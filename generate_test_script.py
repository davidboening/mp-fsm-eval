#!/usr/bin/env python3
# coding: utf-8

import json
import random
import argparse


def check_test_case_validity(test_case_dataset):
    """
    Controls if dictionary entries are conform to syntax.
    
    test_case_dataset : list of dict
    """
    for i, test_case in enumerate(test_case_dataset):
        assert "NAME" in test_case, f"Test case #{i} Invalid NAME"

        assert (
            "N_STATES" in test_case
            and isinstance(test_case["N_STATES"], int)
            and 0 < test_case["N_STATES"] <= 64
        ), f"Test case #{i} Invalid N_STATES"

        assert (
            "N_SYMBOLS" in test_case
            and isinstance(test_case["N_SYMBOLS"], int)
            and 0 < test_case["N_SYMBOLS"] <= test_case["N_STATES"]
        ), f"Test case #{i} Invalid N_SYMBOLS"

        assert (
            "PLAYER_INPUT_SIZES" in test_case
            and isinstance(test_case["PLAYER_INPUT_SIZES"], list)
            and len(test_case["PLAYER_INPUT_SIZES"]) > 1
            and all(
                (isinstance(x, int) and x > 0) for x in test_case["PLAYER_INPUT_SIZES"]
            )
        ), f"Test case #{i} Invalid PLAYER_INPUT_SIZES"

        assert "REPETITIONS" not in test_case or (
            isinstance(test_case["REPETITIONS"], int) and 0 < test_case["REPETITIONS"]
        ), f"Test case #{i} Invalid REPETITIONS"

        assert "DEBUG" not in test_case or isinstance(
            test_case["DEBUG"], bool
        ), f"Test case #{i} Invalid DEBUG"

        assert "VIRTUAL_MACHINE" not in test_case or (
            isinstance(test_case["VIRTUAL_MACHINE"], str)
            and test_case["VIRTUAL_MACHINE"] in ["./spdz2k-party.x", "./semi2k-party.x"]
        ), f"Test case #{i} Invalid VIRTUAL_MACHINE"

        if "PLAYER_DATA" in test_case:
            assert isinstance(
                test_case["PLAYER_DATA"], list
            ), f"Test case #{i} Invalid PLAYER_DATA - Not a list"
            for j, size in enumerate(test_case["PLAYER_INPUT_SIZES"]):
                player_data = test_case["PLAYER_DATA"][j]
                max_value = test_case["N_SYMBOLS"]
                assert (
                    isinstance(player_data, list)
                    and len(player_data) == size
                    and all(
                        (isinstance(x, int) and 0 <= x <= max_value)
                        for x in player_data
                    )
                ), f"Test case #{i} Invalid PLAYER_DATA - User {j} inputs are invalid"


def write_opening(test_case_dataset, fd):
    """
    Write Network creation and Container initialization instructions to file.
    
    test_case_dataset: list of dict (conform to syntax)
    fd : file descriptor
    
    uses GLOBALS: NETWORK_NAME, IMAGE_NAME_FORMAT, IMAGE_NAME
    """

    max_containers = 0
    for entry in test_case_dataset:
        n_containers = len(entry["PLAYER_INPUT_SIZES"])
        if n_containers > max_containers:
            max_containers = n_containers

    # generate network if missing
    fd.write(
        f"docker network inspect {NETWORK_NAME} >/dev/null 2>&1 || "
        f"docker network create --internal {NETWORK_NAME}"
        "\n"
    )
    # init containers
    for i in range(max_containers):
        fd.write(
            "docker run -d -t "
            f"--name {IMAGE_NAME_FORMAT.format(i)} "
            f"--network {NETWORK_NAME} "
            f"{IMAGE_NAME} "
            ">/dev/null"
            "\n"
        )
    return max_containers


def write_closing(test_case_dataset, fd):
    """
    Write Container deallocation instructions to file.
    
    test_case_dataset: list of dict (conform to syntax)
    fd : file descriptor
    
    uses GLOBAL: IMAGE_NAME_FORMAT
    """

    max_containers = 0
    for entry in test_case_dataset:
        n_containers = len(entry["PLAYER_INPUT_SIZES"])
        if n_containers > max_containers:
            max_containers = n_containers

    # stop and remove containers
    for i in range(max_containers):
        fd.write(
            f"docker stop {IMAGE_NAME_FORMAT.format(i)} >/dev/null && "
            f"docker rm {IMAGE_NAME_FORMAT.format(i)} >/dev/null"
            "\n"
        )
    return max_containers


def write_test_case(test_case, fd):
    """
    Writes Instructions necessary to execute the given test case.
    
    test_case: dict (conform to syntax)
    fd : file descriptor
    
    uses GLOBAL: IMAGE_NAME_FORMAT
    """

    n_containers = len(test_case["PLAYER_INPUT_SIZES"])
    test_name = test_case["NAME"]
    n_states = test_case["N_STATES"]
    n_symbols = test_case["N_SYMBOLS"]
    player_input_sizes = test_case["PLAYER_INPUT_SIZES"]
    string_length = sum(test_case["PLAYER_INPUT_SIZES"])

    # Optional Arguments
    if "DEBUG" in test_case and test_case["DEBUG"] is True:
        debug = "_debug"
    else:
        debug = ""
    if "REPETITIONS" in test_case:
        repetitions = test_case["REPETITIONS"]
    else:
        repetitions = 1
    if "VIRTUAL_MACHINE" in test_case:
        virtual_machine = test_case["VIRTUAL_MACHINE"]
    else:
        virtual_machine = r"./semi2k-party.x"

    if "PLAYER_DATA" in test_case:
        player_data = test_case["PLAYER_DATA"]
    else:
        player_data = None

    fd.write(
        f"echo Starting {test_name}\n"
        f"echo N_STATES={n_states}\n"
        f"echo N_SYMBOLS={n_symbols}\n"
        f"echo N_PLAYERS={n_containers}\n"
        f"echo STRING_LENGTH={string_length}\n"
        + (f"echo DEBUG MODE\n" if debug == "_debug" else "")
        + f"echo VIRTUAL_MACHINE={virtual_machine}\n"
        f"echo REPETITIONS={repetitions}\n"
    )

    # compile and generate data
    sum_of_data = 0
    for i in range(n_containers):
        fd.write(
            f"docker exec {IMAGE_NAME_FORMAT.format(i)} "
            f"./compile.py -M fsm_eval{debug} "
            f"{n_states} "
            f"{n_symbols} "
            f"{' '.join(str(j) for j in player_input_sizes)} "
            ">/dev/null"
            "\n"
        )

        if player_data is None:
            # generate uniformly over [0, n_symbols[
            secret_data = " ".join(
                f"{random.randrange(n_symbols):x}" for j in range(player_input_sizes[i])
            )
        else:
            secret_data = " ".join(f"{value:x}" for value in player_data[i])

        fd.write(
            f"docker exec {IMAGE_NAME_FORMAT.format(i)} bash -c '"
            f"echo {player_input_sizes[i]} {secret_data} > gf2n_vals.in && "
            "./gen_input_f2n.x && "
            f"mv gf2n_vals.out Player-Data/Private-Input-{i}' "
            ">/dev/null 2>&1"
            "\n"
        )

        sum_of_data += sum(int(x, 16) for x in secret_data.split(" "))

    # adds sum of elements (Useful for checking final result with current FSM)
    fd.write(f"echo SUM_OF_DATA={sum_of_data}\n")

    executable_name = f"fsm_eval{debug}-{n_states}-{n_symbols}-"
    executable_name += "-".join(str(j) for j in player_input_sizes)

    for k in range(repetitions):
        fd.write(f"echo Repetition {k+1}\n")
        # start all players but 0
        for i in range(n_containers - 1, 0, -1):
            fd.write(
                f"docker exec -d {IMAGE_NAME_FORMAT.format(i)} {virtual_machine} {i} "
                f"{executable_name} -N {n_containers} -h mp-fsm-eval-0 -pn 5000"
                "\n"
            )

        # start player 0 (stdout on)
        fd.write(
            f"docker exec {IMAGE_NAME_FORMAT.format(0)} {virtual_machine} 0 "
            f"{executable_name} -N {n_containers} -h mp-fsm-eval-0 -pn 5000"
            "\n"
        )

    fd.write(f"echo Finished {test_name}\n")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Generate a Test Suite for MP-FSM evaluation given json file"
    )
    parser.add_argument("json", help="Path to json file describing the test")
    parser.add_argument("name", help="Name of generated Script")

    parser.add_argument(
        "-I", "--image", default="mp-fsm-eval", help="Name of the image"
    )
    parser.add_argument(
        "-N",
        "--network",
        default="mp-fsm-eval-internal-lan",
        help="Name of the network",
    )
    parser.add_argument(
        "-C", "--cformat", default="mp-fsm-eval", help="Prefix for Container names"
    )

    args = parser.parse_args()

    SCRIPT_NAME = args.name
    TEST_DESCRIPTION = args.json

    IMAGE_NAME = args.image
    NETWORK_NAME = args.network

    IMAGE_NAME_FORMAT = args.cformat + "-{}"

    with open(TEST_DESCRIPTION) as fd:
        test_case_dataset = json.load(fd)

    check_test_case_validity(test_case_dataset)

    with open(SCRIPT_NAME, "w+", newline="\n") as fd:
        # Initialize Network and Containers
        write_opening(test_case_dataset, fd)

        # Execute all Test Cases
        for test_case in test_case_dataset:
            write_test_case(test_case, fd)

        # Stop and Remove Containers
        write_closing(test_case_dataset, fd)

    # Allow command chaining
    print(SCRIPT_NAME)

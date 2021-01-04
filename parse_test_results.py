#!/usr/bin/env python3
# coding: utf-8

import pandas as pd
import re
import argparse


class ParsingError(Exception):
    """
    Simple exception to denote errors in parsing.
    """

    pass


def parse_result_file(fd):
    """
    Parses an output file optained from running a conform script.

    fd: file descriptor (syntax conform file)

    DOES NOT SUPPORT DEBUG FLAG
    """

    dataframe = pd.DataFrame()
    line = True
    line_count = 0
    while line:
        record = {}
        test_sample = 0

        line = fd.readline()
        line_count += 1
        if isinstance(line, str) and len(line.strip()) == 0:
            line = fd.readline()
            line_count += 1
            continue
        if line.startswith("Starting "):
            record["TestName"] = line[re.match("(Starting )", line).end() : -1].strip()
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("N_STATES"):
            record["# States"] = int(line[re.match("(N_STATES=)", line).end() :])
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("N_SYMBOLS"):
            record["# Symbols"] = int(line[re.match("(N_SYMBOLS=)", line).end() :])
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("N_PLAYERS"):
            record["# Players"] = int(line[re.match("(N_PLAYERS=)", line).end() :])
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("STRING_LENGTH"):
            record["String Length"] = int(
                line[re.match("(STRING_LENGTH=)", line).end() :]
            )
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("VIRTUAL_MACHINE"):
            record["Virtual Machine"] = line[
                re.match("(VIRTUAL_MACHINE=)", line).end() :
            ].strip()
        elif line.startswith("DEBUG"):
            raise ParsingError(f"DEBUG flag not supported by parser ({line_count})")
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("REPETITIONS"):
            test_sample = int(line[re.match("(REPETITIONS=)", line).end() :])
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("SUM_OF_DATA"):
            record["Sum of Inputs"] = int(
                line[re.match("(SUM_OF_DATA=)", line).end() :]
            )
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")

        samples = []
        for i in range(test_sample):
            samples.append({})

            line = fd.readline()
            line_count += 1
            if not line.startswith("Repetition "):
                raise ParsingError(f"Invalid Line ({line_count}): {line}")

            line = fd.readline()
            line_count += 1
            if line.startswith("Trying to run"):
                # ignore message if present (semi2k only)
                line = fd.readline()
                line_count += 1

            if line.startswith("String has been refused"):
                samples[i]["Result"] = False
            elif line.startswith("String has been accepted"):
                samples[i]["Result"] = True
            else:
                raise ParsingError(f"Invalid Line ({line_count}): {line}")

            line = fd.readline()
            line_count += 1
            if line.startswith("Time = "):
                samples[i]["Time(s)"] = float(
                    re.search(r"[+-]?([0-9]*[.])?[0-9]+", line).group(0)
                )
            else:
                raise ParsingError(f"Invalid Line ({line_count}): {line}")

            line = fd.readline()
            line_count += 1
            if line.startswith("Data sent = "):
                samples[i]["Player-0 Data Sent(MB)"] = float(
                    re.search(r"[+-]?([0-9]*[.])?[0-9]+", line).group(0)
                )
            else:
                raise ParsingError(f"Invalid Line ({line_count}): {line}")

            line = fd.readline()
            line_count += 1
            if line.startswith("Global data sent = "):
                samples[i]["Global Data Sent(MB)"] = float(
                    re.search(r"[+-]?([0-9]*[.])?[0-9]+", line).group(0)
                )
            else:
                raise ParsingError(f"Invalid Line ({line_count}): {line}")

        line = fd.readline()
        line_count += 1
        if line.startswith("Finished "):
            if len(samples) != test_sample:
                raise ParsingError(
                    f"Repetition count does not match ({line_count})"
                    f" in Test: {record['TestName']}"
                )
            for i, sample in enumerate(samples):
                record["Repetition"] = i
                record["Result"] = sample["Result"]
                record["Time(s)"] = sample["Time(s)"]
                record["Player-0 Data Sent(MB)"] = sample["Player-0 Data Sent(MB)"]
                record["Global Data Sent(MB)"] = sample["Global Data Sent(MB)"]
                dataframe = dataframe.append(record, ignore_index=True)
        else:
            raise ParsingError(f"Invalid Line ({line_count}): {line}")
    return dataframe


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Parses results generated by any 'generate_test_script.py'"
        " script. Note that 'DEBUG MODE' is not supported"
    )
    parser.add_argument("file", help="Path to file to be parsed")
    parser.add_argument("csv", help="Name of generated .csv")

    args = parser.parse_args()

    RESULTS_FILE = args.file
    # results are saved to csv
    CVS_FILE = args.csv

    with open(RESULTS_FILE, newline="\n") as fd:
        dataframe = parse_result_file(fd)

    dataframe["# States"] = dataframe["# States"].astype("int32")
    dataframe["# Symbols"] = dataframe["# Symbols"].astype("int32")
    dataframe["# Players"] = dataframe["# Players"].astype("int32")
    dataframe["Repetition"] = dataframe["Repetition"].astype("int32")
    dataframe["String Length"] = dataframe["String Length"].astype("int32")
    dataframe["Sum of Inputs"] = dataframe["Sum of Inputs"].astype("int32")
    dataframe["Result"] = dataframe["Result"].astype("bool")

    dataframe = dataframe[
        [
            "TestName",
            "Repetition",
            "# Players",
            "# States",
            "# Symbols",
            "String Length",
            "Virtual Machine",
            "Time(s)",
            "Player-0 Data Sent(MB)",
            "Global Data Sent(MB)",
            "Result",
            "Sum of Inputs",
        ]
    ]

    dataframe.to_csv(CVS_FILE)
    # Allow command chaining
    print(CVS_FILE)

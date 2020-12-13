# Multiparty computation of a Finite State Machine
Built upon https://github.com/data61/MP-SPDZ

## Generate Docker Image
`docker build -t mp-fsm-eval .`

Can take up to 30m, on windows wsl2 seems to not free memory when using `RUN make -j 8` command.
To free said memory close Docker and run `wsl shutdown`.

## Container Instructions
`docker run -it --name mp-fsm-eval mp-fsm-eval`

Runs the container in PseudoTerminal mode, needed since ENTRYPOINT is `bash`.

## Preprocess Private Data
Private data has to be encoded as an element of GF(2^n) with appropiate n.
To obtain said data first encode it as a hexadecimal string ("7fa01") then process it with `./gen_input_f2n.x`
and save the result in the appropriate file `Player-Data/Private-Input-{PLAYER_ID}`.

Example Pipeline:
- `echo 5 1 1 1 1 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0`

Will generate 1,1,1,1,2 the first parameter is the number of hexadecimals to encode.

## To Run the FSM evaluation 
To run the FSM evaluation first compile `fsm_eval_debug` following the template>

`./compile.py -M fsm_eval N_STATES N_SYMBOLS [INPUT_SIZE_1 INPUT_SIZE_2 ...]`

Then connect the various players running each following:

`./spdz2k-party.x PLAYER_ID fsm_eval-{N_STATES}-{N_SYMBOLS}-{INPUT_SIZE_1}-{...} -N N_PLAYERS -h HOSTNAME_OF_PLAYER_0 -pn BASE_PORT_NUMBER`

Note: currently only been tested on localhost

## Tests
A test case printing various details of computation is available as `test_fsm1` to execute it run:

`./compile.py -M test_fsm1`

`./Scripts/spdz2k.sh test_fsm1`

The last script starts 2 `spdz2k-party.x` virtual machines on the same host.


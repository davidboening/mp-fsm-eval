# Multiparty computation of a Finite State Machine
Built upon https://github.com/data61/MP-SPDZ following https://www.researchgate.net/publication/332877290_Multiparty_Evaluation_of_Finite_State_Machine

## Docker
### Generate Docker Image
`docker build -t mp-fsm-eval .`

Uses a lot of resources (15m+ of computation and 15GB+ of RAM) on wsl2 (not tested on linux).

On windows wsl2 seems to not free RAM when using `RUN make -j 8` command.
To free said memory close Docker and run `wsl --shutdown`.

### Container Instructions
`docker run -it --name mp-fsm-eval mp-fsm-eval`

Runs the container in PseudoTerminal mode, needed since ENTRYPOINT is `bash`.

## Multiparty FSM evaluation
### Preprocess Private Data
Private data has to be encoded as an element of GF(2^n) with appropiate n (default is 128).
To obtain said data first encode it as a hexadecimal string ("7fa01") then process it with `./gen_input_f2n.x`
and save the result in the appropriate file `Player-Data/Private-Input-{PLAYER_ID}`.

Example Pipeline:
- `echo 5 ff a1c 1 1 2d1c0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0`

Note that the first input (5) is the number of hexadecimal strings to convert.

### To Run the FSM evaluation 
To run the FSM evaluation first compile `fsm_eval` following the template>

`./compile.py -M fsm_eval N_STATES N_SYMBOLS INPUT_SIZE_P0 INPUT_SIZE_P1 [INPUT_SIZE_P2 ...]`

Then connect the various players running each following:

`./spdz2k-party.x PLAYER_ID fsm_eval-{N_STATES}-{N_SYMBOLS}-{INPUT_SIZE_P0}-{...} -N N_PLAYERS -h HOSTNAME_OF_PLAYER_0 -pn BASE_PORT_NUMBER`

Base port number is required when hostname is not the default option (localhost).

### Tests
#### Same host (example computation)
A test case printing various details of computation is available as `test_fsm1` to execute it run:

`./compile.py -M test_fsm1`

`./Scripts/spdz2k.sh test_fsm1`

The last script starts 2 `spdz2k-party.x` virtual machines on the same host.

#### Costumized Tests
Added [Test Generation Script](./generate_test_script.py) to generate Testing Suites (.sh scripts) based on a .json scheme.
No support for PowerShell Scripts is currently planned.

Example Usage: `./generate_test_script.py Tests/increasing-party-fixed-others.json Scripts/increasing-party-fixed-others.sh`

See [Tests](./Tests) for json examples. For detailed script syntax run with `--help`.

The resulting .sh scripts will:
0) Generate a new internal network for containers (ONCE ONLY).
1) Start all needed containers.
2) Compile fsm_eval with correct parameters.
3) Generate/Initialize private data for each container.
4) Run the underlying vistual machine.
5) Stop all containers (this may take a while).

It is recommended to redirect stdout and stderr to the same file. 

`Scripts/increasing-party-fixed-others.sh > Results/Raw/increasing-party-fixed-others.out 2>&1`

This file (if none of the tests defined in .json run the DEBUG flag) can be parsed with
[Result Parsing Script](./parse_test_results.py) which will generate a .csv file containing all relevant data to the test.

`./parse_test_results.py Results/Raw/increasing-party-fixed-others.out Results/Parsed/increasing-party-fixed-others.csv`

The .csv files of all supported Tests with appropriate plots can be seen in [Plots](./AggregateData.ipynb)

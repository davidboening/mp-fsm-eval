docker network inspect mp-fsm-eval-internal-lan >$null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
echo 'Starting Test semi2k'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 1 4 5 4 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 4 1 3 6 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 4 1 4 7 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=56'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Test semi2k'
echo 'Starting Test spdz2k'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./spdz2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 7 6 1 2 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 4 0 6 4 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 6 7 1 7 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=56'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./spdz2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./spdz2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./spdz2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./spdz2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./spdz2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./spdz2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./spdz2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./spdz2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./spdz2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Test spdz2k'
docker stop mp-fsm-eval-0 >$null && docker rm mp-fsm-eval-0 >$null
docker stop mp-fsm-eval-1 >$null && docker rm mp-fsm-eval-1 >$null
docker stop mp-fsm-eval-2 >$null && docker rm mp-fsm-eval-2 >$null

docker network inspect mp-fsm-eval-internal-lan >/dev/null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-3 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
echo Starting Test Debug
echo N_STATES=16
echo N_SYMBOLS=16
echo N_PLAYERS=4
echo STRING_LENGTH=15
echo DEBUG MODE
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval_debug 16 16 4 6 3 2 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 4 0 1 1 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval_debug 16 16 4 6 3 2 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 6 5 5 1 1 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval_debug 16 16 4 6 3 2 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 3 a f 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval_debug 16 16 4 6 3 2 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 2 0 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
echo SUM_OF_DATA=47
echo Repetition 1
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval_debug-16-16-4-6-3-2 -N 4 -h mp-fsm-eval-0 -pn 5000
echo Finished Test Debug
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null
docker stop mp-fsm-eval-3 >/dev/null && docker rm mp-fsm-eval-3 >/dev/null

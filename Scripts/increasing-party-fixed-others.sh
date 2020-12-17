docker network inspect mp-fsm-eval-internal-lan >/dev/null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-3 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-4 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-5 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-6 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-7 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-8 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-9 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-10 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-11 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-12 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-13 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-14 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-15 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
echo Starting Test p=2
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=2
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 16 16 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 16 3 1 6 7 0 4 2 4 5 4 0 5 4 7 2 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 16 16 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 16 3 2 3 7 4 1 5 5 2 3 0 2 5 5 5 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
echo SUM_OF_DATA=110
echo Repetition 1
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=2
echo Starting Test p=3
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 12 10 10 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 12 5 7 0 4 6 4 1 5 6 1 6 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 12 10 10 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 10 3 1 4 2 0 7 3 4 0 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 12 10 10 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 10 1 3 0 3 3 7 7 0 0 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=114
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-12-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=3
echo Starting Test p=4
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=4
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 8 1 5 7 5 7 4 0 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 8 6 3 3 6 6 0 4 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 8 6 4 0 2 2 3 2 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 8 4 7 7 7 5 5 3 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
echo SUM_OF_DATA=118
echo Repetition 1
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=4
echo Starting Test p=5
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=5
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 8 6 6 6 6 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 8 7 5 2 7 6 0 1 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 8 6 6 6 6 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 6 7 5 1 2 4 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 8 6 6 6 6 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 6 0 2 3 4 4 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 8 6 6 6 6 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 6 7 5 7 6 1 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 8 6 6 6 6 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 6 4 7 6 6 1 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
echo SUM_OF_DATA=124
echo Repetition 1
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-6-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=5
echo Starting Test p=6
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=6
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 7 5 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 7 7 6 1 5 6 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 7 5 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 0 6 2 6 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 7 5 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 5 1 6 5 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 7 5 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 5 2 0 5 5 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 7 5 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 5 5 2 1 4 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 7 5 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 5 5 3 5 1 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
echo SUM_OF_DATA=115
echo Repetition 1
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-5-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=6
echo Starting Test p=8
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=8
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 4 2 3 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 4 0 1 3 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 4 6 1 2 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 4 5 1 0 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 4 5 0 5 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 4 4 0 4 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-6 bash -c 'echo 4 6 5 6 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >/dev/null 2>&1
docker exec mp-fsm-eval-7 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-7 bash -c 'echo 4 1 1 3 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-7' >/dev/null 2>&1
echo SUM_OF_DATA=98
echo Repetition 1
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=8
echo Starting Test p=16
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=16
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 2 7 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 2 0 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 2 1 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 2 0 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 2 2 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 2 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-6 bash -c 'echo 2 5 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >/dev/null 2>&1
docker exec mp-fsm-eval-7 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-7 bash -c 'echo 2 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-7' >/dev/null 2>&1
docker exec mp-fsm-eval-8 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-8 bash -c 'echo 2 7 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-8' >/dev/null 2>&1
docker exec mp-fsm-eval-9 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-9 bash -c 'echo 2 2 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-9' >/dev/null 2>&1
docker exec mp-fsm-eval-10 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-10 bash -c 'echo 2 4 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-10' >/dev/null 2>&1
docker exec mp-fsm-eval-11 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-11 bash -c 'echo 2 0 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-11' >/dev/null 2>&1
docker exec mp-fsm-eval-12 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-12 bash -c 'echo 2 5 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-12' >/dev/null 2>&1
docker exec mp-fsm-eval-13 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-13 bash -c 'echo 2 5 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-13' >/dev/null 2>&1
docker exec mp-fsm-eval-14 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-14 bash -c 'echo 2 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-14' >/dev/null 2>&1
docker exec mp-fsm-eval-15 ./compile.py -M fsm_eval 8 8 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 >/dev/null
docker exec mp-fsm-eval-15 bash -c 'echo 2 3 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-15' >/dev/null 2>&1
echo SUM_OF_DATA=103
echo Repetition 1
docker exec -d mp-fsm-eval-15 ./semi2k-party.x 15 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-14 ./semi2k-party.x 14 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-13 ./semi2k-party.x 13 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-12 ./semi2k-party.x 12 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-11 ./semi2k-party.x 11 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-10 ./semi2k-party.x 10 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-9 ./semi2k-party.x 9 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-15 ./semi2k-party.x 15 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-14 ./semi2k-party.x 14 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-13 ./semi2k-party.x 13 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-12 ./semi2k-party.x 12 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-11 ./semi2k-party.x 11 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-10 ./semi2k-party.x 10 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-9 ./semi2k-party.x 9 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-15 ./semi2k-party.x 15 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-14 ./semi2k-party.x 14 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-13 ./semi2k-party.x 13 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-12 ./semi2k-party.x 12 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-11 ./semi2k-party.x 11 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-10 ./semi2k-party.x 10 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-9 ./semi2k-party.x 9 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2-2 -N 16 -h mp-fsm-eval-0 -pn 5000
echo Finished Test p=16
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null
docker stop mp-fsm-eval-3 >/dev/null && docker rm mp-fsm-eval-3 >/dev/null
docker stop mp-fsm-eval-4 >/dev/null && docker rm mp-fsm-eval-4 >/dev/null
docker stop mp-fsm-eval-5 >/dev/null && docker rm mp-fsm-eval-5 >/dev/null
docker stop mp-fsm-eval-6 >/dev/null && docker rm mp-fsm-eval-6 >/dev/null
docker stop mp-fsm-eval-7 >/dev/null && docker rm mp-fsm-eval-7 >/dev/null
docker stop mp-fsm-eval-8 >/dev/null && docker rm mp-fsm-eval-8 >/dev/null
docker stop mp-fsm-eval-9 >/dev/null && docker rm mp-fsm-eval-9 >/dev/null
docker stop mp-fsm-eval-10 >/dev/null && docker rm mp-fsm-eval-10 >/dev/null
docker stop mp-fsm-eval-11 >/dev/null && docker rm mp-fsm-eval-11 >/dev/null
docker stop mp-fsm-eval-12 >/dev/null && docker rm mp-fsm-eval-12 >/dev/null
docker stop mp-fsm-eval-13 >/dev/null && docker rm mp-fsm-eval-13 >/dev/null
docker stop mp-fsm-eval-14 >/dev/null && docker rm mp-fsm-eval-14 >/dev/null
docker stop mp-fsm-eval-15 >/dev/null && docker rm mp-fsm-eval-15 >/dev/null

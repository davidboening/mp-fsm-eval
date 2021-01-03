docker network inspect mp-fsm-eval-internal-lan >/dev/null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
echo Starting Variable #States: n=8
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 7 7 3 5 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 0 3 4 6 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 0 0 4 2 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=52
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=8
echo Starting Variable #States: n=16
echo N_STATES=16
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 16 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 7 0 2 7 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 16 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 5 4 2 3 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 16 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 6 0 7 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=52
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-16-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=16
echo Starting Variable #States: n=24
echo N_STATES=24
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 24 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 1 4 1 2 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 24 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 7 3 3 6 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 24 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 0 7 4 5 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=54
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-24-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=24
echo Starting Variable #States: n=32
echo N_STATES=32
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 32 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 3 6 2 5 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 32 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 5 2 6 5 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 32 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 0 7 3 3 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=59
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-32-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=32
echo Starting Variable #States: n=40
echo N_STATES=40
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 40 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 6 6 6 6 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 40 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 6 0 3 2 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 40 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 3 7 5 5 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=69
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-40-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=40
echo Starting Variable #States: n=48
echo N_STATES=48
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 48 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 5 1 1 3 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 48 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 5 6 1 4 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 48 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 1 3 7 3 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=51
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-48-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=48
echo Starting Variable #States: n=56
echo N_STATES=56
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 56 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 5 5 4 7 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 56 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 2 3 1 5 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 56 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 5 7 0 0 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=52
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-56-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=56
echo Starting Variable #States: n=64
echo N_STATES=64
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 4 2 7 3 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 2 4 2 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 1 5 2 6 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=51
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-8-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #States: n=64
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null

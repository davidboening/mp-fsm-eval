docker network inspect mp-fsm-eval-internal-lan >/dev/null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
echo Starting Test z=8
echo N_STATES=64
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 4 4 3 6 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 4 1 6 5 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 4 2 5 0 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=64
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
echo Finished Test z=8
echo Starting Test z=12
echo N_STATES=64
echo N_SYMBOLS=12
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 12 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 3 0 8 6 9 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 12 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 5 9 9 2 8 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 12 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 2 a 9 2 8 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=90
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-12-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test z=12
echo Starting Test n=16
echo N_STATES=64
echo N_SYMBOLS=16
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 16 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 4 0 f c d > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 16 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 f 4 8 f 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 16 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 2 b 3 8 d > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=128
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test n=16
echo Starting Test n=20
echo N_STATES=64
echo N_SYMBOLS=20
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 20 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 4 d 7 f 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 20 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 12 4 b e 13 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 20 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 c 2 5 f 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=145
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-20-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test n=20
echo Starting Test n=24
echo N_STATES=64
echo N_SYMBOLS=24
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 24 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 8 1 4 3 14 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 24 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 6 16 14 b 17 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 24 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 a 1 3 14 c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=164
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test n=24
echo Starting Test n=32
echo N_STATES=64
echo N_SYMBOLS=32
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 32 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 8 10 5 c 1a > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 32 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 19 0 1b 1f 10 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 32 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 15 6 1e 1a 13 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=268
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test n=32
echo Starting Test n=48
echo N_STATES=64
echo N_SYMBOLS=48
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 48 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 15 27 1a 7 d > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 48 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 2f 27 7 2e 1e > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 48 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 7 19 f 1f 25 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=390
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test n=48
echo Starting Test n=64
echo N_STATES=64
echo N_SYMBOLS=64
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 64 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 34 0 1f 35 2c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 64 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 10 19 3 23 2c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 64 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 36 35 1a f 20 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=483
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Test n=64
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null

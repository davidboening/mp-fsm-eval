docker network inspect mp-fsm-eval-internal-lan >/dev/null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
echo Starting Variable #Symbols: z=8
echo N_STATES=64
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 1 6 0 6 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 5 4 5 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 8 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 3 4 5 2 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=55
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
echo Finished Variable #Symbols: z=8
echo Starting Variable #Symbols: z=16
echo N_STATES=64
echo N_SYMBOLS=16
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 16 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 5 e 0 1 c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 16 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 9 2 5 a 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 16 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 d 0 e 6 9 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=103
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
echo Finished Variable #Symbols: z=16
echo Starting Variable #Symbols: z=24
echo N_STATES=64
echo N_SYMBOLS=24
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 24 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 2 4 c 3 17 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 24 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 1 0 4 c 11 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 24 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 14 11 6 e e > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=149
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
echo Finished Variable #Symbols: z=24
echo Starting Variable #Symbols: z=32
echo N_STATES=64
echo N_SYMBOLS=32
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 32 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 9 e c d e > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 32 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 10 5 3 18 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 32 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 7 5 12 1d 12 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=194
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
echo Finished Variable #Symbols: z=32
echo Starting Variable #Symbols: z=40
echo N_STATES=64
echo N_SYMBOLS=40
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 40 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 12 1f 6 19 1f > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 40 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 14 9 b 3 13 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 40 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 a 12 12 c 20 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=263
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Symbols: z=40
echo Starting Variable #Symbols: z=48
echo N_STATES=64
echo N_SYMBOLS=48
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 48 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 2d 9 f a 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 48 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 9 2e 25 23 19 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 48 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 2f d 2d 2e 2f > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=433
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
echo Finished Variable #Symbols: z=48
echo Starting Variable #Symbols: z=56
echo N_STATES=64
echo N_SYMBOLS=56
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 56 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 d 10 1a f 17 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 56 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 2b 12 15 29 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 56 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 2a e e f 29 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=349
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-64-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Symbols: z=56
echo Starting Variable #Symbols: z=64
echo N_STATES=64
echo N_SYMBOLS=64
echo N_PLAYERS=3
echo STRING_LENGTH=15
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 64 64 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 22 2f a 24 19 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 64 64 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 21 11 25 2f 19 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 64 64 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 18 1a 4 1 25 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=403
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
echo Finished Variable #Symbols: z=64
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null

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
echo Starting Variable #Parties: p=2
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=2
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 16 16 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 16 2 2 2 0 0 7 1 7 1 5 1 0 1 4 3 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 16 16 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 16 4 2 3 5 6 3 6 6 6 1 5 4 0 4 7 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
echo SUM_OF_DATA=104
echo Repetition 1
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Parties: p=2
echo Starting Variable #Parties: p=3
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 11 11 10 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 11 0 5 0 2 0 4 4 3 6 6 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 11 11 10 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 11 5 6 1 6 6 6 5 1 7 2 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 11 11 10 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 10 2 0 4 0 7 5 5 3 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=108
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Parties: p=3
echo Starting Variable #Parties: p=4
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=4
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 8 7 7 3 7 7 0 3 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 8 0 0 6 2 0 3 0 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 8 5 6 1 7 2 3 5 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 8 8 8 8 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 8 2 6 2 0 1 7 5 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
echo SUM_OF_DATA=110
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
echo Finished Variable #Parties: p=4
echo Starting Variable #Parties: p=5
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=5
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 7 2 4 0 0 1 3 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 7 7 2 2 7 7 1 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 6 7 3 0 7 5 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 6 2 1 3 6 7 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 6 6 7 7 5 2 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
echo SUM_OF_DATA=115
echo Repetition 1
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Parties: p=5
echo Starting Variable #Parties: p=6
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=6
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 6 3 5 7 4 7 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 6 0 4 5 0 0 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 1 3 5 7 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 5 4 2 0 6 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 5 1 4 7 4 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 5 6 5 6 5 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
echo SUM_OF_DATA=110
echo Repetition 1
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Parties: p=6
echo Starting Variable #Parties: p=7
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=7
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 5 3 3 6 6 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 5 7 1 3 0 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 5 4 7 4 3 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 5 4 4 3 3 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 4 7 1 4 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 4 5 1 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >/dev/null
docker exec mp-fsm-eval-6 bash -c 'echo 4 7 3 5 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >/dev/null 2>&1
echo SUM_OF_DATA=134
echo Repetition 1
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Parties: p=7
echo Starting Variable #Parties: p=8
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=8
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 4 0 3 4 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 4 2 0 0 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 4 3 6 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 4 1 6 1 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 4 0 7 5 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 4 2 2 5 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-6 bash -c 'echo 4 1 7 7 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >/dev/null 2>&1
docker exec mp-fsm-eval-7 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >/dev/null
docker exec mp-fsm-eval-7 bash -c 'echo 4 7 1 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-7' >/dev/null 2>&1
echo SUM_OF_DATA=105
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
echo Finished Variable #Parties: p=8
echo Starting Variable #Parties: p=9
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=9
echo STRING_LENGTH=32
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 4 2 4 2 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 4 5 2 3 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 4 4 4 4 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-3 bash -c 'echo 4 0 1 6 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >/dev/null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-4 bash -c 'echo 4 4 7 1 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >/dev/null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-5 bash -c 'echo 3 6 4 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >/dev/null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-6 bash -c 'echo 3 0 5 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >/dev/null 2>&1
docker exec mp-fsm-eval-7 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-7 bash -c 'echo 3 6 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-7' >/dev/null 2>&1
docker exec mp-fsm-eval-8 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >/dev/null
docker exec mp-fsm-eval-8 bash -c 'echo 3 6 1 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-8' >/dev/null 2>&1
echo SUM_OF_DATA=119
echo Repetition 1
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable #Parties: p=9
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null
docker stop mp-fsm-eval-3 >/dev/null && docker rm mp-fsm-eval-3 >/dev/null
docker stop mp-fsm-eval-4 >/dev/null && docker rm mp-fsm-eval-4 >/dev/null
docker stop mp-fsm-eval-5 >/dev/null && docker rm mp-fsm-eval-5 >/dev/null
docker stop mp-fsm-eval-6 >/dev/null && docker rm mp-fsm-eval-6 >/dev/null
docker stop mp-fsm-eval-7 >/dev/null && docker rm mp-fsm-eval-7 >/dev/null
docker stop mp-fsm-eval-8 >/dev/null && docker rm mp-fsm-eval-8 >/dev/null

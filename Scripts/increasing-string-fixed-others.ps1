docker network inspect mp-fsm-eval-internal-lan >$null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
echo 'Starting Variable String Lenght: m=10'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=10'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 3 3 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 4 3 5 2 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 3 3 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 3 3 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 3 3 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 3 2 2 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=32'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=10'
echo 'Starting Variable String Lenght: m=20'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=20'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 7 7 6 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 7 2 7 6 7 0 7 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 7 7 6 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 7 2 5 7 0 6 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 7 7 6 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 6 1 1 7 7 0 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=77'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=20'
echo 'Starting Variable String Lenght: m=30'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=30'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 10 10 10 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 10 4 5 0 3 2 5 0 7 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 10 10 10 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 10 7 1 2 3 3 1 6 2 5 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 10 10 10 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 10 6 1 1 1 4 5 6 0 2 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=91'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=30'
echo 'Starting Variable String Lenght: m=40'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=40'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 14 13 13 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 14 5 2 4 2 0 1 3 4 7 5 3 7 2 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 14 13 13 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 13 1 2 7 7 3 1 6 4 5 1 7 7 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 14 13 13 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 13 1 0 1 1 6 7 3 5 3 2 1 6 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=140'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=40'
echo 'Starting Variable String Lenght: m=50'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=50'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 17 17 16 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 17 5 3 2 6 7 1 1 0 4 7 2 2 7 2 4 2 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 17 17 16 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 17 4 4 1 3 3 3 7 3 3 6 2 3 6 1 7 4 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 17 17 16 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 16 5 6 4 6 7 3 3 0 3 3 4 5 6 2 1 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=184'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=50'
echo 'Starting Variable String Lenght: m=60'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=60'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 20 20 20 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 20 2 5 1 3 7 1 6 2 1 4 4 3 4 4 2 2 5 0 6 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 20 20 20 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 20 7 4 1 5 4 1 5 2 5 0 1 7 5 4 0 1 3 1 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 20 20 20 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 20 6 3 1 4 3 4 2 0 2 4 5 7 1 4 3 5 3 2 6 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=205'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=60'
echo 'Starting Variable String Lenght: m=70'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=70'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 24 23 23 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 24 0 4 0 1 6 5 0 0 6 1 7 2 4 2 3 5 5 0 1 3 6 7 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 24 23 23 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 23 0 0 5 1 3 4 6 0 3 0 6 1 2 5 5 3 4 2 3 2 4 3 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 24 23 23 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 23 0 6 2 7 6 3 5 0 2 7 0 3 7 3 1 1 2 5 7 2 7 4 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=227'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=70'
echo 'Starting Variable String Lenght: m=80'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=80'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 27 27 26 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 27 6 7 0 1 2 6 2 3 5 1 1 4 2 4 1 4 4 1 6 6 6 7 3 7 4 1 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 27 27 26 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 27 2 3 2 6 1 0 3 4 5 0 0 1 0 3 0 7 0 0 2 6 0 5 2 5 0 5 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 27 27 26 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 26 1 5 4 4 0 1 3 7 7 0 7 6 0 6 0 0 5 3 0 0 6 6 5 5 5 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=250'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable String Lenght: m=80'
docker stop mp-fsm-eval-0 >$null && docker rm mp-fsm-eval-0 >$null
docker stop mp-fsm-eval-1 >$null && docker rm mp-fsm-eval-1 >$null
docker stop mp-fsm-eval-2 >$null && docker rm mp-fsm-eval-2 >$null

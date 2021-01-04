docker network inspect mp-fsm-eval-internal-lan >$null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-3 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-4 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-5 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-6 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-7 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-8 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
echo 'Starting Variable #Parties: p=2'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=2'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 16 16 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 16 2 6 0 4 3 7 6 4 3 3 0 2 6 4 3 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 16 16 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 16 7 2 0 3 4 2 2 7 5 1 1 1 1 7 4 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
echo 'SUM_OF_DATA=111'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-16-16 -N 2 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=2'
echo 'Starting Variable #Parties: p=3'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 11 11 10 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 11 6 6 3 6 4 6 0 5 6 5 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 11 11 10 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 11 1 7 1 4 6 7 4 4 4 0 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 11 11 10 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 10 7 4 2 1 5 7 4 2 2 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=126'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-11-11-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=3'
echo 'Starting Variable #Parties: p=4'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=4'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 8 8 8 8 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 8 5 6 6 5 6 6 4 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 8 8 8 8 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 8 0 2 7 0 0 3 2 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 8 8 8 8 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 8 2 5 3 4 4 3 3 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 8 8 8 8 >$null
docker exec mp-fsm-eval-3 bash -c 'echo 8 0 7 6 3 7 6 1 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >$null 2>&1
echo 'SUM_OF_DATA=127'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-8-8-8-8 -N 4 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=4'
echo 'Starting Variable #Parties: p=5'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=5'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 7 6 3 2 5 3 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 7 5 1 4 2 6 7 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 6 0 7 0 3 1 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >$null
docker exec mp-fsm-eval-3 bash -c 'echo 6 6 0 7 0 2 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >$null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 7 7 6 6 6 >$null
docker exec mp-fsm-eval-4 bash -c 'echo 6 2 0 1 3 6 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >$null 2>&1
echo 'SUM_OF_DATA=103'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6-6-6 -N 5 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=5'
echo 'Starting Variable #Parties: p=6'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=6'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 6 7 1 0 2 2 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 6 1 0 3 4 5 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 4 3 5 6 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >$null
docker exec mp-fsm-eval-3 bash -c 'echo 5 7 1 7 7 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >$null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >$null
docker exec mp-fsm-eval-4 bash -c 'echo 5 0 6 1 3 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >$null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 6 6 5 5 5 5 >$null
docker exec mp-fsm-eval-5 bash -c 'echo 5 4 5 3 4 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >$null 2>&1
echo 'SUM_OF_DATA=106'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-6-6-5-5-5-5 -N 6 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=6'
echo 'Starting Variable #Parties: p=7'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=7'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 4 4 1 4 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 7 6 6 5 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 6 2 2 2 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-3 bash -c 'echo 5 3 6 2 2 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >$null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-4 bash -c 'echo 4 0 2 7 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >$null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-5 bash -c 'echo 4 2 3 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >$null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 5 5 5 5 4 4 4 >$null
docker exec mp-fsm-eval-6 bash -c 'echo 4 2 5 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >$null 2>&1
echo 'SUM_OF_DATA=111'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-5-5-5-5-4-4-4 -N 7 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=7'
echo 'Starting Variable #Parties: p=8'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=8'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 4 6 4 4 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 4 2 2 0 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 4 5 6 3 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-3 bash -c 'echo 4 6 6 0 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >$null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-4 bash -c 'echo 4 5 1 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >$null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-5 bash -c 'echo 4 0 0 6 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >$null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-6 bash -c 'echo 4 4 5 3 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >$null 2>&1
docker exec mp-fsm-eval-7 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 4 4 4 >$null
docker exec mp-fsm-eval-7 bash -c 'echo 4 5 5 0 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-7' >$null 2>&1
echo 'SUM_OF_DATA=111'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-4-4-4 -N 8 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=8'
echo 'Starting Variable #Parties: p=9'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=9'
echo 'STRING_LENGTH=32'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 4 5 4 4 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 4 3 4 3 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 4 1 2 1 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
docker exec mp-fsm-eval-3 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-3 bash -c 'echo 4 6 6 0 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-3' >$null 2>&1
docker exec mp-fsm-eval-4 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-4 bash -c 'echo 4 5 0 7 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-4' >$null 2>&1
docker exec mp-fsm-eval-5 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-5 bash -c 'echo 3 2 5 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-5' >$null 2>&1
docker exec mp-fsm-eval-6 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-6 bash -c 'echo 3 4 6 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-6' >$null 2>&1
docker exec mp-fsm-eval-7 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-7 bash -c 'echo 3 5 0 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-7' >$null 2>&1
docker exec mp-fsm-eval-8 ./compile.py -M fsm_eval 8 8 4 4 4 4 4 3 3 3 3 >$null
docker exec mp-fsm-eval-8 bash -c 'echo 3 7 6 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-8' >$null 2>&1
echo 'SUM_OF_DATA=119'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-8 ./semi2k-party.x 8 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-7 ./semi2k-party.x 7 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-6 ./semi2k-party.x 6 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-5 ./semi2k-party.x 5 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-4 ./semi2k-party.x 4 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-3 ./semi2k-party.x 3 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-4-4-4-4-3-3-3-3 -N 9 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Parties: p=9'
docker stop mp-fsm-eval-0 >$null && docker rm mp-fsm-eval-0 >$null
docker stop mp-fsm-eval-1 >$null && docker rm mp-fsm-eval-1 >$null
docker stop mp-fsm-eval-2 >$null && docker rm mp-fsm-eval-2 >$null
docker stop mp-fsm-eval-3 >$null && docker rm mp-fsm-eval-3 >$null
docker stop mp-fsm-eval-4 >$null && docker rm mp-fsm-eval-4 >$null
docker stop mp-fsm-eval-5 >$null && docker rm mp-fsm-eval-5 >$null
docker stop mp-fsm-eval-6 >$null && docker rm mp-fsm-eval-6 >$null
docker stop mp-fsm-eval-7 >$null && docker rm mp-fsm-eval-7 >$null
docker stop mp-fsm-eval-8 >$null && docker rm mp-fsm-eval-8 >$null

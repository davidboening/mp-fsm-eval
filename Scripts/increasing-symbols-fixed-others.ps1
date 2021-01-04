docker network inspect mp-fsm-eval-internal-lan >$null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >$null
echo 'Starting Variable #Symbols: z=8'
echo 'N_STATES=8'
echo 'N_SYMBOLS=8'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 4 6 2 4 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 0 6 5 4 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 3 5 0 6 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=62'
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
echo 'Finished Variable #Symbols: z=8'
echo 'Starting Variable #Symbols: z=16'
echo 'N_STATES=8'
echo 'N_SYMBOLS=16'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 16 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 0 0 e 3 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 16 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 c 2 c f 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 16 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 6 d b 6 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=108'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-16-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=16'
echo 'Starting Variable #Symbols: z=24'
echo 'N_STATES=8'
echo 'N_SYMBOLS=24'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 24 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 6 e 17 14 12 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 24 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 4 5 3 1 11 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 24 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 16 0 f 8 d > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=169'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-24-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=24'
echo 'Starting Variable #Symbols: z=32'
echo 'N_STATES=8'
echo 'N_SYMBOLS=32'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 32 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 f 1a 15 16 1c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 32 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 e 9 d 15 1b > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 32 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 17 5 2 16 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=249'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-32-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=32'
echo 'Starting Variable #Symbols: z=40'
echo 'N_STATES=8'
echo 'N_SYMBOLS=40'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 40 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 1b 1a 5 15 23 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 40 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 1f e 22 1c 20 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 40 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 10 14 11 c 17 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=341'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-40-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=40'
echo 'Starting Variable #Symbols: z=48'
echo 'N_STATES=8'
echo 'N_SYMBOLS=48'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 48 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 8 1c d 8 f > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 48 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 15 2b 23 2e 2c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 48 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 1f 1c 7 20 1a > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=385'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-48-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=48'
echo 'Starting Variable #Symbols: z=56'
echo 'N_STATES=8'
echo 'N_SYMBOLS=56'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 56 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 16 3 37 2a 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 56 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 21 1f 15 2e 10 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 56 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 7 12 27 d 13 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=369'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-56-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=56'
echo 'Starting Variable #Symbols: z=64'
echo 'N_STATES=8'
echo 'N_SYMBOLS=64'
echo 'N_PLAYERS=3'
echo 'STRING_LENGTH=15'
echo 'VIRTUAL_MACHINE=./semi2k-party.x'
echo 'REPETITIONS=3'
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 64 5 5 5 >$null
docker exec mp-fsm-eval-0 bash -c 'echo 5 15 3d 13 5 3e > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >$null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 64 5 5 5 >$null
docker exec mp-fsm-eval-1 bash -c 'echo 5 21 e 33 c 1c > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >$null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 64 5 5 5 >$null
docker exec mp-fsm-eval-2 bash -c 'echo 5 1a 32 7 9 33 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >$null 2>&1
echo 'SUM_OF_DATA=449'
echo 'Repetition 1'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 2'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Repetition 3'
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-64-5-5-5 -N 3 -h mp-fsm-eval-0 -pn 5000
echo 'Finished Variable #Symbols: z=64'
docker stop mp-fsm-eval-0 >$null && docker rm mp-fsm-eval-0 >$null
docker stop mp-fsm-eval-1 >$null && docker rm mp-fsm-eval-1 >$null
docker stop mp-fsm-eval-2 >$null && docker rm mp-fsm-eval-2 >$null

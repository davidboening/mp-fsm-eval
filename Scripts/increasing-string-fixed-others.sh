docker network inspect mp-fsm-eval-internal-lan >/dev/null 2>&1 || docker network create --internal mp-fsm-eval-internal-lan
docker run -d -t --name mp-fsm-eval-0 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-1 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
docker run -d -t --name mp-fsm-eval-2 --network mp-fsm-eval-internal-lan mp-fsm-eval >/dev/null
echo Starting Variable String Lenght: m=10
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=10
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 4 3 3 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 4 2 6 5 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 4 3 3 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 3 5 5 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 4 3 3 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 3 5 3 4 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=41
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-4-3-3 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=10
echo Starting Variable String Lenght: m=20
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=20
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 7 7 6 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 7 1 4 6 5 3 4 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 7 7 6 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 7 3 4 3 1 7 4 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 7 7 6 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 6 1 3 4 3 1 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=63
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-7-7-6 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=20
echo Starting Variable String Lenght: m=30
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=30
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 10 10 10 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 10 1 0 7 0 4 5 6 0 4 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 10 10 10 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 10 4 6 0 1 0 0 6 0 0 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 10 10 10 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 10 1 2 2 2 4 5 6 7 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=82
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-10-10-10 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=30
echo Starting Variable String Lenght: m=40
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=40
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 14 13 13 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 14 2 7 3 7 5 6 5 0 5 5 0 6 2 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 14 13 13 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 13 5 6 4 7 5 6 0 7 4 5 0 7 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 14 13 13 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 13 4 6 4 2 2 0 0 7 2 7 2 1 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=157
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-14-13-13 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=40
echo Starting Variable String Lenght: m=50
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=50
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 17 17 16 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 17 1 0 4 6 0 2 3 3 2 1 0 4 3 3 3 2 6 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 17 17 16 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 17 6 6 2 6 0 5 6 4 7 6 0 3 5 6 5 1 3 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 17 17 16 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 16 5 5 5 6 6 2 7 7 1 0 4 5 5 0 5 7 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=184
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-17-17-16 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=50
echo Starting Variable String Lenght: m=60
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=60
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 20 20 20 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 20 1 0 1 2 2 4 1 6 6 5 6 2 7 0 6 1 1 6 3 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 20 20 20 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 20 2 7 3 6 2 1 0 7 0 3 7 3 2 2 3 5 3 3 1 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 20 20 20 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 20 4 6 4 0 0 5 7 5 5 0 0 4 7 0 6 2 0 2 2 5 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=189
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-20-20-20 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=60
echo Starting Variable String Lenght: m=70
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=70
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 24 23 23 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 24 6 3 0 3 5 6 7 5 1 4 0 3 0 0 1 3 2 4 0 7 2 2 6 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 24 23 23 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 23 4 4 7 0 5 1 6 6 7 5 7 1 6 6 3 6 1 4 0 0 1 1 1 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 24 23 23 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 23 3 5 1 0 0 5 4 3 4 4 7 2 2 6 6 7 1 1 0 6 5 3 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=228
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-24-23-23 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=70
echo Starting Variable String Lenght: m=80
echo N_STATES=8
echo N_SYMBOLS=8
echo N_PLAYERS=3
echo STRING_LENGTH=80
echo VIRTUAL_MACHINE=./semi2k-party.x
echo REPETITIONS=3
docker exec mp-fsm-eval-0 ./compile.py -M fsm_eval 8 8 27 27 26 >/dev/null
docker exec mp-fsm-eval-0 bash -c 'echo 27 1 0 0 7 3 2 6 5 1 3 0 1 0 6 7 3 3 7 0 4 5 2 1 5 4 5 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-0' >/dev/null 2>&1
docker exec mp-fsm-eval-1 ./compile.py -M fsm_eval 8 8 27 27 26 >/dev/null
docker exec mp-fsm-eval-1 bash -c 'echo 27 7 6 2 5 0 0 6 3 3 5 2 3 7 4 3 5 6 5 5 1 7 7 3 4 6 7 2 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-1' >/dev/null 2>&1
docker exec mp-fsm-eval-2 ./compile.py -M fsm_eval 8 8 27 27 26 >/dev/null
docker exec mp-fsm-eval-2 bash -c 'echo 26 7 2 5 5 0 6 0 7 2 0 0 4 5 0 2 1 0 1 2 0 3 6 1 7 2 0 > gf2n_vals.in && ./gen_input_f2n.x && mv gf2n_vals.out Player-Data/Private-Input-2' >/dev/null 2>&1
echo SUM_OF_DATA=265
echo Repetition 1
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 2
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Repetition 3
docker exec -d mp-fsm-eval-2 ./semi2k-party.x 2 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec -d mp-fsm-eval-1 ./semi2k-party.x 1 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
docker exec mp-fsm-eval-0 ./semi2k-party.x 0 fsm_eval-8-8-27-27-26 -N 3 -h mp-fsm-eval-0 -pn 5000
echo Finished Variable String Lenght: m=80
docker stop mp-fsm-eval-0 >/dev/null && docker rm mp-fsm-eval-0 >/dev/null
docker stop mp-fsm-eval-1 >/dev/null && docker rm mp-fsm-eval-1 >/dev/null
docker stop mp-fsm-eval-2 >/dev/null && docker rm mp-fsm-eval-2 >/dev/null

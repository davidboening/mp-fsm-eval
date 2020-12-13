FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive 
RUN apt update && apt upgrade -y
RUN apt install -y automake build-essential git libboost-dev libboost-thread-dev libsodium-dev libssl-dev libtool m4 python texinfo yasm

RUN git clone https://github.com/data61/MP-SPDZ.git /opt/source/mp-spdz

WORKDIR /opt/source/mp-spdz/
RUN make -j 8 tldr

RUN apt install -y python3

RUN make gen_input
RUN make -j 8 spdz2k

COPY ./*.mpc /opt/source/mp-spdz/Programs/Source/

ENTRYPOINT bash
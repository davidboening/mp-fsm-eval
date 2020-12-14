FROM ubuntu

# Update packages and install dependencies
ENV DEBIAN_FRONTEND=noninteractive 
RUN apt update && apt install -y \
	automake build-essential git libboost-dev libboost-thread-dev \
	libsodium-dev libssl-dev libtool m4 python python3 texinfo yasm \
	&& rm -rf /var/lib/apt/lists/*

# Download and install main library
RUN git clone https://github.com/data61/MP-SPDZ.git /opt/source/mp-spdz
WORKDIR /opt/source/mp-spdz/
RUN make -j 8 tldr
RUN make -j 8 gen_input spdz2k

# Copy source code
COPY ./*.mpc /opt/source/mp-spdz/Programs/Source/

# Initialize files
RUN mkdir Player-Data

# TODO: generate a script for ease of use
ENTRYPOINT bash
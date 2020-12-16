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
RUN make -j 2 tldr
RUN make -j 2 gen_input_f2n.x semi2k-party.x spdz2k-party.x replicated-ring-party.x galois-degree.x

# Copy source code
COPY ./*.mpc /opt/source/mp-spdz/Programs/Source/

# Initialize files
RUN mkdir Player-Data

# TODO: generate a script for ease of use
ENTRYPOINT bash
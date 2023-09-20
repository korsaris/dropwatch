FROM debian:12

WORKDIR /var/dropwatch

RUN apt -y update

RUN apt install -y sudo dh-autoreconf pkg-config libpcap-dev make libnl-3-dev libnl-genl-3-dev binutils-dev libreadline6-dev

# build container with --network=host or need configure dns on build stage
COPY . /var/dropwatch

CMD ./autogen.sh; ./configure; make; cp ./src/dropwatch ./docker_out/; cp ./src/dwdump ./docker_out/


FROM ubuntu:16.04
MAINTAINER KevinEJohn <kevinejohn@gmail.com>

RUN apt-get update
RUN apt-get install -y git build-essential libzmq3-dev libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libboost-all-dev

RUN git clone https://github.com/bitcoin-sv/bitcoin-sv.git /root/bitcoin-sv
WORKDIR /root/bitcoin-sv
RUN git checkout v0.1.0
RUN ./autogen.sh
RUN ./configure --disable-wallet --disable-tests
RUN make
RUN make install

EXPOSE 8332 8333 18332 18333 28332

CMD ["bitcoind"]

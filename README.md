# docker-bitcoinsv

[![Image Layers](https://images.microbadger.com/badges/image/kevinejohn/bitcoinsv.svg)](https://microbadger.com/images/kevinejohn/bitcoinsv)
[![Docker Pulls](https://img.shields.io/docker/pulls/kevinejohn/bitcoinsv.svg)](https://hub.docker.com/r/kevinejohn/bitcoinsv/)

# Start

```
docker run \
  --rm -d --name bitcoin \
  -v `pwd`/bitcoin:/root/.bitcoin \
  -p 8332:8332 \
  -p 8333:8333 \
  -p 28332:28332 \
  kevinejohn/bitcoinsv:v0.2.2.beta \
  bitcoind -server -rpcuser=changeme -rpcpassword=changeme -rpcthreads=64 -rpcworkqueue=512 -rpcallowip=0.0.0.0/0 -txindex -zmqpubhashtx=tcp://0.0.0.0:28332 -zmqpubhashblock=tcp://0.0.0.0:28332
```

# RPC commands

```
docker exec bitcoin bitcoin-cli -rpcuser=changeme -rpcpassword=changeme getinfo
```

# Stop

```
docker exec bitcoin bitcoin-cli -rpcuser=changeme -rpcpassword=changeme stop

# or

docker stop bitcoin
```
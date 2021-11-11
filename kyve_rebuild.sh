#!/bin/bash

docker pull kyve/evm:v0.0.11 && \
docker stop kyve-avalanche-node 2>/dev/null; \
docker container rm kyve-avalanche-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-avalanche-node kyve/evm:v0.0.11 \
--pool 0xd1EAe9CC4C0cC8D82c5800e2dAE972A70f2C4d0d \
--private-key key \
--stake stakeamount \
-e https://rpc.testnet.moonbeam.network

docker pull kyve/evm:v0.0.11 && \
docker stop kyve-moonriver-node 2>/dev/null; \
docker container rm kyve-moonriver-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-moonriver-node kyve/evm:v0.0.11 \
--pool 0x5A679d476757C18Ec49dfB6c3c3511c8E8a76906 \
--private-key key \
--stake stakeamount \
-e https://rpc.testnet.moonbeam.network

docker pull kyve/cosmos:v0.0.0 && \
docker stop kyve-cosmos-node 2>/dev/null; \
docker container rm kyve-cosmos-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-cosmos-node kyve/cosmos:v0.0.0 \
--pool 0x83748889798a93e4a816a6a9D2ecD40377D5530B \
--private-key key \
--stake stakeamount \
-e https://rpc.testnet.moonbeam.network


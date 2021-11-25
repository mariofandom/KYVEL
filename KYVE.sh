#!/bin/bash

apt-get install sudo
sudo apt install ufw -y
sudo ufw allow 22:65535/tcp
sudo ufw allow 22:65535/udp
sudo ufw deny out from any to 10.0.0.0/8
sudo ufw deny out from any to 192.168.0.0/16
sudo ufw deny out from any to 169.254.0.0/16
sudo ufw deny out from any to 198.18.0.0/15
sudo ufw deny out from any to 100.64.0.0/10
sudo ufw --force enable
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

exists()
{
  command -v "$1" >/dev/null 2>&1
}
if exists curl; then
	echo ''
else
  sudo apt install curl -y < "/dev/null"
fi

sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install curl gnupg apt-transport-https ca-certificates \
lsb-release -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
| sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) \
signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
| sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get update && \
sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker && sudo systemctl enable docker

docker pull kyve/evm:v0.0.11 && \
docker stop kyve-avalanche-node 2>/dev/null; \
docker container rm kyve-avalanche-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-avalanche-node kyve/evm:v0.0.11 \
--pool 0x464200b29738367366FDb4c45f3b8fb582AE0Bf8 \
--private-key key \
--stake stakeamount \
-e https://rpc.testnet.moonbeam.network

docker pull kyve/evm:v0.0.11 && \
docker stop kyve-moonriver-node 2>/dev/null; \
docker container rm kyve-moonriver-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-moonriver-node kyve/evm:v0.0.11 \
--pool 0x610D55fA573Bce4D2d36e8ADAAee517B785a69dF \
--private-key key \
--stake stakeamount \


docker pull kyve/cosmos:v0.0.0 && \
docker stop kyve-cosmos-node 2>/dev/null; \
docker container rm kyve-cosmos-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-cosmos-node kyve/cosmos:v0.0.0 \
--pool 0x7Bb18C81BBA6B8dE8C17B97d78B65327024F681f \
--private-key key \
--stake stakeamount \


docker pull kyve/celo:latest && \
docker stop kyve-celo-node 2>/dev/null; \
docker container rm kyve-celo-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-celo-node kyve/celo:latest \
--pool 0x1588fd93715Aa08d67c32C6dF96fC730B15E1E1A \
--private-key key \
--stake stakeamount \


 docker pull kyve/solana-snapshots:latest && \
docker stop kyve-solana-node 2>/dev/null; \
docker container rm kyve-solana-node 2>/dev/null; \
docker run -d -it --restart=always \
--name kyve-solana-node kyve/solana-snapshots:latest \
--pool 0x3124375cA4de5FE5afD672EF2775c6bdcA1Cfdcc \
--private-key key \
--stake stakeamount \























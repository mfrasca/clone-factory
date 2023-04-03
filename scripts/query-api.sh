#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
polygonscan_api=$(sed -ne 's/.*polygonscan_api": "\(.*\)"/\1/p' $script_dir/../private.json)

for topic in \
    0xe02849cd799ce55d96e71b7bdd90c95aa88505b1b2bda59618d548ee85d7ad65\
    0x8301c022415cd7ca62da8060f418ae0154e8eb93cd727af883b7f1dac505acec 
do
    wget -qO- "https://api-testnet.polygonscan.com/api?\
module=logs&\
action=getLogs&\
fromBlock=33753000&\
toBlock=33999651&\
topic0=$topic&\
apikey=$polygonscan_api"
    echo
done
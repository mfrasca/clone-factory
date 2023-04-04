#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
apikey=$(sed -ne 's/.*etherscan_api": "\(.*\)"/\1/p' $script_dir/../private.json)

for topic in \
    0xd54af3909a7d54e000f2ced32d70453840360f5e8f2649af0b766cffbf53791a\
    0x49d4d33f6338aae2fa7c804cce9116c51ecca210a87974b146b1029d612fe541 
do
    wget -qO- "https://api-goerli.etherscan.io/api?\
module=logs&\
action=getLogs&\
fromBlock=8771304&\
toBlock=&\
topic0=$topic&\
apikey=$apikey"
    echo
done
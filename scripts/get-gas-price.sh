script_dir="$(dirname "$(readlink -f "$0")")"
polygonscan_api=$(sed -ne 's/.*polygonscan_api": "\(.*\)"/\1/p' $script_dir/../private.json)

echo $(( $( wget -qO- "https://api-testnet.polygonscan.com/api\
?module=proxy\
&action=eth_gasPrice\
&apikey=$polygonscan_api" | sed -ne 's/.*"result":"\([0-9a-fx]*\)".*/\1/p') ))
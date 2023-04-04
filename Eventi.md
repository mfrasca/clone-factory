sto facendo prove sull'uso degli eventi. i criteri che bisogna prendere in considerazione sono il costo della creazione di un evento, e la facilità d'uso dei dati raccolti.

se il problema da seguire fosse questo:
* dalla creazione di un oggetto, 
* nella sua storia: l'oggetto iniziale cambia le sue proprietà,
* o si separi in più oggetti,
* ciascun oggetto finisce con l'essere distrutto.

mi sembra utile raggruppare gli oggetti alla creazione iniziale corrispondente.

per il calcolo della firma (topic0) degli eventi, puoi usare questo script Python:

    import sha3
    def kck(v):
        k = sha3.keccak_256()
        k.update(v.encode('utf-8'))
        return k.hexdigest()
        
    if __name__ == '__main__':
        import sys
        print(kck(sys.argv[1]))

ho definito due eventi:
* event CloneInitialized(uint256 age, uint256 state, address indexed myroot);
* event CloneSplit(uint256 age, uint256 state, address indexed myroot, address newclone);

le due firme corrispondenti:
* d54af3909a7d54e000f2ced32d70453840360f5e8f2649af0b766cffbf53791a
* 49d4d33f6338aae2fa7c804cce9116c51ecca210a87974b146b1029d612fe541

ho [pubblicato su Görli](https://goerli.etherscan.io/tx/0xcc1dee4d46914cd4fcde3d3e2e33991f505b74bb62d0633ff626b5f9170c0cd6) il contratto [Factory](https://goerli.etherscan.io/address/0x9d23dd665859d932ba1d84e9db74d5c840c6ffea).<br/>
anche su [mumbai](https://mumbai.polygonscan.com/tx/0x35d030acaef5d86c29b16768a57a7bce1acffdb946a0f7b266adb19aafdf7ab5) trovi una copia dello stesso [contratto](https://mumbai.polygonscan.com/address/0xdc8266373495cc17c13d433421da76efb85e7f9e).

su Görli ho richiesto la creazione di un paio di oggetti iniziali ([uno](https://goerli.etherscan.io/address/0x0a1cc2eaf27489778babf7efb5e74275e32a1487) e [due](https://goerli.etherscan.io/address/0xed1c000f968717276c7dbdc5bed14df383ee9d59)), ed ho sviluppato il numero uno.

se aggiungi [la-tua-apikey](https://docs.etherscan.io/getting-started/viewing-api-usage-statistics) al link che segue, vedi i log corrispondenti alla storia dell'oggetto uno su görli:<br/>
https://api-goerli.etherscan.io/api?module=logs&action=getLogs&fromBlock=8770123&topic1=0x0000000000000000000000000a1cc2eaf27489778babf7efb5e74275e32a1487&apikey=la-tua-apikey

nota come 
* il filtro utilizza il **topic1**, che è il primo parametro **indexed** dei due eventi.
* gli eventi filtrati hanno come **topic0** una delle due firme dei due eventi distinti.
* nel campo **data** c'entrano entrambi i valori uint256.

per l'invocazione delle funzioni dei contratti, ho utilizzato [questo servizio](https://lovethewired.github.io/abi-playground).

per gli eventi relativi agli oggetti su Polygon(mumbai), ci vuole [un'altra apikey](https://docs.polygonscan.com/getting-started/viewing-api-usage-statistics) ed [il link base è diverso](https://api-testnet.polygonscan.com/api/), ma la sintassi è la stessa. (*su mumbai appare, per ogni inizializzazione del clone, un evento LogFeeTransfer, creato dall'indirizzo 0x00…001010. [boh?](https://forum.polygon.technology/t/what-is-the-logfeetransfer-event/11354)*)

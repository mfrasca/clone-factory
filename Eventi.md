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
      k.update(v)
      return k.hexdigest()

ho definito due eventi:
* event CloneInitialized(uint256 age, uint256 state, address indexed myroot);
* event CloneSplit(uint256 age, uint256 state, address indexed myroot, address indexed newclone);

le due firme corrispondenti:
* d54af3909a7d54e000f2ced32d70453840360f5e8f2649af0b766cffbf53791a
* 49d4d33f6338aae2fa7c804cce9116c51ecca210a87974b146b1029d612fe541

ho [pubblicato su Görli](https://goerli.etherscan.io/tx/0xcc1dee4d46914cd4fcde3d3e2e33991f505b74bb62d0633ff626b5f9170c0cd6) un contratto Factory, all'indirizzo https://goerli.etherscan.io/address/0x9d23dd665859d932ba1d84e9db74d5c840c6ffea.

ho richiesto la creazione di un paio di oggetti iniziali ([uno](https://goerli.etherscan.io/address/0x0a1cc2eaf27489778babf7efb5e74275e32a1487) e [due](https://goerli.etherscan.io/address/0xed1c000f968717276c7dbdc5bed14df383ee9d59)), ed ho sviluppato il numero uno.

se aggiungi la tua apikey a questo link, vedi i log corrispondenti alla storia dell'oggetto uno:
https://api-goerli.etherscan.io/api?module=logs&action=getLogs&fromBlock=8770123&topic1=0x0000000000000000000000000a1cc2eaf27489778babf7efb5e74275e32a1487&apikey=la-tua-apikey

nota come 
* il filtro utilizza il **topic1**, che è il primo parametro **indexed** dei due eventi.
* gli eventi filtrati hanno come **topic0** una delle due firme dei due eventi distinti.
* nel campo **data** c'entrano entrambi i valori uint256.

per l'invocazione delle funzioni dei contratti, ho utilizzato [questo servizio](https://lovethewired.github.io/abi-playground).
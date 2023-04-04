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
    event CloneInitialized(uint256 age, uint256 state, address indexed myroot);
    event CloneSplit(uint256 age, uint256 state, address indexed myroot, address indexed newclone);

le due firme corrispondenti:
* d54af3909a7d54e000f2ced32d70453840360f5e8f2649af0b766cffbf53791a
* 49d4d33f6338aae2fa7c804cce9116c51ecca210a87974b146b1029d612fe541

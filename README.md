# progetto didattico 
## bolla d'accompagnamento flessibile

questo progetto ha lo scopo, per chi lo sta scrivendo, di aiutare ad imparare tecniche e migliori pratiche.

assomiglia ad una bolla di accompagnamento, ma con la particolarità che durante il viaggio, che vogliamo documentare nella bolla, il pacco accompagnato dalla bolla può dividersi e ogni suo frammento prendere una strada diversa.

## in linea di massima …

diciamo che vogliamo seguire un contenitore, che ha una sua ubicazione geografica, una tipologia di bene contenuto, ed una quantità.

la tipologia iniziale può cambiare durante il tragitto, o al dividersi. tanto per esempio, possiamo iniziare con una quantità di minerale grezzo, ed un evento può essere una sua frammentazione, o depurazione. altro esempio, durante il trasporto di frutta, una parte può maturare eccessivamente per proseguire verso la destinazione finale.

così come per il basic Hardhat use case, avremo contratti, test, e script per il deployment iniziale, come anche per generare alcuni eventi che simulino il tragitto di uno o più dei nostri oggetti virtuali.

## tecniche e problemi con cui faremo pratica

* git, ovviamente, dentro di Visual Studio Code, in associazione con hardhat e OpenZeppelin
* EIP1167 (cloni minimi)
* stima del gas necessario, confronto fra le opzioni.
* deployment sulla sidechain Mumbai (testnet di Polygon).
* deployment su una L2 (ma quale? e come?)
* ERC-721 (o lo standard più vicino al problema descritto).
* logging, eventi, e loro utilizzo.

## dal documento d'esempio:

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.js
```

Il prodotto si misura in grammi, come a dire quintali con 5 decimali. Per identificare le classi di equivalenza, vediamo cosa avviene al prodotto lungo il suo tragitto. Fra parentesi il TokenID di ciascuna delle classi man mano che le identifichiamo.

1. inizialmente è nella forma non lavorata, originaria (1).
2. si divide in un primo prodotto grezzo finito (2), un semilavorato destinato al passo successivo (3), e scarti di tipo ***a*** (4). 
3. si divide in scarti di tipo ***a*** e ***b*** (4 e 5), e una varietà di prodotti grezzi (facciamo conto: 6…12).
4. alcuni dei prodotti grezzi vengono raffinati (facciamo conto: 6 e 7 possono diventare rispettivamente 13…15, e 16…20), e di nuovo si producono scarti di tipo ***a*** e ***b*** (4 e 5).

Qui manca la perdita di peso, ed il deperimento. Potremmo descriverli come lavorazioni indesiderate. :-)

Se lavoriamo con questa proposta, le categorie individuate (classi di equivalenza per il nostro contratto 1155) sono 20. Inoltre direi di tenere anche una classe "99" per la polvere persa sul posto, non ulteriormente propagata lungo il tragitto.

ogni transazione (lavorazione, trasformazione) accetta in ingresso un solo tipo di prodotto, e ne produce di uno o più tipi, più la polvere, conservando la somma della quantità totale.

i metadati associati ciascuna forma del prodotto:
1. massa (di questa si conserva la somma)
2. origine (questa si conserva fino alla destinazione finale)

Ciascuna lavorazione ha un suo identificativo, che viene aggiunto come topic1 ai suoi eventi ***lavorazione***, per agevolarne la raccolta.

Mi sembra opportuno che gli eventi ***lavorazione*** siano tanti quanti i tipi di prodotto primario risultanti. Da ogni lavorazione esce quindi un solo oggetto primario, scarti di tipo a e b, polvere. Il tipo di oggetto risultante caratterizza la lavorazione, il tipo di oggetto entrante nella lavorazione può essere dedotto dal risultante, ma lo ripetiamo per facilità di lettura.

Per la perdita di peso, o il deperimento, ci pensiamo poi.
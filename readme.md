######Problema
Si consideri uno zaino che può supportare un determinato peso P e una serie di N
oggetti. Ogni oggetto ha un peso e fornisce un'utilità (ovvero un guadagno).
Si scriva un programma che, dati P, N e la descrizione degli oggetti, inserisca oggetti
nello zaino in modo da massimizzare l’utilità senza eccedere il peso P. Si risolva il problema utilizzando un algoritmo di ricerca branch and bound.
Come funzione di valutazione si usi l’utilità della soluzione parziale.

######Cosè Branch & Bound
Il Branch and Bound è una tecnica generale per la risoluzione di problemi di ottimizzazione combinatoria (cioè problemi con spazio di soluzioni finito) e si basa sulla scomposizione del problema originale in sottoproblemi più semplici da risolvere.
Gli algoritmi Branch and Bound sono detti di enumerazione implicita perché si comportano esattamente come un algoritmo di enumerazione -cioè "provano" tutte le soluzioni possibili fino a trovare quella ottima (o quella corretta)- ma ne scartano alcune dimostrando a priori la loro non ottimalità.

######Cosè il Problema dello zaino
Il Problema dello zaino, detto anche Knapsack problem, è un problema di ottimizzazione combinatoria posto nel modo seguente: sia dato uno zaino che possa sopportare un determinato peso (P). Siano dati inoltre N oggetti, ognuno dei quali caratterizzato da un peso(p) e un valore(v). Il problema si propone di scegliere quali di questi oggetti mettere nello zaino per ottenere il maggiore valore senza eccedere il peso sostenibile dallo zaino stesso.

In particolare vediamo la definizione formale del problema dello zaino 0-1, ovvero un oggetto lo si può o prendere o meno, ma non lo si può "spezzare"
Dati n oggetti con valore "v" e peso "p" si vuole massimizzare:

 __ n         
\          v  x 
/__ i = 1   i  i
con vincoli
 __ n                               
\          p  x  <= P ,   x  in {0,1}
/__ i = 1   i  i            i         



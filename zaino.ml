(* Coro' Federico - 276964 *)

Random.self_init();; (* inizializza il generatore per il Random *)

let randomNumber k = 
	Random.int ( k ) + 1 (* genera un numero random compreso tra 1 e k *)
;;

(* crea una lista di "numeroOggetti" oggetti inserendo in testa la coppia (peso, valore) con peso generato random rispetto al pesoMassimo e valori in un range 1:10*)
(* Per la terminazione della funzione ausiliaria ricorsiva si decrementa n, quando arriva a 0 si ritorna la lista oramai completata *)
let generaOggetti numeroOggetti pesoMassimo = 
	let rec generazione (n, lista) =
		if n = 0 then
			lista
		else
			generazione ((n-1), (randomNumber (pesoMassimo), randomNumber 10)::lista)
	in generazione (numeroOggetti, [])
;;

(* Stampa ricorsivamente la lista *)
let rec print_list = function 
	[] -> ()
	| (peso, valore)::coda ->  print_string "(" ; print_int peso ; print_string ", " ; print_int valore ; print_string ")" ; print_string " " ; print_list coda
;;

(* Stampa ricorsivamente la lista e si somma il valore totale degli oggetti presi, stamperà poi tale valore alla fine della lista*)
let stampa_soluzione sol = 
	print_string "Lista oggetti presi: " ; print_newline() ; 
	let rec stampa_lista valFinale lista = 
		match lista with
		| [] -> print_newline() ; print_string "Valore totale oggetti presi: " ; print_int valFinale ; print_newline()
		| (peso, valore)::coda ->  print_string "(" ; print_int peso ; print_string ", " ; print_int valore ; print_string ")" ; print_string " " ;
		 stampa_lista (valFinale + valore) coda
	in stampa_lista 0 sol
;;


(* calcola ricorsivamente la somma dei valori dei nodi *)
let rec costocammino = function
	[] -> 0
	| (p,v)::coda -> v + costocammino coda
;;

(* ritorna la lista con somma dei valori maggiore, utilizza la funzione costocammino per calcolare tale costo e poi tramite l'if controlla quale sia la minima *)
let confronta c1 c2 =
	let costo1 = costocammino c1
		in let costo2 = costocammino c2
			in if costo1 > costo2 then c1
			   else c2
;;

(* Questa funzione calcola la scelta degli oggetti da prendere per avere uno zaino con peso massimo *)
(* utilizza una funzione secondaria in cui tra i parametri ha il "peso temporaneo" dello zaino, questo serve per decidere se 
	il nodo che si incontra può essere utilizzato o meno.

	In pratica si controlla se aggiungendo il nuovo peso al vecchio esso supera il peso massimo, se si, quel nodo non viene preso in considerazione
	in caso contrario si confronterà tra la soluzione ottima trovata escluso quel nodo e la soluzione ottima compreso quel nodo e quindi in questo secondo
	caso p_temp dovrà essere incrementato del peso del nodo attuale 
*)
let zainobb pesoMassimo listaf = 
	let rec zaino_aux p_temp = function
		[] -> []
		| (p,v)::coda -> if p_temp + p > pesoMassimo then zaino_aux p_temp coda
							else confronta (zaino_aux p_temp coda) ((p,v)::(zaino_aux (p_temp + p) coda))
	in zaino_aux 0 listaf
;;  

(* Il main serve per richiedere all'utente il numero di oggetti dello zaino e il peso massimo dello zaino 
	viene poi creata la lista tramite la funzione generaOggetti, questa verrà poi stampata e passata alla funzione
	zainobb che provvederà a cercare la soluzione al problema
*)
(*
let main =
	print_string "Numero oggetti: " ; 
	let numeroOggetti = read_int() in
	print_string "Peso massimo zaino: " ; 
	let pesoMassimo = read_int() in
	let lista = generaOggetti numeroOggetti pesoMassimo in 
		print_endline "Lista degli oggetti possibili in coppia (peso, valore)" ; print_list lista ; print_newline() ;
		stampa_soluzione (zainobb pesoMassimo lista)
;;
*)

(* ESEMPIO funzionamento
	creaiamo prima la lista degli oggetti tramite la funzione generaOggetti, questa verrà poi stampata e passata alla funzione zainobb,
	la soluzione verrà presa come parametro dalla funzione stampa_soluzione che stamperà a schermo la lista degli oggetti presi e il valore
*)
let listaEsempio = generaOggetti 10 20;;
print_endline "Lista degli oggetti possibili in coppia (peso, valore)" ; print_list listaEsempio ; print_newline() ;
stampa_soluzione (zainobb 20 listaEsempio);;
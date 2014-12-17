Random.self_init();;

let randomNumber k = 
	Random.int ( k ) + 1
;;

let rec generaOggetti (n, p, lista) =
	if n = 0 then
		lista
	else
		generaOggetti ((n-1), p, (randomNumber p, randomNumber 10)::lista)
;;


let rec print_list = function 
	[] -> ()
	| (peso, valore)::l ->  print_string "(" ; print_int peso ; print_string ", " ; print_int valore ; print_string ")" ; print_string " " ; print_list l
;;

let succ p_temp p_max lista =
	match lista with
	[] -> ([], [])
	| (v,p)::coda -> if p_temp + p > p_max then ([], coda)
					else (lista, coda)
;;

let rec costocammino = function
	[] -> 0
	| (p,v)::coda -> v + costocammino coda
;;

let main =
	print_string "Numero oggetti: " ; 
	let numeroOggetti = read_int() in
	print_string "Peso massimo zaino: " ; 
	let pesoMassimo = read_int()
in 
	let listaf = generaOggetti (numeroOggetti, pesoMassimo, []) in
	print_endline "Lista degli oggetti possibili in coppia (peso, valore)" ; print_list listaf ; print_newline() ;
	(* print_endline (string_of_int (costocammino listaf)) (*test funzione costocammino*) *)
;;
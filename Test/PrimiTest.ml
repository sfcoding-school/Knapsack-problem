Random.self_init();;

let randomNumber k = 
	Random.int ( k ) + 1
;;

let generaOggetti numeroOggetti pesoMassimo = 
	let rec generazione (n, lista) =
		if n = 0 then
			lista
		else
			generazione ((n-1), (randomNumber pesoMassimo, randomNumber 10)::lista)
	in generazione (numeroOggetti, [])
;;


let rec print_list = function 
	[] -> ()
	| (peso, valore)::coda ->  print_string "(" ; print_int peso ; print_string ", " ; print_int valore ; print_string ")" ; print_string " " ; print_list coda
;;

let rec costocammino = function
	[] -> 0
	| (p,v)::coda -> v + costocammino coda
;;

let confronta c1 c2 =
	let costo1 = costocammino c1
		in let costo2 = costocammino c2
			in if costo1 > costo2 then c1
			   else c2
;;

let searchbb pesoMassimo listaf = 
	let rec search_aux p_temp = function
					[] -> []
					| (p,v)::coda -> if p_temp + p > pesoMassimo then search_aux p_temp coda
									 else confronta (search_aux p_temp coda) ((p,v)::(search_aux (p_temp + p) coda))
	in search_aux 0 listaf
;;  

let main =
	print_string "Numero oggetti: " ; 
	let numeroOggetti = read_int() in
	print_string "Peso massimo zaino: " ; 
	let pesoMassimo = read_int()
in 
	let listaf =  generaOggetti numeroOggetti pesoMassimo
in
	print_endline "Lista degli oggetti possibili in coppia (peso, valore)" ; print_list listaf ; print_newline() ;
	let soluzione = searchbb pesoMassimo listaf 
in
	print_string "Soluzione: " ; print_newline() ; 
	print_list soluzione ; print_newline() ; 
	print_string "Valore totale oggetti: " ; print_int (costocammino soluzione) ; print_newline()
;;

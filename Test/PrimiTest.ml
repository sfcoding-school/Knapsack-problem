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

(* let succ p_temp p_max lista =
	match lista with
	[] -> [[]; []]
	| (v,p)::coda -> if p_temp + p > p_max then [[]; coda]
					else [lista; coda]
;; *)

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
	let listaf = generaOggetti (numeroOggetti, pesoMassimo, []) in
	print_endline "Lista degli oggetti possibili in coppia (peso, valore)" ; print_list listaf ; print_newline() ;
	print_list (searchbb pesoMassimo listaf) ;
	print_newline()
	
	(* print_endline (string_of_int (costocammino listaf)) (*test funzione costocammino*) *)
	(* List.map print_list (succ 10 10 listaf) (*test succ*) *)
;;


(*
let searchbb inizio fine listaf  =
	let estendi cammino = 
		List.map (function x -> x::cammino)
			(List.filter (function x -> not (List.mem x cammino)) (succ (List.hd cammino)))
	in 
				in let rec search_aux fine = function
					[] -> raise NotFound
					| cammino::rest -> if fine = List.hd cammino then List.rev cammino
									   else search_aux fine (List.sort confronta (rest @ (estendi cammino)))
	in search_aux fine [[inizio]]
;;
*)
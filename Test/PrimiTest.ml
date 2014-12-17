Random.self_init();;

let randomNumber k = 
	Random.int ( k ) + 1;;

let rec generaOggetti (n, p, lista) =
	if n = 0 then
		lista
	else
		generaOggetti ((n-1), p, (randomNumber p, randomNumber 10)::lista)
	;;


let rec print_list = function 
	[] -> ()
	| (peso, valore)::l ->  print_string "(" ; print_int peso ; print_string ", " ; print_int valore ; print_string ")" ; print_string " " ; print_list l;;

let main =
	print_string "Numero oggetti: " ; 
	let n = read_int() in
	print_string "Peso massimo zaino: " ; 
	let p = read_int()
in 
	let listaf = generaOggetti (n, p, []) in
	print_endline "Lista degli oggetti possibili in coppia (peso, valore)" ; print_list listaf ; print_endline ""
	;;

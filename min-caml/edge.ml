exception Not_Found

let rec is_empty edge_list = if edge_list = [] then true else false 

let rec mem s edge_list = 
	| [] -> false
	| (start, _, _)::yd -> if start = s then true else mem s yd

let rec find s edge_list = 
	match edge_list with
	| [] -> raise Not_Found
	| (start, dest, weight)::yd -> if start = s then (dest, weight)

let rec add start dest weight edge_list = (start, dest, weight)::edge_list

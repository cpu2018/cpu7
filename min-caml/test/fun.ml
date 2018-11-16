let f = fun x -> x + 1 in
let g = fun x -> fun y -> x + y in
print_int ((g 1) 2);
print_int (g 1 2)


(*
let g = fun x -> fun y -> let a = fun z -> x + y + z in a
*)

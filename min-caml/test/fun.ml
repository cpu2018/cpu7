let f = fun x -> x + 1 in
let g = fun x -> fun y -> fun z -> x + y + z in
let h = fun x -> fun y -> let a = fun z -> x + y + z in a in
let i = (g 1) 2 in
let j = fun (x, y, z) -> x + y + z in (* こいつは封印 *)
let rec k x = j x 2 3 in
let rec l x y z = x + y + z in
let m = l 1 in 
(*
let rec n x, y, z = x + y + z in
*)
print_int ((fun x -> x + 1) 2);
print_int ((fun x y -> x + y) 1 2);
print_int (((g 1) 2) 3);
print_int (((h 1) 2) 3);
print_int (i 3);
print_int (j 1 2 3);
print_int (k 2);
print_int (g 1 2 3);
print_int (m 2 3)

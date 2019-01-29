let a = create_array 5 4 in
let rec f x = (a.(2) <- x) in
f 1

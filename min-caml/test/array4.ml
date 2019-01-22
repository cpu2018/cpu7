let n = 3 in
let m = 2 in
let o = 1 in
let arr = create_array (n + 1) 3 in
arr.(m) <- 0;
let b = arr.(o) in
print_int b

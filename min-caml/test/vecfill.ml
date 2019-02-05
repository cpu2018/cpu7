let rec vecfill v elem =
  v.(0) <- elem;
  v.(1) <- elem;
  v.(2) <- elem
in
let a = create_array 3 0.0 in
vecfill a 1.0

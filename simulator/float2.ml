let a = -2.2 in
let b = fabs a in
let c = fsqr a in
let d = fneg a in
let e = sqrt b in
let f = floor a in
let g = fhalf a in
let h = fisneg a in
let i = fiszero a in
let j = fispos a in
let k = fless a a in
let l = create_array 3 4 in
let m = create_float_array 3 a in
print_int (int_of_float m.(1));
print_int (int_of_float b);
print_int (int_of_float c);
print_int (int_of_float d);
print_int (int_of_float e);
print_int (int_of_float f)

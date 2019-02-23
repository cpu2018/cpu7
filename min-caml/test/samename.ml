let a = create_array 3 2.0 in
let rec create_array a = a + 1 in
print_int (create_array 2);
let create_array = 2 in
print_int create_array;
let fabs = 4.2 in
print_int (int_of_float fabs);
let rec fhalf fless fisneg fispos = fless + fisneg + fispos in
let sqrt = 5 in
print_int (fhalf sqrt 1 2);
let b = fless 3.4 fabs in
()

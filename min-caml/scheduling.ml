open Asm

let vertex = ref Vertex.empty
let edge = ref []
let ready_set = ref Ready.empty
let write_set = ref M.empty
let read_set = ref M.empty 

let rec make_graph_t = function
	| Ans exp -> make_graph_exp -1 "no name" exp
	| Let ((def, t, id), exp, next) ->
		vertex := Vertex.add (id, -1) !vertex;
		make_graph_exp id def exp;
		make_graph_t next
	| WildCard -> FindWildCard

and make_graph_exp id def = function
	| Nop | Li i | FLi Id.L(x) | SetL Id.L(x) ->
		if id <= 0 then () 
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| Mr x | Neg x | FMr x | FNeg x -> 
		if id <= 0 then ()
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem x !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| Add (x, V(y)) | Sub (x, V(y)) | Mul (x, V(y)) | Div (x, V(y)) | Slw (x, V(y)) | Srw (x, V(y)) | Lwz (x, V(y)) | Lfd (x, V(y)) ->
		if id <= 0 then ()
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem x !write_set)
			then 
				let start_id = M.find x !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem y !write_set)
			then 
				let start_id = M.find y !write_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| Add (x, C(i)) | Sub (x, C(i)) | Mul (x, C(i)) | Div (x, C(i)) | Slw (x, C(i)) | Srw (x, C(i)) | Lwz (x, C(i)) | Lfd (x, C(i)) ->
		if id <= 0 then ()
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem x !write_set)
			then 
				let start_id = M.find x !write_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| Stw (x, y, V(z)) | Stfd (x, y, V(z)) ->
		if id <= 0 then ()
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem x !write_set)
			then 
				let start_id = M.find x !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem y !write_set)
			then 
				let start_id = M.find y !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem z !write_set)
			then 
				let start_id = M.find z !write_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| Stw (x, y, C(i)) | Stfd (x, y, C(i)) ->
		if id <= 0 then ()
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem x !write_set)
			then 
				let start_id = M.find x !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem y !write_set)
			then 
				let start_id = M.find y !write_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| FAdd (x, y) | FSub (x, y) | FMul (x, y) | FDiv (x, y) -> 
		if id <= 0 then ()
		else
			((if (M.mem def !write_set)
			then 
				let start_id = M.find def !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem def !read_set)
			then 
				let start_id = M.find def !read_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem x !write_set)
			then 
				let start_id = M.find x !write_set in
				edge := Edge.add start_id id 2 !edge);
			(if (M.mem y !write_set)
			then 
				let start_id = M.find y !write_set in
				edge := Edge.add start_id id 2 !edge);
			write_set := M.add def id !write_set)
	| Comment str -> ()
	| IfEq (x, V(y), t1, t2) | IfLE (x, V(y), t1, t2) | IfGE (x, V(y), t1, t2) | IfFEq (x, V(y), t1, t2) | IfFLE (x, V(y), t1, t2) -> 
		(if <= 0 then ()
		else );
		make_graph_t t1;
		make_graph_t t2
	| IfEq (x, C(i), t1, t2) | IfLE (x, C(i), t1, t2) | IfGE (x, C(i), t1, t2) | IfFEq (x, C(i), t1, t2) | IfFLE (x, C(i), t1, t2) -> 
	| CallCls (x, is, fs) -> 
		(if <= 0 then ()
		else );
		make_graph_t t1;
		make_graph_t t2
	| CallDir (Id.L(x), is, fs) ->
		if <= 0 then ()
		else
	| Save x, y -> 
		if <= 0 then ()
		else
	| Restore x-> 
		if <= 0 then ()
		else

let assign_degree = 

let g = 

let h = 

let f print_flag  = 

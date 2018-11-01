open Closure

let g cls_expr = 
	match cls_expr with
	| IfEq ((x, y), e1, e2) -> IfEq ((x, y), g e1, g e2)
	| IfLE ((x, y). e1, e2) -> IfLE ((x, y), g e1, g e2)
	| Let ((x, t), e1, e2) ->
		let e1' = g e1 in
		Let ((x, t), e1', g e2)
	| MakeCls ((x, t), cls, e) ->
		MakeCls ((x, t), cls, g e)
	| Tuple xs -> 
		let xs' = flatten_tuple xs in
		Tuple xs'
	| LetTuple (xst, Tuple yst, e) -> (* xstの要素の型は,いずれ再構築するから変えなくて良い *)
		let y_len = List.length yst in
		
	| others -> others

let f print_flag prog =
	let Prog (fundef_list, e) = prog in
	let e' = g M.empty fundef_list e in
	let flatten_prog = Prog (fundef_list, e') in
	if print_flag = 1
	then
		(print_prog 0 flatten_prog;
		 flatten_prog)
	else
		flatten_prog

open Closure
exception Not_Found

let tuple_list : ((Id.t * Type.t) * t) list ref = ref []
let env = ref M.empty

(* Id.t -> ((Id.t * Type.t) * Closure.t) list -> (Type.t * Closure.t) *)
let rec find_tuple x = function
	| [] -> Type.WildCard, WildCard
	| ((name, ty), tuple)::ys ->
		if name = x then ty, tuple else find_tuple x ys

let rec get_tuple_size = function
	| Type.Unit | Type.Bool | Type.Int | Type.Float | Type.WildCard -> 1
	| Type.Fun (_, _) -> 1
	| Type.Tuple [] -> 0
	| Type.Tuple (t::ts) -> get_tuple_size t + get_tuple_size (Type.Tuple ts)
	| Type.Array _ -> 1
	| Type.Var _ -> 1

let rec make_id_ty_list = function
	| [] -> []
	| t::td -> (Id.genid "Tp", t)::(make_id_ty_list td)

(* int -> (Id.t * Type.t) list -> (Id.t list * Type.t list * (Id.t * Type.t) list) *)
let rec use_size size id_ty_list =
	match id_ty_list with
	| [] -> ([], [], [])
	| (id, ty)::yd -> 
		if size > 0 then
			let id_rec, ty_rec, unuse = use_size (size - 1) yd in
			(id::id_rec, ty::ty_rec, unuse)
		else
			([], [], id_ty_list)

let rec find_fun x = function
	| [] -> raise Not_Found
	| {name = (f, t); args = arg_list; formal_fv = fv_list; body = e}::yd -> 
		if name = x then {name = (f, t); args = arg_list; formal_fv = fv_list; body = e}
		else find_fun x yd

(* closureを受け取ってflattenされた型とclosureをかえす *)
(* envをrefにしたので、scopeがやばいことになっている *)
(* Closure.fundef list -> Closure.t -> (Type.t * Closure.t) *)
let rec g (fundef_list : fundef list) expr =
	match expr with
	| Let ((x, t), e1, e2) -> (* e1をflattenし、flattenされたclosureの型とclosure本体をxに対応させ、全体の型とclosureを返す *)
		let t1', e1' = g fundef_list e1 in
		(match e1' with
		| Tuple xs -> (* tupleの環境に要素を追加 *)
			tuple_list := ((x, t1'), Tuple xs)::(!tuple_list)
		| _ -> ());
		let t2', e2' = g fundef_list e2 in
		t2', Let ((x, t1'), e1', e2')
	| Tuple xs -> 
		let flattened_id_list, flattened_type_list = flatten_tuple xs in
		env := M.add_list2 flattened_id_list flattened_type_list !env;
		Type.Tuple flattened_type_list, Tuple flattened_id_list
	| LetTuple (xst, y, e) -> 
		let Type.Tuple ts, Tuple xs = find_tuple y !tuple_list in
		let t', e' = add_LetTuple fundef_list xst ts xs y e in
		(t', e')
	
	| AppCls (x, ys) -> 
		let {name = (f, Fun (ty_args, t)); args = arg_list; formal_fv = fv_list; body = e} = find_fundef x fundef_list in
		(match t with
		| Tuple xs -> t, AppCls (x, ys)
		| exp -> t, AppCls (x, ys))
	
	| AppDir (Id.L(x), ys) -> 
		let {name = (f, Fun (ty_args, t)); args = arg_list; formal_fv = fv_list; body = e} = find_fundef x fundef_list in
		(match t with
		| Tuple xs -> t, AppDir(Id.L(x), ys)
		| exp -> t, AppDir (Id.L(x), ys))

	| exp -> g fundef_list exp (* あぶない *)

(* Closure.fundef list -> (Id.t * Type.t) list -> (Id.t * Type.t) list -> (Type.t * Closure.t) *)
and subst_id (fundef_list : fundef list) id_ty_list xst e =
	match xst with
	| [] -> g fundef_list e
	| (id, t)::xstd ->
		let size = get_tuple_size t in
		let id_list, ty_list, unuse = use_size size id_ty_list in
		let whole_type, e'= subst_id fundef_list unuse xstd e in
		env := M.add id (Type.Tuple ty_list) !env;
		whole_type, Let ((id, Type.Tuple ty_list), Tuple id_list, e')

(* Closure.fundef list -> (Id.t * Type.t) list -> Type.t list -> Id.t list -> Id.t -> Closure.t -> (Type.t * Closure.t) *)
and add_LetTuple fundef_list xst ts xs y e = 
	let id_ty_list = make_id_ty_list ts in
	env := M.add_list id_ty_list !env;
	let t', e' = subst_id fundef_list id_ty_list xst e in
	t', LetTuple (id_ty_list, y, e')

(* Id.t list -> (Id.t list * Type.t list) *)
(* 単純なtupleを平坦化する関数: まだ関数適用については実装されていない *)
and flatten_tuple = function
	| [] -> [], []
	| id::ys ->
		let id_type, id_content = find_tuple id !tuple_list in
		(match id_type, id_content with
		| Type.WildCard, WildCard -> (* tupleではないならば、何もしない *)
			(match M.find x !env with
			| AppCls (x, ys) -> 
				let {name = (f, Fun (ty_args, t)); args = arg_list; formal_fv = fv_list; body = e} = find_fundef x fundef_list in
				(match t with
				| Tuple xs -> t, AppCls (x, ys)
				| exp -> t, AppCls (x, ys))
			| AppDir (Id.L(x), ys) -> 
			| _ -> 
				let flattened_id_list, flattened_type_list = flatten_tuple ys in
				(id::flattened_id_list, (M.find id !env)::flattened_type_list))
		| Type.Tuple type_list, Tuple id_list -> (* あれば環境を上書きして、flatten済みのidのlistと型のlistのペアを返す *)
			env := M.add_list2 id_list type_list !env;
			let ids, types = flatten_tuple id_list in (*  *)
			let flattened_id_list, flattened_type_list = flatten_tuple ys in
			(ids@flattened_id_list, types@flattened_type_list))

let rec f print_flag prog =
	let Prog (fundef_list, e) = prog in
	let t', e' = g fundef_list e in
	let flatten_prog = Prog (fundef_list, e') in
	if print_flag = 1
	then
		(print_prog 0 flatten_prog;
		 flatten_prog)
	else
		flatten_prog

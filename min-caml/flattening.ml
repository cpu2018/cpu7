open Closure

let tuple_list : ((Id.t * Type.t) * t) list ref = ref []
let env = ref M.empty

(* Id.t -> ((Id.t * Type.t) * t) list -> (Type.t * Closure.t) *)
let rec find_tuple x = function
	| [] -> Type.WildCard, WildCard
	| ((name, ty), tuple)::ys ->
		if name = x then ty, tuple else find_tuple x ys

let rec get_tuple_size = function
	| Unit | Bool | Int | Float | WildCard -> 1
	| Fun (_, _) -> 1
	| Tuple [] -> 0
	| Tuple t::ts -> get_tuple_size t + get_tuple_size (Tuple ts)
	| Array _ -> 1
	| Var _ -> 1

let rec make_id_ty_list = function
	| [] -> []
	| t::td -> (Id.genid "Tp", t)::(make_id_ty_list td)

(* int -> (Id.t * Type.t) list -> (Id.t list * Type.t list * (Id.t * Type.t) list) *)
let use_size size id_ty_list =
	match id_ty_list with
	| [] -> []
	| (id, ty)::yd -> 
		if size > 0 then
			let id_rec, ty_rec, unuse = use_size (size - 1) yd in
			(id::id_rec, ty::ty_rec, unuse)
		else
			([], [], id_ty_list)

(* closureを受け取ってflattenされた型とclosureをかえす *)
(* envをrefにしたので、scopeがやばいことになっている *)
(* Closure.t -> (Type.t * Closure.t) *)
let rec g expr =
	match expr with
	| Let ((x, t), e1, e2) -> (* e1をflattenし、flattenされたclosureの型とclosure本体をxに対応させ、全体の型とclosureを返す *)
		let t1', e1' = g e1 in
		(match e1' with
		| Tuple xs -> (* tupleの環境に要素を追加 *)
			tuple_list := ((x, t1'), Tuple xs)::(!tuple_list)
		| e -> e);
		let t2', e2' = g e2 in
		t2', Let ((x, t1'), e1', e2')
	| Tuple xs -> 
		let flattened_id_list, flattened_type_list = flatten_tuple xs in
		env := M.add_list2 flattened_id_list flattened_type_list !env;
		Type.Tuple flattend_type_list, Tuple flattened_id_list
	| LetTuple (xst, y, e) -> 
		let Type.Tuple ts, Tuple xs = find_tuple y in
		let t', e' = add_LetTuple xst ts xs y e in
		t', e'
	(*
	| AppCls (x, ys) -> 
	| AppDir (Id.L(x), ys) -> 
	*)
	| exp -> exp

(* (Id.t * Type.t) list -> (Id.t * Type.t) list -> (Type.t * Closure.t) *)
and subst_id id_ty_list xst e =
	match xst with
	| [] -> g e
	| (id, t)::xstd ->
		let size = get_tuple_size t in
		let id_list, ty_list, unuse = use_size size id_ty_list in
		let whole_type, e'= subst_id unuse xstd e in
		env := M.add id (Type.Tuple ty_list) !env;
		whole_type, Let ((id, Type.Tuple ty_list), Tuple id_list, e')

(* (Id.t * Type.t) list -> Type.t list -> Id.t list -> Id.t -> Closure.t -> (Type.t * Closure.t) *)
and add_LetTuple xst ts xs y e = 
	let id_ty_list = make_id_ty_list ts in
	env := M.add_list id_ty_list !env;
	let t', e' = subst_id id_ty_list xst e in
	t', LetTuple (id_ty_list, y, e')

(* Id.t list -> (Id.t list * Type.t list) *)
(* 単純なtupleを平坦化する関数: まだ関数適用については実装されていない *)
and flatten_tuple xs = function
	| [] -> []
	| id::ys ->
		let id_type, id_content = find_tuple id x in
		(match id_type, id_content with
		| Type.WildCard, WildCard -> (* tupleではないならば、何もしない *)
			let flattened_id_list, flattened_type_list = flatten_tuple ys in
			(id::flattened_id_list, (M.find id !env)::flattened_type_list)
		| Type.Tuple type_list, Tuple id_list -> (* あれば環境を上書きして、flatten済みのidのlistと型のlistのペアを返す *)
			env := M.add_list2 id_list type_list !env
			let ids, types = flatten_tuple id_list in (*  *)
			let flattened_id_list, flattened_type_list = flatten_tuple ys in
			ids::flattened_id_list, types::flattened_type_list)

let rec f print_flag prog =
	let (fundef_list, e) = prog in
	let flatten_prog = (fundef_list, g e) in
	if print_flag = 1
	then
		(print_prog 0 flatten_prog;
		 flatten_prog)
	else
		flatten_prog

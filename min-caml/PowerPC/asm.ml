(* PowerPC assembly with a few virtual instructions *)
exception FindWildCard

type id = int
type id_or_imm = V of Id.t | C of int (* 変数または定数 *)
type t = (* 命令の列 (caml2html: sparcasm_t) *)
	| Ans of exp
	| Let of (Id.t * Type.t * id) * exp * t
	| WildCard
and exp = (* 一つ一つの命令に対応する式 (caml2html: sparcasm_exp) *)
	| Nop
	| Li of int
	| FLi of Id.l
	| SetL of Id.l
	| Mr of Id.t
	| Neg of Id.t
	| Add of Id.t * id_or_imm
	| Sub of Id.t * id_or_imm
	| Mul of Id.t * id_or_imm
	| Div of Id.t * id_or_imm
	| Slw of Id.t * id_or_imm
	| Srw of Id.t * id_or_imm
	| Lwz of Id.t * id_or_imm
	| Stw of Id.t * Id.t * id_or_imm
	| FMr of Id.t
	| FNeg of Id.t
	| FAdd of Id.t * Id.t
	| FSub of Id.t * Id.t
	| FMul of Id.t * Id.t
	| FDiv of Id.t * Id.t
	| Floor of Id.t
	| Sqrt of Id.t
	| FtoI of Id.t
	| ItoF of Id.t
	| Lfd of Id.t * id_or_imm
	| Stfd of Id.t * Id.t * id_or_imm
	| Comment of string
	(* virtual instructions *)
	| IfEq of Id.t * id_or_imm * t * t
	| IfLE of Id.t * id_or_imm * t * t
	| IfGE of Id.t * id_or_imm * t * t (* 左右対称ではないので必要 *)
	| IfFEq of Id.t * Id.t * t * t
	| IfFLE of Id.t * Id.t * t * t
	(* closure address, integer arguments, and float arguments *)
	| CallCls of Id.t * Id.t list * Id.t list (* 呼び出すclsの名前 * int/boolの引数 * floatの引数 *)
	| CallDir of Id.l * Id.t list * Id.t list (* 呼び出すclsの名前 * int/boolの引数 * floatの引数 *)
	| Save of Id.t * Id.t (* レジスタ変数の値をスタック変数へ保存 (caml2html: sparcasm_save) *)
	| Restore of Id.t (* スタック変数から値を復元 (caml2html: sparcasm_restore) *)
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
(* プログラム全体 = 浮動小数点数テーブル + トップレベル関数 + メインの式 (caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t

let id_incr = ref 0
let gen_id () = id_incr := !id_incr + 1; !id_incr

let fletd(x, e1, e2) = Let((x, Type.Float, gen_id ()), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit, gen_id ()), e1, e2)

let regs = (* Array.init 27 (fun i -> Printf.sprintf "_R_%d" i) *)
	[| "%r2"; "%r5"; "%r6"; "%r7"; "%r8"; "%r9"; "%r10";
		 "%r11"; "%r12"; "%r13"; "%r14"; "%r15"; "%r16"; "%r17"; "%r18";
		 "%r19"; "%r20"; "%r21"; "%r22"; "%r23"; "%r24"; "%r25"; "%r26";
		 "%r27"; "%r28"; "%r29"; "%r30" |]
let fregs = Array.init 32 (fun i -> Printf.sprintf "%%f%d" i) (* rをfに変換 *)
let allregs = Array.to_list regs (* listに変換 *)
let allfregs = Array.to_list fregs (* listに変換 *)
let reg_cl = regs.(Array.length regs - 1) (* closure address (caml2html: sparcasm_regcl) *)
let reg_sw = regs.(Array.length regs - 2) (* temporary for swap *)
let reg_fsw = fregs.(Array.length fregs - 1) (* temporary for swap *)
(*let reg_zero = "%r00" (* zero register --- bobo custom *)*)
let reg_sp = "%r3" (* stack pointer *)
let reg_hp = "%r4" (* heap pointer (caml2html: sparcasm_reghp) *)
let reg_tmp = "%r31" (* [XX] ad hoc *) (* link register の内容を一時的に格納*)
let is_reg x = (x.[0] = '%') (* レジスタかどうかを判定 *)

(* super-tenuki *)
let rec remove_and_uniq xs = function
	| [] -> []
	| x :: ys when S.mem x xs -> remove_and_uniq xs ys
	| x :: ys -> x :: remove_and_uniq (S.add x xs) ys

(* free variables in the order of use (for spilling) (caml2html: sparcasm_fv) *)
let fv_id_or_imm = function V(x) -> [x] | _ -> []
let rec fv_exp = function
	| Nop | Li(_) | FLi(_) | SetL(_) | Comment(_) | Restore(_) -> []
	| Mr(x) | Neg(x) | FMr(x) | FNeg(x) | Save(x, _) -> [x]
	| Add(x, y') | Sub(x, y') | Mul(x, y')| Div(x, y') | Slw(x, y') | Srw(x, y') | Lfd(x, y') | Lwz(x, y') -> x :: fv_id_or_imm y'
	| Stw(x, y, z') | Stfd(x, y, z') -> x :: y :: fv_id_or_imm z'
	| FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) -> [x; y]
	| IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) ->	x :: fv_id_or_imm y' @ remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
	| IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) -> x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
	| CallCls(x, ys, zs) -> x :: ys @ zs
	| CallDir(_, ys, zs) -> ys @ zs
and fv = function
	| Ans(exp) -> fv_exp exp
	| Let((x, t, id), exp, e) ->
			fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
	| WildCard -> raise FindWildCard
let fv e = remove_and_uniq S.empty (fv e)

let rec concat e1 (xt : Id.t * Type.t * id) e2 =
	match e1 with
	| Ans(exp) -> Let(xt, exp, e2)
	| Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)
	| WildCard -> raise FindWildCard

let align i = (if i mod 8 = 0 then i else i + 4)

(* ここからデバッグ用print関数 *)

let rec print_indent depth =
	if depth = 0 then ()
	else (print_string ".	 "; print_indent (depth - 1))

let print_id_or_imm = function
	| V idt -> Id.print_t idt
	| C i -> print_string (string_of_int i)

let rec print_id_list fv_list =
	List.iter (fun id -> Id.print_t id; print_string ", ") fv_list

let print_t_tuple (x, t) = Id.print_t x; print_string ", "

let rec print_l_float depth (idl, floaT) =
	print_indent depth; Id.print_l idl; print_newline ();
	print_indent depth; print_string (string_of_float floaT); print_newline ()

let newline_flag = ref 0

let is_already_newline flag = 
	if !flag = 0 then (print_newline (); flag := 1)
	else ()

let rec print_t depth ty =
	is_already_newline newline_flag;
	print_indent depth; newline_flag := 0;
	match ty with
	| Ans exp -> print_string "Ans "; print_exp (depth + 1) exp
	| Let ((x, y, id), exp, t) ->
		print_string "Let ";
		Id.print_t x; print_string "(id: "; print_int id; print_string ")"; print_string " ------ Type : "; Type.print_code y; newline_flag := 1;
		print_exp (depth + 1) exp; print_newline ();
		print_indent depth; print_string "in ";
		print_t depth t
	| WildCard -> print_string "WildCard"; raise FindWildCard
and print_exp depth expr =
	is_already_newline newline_flag;
	print_indent depth; newline_flag := 0;
	match expr with
	| Nop -> print_string "Nop "
	| Li i -> print_string "Li "; print_string (string_of_int i)
	| FLi x -> print_string "FLi "; Id.print_l x
	| SetL x -> print_string "SetL "; Id.print_l x
	| Mr x -> print_string "Mr "; Id.print_t x
	| Neg x -> print_string "Neg "; Id.print_t x
	| Add (x, y) -> 
		print_string "Add "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Sub (x, y) -> 
		print_string "Sub "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Mul (x, y) ->	
		print_string "Mul "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Div (x, y) -> 
		print_string "Div "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Slw (x, y) -> 
		print_string "Slw "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Srw (x, y) -> 
		print_string "Srw "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Lwz (x, y) -> 
		print_string "Lwz "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); print_id_or_imm y
	| Stw (x, y, z) -> 
		print_string "Stw "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); Id.print_t y; print_newline ();
		print_indent (depth + 1); print_id_or_imm z
	| FMr x -> 
		print_string "FMr "; print_newline ();
		print_indent (depth + 1); Id.print_t x
	| FNeg x -> 
		print_string "FNeg "; print_newline ();
		print_indent (depth + 1); Id.print_t x
	| FAdd (x, y) -> 
		print_string "FAdd "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); Id.print_t y
	| FSub (x, y) -> 
		print_string "FSub "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); Id.print_t y
	| FMul (x, y) -> 
		print_string "FMul "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); Id.print_t y
	| FDiv (x, y) -> 
		print_string "FDiv "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); Id.print_t y
	| Lfd (idt, idim) -> 
		print_string "Lfd "; print_newline ();
		print_indent (depth + 1); Id.print_t idt; print_newline ();
		print_indent (depth + 1); print_id_or_imm idim
	| Stfd (idt1, idt2, idim) -> 
		print_string "Stfd "; print_newline ();
		print_indent (depth + 1); Id.print_t idt1; print_newline ();
		print_indent (depth + 1); Id.print_t idt2; print_newline ();
		print_indent (depth + 1); print_id_or_imm idim
	| Comment str -> print_string "Comment "; print_string str
	| IfEq (idt, idim, t1, t2) -> 
		print_string "IfEq "; print_newline ();
		print_indent (depth + 1); Id.print_t idt; print_newline ();
		print_indent (depth + 1); print_id_or_imm idim; print_newline ();
		print_indent depth; print_string "then";
		print_t (depth + 1) t1; print_newline ();
		print_indent depth; print_string "else";
		print_t (depth + 1) t2
	| IfLE (idt, idim, t1, t2) -> 
		print_string "IfLE "; print_newline ();
		print_indent (depth + 1); Id.print_t idt; print_newline ();
		print_indent (depth + 1); print_id_or_imm idim; print_newline ();
		print_indent depth; print_string "then";
		print_t (depth + 1) t1; print_newline ();
		print_indent depth; print_string "else";
		print_t (depth + 1) t2
	| IfGE (idt, idim, t1, t2) -> 
		print_string "IfGE "; print_newline ();
		print_indent (depth + 1); Id.print_t idt; print_newline ();
		print_indent (depth + 1); print_id_or_imm idim; print_newline ();
		print_indent depth; print_string "then";
		print_t (depth + 1) t1; print_newline ();
		print_indent depth; print_string "else";
		print_t (depth + 1) t2
	| IfFEq (idt1, idt2, t1, t2) ->
		print_string "IfFEq "; print_newline ();
		print_indent (depth + 1); Id.print_t idt1; print_newline ();
		print_indent (depth + 1); Id.print_t idt2; print_newline ();
		print_indent depth; print_string "then";
		print_t (depth + 1) t1; print_newline ();
		print_indent depth; print_string "else";
		print_t (depth + 1) t2
	| IfFLE (idt1, idt2, t1, t2) -> 
		print_string "IfFLE "; print_newline ();
		print_indent (depth + 1); Id.print_t idt1; print_newline ();
		print_indent (depth + 1); Id.print_t idt2; print_newline ();
		print_indent depth; print_string "then";
		print_t (depth + 1) t1; print_newline ();
		print_indent depth; print_string "else";
		print_t (depth + 1) t2
	| CallCls (idt, idt_list1, idt_list2) -> 
		print_string "CallCls "; print_newline ();
		print_indent (depth + 1); print_string "address = "; Id.print_t idt; print_newline ();
		print_indent (depth + 1); print_string "int args = ";
		List.iter (fun t -> Id.print_t t; print_string ", ") idt_list1; print_newline ();
		print_indent (depth + 1); print_string "float args = ";
		List.iter (fun t -> Id.print_t t; print_string ", ") idt_list2
	| CallDir (idl, idt_list1, idt_list2) -> 
		print_string "CallDir "; print_newline ();
		print_indent (depth + 1); Id.print_l idl; print_newline ();
		print_indent (depth + 1); print_string "int args = ";
		List.iter (fun t -> Id.print_t t; print_string ", ") idt_list1; print_newline ();
		print_indent (depth + 1); print_string "float args = ";
		List.iter (fun t -> Id.print_t t; print_string ", ") idt_list2
	| Save (x, y) -> 
		print_string "Save "; print_newline ();
		print_indent (depth + 1); Id.print_t x; print_newline ();
		print_indent (depth + 1); Id.print_t y
	| Restore x -> 
		print_string "Restore "; print_newline ();
		print_indent (depth + 1); Id.print_t x

let print_fundef depth {name = name_l; 
						args = arg_list; 
						fargs = farg_list; 
						body = t;
						ret = ty} =
	print_indent depth; print_string "fundef = {"; print_newline ();
	print_indent (depth + 1); print_string "name = "; Id.print_l name_l; print_newline ();
	print_indent (depth + 1); print_string "args = "; List.iter (fun id -> Id.print_t id; print_string ", ") arg_list; print_newline ();
	print_indent (depth + 1); print_string "fargs = "; List.iter (fun id -> Id.print_t id; print_string ", ") farg_list; print_newline ();
	print_indent (depth + 1); print_string "body = "; print_t (depth + 2) t; print_newline ();
	print_indent (depth + 1); print_string "ret = Type : ";Type.print_type ty; print_newline ();
	print_indent depth; print_string "}"; print_newline ()

let print_prog depth (Prog (l_float_list, fundef_list, t)) =
	print_string "Prog "; print_newline ();
	print_indent (depth + 1); print_string "(Id.l * float) list = "; print_newline ();
	List.iter (print_l_float (depth + 2)) l_float_list;
	print_indent (depth + 1); print_string "fundef list = "; print_newline ();
	List.iter (print_fundef (depth + 2)) fundef_list;
	print_indent (depth + 1); print_string "Asm.t = ";
	print_t (depth + 2) t

(* 2オペランドではなく3オペランドのx86アセンブリもどき *)

type id_or_imm = V of Id.t | C of int
type t = (* 命令の列 (caml2html: sparcasm_t) *)
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp = (* 一つ一つの命令に対応する式 (caml2html: sparcasm_exp) *)
  | Nop
  | Set of int
  | SetL of Id.l
  | Mov of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Mul of Id.t * id_or_imm
  | Div of Id.t * id_or_imm
  | Ld of Id.t * id_or_imm * int
  | St of Id.t * Id.t * id_or_imm * int
  | FMovD of Id.t
  | FNegD of Id.t
  | FAddD of Id.t * Id.t
  | FSubD of Id.t * Id.t
  | FMulD of Id.t * Id.t
  | FDivD of Id.t * Id.t
  | LdDF of Id.t * id_or_imm * int
  | StDF of Id.t * Id.t * id_or_imm * int
  | Comment of string
  (* virtual instructions *)
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t (* 左右対称ではないので必要 *)
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* レジスタ変数の値をスタック変数へ保存 (caml2html: sparcasm_save) *)
  | Restore of Id.t (* スタック変数から値を復元 (caml2html: sparcasm_restore) *)
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
(* プログラム全体 = 浮動小数点数テーブル + トップレベル関数 + メインの式 (caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)

let regs = (* Array.init 16 (fun i -> Printf.sprintf "%%r%d" i) *)
  [| "%eax"; "%ebx"; "%ecx"; "%edx"; "%esi"; "%edi" |]
let fregs = Array.init 8 (fun i -> Printf.sprintf "%%xmm%d" i)
let allregs = Array.to_list regs
let allfregs = Array.to_list fregs
let reg_cl = regs.(Array.length regs - 1) (* closure address (caml2html: sparcasm_regcl) *)
(*
let reg_sw = regs.(Array.length regs - 1) (* temporary for swap *)
let reg_fsw = fregs.(Array.length fregs - 1) (* temporary for swap *)
*) let reg_sp = "%ebp" (* stack pointer *)
let reg_hp = "min_caml_hp" (* heap pointer (caml2html: sparcasm_reghp) *)
(* let reg_ra = "%eax" (* return address *) *)
let is_reg x = (x.[0] = '%' || x = reg_hp)

(* super-tenuki *)
let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when S.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (S.add x xs) ys

(* free variables in the order of use (for spilling) (caml2html: sparcasm_fv) *)
let fv_id_or_imm = function V(x) -> [x] | _ -> []
let rec fv_exp = function
  | Nop | Set(_) | SetL(_) | Comment(_) | Restore(_) -> []
  | Mov(x) | Neg(x) | FMovD(x) | FNegD(x) | Save(x, _) -> [x]
  | Add(x, y') | Sub(x, y') | Mul(x, y') | Div(x, y') | Ld(x, y', _) | LdDF(x, y', _) -> x :: fv_id_or_imm y'
  | St(x, y, z', _) | StDF(x, y, z', _) -> x :: y :: fv_id_or_imm z'
  | FAddD(x, y) | FSubD(x, y) | FMulD(x, y) | FDivD(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) -> x :: fv_id_or_imm y' @ remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) -> x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
let fv e = remove_and_uniq S.empty (fv e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

let align i = (if i mod 8 = 0 then i else i + 4)

(* ここからデバッグ用print関数 *)
(*
let rec print_indent depth =
	if depth = 0 then ()
	else (print_string ".   "; print_indent (depth - 1))
(*
let print_indent_t depth x =
	print_indent depth;
	Id.print_t x
*)
let rec print_id_list fv_list =
	List.iter (fun id -> Id.print_t id; print_string ", ") fv_list

let print_t_tuple (x, t) = Id.print_t x; print_string ", "

let print_closure {entry = label; actual_fv = fv_list} =
	Id.print_l label;
	print_id_list fv_list

let newline_flag = ref 0

let is_already_newline flag = 
	if !flag = 0 then (print_newline (); flag := 1)
	else ()

let rec print_t depth ty =
	is_already_newline newline_flag;
	print_indent depth; newline_flag := 0;
	match ty with
	| Ans exp -> print_string "Ans "; print_exp (depth + 1) exp
	| Let ((x, y), exp, t) ->
		print_string "Let "	 ;
		Id.print_t x; print_string " ------ Type : "; Type.print_code t;
		print_exp (depth + 1) exp;
		print_indent depth; print_string "in"; print_newline ();
		print_t depth e2
and print_exp depth expr =
	is_already_newline newline_flag;
	print_indent depth; newline_flag := 0;
	match expr with
	| Nop -> 
	| Set i -> 
	| SetL x
	| Mov x
	| Neg x
	| Add (x, y)
	| Sub (x, y)
	| Mul (x, y)
	| Div (x, y)
	| Ld (x, y, )
	| St 
	| FMovD 
	| FNegD 
	| FAddD 
	| FSubD 
	| FMulD 
	| FDivD 
	| LdDF 
	| StDF 
	| IfEq 
	| IfLE 
	| IfFEq 
	| IfFLE 
	| CallCls 
	| CallDir 
	| Save 
	| Restore 

let print_fundef depth {name = (name_l, name_type); args = arg_list; formal_fv = fv_list; body = exp} =
	print_indent depth; print_string "fundef = {"; print_newline ();
	print_indent (depth + 1); print_string "name = "; Id.print_l name_l; print_newline ();
	print_indent (depth + 1); print_string "args = "; List.iter (fun tuple -> print_t_tuple tuple) arg_list; print_newline ();
	print_indent (depth + 1); print_string "formal_fv = "; List.iter (fun tuple -> print_t_tuple tuple) fv_list; print_newline ();
	print_indent (depth + 1); print_string "body = "; print_newline (); print_code (depth + 2) exp;
	print_indent depth; print_string "}"; print_newline ()

let print_prog depth (Prog (fundef_list, exp)) =
	print_string "<PROG> "; print_newline ();
	print_indent (depth + 1); print_string "fundef list = "; print_newline ();
	List.iter (print_fundef (depth + 2)) fundef_list;
	print_indent (depth + 1); print_string "Closure.t = "; print_newline ();
	print_code (depth + 2) exp
*)

let limit = ref 1000
let syntax_flag = ref 0
let parsing_flag = ref 0
let fun_flag = ref 0
let kNormal_flag = ref 0
let cse_flag = ref 0
let alpha_flag = ref 0
let beta_flag = ref 0
let inline_flag = ref 0
let before_cls_flag = ref 0
let cls_flag = ref 0
let cls_typ_flag = ref 0
let flattening_flag = ref 0
let virtual_flag = ref 0
let simm_flag = ref 0
let regalloc_flag = ref 0
let float_value_flag = ref 1
let float_flag = ref 1
let sca_flag = ref 1
let array_flag = ref 1
let read_flag = ref 1
let print_flag = ref 1


let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
	Format.eprintf "iteration %d@." n;
	if n < 1 then e else
	let e' = 
		(Elim.f 
			(ConstFold.f 
				(Inline.f !inline_flag 
					(Assoc.f 
						(Beta.f !beta_flag
							(ComSubExp.f !cse_flag
								e)))))) in
	if e = e' then e else
	iter (n - 1) e'

let lexbuf outchan l = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
	Id.counter := 0;
	Typing.extenv := M.empty;
	Emit.f outchan !float_value_flag !float_flag !sca_flag !array_flag !read_flag !print_flag 
		(RegAlloc.f !regalloc_flag
			(Simm.f !simm_flag
				(Virtual.f !virtual_flag
						(Closure.f !before_cls_flag !cls_flag
							(iter !limit
								(Alpha.f !alpha_flag
									(KNormal.f !kNormal_flag
										(Typing.f !syntax_flag
												(Parser.exp Lexer.token l)))))))))
let string s = lexbuf stdout (Lexing.from_string s) (* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)

let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
	let inchan = open_in (f ^ ".ml") in
	let outchan = open_out (f ^ ".s") in
	try
		lexbuf outchan (Lexing.from_channel inchan);
		close_in inchan;
		close_out outchan;
	with e -> (close_in inchan; close_out outchan; raise e)

let () = (* ここからコンパイラの実行が開始される (caml2html: main_entry) *)
	let files = ref [] in
	Arg.parse
		[("-inline_size", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
		 ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated");
		 ("-nofloatvalue", Arg.Unit(fun () -> float_value_flag := 0), "unable to add float value library");
		 ("-nofloat", Arg.Unit(fun () -> float_flag := 0), "unable to add float library");
		 ("-nosca", Arg.Unit(fun () -> sca_flag := 0), "unable to add sca library");
		 ("-noarray", Arg.Unit(fun () -> array_flag := 0), "unable to add array library");
		 ("-noread", Arg.Unit(fun () -> read_flag := 0), "unable to add read library");
		 ("-noprint", Arg.Unit(fun () -> print_flag := 0), "unable to add print library");
		 ("-nolib", Arg.Unit(fun () -> 
		 	float_value_flag := 0;
		 	float_flag := 0;
		 	sca_flag := 0;
		 	array_flag := 0;
		 	read_flag := 0;
		 	print_flag := 0;
			), "unable to add any library");
		 ("-parser", Arg.Unit(fun () -> parsing_flag := 1), "dump code after parsing");
		 ("-parsing", Arg.Unit(fun () -> parsing_flag := 1), "dump code after parsing");
		 ("-fun", Arg.Unit(fun () -> fun_flag := 1), "dump code after fun2letrec");
		 ("-syntax", Arg.Unit(fun () -> syntax_flag := 1), "dump code after type checking");
		 ("-knormal", Arg.Unit(fun () -> kNormal_flag := 1), "dump code after kNormal");
		 ("-kNormal", Arg.Unit(fun () -> kNormal_flag := 1), "dump code after kNormal");
		 ("-alpha", Arg.Unit(fun () -> alpha_flag := 1), "dump code after alpha");
		 ("-cse", Arg.Unit(fun () -> cse_flag := 1), "dump code after ComSubexpElim");
		 ("-beta", Arg.Unit(fun () -> beta_flag := 1), "dump code after beta");
		 ("-inline", Arg.Unit(fun () -> inline_flag := 1), "dump code after inline");
		 ("-before_cls", Arg.Unit(fun () -> before_cls_flag := 1), "dump code before closure");
		 ("-cls", Arg.Unit(fun () -> cls_flag := 1), "dump code after closure");
		 ("-clstyp", Arg.Unit(fun () -> cls_typ_flag := 1), "dump code after closure");
		 ("-flatten", Arg.Unit(fun () -> flattening_flag := 1), "dump code after flattening");
		 ("-flattening", Arg.Unit(fun () -> flattening_flag := 1), "dump code after flattening");
		 ("-virtual", Arg.Unit(fun () -> virtual_flag := 1), "dump code after virtual");
		 ("-simm", Arg.Unit(fun () -> simm_flag := 1), "dump code after simm");
		 ("-regalloc", Arg.Unit(fun () -> regalloc_flag := 1), "dump code after regalloc");
		 ("-dumpall", Arg.Unit(fun () -> 
		 	parsing_flag := 1;
			fun_flag := 1;
		 	syntax_flag := 1; 
		 	kNormal_flag := 1; 
			alpha_flag := 1; 
			cse_flag := 1; 
			beta_flag := 1;
			inline_flag := 1; 
			before_cls_flag := 1; 
			cls_flag := 1; 
			flattening_flag := 1; 
			virtual_flag := 1; 
			simm_flag := 1; 
			regalloc_flag := 1), "dump all")
		 ]
		(fun s -> files := !files @ [s])
		("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
		 Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
	List.iter
		(fun f -> ignore (file f))
		!files

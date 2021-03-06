%{
(* parserが利用する変数、関数、型などの定義 *)
open Syntax
let addtyp x = (x, Type.gentyp ())
let getpos () = {
		   ls = (Parsing.symbol_start_pos ()).Lexing.pos_lnum;
		   le = (Parsing.symbol_end_pos ()).Lexing.pos_lnum;
           chs = (Parsing.symbol_start_pos ()).Lexing.pos_cnum - (Parsing.symbol_start_pos ()).Lexing.pos_bol;
           che = (Parsing.symbol_end_pos ()).Lexing.pos_cnum - (Parsing.symbol_end_pos ()).Lexing.pos_bol}
%}

/* (* 字句を表すデータ型の定義 (caml2html: parser_token) *) */
%token <bool> BOOL
%token <int> INT
%token <float> FLOAT
%token NOT
%token MINUS
%token PLUS
%token ADHOC
%token AST
%token SLASH
%token MINUS_DOT
%token PLUS_DOT
%token AST_DOT
%token SLASH_DOT
%token FLOOR
%token SQRT
%token FTOI
%token ITOF
%token EQUAL
%token LESS_GREATER
%token LESS_EQUAL
%token GREATER_EQUAL
%token LESS
%token GREATER
%token IF
%token THEN
%token ELSE
%token <Id.t> IDENT
%token LET
%token IN
%token FUN
%token ARROW
%token REC
%token COMMA
%token ARRAY_CREATE
%token DOT
%token LESS_MINUS
%token SEMICOLON
%token LPAREN
%token RPAREN
%token EOF
%token SFTL
%token SFTR
%token READINT
%token READFLOAT
%token FABS
%token FSQR
%token FISZERO
%token FISPOS
%token FISNEG
%token FHALF
%token FNEG
%token FLESS
%token PRINT_CHAR

/* (* 優先順位とassociativityの定義（低い方から高い方へ） (caml2html: parser_prior) *) */
%nonassoc IN
%right prec_let
%right SEMICOLON
%right prec_if
%right LESS_MINUS
%nonassoc prec_tuple
%left COMMA
%left EQUAL LESS_GREATER LESS GREATER LESS_EQUAL GREATER_EQUAL
%left PLUS MINUS PLUS_DOT MINUS_DOT
%left AST_DOT SLASH_DOT AST SLASH
%left FTOI ITOF READINT READFLOAT FABS FSQR FISZERO FISPOS FISNEG FHALF FNEG FLESS PRINT_CHAR
%right prec_unary_minus
%left prec_app
%left DOT

/* (* 開始記号の定義 *) */
%type <Syntax.t> exp
%start exp

%%

simple_exp: /* (* 括弧をつけなくても関数の引数になれる式 (caml2html: parser_simple) *) */
| LPAREN exp RPAREN
    { $2 }
| LPAREN RPAREN
    { Unit (getpos ()) }
| BOOL
    { Bool($1, getpos ()) }
| INT
    { Int($1, getpos ()) }
| FLOAT
    { Float($1, getpos ()) }
| IDENT
    { Var($1, getpos ()) }
| simple_exp DOT LPAREN exp RPAREN
    { Get($1, $4) }

exp: /* (* 一般の式 (caml2html: parser_exp) *) */
| simple_exp
    { $1 }
| exp SEMICOLON
	{ $1 }
| NOT exp
    %prec prec_app
    { Not($2) }
| MINUS exp
    %prec prec_unary_minus
    { match $2 with
    | Float(f, p) -> Float(-.f, p) (* -1.23などは型エラーではないので別扱い *)
    | e -> Neg(e) }
| exp ADHOC exp
	{ AdHoc($1, $3) }
| exp PLUS exp /* (* 足し算を構文解析するルール (caml2html: parser_add) *) */
    { Add($1, $3) }
| exp MINUS exp
    { Sub($1, $3) }
| exp AST exp
	{ ShiftIL($1, Int (2, getpos ())) }
| exp SLASH exp
	{ ShiftIR($1, Int (1, getpos ())) }
| exp SFTL exp
	{ ShiftIL($1, $3) }
| exp SFTR exp
	{ ShiftIR($1, $3) }
| exp EQUAL exp
    { Eq($1, $3) }
| exp LESS_GREATER exp
    { Not(Eq($1, $3)) }
| exp LESS exp
    { Not(LE($3, $1)) }
| exp GREATER exp
    { Not(LE($1, $3)) }
| exp LESS_EQUAL exp
    { LE($1, $3) }
| exp GREATER_EQUAL exp
    { LE($3, $1) }
| IF exp THEN exp ELSE exp
    %prec prec_if
    { If($2, $4, $6) }
| MINUS_DOT exp
    %prec prec_unary_minus
    { FNeg($2) }
| exp PLUS_DOT exp
    { FAdd($1, $3) }
| exp MINUS_DOT exp
    { FSub($1, $3) }
| exp AST_DOT exp
    { FMul($1, $3) }
| exp SLASH_DOT exp
    { FDiv($1, $3) }
| FLOOR exp
	{ Floor($2) }
| SQRT exp
	{ Sqrt($2) }
| FTOI exp
	{ FtoI($2) }
| ITOF exp
	{ ItoF($2) }
| LET IDENT EQUAL exp IN exp
    %prec prec_let
    { Let(addtyp $2, $4, $6) }
| FUN funargs ARROW exp
    %prec prec_let
	{ Fun($2, $4, getpos ()) }
| LET REC fundef IN exp
    %prec prec_let
    { LetRec($3, $5) }
| simple_exp actual_args
    %prec prec_app
    { App($1, $2) }
| elems
    %prec prec_tuple
    { Tuple($1) }
| LET LPAREN pat RPAREN EQUAL exp IN exp
    { LetTuple($3, $6, $8) }
| simple_exp DOT LPAREN exp RPAREN LESS_MINUS exp
    { Put($1, $4, $7) }
| exp SEMICOLON exp
    { Let((Id.gentmp Type.Unit, Type.Unit), $1, $3) }
| exp SEMICOLON exp SEMICOLON
    { Let((Id.gentmp Type.Unit, Type.Unit), $1, $3) }
| ARRAY_CREATE simple_exp simple_exp
    %prec prec_app
    { Array($2, $3) }
| READINT simple_exp
	{ Read_I $2 }
| READFLOAT simple_exp
	{ Read_F $2 }
| FABS simple_exp
	{ If (LE($2, Float(0.0, getpos ())), FNeg($2), $2) }
| FISZERO simple_exp
	{ Eq ($2, Float(0.0, getpos ())) }
| FISPOS simple_exp
	{ Not (LE($2, Float(0.0, getpos ()))) }
| FISNEG simple_exp
	{ Not (LE(Float(0.0, getpos ()), $2)) }
| FHALF simple_exp
	{ FMul ($2, Float(0.5, getpos ())) }
| FNEG simple_exp
	{ FNeg($2) }
| FLESS simple_exp simple_exp
	{ Not (LE($3, $2)) }
| FSQR simple_exp
	{ FMul ($2, $2) }
| PRINT_CHAR simple_exp
	{ Out $2 }
| error
    { failwith
        (Printf.sprintf "parse error near line %d-%d characters %d-%d"
		   ((Parsing.symbol_start_pos ()).Lexing.pos_lnum)
		   ((Parsing.symbol_end_pos ()).Lexing.pos_lnum)
           ((Parsing.symbol_start_pos ()).Lexing.pos_cnum - (Parsing.symbol_start_pos ()).Lexing.pos_bol)
           ((Parsing.symbol_end_pos ()).Lexing.pos_cnum - (Parsing.symbol_end_pos ()).Lexing.pos_bol)) }

fundef:
| IDENT formal_args EQUAL exp
    { { name = (addtyp $1, getpos ()); args = $2; body = $4 } }

formal_args:
| IDENT formal_args
    { addtyp $1 :: $2 }
| IDENT
    { [addtyp $1] }

argtuple:
| LPAREN argtuple COMMA argtuple RPAREN
	{ $2 @ $4 }
| argtuple COMMA argtuple
	{ $1 @ $3 }
| IDENT
	{ [addtyp $1] }

funargs:
| argtuple
	{ $1 }
| IDENT funargs
	{ addtyp $1 :: $2 }
| IDENT
	{ [addtyp $1] }

actual_args:
| actual_args simple_exp
    %prec prec_app
    { $1 @ [$2] }
| simple_exp
    %prec prec_app
    { [$1] }

elems:
| elems COMMA exp
    { $1 @ [$3] }
| exp COMMA exp
    { [$1; $3] }

pat:
| pat COMMA IDENT
    { $1 @ [addtyp $3] }
| IDENT COMMA IDENT
    { [addtyp $1; addtyp $3] }

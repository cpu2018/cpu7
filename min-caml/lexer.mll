{
(* lexerが利用する変数、関数、型などの定義 *)
open Parser
open Type
}

(* 正規表現の略記 *)
let space = [' ' '\t']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let newline = ['\n' '\r']

rule token = parse
| newline
	{ Lexing.new_line lexbuf; token lexbuf }
| space+
    { token lexbuf }
| "(*"
    { comment lexbuf; (* ネストしたコメントのためのトリック *)
      token lexbuf }
| '('
    { LPAREN }
| ')'
    { RPAREN }
| "true"
    { BOOL(true) }
| "false"
    { BOOL(false) }
| "not"
    { NOT }
| digit+ (* 整数を字句解析するルール (caml2html: lexer_int) *)
    { INT(int_of_string (Lexing.lexeme lexbuf)) }
| digit+ ('.' digit*)? (['e' 'E'] ['+' '-']? digit+)?
    { FLOAT(float_of_string (Lexing.lexeme lexbuf)) }
| '-' (* -.より後回しにしなくても良い? 最長一致? *)
    { MINUS }
| '+' (* +.より後回しにしなくても良い? 最長一致? *)
    { PLUS }
| '^'
	{ ADHOC }
| '*'
	{ AST }
| '/'
	{ SLASH }
| "-."
    { MINUS_DOT }
| "+."
    { PLUS_DOT }
| "*."
    { AST_DOT }
| "/."
    { SLASH_DOT }
| "floor"
	{ FLOOR }
| "sqrt"
	{ SQRT }
| "int_of_float"
	{ FTOI }
| "float_of_int"
	{ ITOF }
| '='
    { EQUAL }
| "<>"
    { LESS_GREATER }
| "<="
    { LESS_EQUAL }
| ">="
    { GREATER_EQUAL }
| '<'
    { LESS }
| '>'
    { GREATER }
| "if"
    { IF }
| "then"
    { THEN }
| "else"
    { ELSE }
| "let"
    { LET }
| "in"
    { IN }
| "fun"
	{ FUN }
| "->"
	{ ARROW }
| "rec"
    { REC }
| ','
    { COMMA }
| '_'
    { IDENT(Id.gentmp Type.Unit) }
| "Array.create" | "Array.make" | "create_array" | "create_float_array" (* [XX] ad hoc *)
    { ARRAY_CREATE }
| '.'
    { DOT }
| "<-"
    { LESS_MINUS }
| ';'
    { SEMICOLON }
| eof
    { EOF }
| "<<"
	{ SFTL }
| ">>"
	{ SFTR }
| "read_int"
	{ READINT }
| "read_float"
	{ READFLOAT }
| "fabs"
	{ FABS }
| "fsqr"
	{ FSQR }
| "fiszero"
	{ FISZERO }
| "fispos"
	{ FISPOS }
| "fisneg"
	{ FISNEG }
| "fhalf"
	{ FHALF }
| "fneg"
	{ FNEG }
| "fless"
	{ FLESS }
| lower (digit|lower|upper|'_')* (* 他の「予約語」より後でないといけない *)
    { IDENT(Lexing.lexeme lexbuf) }
| _
    { failwith
        (Printf.sprintf "unknown token %s near characters %d-%d"
           (Lexing.lexeme lexbuf)
           (Lexing.lexeme_start lexbuf)
           (Lexing.lexeme_end lexbuf)) }
and comment = parse
| "*)"
    { () }
| "(*"
    { comment lexbuf;
      comment lexbuf }
| newline
	{ Lexing.new_line lexbuf; comment lexbuf; () }
| eof
    { Format.eprintf "warning: unterminated comment@." }
| _
    { comment lexbuf }

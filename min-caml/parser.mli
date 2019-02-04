type token =
  | BOOL of (bool)
  | INT of (int)
  | FLOAT of (float)
  | NOT
  | MINUS
  | PLUS
  | ADHOC
  | AST
  | SLASH
  | MINUS_DOT
  | PLUS_DOT
  | AST_DOT
  | SLASH_DOT
  | FLOOR
  | SQRT
  | FTOI
  | ITOF
  | EQUAL
  | LESS_GREATER
  | LESS_EQUAL
  | GREATER_EQUAL
  | LESS
  | GREATER
  | IF
  | THEN
  | ELSE
  | IDENT of (Id.t)
  | LET
  | IN
  | FUN
  | ARROW
  | REC
  | COMMA
  | ARRAY_CREATE
  | DOT
  | LESS_MINUS
  | SEMICOLON
  | LPAREN
  | RPAREN
  | EOF
  | SFTL
  | SFTR
  | READINT
  | READFLOAT
  | FABS
  | FSQR
  | FISZERO
  | FISPOS
  | FISNEG
  | FHALF
  | FNEG
  | FLESS
  | PRINT_CHAR

val exp :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t

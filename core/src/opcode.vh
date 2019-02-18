`ifndef OPCODE
`define OPCODE
`define OP_OUT   6'b000001
`define OP_IN    6'b000010
`define OP_FIN   6'b000100
`define OP_B     6'b010010
`define OP_BC    6'b010000
`define OP_BCLR  6'b010011
`define OP_LWZ   6'b100000
`define OP_STW   6'b100100
`define OP_ADDI  6'b001110
`define OP_ADDIS 6'b001111
`define OP_CMPI  6'b001011
`define OP_LFD   6'b110010
`define OP_STFD  6'b110110
`define OP_SLWI  6'b010101
`define OP_FSLWI 6'b101010
//opcode == 6'd31
`define XOP_ADD   9'b100001010
`define XOP_CMP   9'b000000000
`define XOP_SUB   9'b000101000
`define XOP_OR    9'b110111100
`define XOP_MFLR  9'b101010011
`define XOP_MTLR  9'b111010011
//`define XOP_STWX  9'b010010111
`define XOP_LFDX  9'b001010111
`define XOP_LWZX  9'b000010111
`define XOP_ITOF  9'b111111111
//opcode == 6'd63
`define XOP_FABS  9'b111111110
`define XOP_FADD  9'b000010101
`define XOP_FSUB  9'b000010100
`define XOP_FMUL  9'b000011001
`define XOP_FDIV  9'b000010010
`define XOP_FTOI  9'b111111100
`define XOP_FLOOR 9'b111111111
`define XOP_FSQRT 9'b000010110
`define XOP_FNEG  9'b000000000
`define XOP_FCMPU 9'b000000001
`define XOP_FMR   9'b001001000
//ori slw srw stwx
`endif //ifndef OPCODE

`ifndef ALU_OP
`define ALU_OP
`define ALU_ADD 3'd0
`define ALU_SUB 3'd1
`define ALU_AND 3'd2
`define ALU_OR  3'd3
`define ALU_ID  3'd4
`define ALU_SLW 3'd5
`define ALU_SRW 3'd6
//`define ALU_FTOI 3'd7
`endif // ifndef ALU_OP

`ifndef FLOAT_OP
`define FLOAT_OP
`define FLOAT_FABS 4'd1
`define FLOAT_FADD 4'd2
`define FLOAT_FSUB 4'd3
`define FLOAT_FMUL 4'd4
`define FLOAT_FDIV 4'd5
`define FLOAT_ITOF 4'd6
`define FLOAT_FLOOR 4'd7
`define FLOAT_FSQRT 4'd8
`define FLOAT_FNEG 4'd0
`define FLOAT_FSLWI 4'd9
`define FLOAT_FMR   4'd10

`endif // ifndef FLOAT_OP
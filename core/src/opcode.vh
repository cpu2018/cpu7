`ifndef OPCODE
`define OPCODE
`define OP_OUT  6'b000001
`define OP_IN   6'b000010
`define OP_B    6'b010010
`define OP_BC   6'b010000
`define OP_BCLR 6'b010011
`define OP_LWZ  6'b100000
`define OP_STW  6'b100100
`define OP_ADDI 6'b001110
`define OP_CMPI 6'b001011
`define OP_SLWI 6'b010101
`define XOP_ADD  9'b100001010
`define XOP_CMP  9'b000000000
`define XOP_SUB  9'b000101000
`define XOP_OR   9'b110111100
`define XOP_MFLR 9'b101010011
`define XOP_MTLR 9'b111010011

//addis ori slw srw
`endif //ifndef OPCODE

`ifndef ALU_OP
`define ALU_OP
`define ALU_ADD 3'd0
`define ALU_SUB 3'd1
`define ALU_AND 3'd2
`define ALU_OR  3'd3
`define ALU_XOR 3'd4
`define ALU_ID  3'd5
`define ALU_SLW 3'd6
`define ALU_SRW 3'd7
`endif // ifndef ALU_OP
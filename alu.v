`include "opcode.vh"

module alu(
  input wire signed [31:0] in1,
  input wire signed [31:0] in2,
  input wire [2:0] alu_op,
  input wire [4:0] shift,
  output wire [31:0] out
  );

  assign out = (alu_op == `ALU_ADD) ? in1 + in2 :
               (alu_op == `ALU_SUB) ? in2 - in1 :
               (alu_op == `ALU_AND) ? in1 & in2 :
               (alu_op == `ALU_OR) ? in1 | in2 :
               //(alu_op == `ALU_XOR) ? in1 ^ in2 :
               (alu_op == `ALU_ID) ? in2 :
               (alu_op == `ALU_SLW) ? in1 << shift :
               (alu_op == `ALU_SRW) ? in1 >> shift : 0;

endmodule
`default_nettype none

`include "opcode.vh"

module decode (
  input wire clk,

  input wire decode_en,
  output reg execute_en = 0,

  input wire [31:0] instr,
  input wire [18:0] pc,

  //input wire rcv_en,
  //input wire trans_en,

  output wire [4:0] rreg1,
  output wire [4:0] rreg2,
  input wire  [31:0] rdata1,
  input wire  [31:0] rdata2,

  output reg  [31:0] data1_reg,
  output reg  [31:0] data2_reg,
  output reg  [4:0]  wreg_reg,
  output reg  reg_we,

  input  wire [31:0] lr_rdata,
  output reg  [31:0] lr_wdata = 0,
  output reg  lr_we = 0,
  output reg  mflr = 0,

  output reg  [2:0] cr_field,
  output reg  cr_we = 0,
  //output reg  [1:0] cr_bit = 0,

  output reg  input_reg,
  output reg  output_reg,

  output reg  mem_access = 0,
  output reg  [31:0] mem_addr,
  output reg  mem_we = 0,

  output reg  branch = 0,
  output reg  [18:0] b_addr = 1,
  output reg  [4:0] b_cond = 0,
  output reg  bclr = 0,

  output reg  [2:0] alu_op,
  output reg  [4:0] shift
  );

  wire [5:0] opcode;
  assign opcode = instr[31:26];
  wire [8:0] xopcode;
  assign xopcode = instr[9:1];

  wire [4:0] wreg;
  assign wreg = ((opcode == 6'd31 && xopcode == `XOP_OR) || (opcode == `OP_SLWI)) ? instr[20:16] : instr[25:21];
  assign rreg1 = ((opcode == 6'd31 && xopcode == `XOP_OR) || (opcode == `OP_SLWI)) ? instr[25:21] : instr[20:16];
  assign rreg2 = ((opcode == `OP_OUT) || (opcode == `OP_IN) || (opcode == `OP_STW) || (opcode == 6'd31 && xopcode == `XOP_MTLR)) ? instr[25:21] : instr[15:11];

  wire [31:0] imm;
  assign imm = {{17{instr[15:15]}}, instr[14:0]};
  wire use_imm;
  assign use_imm = (opcode == `OP_ADDI) || (opcode == `OP_CMPI) || (opcode == `OP_SLWI);

  always @(posedge clk) begin
    if (decode_en) begin
      data1_reg <= rdata1;
      data2_reg <= (use_imm) ? imm : rdata2;
      //execute_en <= 1; //TODO: execute mem_access in/out で分ける?
      wreg_reg <= wreg;
      if (opcode == `OP_IN) begin
        input_reg <= 1;
        reg_we <= 1;
      end
      if (opcode == `OP_OUT) begin
        output_reg <= 1;
        reg_we <= 0;
      end
      if (opcode == `OP_B) begin
        execute_en <= 1;
        branch <= 1;
        b_cond <= 5'b10000;
        if (instr[0:0]) begin
          lr_wdata <= {11'd0, (pc + 19'd1), 2'd0};
          lr_we <= 1;
        end
      end
      if (opcode == `OP_BC) begin
        execute_en <= 1;
        branch <= 1;
        b_cond <= instr[25:21];
      end
      if (opcode == `OP_BCLR) begin
        execute_en <= 1;
        bclr <= 1;
        b_cond <= instr[25:21];
      end
      if (opcode == `OP_LWZ) begin
        mem_access <= 1;
        mem_addr <= rdata1 + {imm[31:2],2'b00};
        reg_we <= 1;
      end
      if (opcode == `OP_STW) begin
        mem_access <= 1;
        mem_addr <= rdata1 + {imm[31:2],2'b00};
        mem_we <= 1;
      end
      if (opcode == `OP_ADDI) begin
        execute_en <= 1;
        reg_we <= 1;
        alu_op <= `ALU_ADD;
      end
      if (opcode == 6'd31 && xopcode == `XOP_ADD) begin
        execute_en <= 1;
        reg_we <= 1;
        alu_op <= `ALU_ADD;
      end
      if (opcode == 6'd31 && xopcode == `XOP_SUB) begin
        execute_en <= 1;
        reg_we <= 1;
        alu_op <= `ALU_SUB;
      end
      if (opcode == 6'd31 && xopcode == `XOP_OR) begin
        execute_en <= 1;
        reg_we <= 1;
        alu_op <= `ALU_OR;
      end
      if (opcode == 6'd31 && xopcode == `XOP_CMP) begin
        execute_en <= 1;
        cr_we <= 1;
      end
      if (opcode == `OP_CMPI) begin
        execute_en <= 1;
        cr_we <= 1;
      end
      if (opcode == `OP_SLWI) begin
        execute_en <= 1;
        reg_we <= 1;
        alu_op <= (instr[5:1] == 5'b11111) ? `ALU_SRW : `ALU_SLW;
        shift <= (instr[5:1] == 5'b11111) ? instr[10:6] : instr[15:11];
      end
      if (opcode == 6'd31 && xopcode == `XOP_MFLR) begin
        execute_en <= 1;
        reg_we <= 1;
        mflr <= 1;
      end
      if (opcode == 6'd31 && xopcode == `XOP_MTLR) begin
        execute_en <= 1;
        lr_we <= 1;
        lr_wdata <= rdata2;
      end
    end else begin
      reg_we <= 0;
      execute_en <= 0;
      input_reg <= 0;
      output_reg <= 0;
      bclr <= 0;
      branch <= 0;
      mem_access <= 0;
      mem_we <= 0;
      cr_we <= 0;
      mflr <= 0;
      lr_we <= 0;
    end
  end

  always @(posedge clk) begin
    b_addr <= (opcode == `OP_B) ? instr[20:2] : {{6{instr[15:15]}},instr[14:2]};
    cr_field <= ((opcode == 6'd31 && xopcode == `XOP_CMP) || (opcode == `OP_CMPI)) ? instr[25:23] : instr[18:16];
    //cr_bit <= (3 - instr[17:16]);
  end


endmodule // decode

`default_nettype wire
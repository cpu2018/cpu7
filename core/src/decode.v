`default_nettype none

`include "opcode.vh"

module decode (
  input wire clk,

  input wire decode_en,
  output reg execute_en = 0,

  (* mark_debug = "true" *) input wire [31:0] instr,
  (* mark_debug = "true" *) input wire [18:0] pc,

  //input wire rcv_en,
  //input wire trans_en,

  output wire [4:0] rreg1,
  output wire [4:0] rreg2,
  input wire signed [31:0] rdata1,
  input wire signed [31:0] rdata2,
  output reg  [31:0] data1_reg,
  output reg  [31:0] data2_reg,
  output reg  [4:0]  wreg_reg,
  output reg  reg_we_reg,

  //output wire [4:0] f_rreg1,
  //output wire [4:0] f_rreg2,
  input wire  [31:0] f_rdata1,
  input wire  [31:0] f_rdata2,
  output reg  [31:0] f_data1_reg,
  output reg  [31:0] f_data2_reg,
  //output reg  [4:0]  f_wreg_reg,
  output reg  f_we_reg,

  output reg  w_byte = 0,

  //input  wire [31:0] lr_rdata,
  output reg  [31:0] lr_wdata = 0,
  output reg  lr_we_reg = 0,
  output reg  mflr = 0,

  output reg  [2:0] cr_field,
  output reg  cr_we_reg = 0,
  output reg  cmp_src,
  //output reg  [1:0] cr_bit = 0,

  output reg  input_reg,
  output reg  output_reg,

  output reg  mem_access_reg = 0,
  output reg  [31:0] mem_addr,
  output reg  mem_we_reg = 0,
  output reg signed [31:0] mem_wdata,

  output reg  branch = 0,
  output reg  [18:0] b_addr = 1,
  output reg  [4:0] b_cond = 0,
  output reg  bclr = 0,

  output reg  [2:0] alu_op_reg,
  output reg  [4:0] shift_reg,

  output reg  [3:0] float_op_reg
  );

  wire [5:0] opcode;
  assign opcode = instr[31:26];
  wire [8:0] xopcode;
  assign xopcode = instr[9:1];

  wire [4:0] wreg;
  assign wreg = ((opcode == 6'd31 && xopcode == `XOP_OR) || (opcode == `OP_SLWI) || (opcode == `OP_FSLWI)) ? instr[20:16] : instr[25:21];
  assign rreg1 = ((opcode == 6'd31 && xopcode == `XOP_OR) || (opcode == `OP_SLWI) || (opcode == `OP_FSLWI)) ? instr[25:21] : instr[20:16];
  assign rreg2 = ((opcode == `OP_OUT) || (opcode == `OP_STW) || (opcode == `OP_STFD) || (opcode == 6'd31 && xopcode == `XOP_MTLR)) ? instr[25:21] : instr[15:11];

  wire signed [31:0] imm;
  assign imm = {{17{instr[15:15]}}, instr[14:0]};
  wire signed [31:0] imms;
  assign imms = {instr[15:0], 16'd0};
  wire use_imm;
  assign use_imm = (opcode == `OP_ADDI) || (opcode == `OP_CMPI);
  wire use_imms;
  assign use_imms = (opcode == `OP_ADDIS);

  wire reg_we;
  assign reg_we = (opcode == `OP_IN) ||
                  (opcode == `OP_LWZ) ||
                  (opcode == `OP_ADDI) ||
                  (opcode == `OP_ADDIS) ||
                  (opcode == `OP_SLWI) ||
                  (opcode == 6'd31 &&
                    ((xopcode == `XOP_LWZX) ||
                     (xopcode == `XOP_ADD) ||
                     (xopcode == `XOP_SUB) ||
                     (xopcode == `XOP_OR) ||
                     (xopcode == `XOP_MFLR))) ||
                  (opcode == 6'd63  &&
                    (xopcode == `XOP_FTOI));
  wire f_we;
  assign f_we = (opcode == `OP_FIN) ||
                (opcode == `OP_LFD) ||
                (opcode == `OP_FSLWI) ||
                (opcode == 6'd31 &&
                  (xopcode == `XOP_LFDX || xopcode == `XOP_ITOF)) ||
                (opcode == 6'd63 &&
                  (xopcode == `XOP_FABS ||
                   xopcode == `XOP_FADD ||
                   xopcode == `XOP_FSUB ||
                   xopcode == `XOP_FMUL ||
                   xopcode == `XOP_FDIV ||
                   xopcode == `XOP_FLOOR ||
                   xopcode == `XOP_FSQRT ||
                   xopcode == `XOP_FNEG ||
                   xopcode == `XOP_FMR));

  wire cr_we;
  assign cr_we = (opcode == `OP_CMPI) ||
                 (opcode == 6'd31 && xopcode == `XOP_CMP) ||
                 (opcode == 6'd63 && xopcode == `XOP_FCMPU);

  wire [2:0] alu_op;
  assign alu_op = (opcode == `OP_ADDI || opcode == `OP_ADDI || (opcode == 6'd31 && xopcode == `XOP_ADD)) ? `ALU_ADD :
                  (opcode == 6'd31 && xopcode == `XOP_SUB) ? `ALU_SUB :
                  (opcode == 6'd31 && xopcode == `XOP_OR) ? `ALU_OR :
                  (opcode == `OP_SLWI) ? ((instr[5:1] == 5'b11111) ? `ALU_SRW : `ALU_SLW) :
                  (opcode == 6'd63 && xopcode == `XOP_FTOI) ? 3'd7 : 0;


  wire [3:0] float_op;
  assign float_op = (opcode == `OP_FSLWI) ? `FLOAT_FSLWI :
                    (opcode == 6'd31 && xopcode == `XOP_ITOF) ? `FLOAT_ITOF :
                    (opcode == 6'd63 && xopcode == `XOP_FABS) ? `FLOAT_FABS :
                    (opcode == 6'd63 && xopcode == `XOP_FADD) ? `FLOAT_FADD :
                    (opcode == 6'd63 && xopcode == `XOP_FSUB) ? `FLOAT_FSUB :
                    (opcode == 6'd63 && xopcode == `XOP_FMUL) ? `FLOAT_FMUL :
                    (opcode == 6'd63 && xopcode == `XOP_FDIV) ? `FLOAT_FDIV :
                    (opcode == 6'd63 && xopcode == `XOP_FLOOR) ? `FLOAT_FLOOR :
                    (opcode == 6'd63 && xopcode == `XOP_FSQRT) ? `FLOAT_FSQRT :
                    (opcode == 6'd63 && xopcode == `XOP_FNEG) ? `FLOAT_FNEG :
                    (opcode == 6'd63 && xopcode == `XOP_FMR) ? `FLOAT_FMR : 0;

  wire [4:0] shift;
  assign shift = (instr[5:1] == 5'b11111) ? instr[10:6] : instr[15:11];

  wire mem_access;
  assign mem_access = (opcode == `OP_LWZ) ||
                      (opcode == `OP_LFD) ||
                      (opcode == `OP_STW) ||
                      (opcode == `OP_STFD) ||
                      (opcode == 6'd31 &&
                        (xopcode == `XOP_LFDX ||
                         xopcode == `XOP_LWZX));

  wire mem_we;
  assign mem_we = (opcode == `OP_STW) ||
                  (opcode == `OP_STFD);

  wire lr_we;
  assign lr_we = (opcode == `OP_B && instr[0:0]) ||
                 (opcode == 6'd31 && xopcode == `XOP_MTLR);

  always @(posedge clk) begin
    if (decode_en) begin
      data1_reg <= rdata1;
      data2_reg <= (use_imms) ? imms :
                   (use_imm) ? imm : rdata2;
      reg_we_reg <= reg_we;
      f_data1_reg <= f_rdata1;
      f_data2_reg <= f_rdata2;
      f_we_reg <= f_we;
      //execute_en <= 1; //TODO: execute mem_access in/out で分ける?
      lr_we_reg <= lr_we;
      wreg_reg <= wreg;
      cr_we_reg <= cr_we;
      alu_op_reg <= alu_op;
      shift_reg <= shift;
      float_op_reg <= float_op;
      mem_access_reg <= mem_access;
      mem_we_reg <= mem_we;
      if (opcode == `OP_IN) begin
        input_reg <= 1;
        w_byte <= 1;
      end else if (opcode == `OP_OUT) begin
        output_reg <= 1;
      end else if (opcode == `OP_FIN) begin
        input_reg <= 1;
        w_byte <= 1;
      end else if (opcode == `OP_B) begin
        execute_en <= 1;
        branch <= 1;
        b_cond <= 5'b10000;
        if (instr[0:0]) begin
          lr_wdata <= {11'd0, (pc + 19'd1), 2'd0};
        end
      end else if (opcode == `OP_BC) begin
        execute_en <= 1;
        branch <= 1;
        b_cond <= instr[25:21];
      end else if (opcode == `OP_BCLR) begin
        execute_en <= 1;
        bclr <= 1;
        b_cond <= instr[25:21];
      end else if (opcode == `OP_LWZ) begin
        mem_addr <= rdata1 + {imm[31:2],2'b00};
      end else if (opcode == `OP_LFD) begin
        mem_addr <= rdata1 + {imm[31:2],2'b00};
      end else if (opcode == 6'd31 && xopcode == `XOP_LFDX) begin
        mem_addr <= {(rdata1[31:2] + rdata2[31:2]),2'b00};
      end else if (opcode == 6'd31 && xopcode == `XOP_LWZX) begin
        mem_addr <= {(rdata1[31:2] + rdata2[31:2]),2'b00};
      end else if (opcode == `OP_STW) begin
        mem_addr <= rdata1 + {imm[31:2],2'b00};
        mem_wdata <= rdata2;
      end else if (opcode == `OP_STFD) begin
        mem_addr <= rdata1 + {imm[31:2],2'b00};
        mem_wdata <= f_rdata2;
      end else if (opcode == `OP_ADDI) begin
        execute_en <= 1;
      end else if (opcode == `OP_ADDIS) begin
        execute_en <= 1;
      end else if (opcode == 6'd31 && xopcode == `XOP_ADD) begin
        execute_en <= 1;
      end else if (opcode == 6'd31 && xopcode == `XOP_SUB) begin
        execute_en <= 1;
      end else if (opcode == 6'd31 && xopcode == `XOP_OR) begin
        execute_en <= 1;
      end else if (opcode == 6'd31 && xopcode == `XOP_CMP) begin
        execute_en <= 1;
        cmp_src <= 0;
      end else if (opcode == `OP_CMPI) begin
        execute_en <= 1;
        cmp_src <= 0;
      end else if (opcode == `OP_SLWI) begin
        execute_en <= 1;
      end else if (opcode == 6'd31 && xopcode == `XOP_MFLR) begin
        execute_en <= 1;
        mflr <= 1;
      end else if (opcode == 6'd31 && xopcode == `XOP_MTLR) begin
        execute_en <= 1;
        lr_wdata <= rdata2;
      end else if (opcode == 6'd31 && xopcode == `XOP_ITOF) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FABS) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FADD) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FSUB) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FMUL) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FDIV) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FTOI) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FLOOR) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FSQRT) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FNEG) begin
        execute_en <= 1;
      end else if (opcode == `OP_FSLWI) begin
        execute_en <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FCMPU) begin
        execute_en <= 1;
        cmp_src <= 1;
      end else if (opcode == 6'd63 && xopcode == `XOP_FMR) begin
        execute_en <= 1;
      end
    end else begin
      reg_we_reg <= 0;
      f_we_reg <= 0;
      cr_we_reg <= 0;
      execute_en <= 0;
      input_reg <= 0;
      output_reg <= 0;
      bclr <= 0;
      branch <= 0;
      mem_access_reg <= 0;
      mem_we_reg <= 0;
      mflr <= 0;
      lr_we_reg <= 0;
      w_byte <= 0;
    end
  end

  always @(posedge clk) begin
    b_addr <= (opcode == `OP_B) ? instr[20:2] : {{6{instr[15:15]}},instr[14:2]};
    cr_field <= ((opcode == 6'd31 && xopcode == `XOP_CMP) || (opcode == `OP_CMPI) || (opcode == 6'd63 && xopcode == `XOP_FCMPU)) ? instr[25:23] : instr[18:16];
  end


endmodule // decode

`default_nettype wire
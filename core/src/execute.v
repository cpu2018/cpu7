`default_nettype none

module execute(
  input wire clk,
  input wire rstn,

  input wire execute_en,
  output reg writeback_en,

  (* mark_debug = "true" *) input wire signed [31:0] data1,
  (* mark_debug = "true" *) input wire signed [31:0] data2,

  (* mark_debug = "true" *) input wire [31:0] f_data1,
  (* mark_debug = "true" *) input wire [31:0] f_data2,

  (* mark_debug = "true" *) output reg [31:0] dout,
  (* mark_debug = "true" *) output reg [31:0] f_dout,

  input  wire [2:0] alu_op,
  input  wire [4:0] shift,

  input  wire [3:0] float_op,

  input wire cmp_src,
  output reg [3:0] cr_wdata,

  input wire mem_access,
  input wire in_en,
  input wire out_en,

  input wire [31:0] mem_rdata,

  input wire use_fpu
  );

  wire [31:0] alu_out;
  alu alu(.in1(data1), .in2(data2), .alu_op(alu_op), .out(alu_out), .shift(shift));

  wire [3:0] cmp_data;
  assign cmp_data = (data1 < data2) ? 4'b1000 :
                    (data1 > data2) ? 4'b0100 : 4'b0010;

  reg fdiv_ready, fsqrt_ready;
  wire fdiv_valid, fsqrt_valid;

  wire [31:0] fadd_out;
  fadd fadd(.x1(f_data1), .x2(f_data2), .y(fadd_out));
  wire [31:0] fsub_out;
  fsub fsub(.x1(f_data1), .x2(f_data2), .y(fsub_out));
  wire [31:0] fmul_out;
  fmul fmul(.x1(f_data1), .x2(f_data2), .y(fmul_out));
  wire [31:0] fdiv_out;
  fdiv fdiv(.clk(clk), .ready(fdiv_ready), .x1(f_data1), .x2(f_data2), .y_reg(fdiv_out), .valid(fdiv_valid));
  wire [31:0] itof_out;
  itof itof(.i(data1), .f(itof_out));
  wire [31:0] floor_out;
  floor floor(.x1(f_data1), .y(floor_out));
  wire [31:0] fsqrt_out;
  fsqrt fsqrt(.clk(clk), .ready(fsqrt_ready), .x1(f_data1), .y_reg(fsqrt_out), .valid(fsqrt_valid));
  wire [31:0] fneg_out;
  fneg fneg(.x1(f_data2), .y(fneg_out));
  wire [31:0] fabs_out;
  fabs fabs(.x1(f_data1[30:0]), .y(fabs_out));
  wire [31:0] fslwi_out;
  assign fslwi_out = f_data1 << 8;
  wire [31:0] fmr_out;
  assign fmr_out = f_data2;
  reg [31:0] fadd_out_reg, fsub_out_reg, fmul_out_reg, fdiv_out_reg, itof_out_reg, floor_out_reg, fsqrt_out_reg, fneg_out_reg, fabs_out_reg, fslwi_out_reg, fmr_out_reg, f_data1_reg, f_data2_reg;

  wire [31:0] ftoi_out;
  ftoi ftoi(.f(f_data1), .i(ftoi_out));

  //wire [3:0] fcmp_data;
  //assign fcmp_data = (f_data1 == f_data2) ? 4'b0010 :
  //                   (fsub_out[31]) ? 4'b1000 : 4'b0100;

  //wire [31:0] fpu_out;
  //assign fpu_out = (float_op == `FLOAT_FNEG) ? fneg_out :
  //                 (float_op == `FLOAT_FABS) ? fabs_out :
  //                 (float_op == `FLOAT_FADD) ? fadd_out :
    //               (float_op == `FLOAT_FSUB) ? fsub_out :
      //             (float_op == `FLOAT_FMUL) ? fmul_out :
        //           (float_op == `FLOAT_FDIV) ? fdiv_out :
          //         (float_op == `FLOAT_ITOF) ? itof_out :
            //       (float_op == `FLOAT_FLOOR) ? floor_out :
              //     (float_op == `FLOAT_FSQRT) ? fsqrt_out :
                //   (float_op == `FLOAT_FSLWI) ? (f_data1 << 8) : f_data2;

  reg [1:0] mem_access_state;
  reg [1:0] use_fpu_state;
  reg [3:0] float_op_reg;

  always @(posedge clk) begin
    if (~rstn) begin
      writeback_en <= 0;
      mem_access_state <= 0;
      use_fpu_state <= 0;
    end else begin
      if (execute_en) begin
        cr_wdata <= cmp_data;
        dout <= (alu_op == 3'd7) ? ftoi_out : alu_out;
        if (~use_fpu) begin
          writeback_en <= 1;
        end else begin
          use_fpu_state <= (float_op == `FLOAT_FDIV || float_op == `FLOAT_FSQRT) ? 2 : 1;
          f_data1_reg <= f_data1;
          f_data2_reg <= f_data2;
          fadd_out_reg <= fadd_out;
          fsub_out_reg <= fsub_out;
          fmul_out_reg <= fmul_out;
          itof_out_reg <= itof_out;
          floor_out_reg <= floor_out;
          fneg_out_reg <= fneg_out;
          fabs_out_reg <= fabs_out;
          fslwi_out_reg <= fslwi_out;
          fmr_out_reg <= fmr_out;
          float_op_reg <= float_op;
        end
      end else if (mem_access) begin
        mem_access_state <= 1;
      end else if (mem_access_state == 2) begin
        writeback_en <= 1;
        dout <= mem_rdata;
        f_dout <= mem_rdata;
        mem_access_state <= 0;
      end else if (mem_access_state == 1) begin
        mem_access_state <= 2;
      end else if (use_fpu_state == 1) begin
        f_dout <= (float_op_reg == `FLOAT_FNEG) ? fneg_out :
                 (float_op_reg == `FLOAT_FABS) ? fabs_out_reg :
                 (float_op_reg == `FLOAT_FADD) ? fadd_out_reg :
                 (float_op_reg == `FLOAT_FSUB) ? fsub_out_reg :
                 (float_op_reg == `FLOAT_FMUL) ? fmul_out_reg :
                 (float_op_reg == `FLOAT_FDIV) ? fdiv_out_reg :
                 (float_op_reg == `FLOAT_ITOF) ? itof_out_reg :
                 (float_op_reg == `FLOAT_FLOOR) ? floor_out_reg :
                 (float_op_reg == `FLOAT_FSQRT) ? fsqrt_out_reg :
                 (float_op_reg == `FLOAT_FSLWI) ? fslwi_out_reg : fmr_out_reg;
        cr_wdata <= (f_data1_reg == f_data2_reg) ? 4'b0010 :
                    (fsub_out_reg[31]) ? 4'b1000 : 4'b0100;
        writeback_en <= 1;
        use_fpu_state <= 0;
      end else if (use_fpu_state == 2) begin // fdev fssqrt
        if (float_op == `FLOAT_FDIV) begin
          fdiv_ready <=1;
          use_fpu_state <= 3;
        end else begin
          fsqrt_ready <= 1;
          use_fpu_state <= 3;
        end
      end else if (use_fpu_state == 3) begin
        fdiv_ready <= 0;
        fsqrt_ready <= 0;
        if (fdiv_valid) begin
          fdiv_out_reg <= fdiv_out;
          use_fpu_state <= 1;
        end else if (fsqrt_valid) begin
          fsqrt_out_reg <= fsqrt_out;
          use_fpu_state <= 1;
        end
      end else begin
        writeback_en <= 0;
      end
    end
  end

endmodule // execute

module fneg(
  input wire [31:0] x1,
  output wire [31:0] y
  );
  assign y[31:0] = {{~(x1[31:31])}, x1[30:0]};
endmodule

module fabs(
  input wire [30:0] x1,
  output wire [31:0] y
  );
  assign y[31:0] = {1'b0, x1[30:0]};
endmodule

`default_nettype wire


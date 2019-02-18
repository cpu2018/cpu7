`default_nettype none

module execute(
  input wire clk,

  input wire execute_en,
  output reg writeback_en = 0,

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
  output reg [3:0] cr_wdata
  );

  wire [31:0] alu_out;
  alu alu(.in1(data1), .in2(data2), .alu_op(alu_op), .out(alu_out), .shift(shift));

  wire [3:0] cmp_data;
  assign cmp_data = (data1 < data2) ? 4'b1000 :
                    (data1 > data2) ? 4'b0100 : 4'b0010;
  wire [31:0] fadd_out;
  fadd fadd(.x1(f_data1), .x2(f_data2), .y(fadd_out));
  wire [31:0] fsub_out;
  fsub fsub(.x1(f_data1), .x2(f_data2), .y(fsub_out));
  wire [31:0] fmul_out;
  fmul fmul(.x1(f_data1), .x2(f_data2), .y(fmul_out));
  wire [31:0] fdiv_out;
  fdiv fdiv(.x1(f_data1), .x2(f_data2), .y(fdiv_out));
  wire [31:0] itof_out;
  itof itof(.i(data1), .f(itof_out));
  wire [31:0] floor_out;
  floor floor(.x1(f_data1), .y(floor_out));
  wire [31:0] fsqrt_out;
  fsqrt fsqrt(.x1(f_data1), .y(fsqrt_out));
  wire [31:0] fneg_out;
  fneg fneg(.x1(f_data2), .y(fneg_out));
  wire [31:0] fabs_out;
  fabs fabs(.x1(f_data1[30:0]), .y(fabs_out));
  wire [31:0] ftoi_out;
  ftoi ftoi(.f(f_data1), .i(ftoi_out));

  wire [3:0] fcmp_data;
  assign fcmp_data = (f_data1 == f_data2) ? 4'b0010 :
                     (fsub_out[31]) ? 4'b1000 : 4'b0100;

  wire [31:0] fpu_out;
  assign fpu_out = (float_op == `FLOAT_FNEG) ? fneg_out :
                   (float_op == `FLOAT_FABS) ? fabs_out :
                   (float_op == `FLOAT_FADD) ? fadd_out :
                   (float_op == `FLOAT_FSUB) ? fsub_out :
                   (float_op == `FLOAT_FMUL) ? fmul_out :
                   (float_op == `FLOAT_FDIV) ? fdiv_out :
                   (float_op == `FLOAT_ITOF) ? itof_out :
                   (float_op == `FLOAT_FLOOR) ? floor_out :
                   (float_op == `FLOAT_FSQRT) ? fsqrt_out :
                   (float_op == `FLOAT_FSLWI) ? (f_data1 << 8) : f_data2;

  always @(posedge clk) begin
    if (execute_en) begin
      writeback_en <= 1;
      cr_wdata <= (cmp_src) ? fcmp_data : cmp_data;
      dout <=  (alu_op == 3'd7) ? ftoi_out : alu_out;
      f_dout <= fpu_out;
    end else begin
      writeback_en <= 0;
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


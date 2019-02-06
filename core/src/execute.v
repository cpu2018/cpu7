`default_nettype none

module execute(
  input wire clk,

  input wire execute_en,
  output reg writeback_en = 0,

  input wire signed [31:0] data1,
  input wire signed [31:0] data2,

  output reg [31:0] dout,

  input  wire [2:0] alu_op,
  input  wire [4:0] shift,

  output reg [3:0] cr_wdata
  );

  wire [31:0] alu_out;
  alu alu(.in1(data1), .in2(data2), .alu_op(alu_op), .out(alu_out), .shift(shift));

  wire [3:0] cmp_data;
  assign cmp_data = (data1 < data2) ? 4'b1000 :
                    (data1 > data2) ? 4'b0100 : 4'b0010;

  always @(posedge clk) begin
    if (execute_en) begin
      writeback_en <= 1;
      cr_wdata <= cmp_data;
      dout <= alu_out;
    end else begin
      writeback_en <= 0;
    end
  end

endmodule // execute

`default_nettype wire
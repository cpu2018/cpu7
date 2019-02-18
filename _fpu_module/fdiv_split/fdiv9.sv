`default_nettype none

module fdiv9(
  input wire [31:0] x1,
  input wire [23:0] y7,
  output wire [23:0] y11 );

  wire [22:0] m1;
  assign m1 = x1[22:0];
  
  wire [11:0] m1_0, y7_0;
  assign m1_0 = m1[11:0];
  assign y7_0 = y7[11:0];

  assign y11 = m1_0 * y7_0;

endmodule

`default_nettype wire

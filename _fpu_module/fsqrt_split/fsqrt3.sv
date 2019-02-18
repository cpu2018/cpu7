`default_nettype none

module fsqrt3(
  input wire [31:0] x1,
  input wire [23:0] y2,
  output wire [23:0] y5 );
  
  wire [22:0] m1;
  assign m1 = x1[22:0];

  wire [11:0] m1_0, y2_1;
  assign m1_0 = m1[11:0];
  assign y2_1 = y2[23:12];

  assign y5 = m1_0 * y2_1;

endmodule

`default_nettype wire

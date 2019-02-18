`default_nettype none

module fdiv4(
  input wire [31:0] x2,
  input wire [23:0] y2,
  output wire [23:0] y6 );

  wire [22:0] m2;
  assign m2 = x2[22:0];

  wire [11:0] m2_0, y2_0;
  assign m2_0 = m2[11:0];
  assign y2_0 = y2[11:0];

  assign y6 = m2_0 * y2_0;
endmodule

`default_nettype wire

`default_nettype none

module fdiv3(
  input wire [31:0] x2,
  input wire [23:0] y2,
  output wire [23:0] y5 );

  wire [22:0] m2;
  assign m2 = x2[22:0];

  wire [11:0] m2_0, y2_1;
  assign m2_0 = m2[11:0];
  assign y2_1 = y2[23:12];

  assign y5 = m2_0 * y2_1;
endmodule

`default_nettype wire

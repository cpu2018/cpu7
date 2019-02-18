`default_nettype none

module fdiv2(
  input wire [31:0] x2,
  input wire [23:0] y2,
  output wire [23:0] y4 );

  wire [22:0] m2;
  assign m2 = x2[22:0];

  wire [11:0] m2_1, y2_0;
  assign m2_1 = {1'b1, m2[22:12]};
  assign y2_0 = y2[11:0];

  assign y4 = m2_1 * y2_0;
endmodule

`default_nettype wire

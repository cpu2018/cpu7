`default_nettype none

module fsqrt1(
  input wire [31:0] x1,
  input wire [23:0] y2,
  output wire [23:0] y3 );
  
  wire [22:0] m1;
  assign m1 = x1[22:0];

  wire [11:0] m1_1, y2_1;
  assign m1_1 = {1'b1, m1[22:12]};
  assign y2_1 = y2[23:12];

  assign y3 = m1_1 * y2_1;

endmodule

`default_nettype wire

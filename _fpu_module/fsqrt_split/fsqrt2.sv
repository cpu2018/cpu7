`default_nettype none

module fsqrt2(
  input wire [31:0] x1,
  input wire [23:0] y2,
  output wire [23:0] y4 );
  
  wire [22:0] m1;
  assign m1 = x1[22:0];

  wire [11:0] m1_1, y2_0;
  assign m1_1 = {1'b1, m1[22:12]};
  assign y2_0 = y2[11:0];

  assign y4 = m1_1 * y2_0;

endmodule

`default_nettype wire

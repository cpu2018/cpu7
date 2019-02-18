`default_nettype none

module fdiv7(
  input wire [31:0] x1,
  input wire [23:0] y7,
  output wire [23:0] y9 );

  wire [22:0] m1;
  assign m1 = x1[22:0];
  
  wire [11:0] m1_1, y7_0;
  assign m1_1 = {1'b1, m1[22:12]};
  assign y7_0 = y7[11:0];

  assign y9 = m1_1 * y7_0;

endmodule

`default_nettype wire

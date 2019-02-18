`default_nettype none

module fdiv6(
  input wire [31:0] x1,
  input wire [23:0] y7,
  output wire [23:0] y8 );

  wire [22:0] m1;
  assign m1 = x1[22:0];
  
  wire [11:0] m1_1, y7_1;
  assign m1_1 = {1'b1, m1[22:12]};
  assign y7_1 = y7[23:12];

  assign y8 = m1_1 * y7_1;

endmodule

`default_nettype wire

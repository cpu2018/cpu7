`default_nettype none

module fsqrt(
  input wire [31:0] x1,
  output wire [31:0] y );

  wire [23:0] y1, y2, y3, y4, y5, y6;
  fsqrt0 u0(x1, y1, y2);
  fsqrt1 u1(x1, y2, y3);
  fsqrt2 u2(x1, y2, y4);
  fsqrt3 u3(x1, y2, y5);
  fsqrt4 u4(x1, y2, y6);
  fsqrt5 u5(x1, y1, y3, y4, y5, y6, y);

endmodule

`default_nettype wire

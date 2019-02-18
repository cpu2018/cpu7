`default_nettype none

module fdiv(
  input wire [31:0] x1,
  input wire [31:0] x2,
  output wire [31:0] y,
  output wire ovf );

  wire [23:0] y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11;
  fdiv0 u0(x2, y1, y2);
  fdiv1 u1(x2, y2, y3);
  fdiv2 u2(x2, y2, y4);
  fdiv3 u3(x2, y2, y5);
  fdiv4 u4(x2, y2, y6);
  fdiv5 u5(y1, y3, y4, y5, y6, y7);
  fdiv6 u6(x1, y7, y8);
  fdiv7 u7(x1, y7, y9);
  fdiv8 u8(x1, y7, y10);
  fdiv9 u9(x1, y7, y11);
  fdiv10 u10(x1, x2, y8, y9, y10, y11, y, ovf);

endmodule

`default_nettype wire

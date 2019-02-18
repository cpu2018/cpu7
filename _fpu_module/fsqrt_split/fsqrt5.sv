`default_nettype none

module fsqrt5(
  input wire [31:0] x1,
  input wire [23:0] y1,
  input wire [23:0] y3,
  input wire [23:0] y4,
  input wire [23:0] y5,
  input wire [23:0] y6,
  output wire [31:0] y );

  wire s1;
  wire [7:0] e1;
  wire [22:0] m1;
  assign s1 = x1[31:31];
  assign e1 = x1[30:23];
  assign m1 = x1[22:0];

  wire [7:0] eabs, ehalf, e;
  assign eabs = (e1[7:7]) ? e1 - 8'b01111111 : 8'b01111111 - e1 + 1;
  assign ehalf = eabs >> 1;
  assign e = (e1[7:7]) ? 8'b01111111 + ehalf : 8'b01111111 - ehalf;
  
  wire [22:0] xsqrt23;
  wire [23:0] xxsi24;
  wire [24:0] xsqrt25;
  wire [47:0] xxsi48;

  assign xxsi48 = {y3, 24'b0} + {12'b0, y4, 12'b0} + {12'b0, y5, 12'b0} + {24'b0, y6};
  assign xxsi24 = (xxsi48[47:47]) ? xxsi48[47:24] : xxsi48[46:23];
  assign xsqrt25 = (m1[22:21] == 2'b11 && xxsi24[22:21] == 2'b00) ? {1'b0, y1} + {xxsi24, 1'b0} : {1'b0, y1} + {1'b0, xxsi24};
  assign xsqrt23 = (&(m1[22:2]) && xsqrt25[23:22] == 2'b0) ? 23'b11111111111111111111111 : xsqrt25[23:1];

  assign y = { s1, e, xsqrt23 };

endmodule

`default_nettype wire

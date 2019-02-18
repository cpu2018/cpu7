`default_nettype none

module fdiv5(
  input wire [23:0] y1,
  input wire [23:0] y3,
  input wire [23:0] y4,
  input wire [23:0] y5,
  input wire [23:0] y6,
  output wire [23:0] y7 );

  wire [23:0] m2m2ii24;
  wire [24:0] m2i25, m2isubm2m2ii25;
  wire [47:0] m2m2ii48;

  assign m2i25 = {y1, 1'b0};
  assign m2m2ii48 = {y3, 24'b0} + {12'b0, y4, 12'b0} + {12'b0, y5, 12'b0} + {24'b0, y6};
  assign m2m2ii24 = (m2m2ii48[47:47]) ? m2m2ii48[47:24] : m2m2ii48[46:23];
  assign m2isubm2m2ii25 = m2i25 - {1'b0, m2m2ii24};
  assign y7 = (m2isubm2m2ii25[24:24]) ? m2isubm2m2ii25[24:1] : ((m2isubm2m2ii25[23:23]) ? m2isubm2m2ii25[23:0] : {m2isubm2m2ii25[22:0], 1'b0});

endmodule

`default_nettype wire

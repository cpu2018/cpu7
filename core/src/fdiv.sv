`default_nettype none

module fdiv (
  input wire clk,
  input wire ready,

  input wire [31:0] x1,
  input wire [31:0] x2,
  output reg [31:0] y_reg,
  output reg ovf_reg,
  output reg valid
  );

  wire [23:0] y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11;
  wire [31:0] y;
  wire ovf;
  reg [2:0] state;
  reg [31:0] x1_reg, x2_reg;
  reg [23:0] y1_reg, y2_reg, y3_reg, y4_reg, y5_reg, y6_reg, y7_reg, y8_reg, y9_reg, y10_reg, y11_reg;
  fdiv0 u0(x2, y1, y2);
  fdiv1 u1(x2_reg, y2_reg, y3);
  fdiv2 u2(x2_reg, y2_reg, y4);
  fdiv3 u3(x2_reg, y2_reg, y5);
  fdiv4 u4(x2_reg, y2_reg, y6);
  fdiv5 u5(y1_reg, y3_reg, y4_reg, y5_reg, y6_reg, y7);
  fdiv6 u6(x1_reg, y7_reg, y8);
  fdiv7 u7(x1_reg, y7_reg, y9);
  fdiv8 u8(x1_reg, y7_reg, y10);
  fdiv9 u9(x1_reg, y7_reg, y11);
  fdiv10 u10(x1_reg, x2_reg, y8_reg, y9_reg, y10_reg, y11_reg, y, ovf);

  always @(posedge clk) begin
    if (ready) begin
      state <= 1;
      x1_reg <= x1;
      x2_reg <= x2;
      y1_reg <= y1;
      y2_reg <= y2;
      valid <= 0;
    end else if (state == 1) begin
      y3_reg <= y3;
      y4_reg <= y4;
      y5_reg <= y5;
      y6_reg <= y6;
      state <= 2;
    end else if (state == 2) begin
      y7_reg <= y7;
      state <= 3;
    end else if (state == 3) begin
      y8_reg <= y8;
      y9_reg <= y9;
      y10_reg <= y10;
      y11_reg <= y11;
      state <= 4;
    end else if (state == 4) begin
      y_reg <= y;
      ovf_reg <= ovf;
      valid <= 1;
      state <= 0;
    end else begin
      valid <= 0;
    end
  end

endmodule // fdiv


/*
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
*/

`default_nettype wire

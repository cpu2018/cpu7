`default_nettype none
module fsqrt (
  input wire clk,
  input wire ready,

  input wire [31:0] x1,
  output reg [31:0] y_reg,
  output reg valid
  );

  wire [23:0] y1, y2, y3, y4, y5, y6;
  wire [31:0] y;
  reg [1:0] state;
  reg [31:0] x1_reg;
  reg [23:0] y1_reg;
  reg [23:0] y2_reg;
  reg [23:0] y3_reg;
  reg [23:0] y4_reg;
  reg [23:0] y5_reg;
  reg [23:0] y6_reg;
  fsqrt0 u0(x1, y1, y2);
  fsqrt1 u1(x1_reg, y2_reg, y3);
  fsqrt2 u2(x1_reg, y2_reg, y4);
  fsqrt3 u3(x1_reg, y2_reg, y5);
  fsqrt4 u4(x1_reg, y2_reg, y6);
  fsqrt5 u5(x1_reg, y1_reg, y3_reg, y4_reg, y5_reg, y6_reg, y);

  always @(posedge clk) begin
    if (ready) begin
      state <= 1;
      x1_reg <= x1;
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
      y_reg <= y;
      valid <= 1;
      state <= 0;
    end else begin
      valid <= 0;
    end
  end
endmodule // fsqrt

/*
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
*/
`default_nettype wire

module reg_file (
  input wire clk,
  input wire [4:0] rreg1,
  input wire [4:0] rreg2,
  input wire [4:0] wreg,
  input wire [31:0] wdata,
  input wire w_en,
  output wire [31:0] rdata1,
  output wire [31:0] rdata2
  );

  reg [31:0] r[31:0];

  assign rdata1 = r[rreg1];
  assign rdata2 = r[rreg2];

  initial begin
    r[3] <= 31'd100000;
    r[4] <= 31'd0;
  end

  always @ (posedge clk) begin
    //r[0] <= 32'd48;
    r[0] <= 32'd0;
    if (w_en) begin
      r[wreg] <= wdata;
    end
  end

endmodule // reg_file

module cr (
  input wire clk,
  input wire rst,
  input wire [2:0] cr_field,
  input wire [3:0] cr_wdata,
  input wire cr_w_en,
  output wire [3:0] cr_rdata
  );
  reg [3:0] r [7:0]; //4bitのレジスタ8個
  assign cr_rdata = r[cr_field];
  always @ (posedge clk) begin
    if (rst) begin
      //r <= 32'd0;
    end else if (cr_w_en) begin
      r[cr_field] <= cr_wdata;
    end
  end
endmodule // cr

module lr (
  input wire clk,
  input wire rst,
  input wire [31:0] lr_wdata,
  input wire lr_w_en,
  output wire [31:0] lr_rdata
  );
  reg [31:0] r;
  assign lr_rdata = r;
  always @ (posedge clk) begin
    if (lr_w_en) begin
      r <= lr_wdata;
    end
  end
endmodule // lr mtlr mflr blrで呼び出し
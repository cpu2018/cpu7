module gpr (
  input wire clk,
  input wire [4:0] rreg1,
  input wire [4:0] rreg2,
  input wire [4:0] wreg,
  input wire [31:0] wdata,
  input wire w_en,
  input wire w_byte,
  output wire [31:0] rdata1,
  output wire [31:0] rdata2
  );

  (* mark_debug = "true" *) reg [31:0] r[31:0];

  assign rdata1 = r[rreg1];
  assign rdata2 = r[rreg2];

  initial begin
    r[0] <= 32'd0;
  end

  always @ (posedge clk) begin
    r[0] <= 0;
    if (w_en) begin
      if (w_byte) begin
        r[wreg][7:0] <= wdata[7:0];
      end else begin
        r[wreg] <= wdata;
      end
    end
  end

endmodule // gpr

module fpr (
  input wire clk,
  (* mark_debug = "true" *) input wire [4:0] rreg1,
  (* mark_debug = "true" *) input wire [4:0] rreg2,
  (* mark_debug = "true" *) input wire [4:0] wreg,
  (* mark_debug = "true" *) input wire [31:0] wdata,
  (* mark_debug = "true" *) input wire w_en,
  input wire w_byte,
  (* mark_debug = "true" *) output wire [31:0] rdata1,
  (* mark_debug = "true" *) output wire [31:0] rdata2
  );

  (* mark_debug = "true" *) reg [31:0] fr[31:0];

  (* mark_debug = "true" *) wire f0 = fr[0];
  (* mark_debug = "true" *) wire f1 = fr[1];
  (* mark_debug = "true" *) wire f2 = fr[2];
  (* mark_debug = "true" *) wire f3 = fr[3];

  assign rdata1 = fr[rreg1];
  assign rdata2 = fr[rreg2];

  always @ (posedge clk) begin
    if (w_en) begin
      if (w_byte) begin
        fr[wreg][7:0] <= wdata[7:0];
      end else begin
        fr[wreg] <= wdata;
      end
    end
  end

endmodule // fpr

module cr (
  input wire clk,
//  input wire rst,
  input wire [2:0] cr_field,
  input wire [3:0] cr_wdata,
  input wire cr_w_en,
  output wire [3:0] cr_rdata
  );
  reg [3:0] r [7:0]; //4bitのレジスタ8個
  assign cr_rdata = r[cr_field];
  always @ (posedge clk) begin
    if (cr_w_en) begin
      r[cr_field] <= cr_wdata;
    end
  end
endmodule // cr

module lr (
  input wire clk,
//  input wire rst,
  input wire [31:0] lr_wdata,
  input wire lr_w_en,
  (* mark_debug = "true" *) output wire [31:0] lr_rdata
  );
  reg [31:0] r;
  assign lr_rdata = r;
  always @ (posedge clk) begin
    if (lr_w_en) begin
      r <= lr_wdata;
    end
  end
endmodule // lr mtlr mflr blrで呼び出し
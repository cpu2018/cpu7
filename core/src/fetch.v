module fetch (
  input wire clk,
  input wire rstn,

  input wire fetch_en,
  output reg decode_en,

  input wire [18:0] nextpc,

  output wire [18:0]  pc
  //input wire  [31:0] instr,

  //output wire  [31:0] instr_reg
  );

  always @(posedge clk) begin
    if (~rstn) begin
      decode_en <= 0;
    end else begin
      if (fetch_en) begin
        decode_en <= 1;
      end else begin
        decode_en <= 0;
      end
    end
  end

  assign pc = nextpc;

endmodule // fetch
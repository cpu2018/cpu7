module fetch (
  input wire clk,
  input wire rstn,

  input wire fetch_en,
  output reg decode_en,

  input wire [18:0] nextpc,

  output reg [18:0]  pc_reg
  //input wire  [31:0] instr,

  //output wire  [31:0] instr_reg
  );

  always @(posedge clk) begin
    if (~rstn) begin
      decode_en <= 0;
    end else begin
      if (fetch_en) begin
        decode_en <= 1;
        pc_reg <= nextpc;
      end else begin
        decode_en <= 0;
      end
    end
  end


endmodule // fetch
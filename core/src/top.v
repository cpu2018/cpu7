`default_nettype none

module cpu (
  input wire clk,
  input wire rstn,

  output reg [3:0] m_axi_araddr,
  input wire m_axi_arready,
  output reg m_axi_arvalid,
  output reg [3:0] m_axi_awaddr,
  input wire m_axi_awready,
  output reg m_axi_awvalid,
  output reg m_axi_bready,
  input wire [1:0] m_axi_bresp,
  input wire m_axi_bvalid,
  input wire [31:0] m_axi_rdata,
  output reg m_axi_rready,
  input wire [1:0] m_axi_rresp,
  input wire m_axi_rvalid,
  output reg [31:0] m_axi_wdata,
  input wire m_axi_wready,
  output reg [3:0] m_axi_wstrb,
  output reg m_axi_wvalid,

  output wire [18:0] mem_addr,
  output wire [31:0] mem_wdata,
  input wire  [31:0] mem_rdata,
  output wire [0:0]  mem_we,

  output wire [7:0] led
  );

  //start
  reg start;
  reg [1:0] start_wait;
  always @(posedge clk) begin
    if (~rstn) begin
      start_wait <= 0;
      start <= 0;
    end else begin
      if (start_wait != 2'd3) begin
        start_wait <= start_wait + 1;
      end
      if (start_wait == 2'd2) begin
        start <= 1;
      end
      if (start) begin
        start <= 0;
      end
    end
  end

  //I/O処理
  localparam  s_io_wait = 0;
  localparam  s_io_rcv = 1;
  localparam  s_io_trans = 2;
  reg [1:0] uart_io_state = s_io_wait;
  reg rcv_state;
  reg [2:0] trans_state;
  reg [7:0] rcv_buf [7:0];
  reg [1:0] rbuf_in;
  reg [1:0] rbuf_out;
  reg [7:0] trans_buf [7:0];
  reg [3:0] tbuf_in;
  reg [3:0] tbuf_out;
  wire in_en;
  wire out_en;
  always @(posedge clk) begin
    if (~rstn) begin
      uart_io_state <= s_io_wait;
      rcv_state <= 0;
      trans_state <= 0;
      rbuf_in <= 0;
      tbuf_out <= 0;
      m_axi_arvalid <= 0;
      m_axi_awvalid <= 0;
      m_axi_bready <= 0;
      m_axi_rready <= 0;
      m_axi_wstrb <= 4'b1111;
      m_axi_wvalid <= 0;
      m_axi_araddr <= 0;
      m_axi_awaddr <= 0;
      m_axi_wdata <= 0;
    end else begin
      if (uart_io_state == s_io_wait) begin
        if (rcv_state == 0) begin
          m_axi_araddr <= 8;
          m_axi_arvalid <= 1;
          rcv_state <= 1;
        end
        if (m_axi_arvalid && m_axi_arready) begin
          m_axi_arvalid <= 0;
          m_axi_rready <= 1;
        end
        if (m_axi_rready && m_axi_rvalid) begin
          m_axi_rready <= 0;
          rcv_state <= 0;
          if (m_axi_rdata[0] == 1 && (((rbuf_in + 1) & (4'b0111)) != rbuf_out)) begin
            uart_io_state <= s_io_rcv;
          end else if (m_axi_rdata[3] == 0 && (tbuf_in != tbuf_out)) begin
            uart_io_state <= s_io_trans;
          end
        end
      end else if (uart_io_state == s_io_rcv) begin
        if (rcv_state == 0) begin
          m_axi_araddr <= 0;
          m_axi_arvalid <= 1;
          rcv_state <= 1;
        end
        if (m_axi_arvalid && m_axi_arready) begin
          m_axi_arvalid <= 0;
          m_axi_rready <= 1;
        end
        if (m_axi_rready && m_axi_rvalid) begin
          m_axi_rready <= 0;
          rcv_state <= 0;
          uart_io_state <= s_io_wait;
          rcv_buf[rbuf_in] <= m_axi_rdata[7:0];
          rbuf_in <= ((rbuf_in + 1) & (4'b0111));
        end
      end else if (uart_io_state == s_io_trans) begin
        if (trans_state == 3'b000) begin
          m_axi_awvalid <= 1;
          m_axi_wvalid <= 1;
          m_axi_awaddr <= 4;
          m_axi_wdata <= {24'd0, trans_buf[tbuf_out]};
          trans_state[0] <= 1;
        end
        if (m_axi_awvalid && m_axi_awready) begin
          m_axi_awvalid <= 0;
          trans_state[1] <= 1;
        end
        if (m_axi_wvalid && m_axi_wready) begin
          m_axi_wvalid <= 0;
          trans_state[2] <= 1;
        end
        if (trans_state == 3'b111) begin
          m_axi_bready <= 1;
        end
        if (m_axi_bready && m_axi_bvalid) begin
          m_axi_bready <= 0;
          uart_io_state <= s_io_wait;
          trans_state <= 0;
          tbuf_out <= ((tbuf_out + 1) & (4'b0111));
        end
      end
    end
  end

  //reg_file
  wire [4:0] rreg1;
  wire [4:0] rreg2;
  wire [31:0] rdata1;
  wire [31:0] rdata2;
  reg  [31:0] wdata_reg;

  wire [4:0] decode_wreg;
  wire decode_reg_we;
  reg ex_reg_we;
  reg [4:0] ex_wreg;

  wire [31:0] reg_wdata;
  gpr gpr(.clk(clk), .rreg1(rreg1), .rreg2(rreg2), .wreg(ex_wreg), .wdata(reg_wdata), .w_en(ex_reg_we && writeback_en), .w_byte(ex_w_byte), .rdata1(rdata1), .rdata2(rdata2));

  reg fetch_en;
  wire decode_en;
  wire execute_en;
  wire writeback_en;

  //fetch
  //wire [31:0] instr;
  reg [18:0] nextpc;
  wire [18:0] pc;
  fetch fecth(.clk(clk), .rstn(rstn), .fetch_en(fetch_en), .nextpc(nextpc), .decode_en(decode_en), .pc(pc));

  //decode
  wire [31:0] decode_data1;
  wire [31:0] decode_data2;
  wire decode_branch;
  wire [18:0] decode_b_addr;
  wire [4:0] decode_b_cond;
  wire [31:0] decode_lr_wdata;
  wire decode_lr_we;
  wire decode_mflr;
  wire [2:0] decode_cr_field;
  wire decode_cr_we;
  wire cmp_src;
  //wire [1:0] decode_cr_bit;
  wire decode_bclr;
  wire decode_mem_access;
  wire [31:0] decode_mem_addr;
  wire decode_mem_we;
  wire [2:0] alu_op;
  wire [4:0] shift;
  //wire f_we;
  wire [31:0] f_rdata1;
  wire [31:0] f_rdata2;
  wire decode_f_we;
  wire [31:0] decode_f_data1;
  wire [31:0] decode_f_data2;
  wire [3:0]  float_op;
  wire decode_w_byte;
  decode decode(.clk(clk), .rstn(rstn), .decode_en(decode_en), .execute_en(execute_en), .instr(mem_rdata), .pc(pc), .rdata1(rdata1), .rdata2(rdata2), .rreg1(rreg1), .rreg2(rreg2), .wreg_reg(decode_wreg), .reg_we_reg(decode_reg_we), .f_rdata1(f_rdata1), .f_rdata2(f_rdata2), .f_data1_reg(decode_f_data1), .f_data2_reg(decode_f_data2), .f_we_reg(decode_f_we), .w_byte(decode_w_byte), .lr_wdata(decode_lr_wdata), .lr_we_reg(decode_lr_we), .mflr(decode_mflr), .cr_field(decode_cr_field), .cr_we_reg(decode_cr_we), .cmp_src(cmp_src), .input_reg(in_en), .output_reg(out_en), .mem_access_reg(decode_mem_access), .mem_addr(decode_mem_addr), .mem_we_reg(decode_mem_we), .mem_wdata(mem_wdata), .data1_reg(decode_data1), .data2_reg(decode_data2), .branch(decode_branch), .b_addr(decode_b_addr), .b_cond(decode_b_cond), .bclr(decode_bclr), .alu_op_reg(alu_op), .shift_reg(shift), .float_op_reg(float_op));

  //execute mem_access I/O

  wire writeback_en1; //算術演算等
  reg writeback_en2; //メモリアクセス
  reg writeback_en3; //I/O

// executeをそのまま通す信号
  reg ex_branch;
  reg [18:0] ex_b_addr;
  reg [4:0] ex_b_cond;
  reg ex_bclr;
  reg [31:0] ex_lr_wdata;
  reg ex_lr_we;
  reg ex_mflr;
  reg [2:0] ex_cr_field;
  reg ex_cr_we;
  reg ex_mem_access;
  reg ex_f_we;
  reg ex_w_byte;
  always @(posedge clk) begin
    if (~rstn) begin
      ex_reg_we <= 0;
      ex_wreg <= 0;
      ex_branch <= 0;
      ex_b_addr <= 0;
      ex_bclr <= 0;
      ex_b_cond <= 0;
      ex_lr_wdata <= 0;
      ex_lr_we <= 0;
      ex_mflr <= 0;
      ex_cr_field <= 0;
      ex_cr_we <= 0;
      ex_mem_access <= 0;
      ex_f_we <= 0;
      ex_w_byte <= 0;
    end else begin
      if (execute_en || in_en || out_en || decode_mem_access) begin
        ex_reg_we <= decode_reg_we;
        ex_wreg <= decode_wreg;
        ex_branch <= decode_branch;
        ex_b_addr <= decode_b_addr;
        ex_bclr <= decode_bclr;
        ex_b_cond <= decode_b_cond;
        ex_lr_wdata <= decode_lr_wdata;
        ex_lr_we <= decode_lr_we;
        ex_mflr <= decode_mflr;
        ex_cr_field <= decode_cr_field;
        ex_cr_we <= decode_cr_we;
        ex_mem_access <= decode_mem_access;
        ex_f_we <= decode_f_we;
        ex_w_byte <= decode_w_byte;
      end
    end
  end

  wire [31:0] dout;
  wire [31:0] f_dout;
  wire [3:0] cr_wdata;
  execute execute(.clk(clk), .rstn(rstn), .execute_en(execute_en), .writeback_en(writeback_en1), .data1(decode_data1), .data2(decode_data2), .f_data1(decode_f_data1), .f_data2(decode_f_data2), .dout(dout), .f_dout(f_dout), .alu_op(alu_op), .shift(shift), .float_op(float_op), .cmp_src(cmp_src), .cr_wdata(cr_wdata), .mem_access(decode_mem_access), .in_en(in_en), .out_en(out_en));

//mem_access
  assign mem_addr = (decode_mem_access) ? decode_mem_addr[20:2] : pc;
  assign mem_we = decode_mem_we;
  //assign mem_wdata = decode_data2;
  always @(posedge clk) begin
    if (~rstn) begin
      writeback_en2 <= 0;
    end else begin
      if (decode_mem_access) begin
        writeback_en2 <= 1;
      end else begin
        writeback_en2 <= 0;
      end
    end
  end

//in・out命令
  reg in_wait;
  reg out_wait;
  reg [7:0] inputdata_reg;
  reg input_reg;
  reg input_start;
  reg send_0xaa;
  always @(posedge clk) begin
    if (~rstn) begin
      input_start <= 0;
      send_0xaa <= 0;
    end else begin
      if (in_en && ~input_start) begin
        input_start <= 1;
        send_0xaa <= 1;
      end else if (send_0xaa) begin
        send_0xaa <= 0;
      end
    end
  end
  always @(posedge clk) begin
    if (~rstn) begin
      writeback_en3 <= 0;
      in_wait <= 0;
      out_wait <= 0;
      input_reg <= 0;
      tbuf_in <= 0;
      rbuf_out <= 0;
    end else begin
      if (send_0xaa) begin
        trans_buf[0] <= 8'b10101010;
        tbuf_in <= 1;
      end else if ((in_en || in_wait) && (rbuf_in != rbuf_out)) begin
        inputdata_reg <= rcv_buf[rbuf_out];
        rbuf_out <= ((rbuf_out + 1) & (4'b0111));
        writeback_en3 <= 1;
        in_wait <= 0;
        input_reg <= 1;
      end else if ((out_en || out_wait) && (((tbuf_in + 1) & (4'b0111)) != tbuf_out)) begin
        trans_buf[tbuf_in] <= decode_data2[7:0];
        tbuf_in <= ((tbuf_in + 1) & (4'b0111));
        writeback_en3 <= 1;
        out_wait <= 0;
        input_reg <= 0;
      end else begin
        input_reg <= 0;
        writeback_en3 <= 0;
        if (in_en) begin
          in_wait <= 1;
        end else if (out_en) begin
          out_wait <= 1;
        end
      end
    end
  end

  assign writeback_en = writeback_en1 || writeback_en2 || writeback_en3;

  //writeback
  wire [31:0] lr_rdata;
  assign reg_wdata = (ex_mem_access) ? mem_rdata :
                     (input_reg) ? {24'd0, inputdata_reg} :
                     (ex_mflr) ? lr_rdata : dout;

  wire [31:0] f_wdata;
  assign f_wdata = (ex_mem_access) ? mem_rdata :
                   (input_reg) ? {24'd0, inputdata_reg} : f_dout;
  always @(posedge clk) begin
    if (~rstn) begin
      fetch_en <= 0;
    end else begin
      if (writeback_en || start) begin
        fetch_en <= 1;
      end else begin
        fetch_en <= 0;
      end
    end
  end

  lr lr(.clk(clk), .lr_wdata(ex_lr_wdata), .lr_w_en((ex_lr_we) && writeback_en), .lr_rdata(lr_rdata));
  wire [3:0]  cr_rdata;
  cr cr(.clk(clk), .cr_field(ex_cr_field), .cr_wdata(cr_wdata), .cr_w_en((ex_cr_we) && writeback_en), .cr_rdata(cr_rdata));
  fpr fpr(.clk(clk), .rreg1(rreg1), .rreg2(rreg2), .wreg(ex_wreg), .wdata(f_wdata), .w_en(ex_f_we && writeback_en), .w_byte(ex_w_byte), .rdata1(f_rdata1), .rdata2(f_rdata2));

  wire  [18:0] offset;
  wire cond_ok;
  assign cond_ok = ex_b_cond[4] || (cr_rdata[3:1] == {ex_b_cond[0], ex_b_cond[1], ex_b_cond[3]}) || (ex_b_cond[2] && (~cr_rdata[1]));
  assign offset = (ex_branch && cond_ok) ? ex_b_addr : 1;

  always @(posedge clk) begin
    if (~rstn) begin
      nextpc <= 0;
    end else begin
      if (writeback_en) begin
        if (ex_bclr && cond_ok) begin
          nextpc <= lr_rdata[20:2];
        end else begin
          nextpc <= nextpc + offset; //TODO : パイプラインするときはpcをレジスタに通す
        end
      end
    end
  end

  reg [24:0] counter;
  always @(posedge clk) begin
    counter <= counter + 1;
  end
  assign led[7:0] = ((mem_rdata == 0 || counter[24:24]) &&  (~fetch_en && ~decode_en && ~execute_en && ~in_en && ~out_en && ~writeback_en && ~decode_mem_access && ~in_wait && ~out_wait)) ? 8'b11111111 : 8'b00000000; //実機で実験するときはcounter[24]にする
  //assign led[7:0] = {8{(~fetch_en && ~decode_en && ~execute_en && ~in_en && ~out_en && ~writeback_en && ~decode_mem_access && ~in_wait && ~out_wait)}} & pc[7:0];


endmodule // cpu

`default_nettype wire
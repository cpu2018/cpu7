`default_nettype none

module fmul(
  input wire [31:0] x1,
  input wire [31:0] x2,
  output wire [31:0] y,
  output wire ovf );
  
  wire s1, s2;
  wire [7:0] e1, e2;
  wire [22:0] m1, m2;
  assign s1 = x1[31:31];
  assign s2 = x2[31:31];
  assign e1 = x1[30:23];
  assign e2 = x2[30:23];
  assign m1 = x1[22:0];
  assign m2 = x2[22:0];
  
  wire s;
  wire [8:0] e_sub, e_subsub, e_subsubsub;
  wire [7:0] e;
  wire [23:0] m1_sub, m2_sub;
  wire [47:0] m_sub;
  wire [22:0] m, m_subsub;
  assign s = s1 ^ s2;
  assign m1_sub = { 1'b1, m1 };
  assign m2_sub = { 1'b1, m2 };
  assign m_sub = m1_sub * m2_sub;
  assign m_subsub = ( m_sub[47:47] ) ? m_sub[46:24] : m_sub[45:23];
  assign e_sub = { 1'b0, e1 } + { 1'b0, e2 };
  assign e_subsub = ( e_sub > 9'd126 ) ? e_sub - 9'd126 : 9'b0;
  assign e_subsubsub = ( m_sub[47:47] || e_subsub < 9'b1 ) ? e_subsub : e_subsub - 9'b1;
  assign ovf = e_subsubsub >= 9'd255;
  assign e = ( ovf ) ? 8'b11111111 : e_subsubsub[7:0];
  assign m = ( ovf ) ? 23'b0 : m_subsub;
  
  assign y = { s, e, m };
  
endmodule

`default_nettype wire


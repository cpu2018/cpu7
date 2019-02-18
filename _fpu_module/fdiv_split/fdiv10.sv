`default_nettype none

module fdiv10(
  input wire [31:0] x1,
  input wire [31:0] x2,
  input wire [23:0] y8,
  input wire [23:0] y9,
  input wire [23:0] y10,
  input wire [23:0] y11,
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
  wire [7:0] e;
  wire [9:0] e_sub;
  assign s = s1 ^ s2;
  assign e_sub = (m1 >= m2) ? (10'b1001111111 + {2'b0, e1}) - {2'b0, e2} : (10'b1001111110 + {2'b0, e1}) - {2'b0, e2};
  assign e = (e_sub[9:9]) ? ((e_sub[8:8]) ? 8'b11111111 : e_sub[7:0]) : 8'b0;

  wire [22:0] m1mulm2isubm2m2ii23, m_sub23, m;
  wire [47:0] m1mulm2isubm2m2ii48;

  assign m1mulm2isubm2m2ii48 = {y8, 24'b0} + {12'b0, y9, 12'b0} + {12'b0, y10, 12'b0} + {24'b0, y11};
  assign m1mulm2isubm2m2ii23 = (m1mulm2isubm2m2ii48[47:47]) ? m1mulm2isubm2m2ii48[46:24] : m1mulm2isubm2m2ii48[45:23];
  assign m_sub23 = (m1 >= m2 && m1[22:21] == m2[22:21] && m1mulm2isubm2m2ii23[22:21] == 2'b11) ? 23'b0 : ((m1 < m2 && m1[22:21] == m2[22:21] && m1mulm2isubm2m2ii23[22:21] == 2'b00) ? 23'b11111111111111111111111 : m1mulm2isubm2m2ii23);
  assign m = (~e_sub[9:9] || e_sub[8:8]) ? 23'b0 : m_sub23;

  assign y = {s, e, m};
  assign ovf = e_sub[8:8];

endmodule

`default_nettype wire

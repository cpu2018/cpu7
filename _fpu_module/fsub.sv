`default_nettype none

module fadd(
  input wire [31:0] x1,
  input wire [31:0] x2,
  output wire [31:0] y,
  output wire ovf );

  wire s1, s2;
  wire [7:0] e1, e2;
  wire [22:0] m1, m2;
  assign s1 = x1[31:31];
  assign s2 = ~(x2[31:31]);
  assign e1 = x1[30:23];
  assign e2 = x2[30:23];
  assign m1 = x1[22:0];
  assign m2 = x2[22:0];
  
  wire [24:0] m1a, m2a;
  assign m1a = { 2'b01, m1 };
  assign m2a = { 2'b01, m2 };
  
  wire [7:0] e2ai;
  assign e2ai = ~e2;
  
  wire [8:0] te9;
  assign te9 = { 1'b0, e1 } + { 1'b0, e2ai };
  
  wire [7:0] tde;
  wire [8:0] tde_sub1;
  wire [8:0] tde_sub2;
  assign tde_sub1 = te9 + 9'b1;
  assign tde_sub2 = ~te9;
  assign tde = (te9[8:8]) ? tde_sub1[7:0] : tde_sub2[7:0];
  
  wire [4:0] de5;
  assign de5 = ( |(tde[7:5]) == 1 ) ? 5'b11111 : tde[4:0];
  
  wire sel, sub1;
  assign sub1 = ( m1a > m2a ) ? 0 : 1;
  assign sel = ( de5 == 5'b0 ) ? sub1 : ~(te9[8:8]);
  
  wire [24:0] ms, mi;
  wire [7:0] es, ei;
  wire ss;
  assign ms = ( sel == 0 ) ? m1a : m2a;
  assign mi = ( sel == 0 ) ? m2a : m1a;
  assign es = ( sel == 0 ) ? e1 : e2;
  assign ei = ( sel == 0 ) ? e2 : e1;
  assign ss = ( sel == 0 ) ? s1 : s2;
  
  wire [55:0] mie;
  assign mie = { mi, 31'b0 };
  
  wire [55:0] mia;
  assign mia = mie >> de5;
  
  wire tstck;
  assign tstck = |(mia[28:0]);
  
  wire [26:0] mye;
  assign mye = ( s1 == s2 ) ? { ms, 2'b0 } + mia[55:29] : { ms, 2'b0 } - mia[55:29];
  
  wire [7:0] esi;
  assign esi = es + 8'b00000001;
  
  wire [7:0] eyd;
  wire [26:0] myd;
  wire stck;
  assign eyd = ( mye[26] == 1 ) ? es + 8'b1 : es;
  assign myd = ( mye[26] == 1 ) ? mye >> 1 : mye;
  assign stck = ( mye[26] == 1 ) ? tstck || mye[0] : tstck;
  
  wire [4:0] se;
  assign se = ( myd[25] == 1 ) ? 5'd0 :
              ( myd[24] == 1 ) ? 5'd1 :
              ( myd[23] == 1 ) ? 5'd2 :
              ( myd[22] == 1 ) ? 5'd3 :
              ( myd[21] == 1 ) ? 5'd4 :
              ( myd[20] == 1 ) ? 5'd5 :
              ( myd[19] == 1 ) ? 5'd6 :
              ( myd[18] == 1 ) ? 5'd7 :
              ( myd[17] == 1 ) ? 5'd8 :
              ( myd[16] == 1 ) ? 5'd9 :
              ( myd[15] == 1 ) ? 5'd10 :
              ( myd[14] == 1 ) ? 5'd11 :
              ( myd[13] == 1 ) ? 5'd12 :
              ( myd[12] == 1 ) ? 5'd13 :
              ( myd[11] == 1 ) ? 5'd14 :
              ( myd[10] == 1 ) ? 5'd15 :
              ( myd[9] == 1 ) ? 5'd16 :
              ( myd[8] == 1 ) ? 5'd17 :
              ( myd[7] == 1 ) ? 5'd18 :
              ( myd[6] == 1 ) ? 5'd19 :
              ( myd[5] == 1 ) ? 5'd20 :
              ( myd[4] == 1 ) ? 5'd21 :
              ( myd[3] == 1 ) ? 5'd22 :
              ( myd[2] == 1 ) ? 5'd23 :
              ( myd[1] == 1 ) ? 5'd24 :
              ( myd[0] == 1 ) ? 5'd25 : 5'd26;
  
  wire [8:0] eyf;
  assign eyf = ( eyd > { 3'b0, se } ) ? { 1'b0, eyd } - { 4'b0, se } : 9'b0;
  
  wire [7:0] eyr;
  wire [26:0] myf;
  assign myf = myd << se;
  assign eyr = eyf[7:0];
  
  wire [24:0] myr;
  assign myr = ( ( myf[1] == 1 && myf[0] == 0 && stck == 0 && myf[2] == 1 ) || ( myf[1] == 1 && myf[0] == 0 && s1 == s2 && stck == 1 ) || ( myf[1] == 1 && myf[0] == 1 ) ) ? myf[26:2] + 25'b1 : myf[26:2];
  
  wire [7:0] ey;
  wire [22:0] my;
  assign ey = ( myr[24] == 1 ) ? eyr + 8'b1 : eyr;
  assign my = myr[22:0];
  
  wire sy;
  assign sy = ( ey == 8'b0 && my == 23'b0 ) ? s1 && s2 : ss;
  
  assign y = ( se == 5'd26 ) ? 32'b0 : { sy, ey, my };
  
  wire ovf_sub_exception;
  assign ovf_sub_exception = &ey;
  assign ovf = ( e1 == 8'd255 || e2 == 8'd255 ) ? 0 : ovf_sub_exception;

endmodule

`default_nettype wire


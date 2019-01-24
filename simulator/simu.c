#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define R 32
#define M 10000

union IntAndFloat {
  int ival;
  float fval;
};

typedef struct cpu{
  char memory[M][9];
  char reg[32][R+1];
  char freg[32][R+1];
  char lr[R+1];
  char cr[8][5];
  char cor[R+1];
  char s[R+1];
} CPU;

typedef struct l{
  char name[20];
  int addr;
} label;

typedef struct c{
  char name[50];
  int addr;
} code;

void finv1(char z[24],char x[13]);
void finv2(char y[24],char x[13]);
void fsqrt_table(char z[24],char x[13]);
void fsqrtinv_tabel(char y[24],char x[13]);

void init_code(code *code){
  for(int i=0;i<50;i++){
    (code->name)[i]='\0';
  }
}

void init_label(label *label){
  for(int i=0;i<20;i++){
    (label->name)[i]='\0';
  }
}

/*インクリメント*/
void inc(char *s,int len){
  for(int i=0;i<len;i++){
    if(s[len-1-i]=='0'){
      s[len-1-i]='1';
      break;
    }
    else{
      s[len-1-i]='0';
    }
  }
}

void init_cpu(CPU *cpu){
  for(int i=0;i<M;i++){
    for(int j=0;j<9;j++){
      (cpu->memory)[i][j]='\0';
    }
  }
  for(int i=0;i<32;i++){
    for(int j=0;j<R+1;j++){
      (cpu->reg)[i][j]='\0';
    }
  }
  for(int i=0;i<R+1;i++){
    (cpu->lr)[i]='\0';
  }
  for(int i=0;i<8;i++){
    for(int j=0;j<5;j++){
      (cpu->cr)[i][j]='\0';
    }
  }
  for(int i=0;i<R+1;i++){
    (cpu->cor)[i]='\0';
  }
  for(int i=0;i<R+1;i++){
    (cpu->s)[i]='\0';
  }
}

/*int型のpowでnのm乗*/
int pow2(int n,int m){
  int ans = 1;
  for(int i=1;i<m+1;i++){
    ans*=n;
  }
  return ans;
}

/*b bitの文字列の反転。gが反転されたbit列*/
void hanten(char *g,char *s,int b){
  for(int i=0;i<b;i++){
    if(s[i]=='0'){
      g[i]='1';
    }
    else{
      g[i]='0';
    }
  }
}


void i_to_b(char *g,int i_g,int b){
  for(int i=0;i<b;i++){
    int r = i_g % 2;
    g[b-i-1] = r + 48;
    i_g = i_g / 2;
  }
}

void i_to_b_long(char *g,long i_g,int b ){
  for(int i=0;i<b;i++){
    int r = i_g % 2;
    g[b-i-1] = r + 48;
    i_g = i_g / 2;
  }
}

int b_to_i(char *s,int b,int e){
  int ans=0;
  for(int i=b;i<e+1;i++){
    if(s[i] == '1'){
      ans += pow2(2,e-i);
    }
  }
  return ans;
}

void r_shift(char *g,char *s,int x,int b){
  strcpy(g,s);
  for(int i=0;i<x;i++){
    for(int j=0;j<b;j++){
      int j2 = b-1-j;
      if(j2==0){
        g[j2]='0';
      }
      else{
        g[j2]=g[j2-1];
      }
    }
  }
}

void zero_count(char *g,char *s,int bg,int sg){
  int ans=0;
  for(int i=1;i<sg;i++){
    if(s[i]=='1'){
      break;
    }
    else{
      ans+=1;
    }
  }
  i_to_b(g,ans,bg);
}

int or(char *s,int b,int e){
  for(int i=b;i<e+1;i++){
    if(s[i]=='1'){
      return 1;
    }
  }
  return 0;
}

int andx(char *s,int b,int e){
  for(int i=b;i<e;i++){
    if(s[i]=='0'){
      return 0;
    }
  }
  return 1;
}



void fpu_fadd(char x1[33],char x2[33],char ans[33],char ovf[2]){
  char s1[2];
  char s2[2];
  char e1[9];
  char e2[9];
  char m1[24];
  char m2[24];

  strncpy(s1,x1,1);
  strncpy(s2,x2,1);
  strncpy(e1,x1+1,8);
  strncpy(e2,x2+1,8);
  strncpy(m1,x1+9,23);
  strncpy(m2,x2+9,23);

  char m1a[26] = "01";
  char m2a[26] = "01";
  strcat(m1a,m1);
  strcat(m2a,m2);

  char e2ai[9];
  hanten(e2ai,e2,8);/*e2のbit反転をe2aiに入れる。8はbit数*/

  char te9[10];
  int i_e1 = b_to_i(e1,0,7);/*8bitを整数に*/
  int i_e2ai = b_to_i(e2ai,0,7);
  int i_te9 = i_e1+i_e2ai;
  i_to_b(te9,i_te9,9);/*整数を9bitに変換*/

  char tde[9];
  char tde_sub1[10];
  char tde_sub2[10];
  int i_tde_sub1 = i_te9 + 1;
  i_to_b(tde_sub1,i_tde_sub1,9);
  hanten(tde_sub2,te9,9);
  if(te9[0]=='1'){
    strncpy(tde,tde_sub1+1,8);
  }
  else{
    strncpy(tde,tde_sub2+1,8);
  }

  char de5[6];
  int or_tde_7_5 = or(tde,0,2);/*tdeの上から3bitのor.veriogだと7:5*/
  if(or_tde_7_5==1){
    strcpy(de5,"11111");
  }
  else{
    strncpy(de5,tde+3,5);/*tdeの4bit目から5bitを取り出す*/
  }

  int sel;
  int sub1;
  int i_m1a = b_to_i(m1a,0,24);
  int i_m2a = b_to_i(m2a,0,24);
  if(i_m1a > i_m2a){
    sub1 = 0;
  }
  else{
    sub1 = 1;
  }
  if(strcmp(de5,"00000")==0){
    sel=sub1;
  }
  else{
    if(te9[0]=='0'){
      sel=1;
    }
    else{
      sel=0;
    }
  }

  char ms[26];
  char mi[26];
  char es[9];
  char ei[9];
  char ss[2];
  if(sel==0){
    strcpy(ms,m1a);
    strcpy(mi,m2a);
    strcpy(es,e1);
    strcpy(ei,e2);
    strcpy(ss,s1);
  }
  else{
    strcpy(ms,m2a);
    strcpy(mi,m1a);
    strcpy(es,e2);
    strcpy(ei,e1);
    strcpy(ss,s2);
  }

  char mie[57];
  strcpy(mie,mi);
  for(int i=0;i<31;i++){
    mie[25+i]='0';
  }

  char mia[57];
  int i_de5 = b_to_i(de5,0,5);
  r_shift(mia,mie,i_de5,56);/*56bitのmieをi_de5だけ右に論理シフト*/
  
  char tstck[2];
  int or_mia = or(mia,27,55);/*miaの28bitから0bitのor*/
  if(or_mia==1){
    tstck[0]='1';
  }
  else{
    tstck[0]='0';
  }

  char mye[28];
  if(s1[0]==s2[0]){
    char mye_sub[28];
    strcpy(mye_sub,ms);
    strcat(mye_sub,"00");
    int i_mye_sub = b_to_i(mye_sub,0,26);
    int i_mye_sub2 = b_to_i(mia,0,26);
    int i_mye = i_mye_sub + i_mye_sub2;
    i_to_b(mye,i_mye,27);
  }
  else{
     char mye_sub[28];
    strcpy(mye_sub,ms);
    strcat(mye_sub,"00");
    int i_mye_sub = b_to_i(mye_sub,0,26);
    int i_mye_sub2 = b_to_i(mia,0,26);
    int i_mye = i_mye_sub - i_mye_sub2;
    i_to_b(mye,i_mye,27);
  }

  char esi[9];
  int i_es = b_to_i(es,0,7);
  int i_esi = i_es + 1;
  i_to_b(esi,i_esi,8);
  
  char eyd[9];
  char myd[28];
  char stck[2];
  if(mye[0]=='1'){
    int i_eyd = i_es + 1;
    i_to_b(eyd,i_eyd,8);
    r_shift(myd,mye,1,27);
    if(tstck[0]=='1'){
      stck[0] = '1';
    }
    else{
      if(mye[26]=='1'){
        stck[0]='1';
      }
      else{
        stck[0]='0';
      }
    }
  }
  else{
    int i_eyd = i_es;
    i_to_b(eyd,i_eyd,8);
    strcpy(myd,mye);
    stck[0]=tstck[0];
  }


  char se[6];
  zero_count(se,myd,5,27);/*mydの25bitから数えて0の出てくる位置を5bitにする*/

  char eyf[10];
  int i_eyd = b_to_i(eyd,0,7);
  char se_sub[9] = "000";
  strcat(se_sub,se);
  int i_se_sub = b_to_i(se_sub,0,7);
  int i_se = b_to_i(se,0,4);
  if(i_eyd > i_se_sub){
    int i_eyf = i_eyd - i_se;
    i_to_b(eyf,i_eyf,9);
  }
  else{
    strcpy(eyf,"000000000");
  }


  char eyr[9];
  char myf[28];
  //int i_se = b_to_i(se,0,4);
  r_shift(myf,myd,i_se,27);
  strncpy(eyr,eyf+1,8);


  char myr[26];
  int i_myr = b_to_i(myf,0,24);
  if(((myf[25]=='1')&&(myf[26]=='1')&&(stck[0]=='0')&&(myf[24]=='1'))||((myf[25]=='1')&&(myf[26]=='0')&&(s1[0]==s2[0])&&(stck[0]==1))||((myf[25]=='1')&&(myf[26]=='1'))){
    i_myr+=1;
    i_to_b(myr,i_myr,27);
  }
  else{
    i_to_b(myr,i_myr,27);
  }


  char ey[9];
  char my[24];
  int i_ey=b_to_i(eyr,0,7);
  if(myr[0]=='1'){
    i_ey+=1;
  }
  i_to_b(ey,i_ey,8);
  strncpy(my,myr+4,23);

  char sy[2];
  if((strcmp(ey,"00000000")==0)&&(strcmp(my,"00000000000000000000000")==0)){
    sy[0] = s1[0];
  }
  else{
    sy[0] = ss[0];
  }

  //int i_se = b_to_i(se,0,5);
  int i_ans = 0;
  if(i_se==26){
    i_ans=0;
    i_to_b(ans,i_ans,32);
  }
  else{
    strcat(ans,sy);
    strcat(ans,ey);
    strcat(ans,my);
  }

  char ovf_sub_exception[2];
  int i_ovf_se = andx(ey,0,7);
  if(i_ovf_se==1){
    ovf_sub_exception[0]='1';
  }
  else{
    ovf_sub_exception[0]='0';
  }
  //int i_e1 = b_to_i(e1,0,7);
  int i_e2 = b_to_i(e2,0,7);
  
  if((i_e1==255)||(i_e2==255)){
    ovf[0]='0';
  }
  else{
    strcpy(ovf,ovf_sub_exception);
  }
}

void fpu_fsub(char x1[33],char x2[33],char ans[33],char ovf[2]){
  char nx2[33];
  strcpy(nx2,x2);
  if(nx2[0]=='0'){
    nx2[0]='1';
  }
  else{
    nx2[1]='0';
  }
  fpu_fadd(x1,nx2,ans,ovf);
}

void fpu_fmul(char x1[33],char x2[33],char ans[33],char ovf[2]){
  char s1[2];
  char s2[2];
  char e1[9];
  char e2[9];
  char m1[24];
  char m2[24];

  strncpy(s1,x1,1);
  strncpy(s2,x2,1);
  strncpy(e1,x1+1,8);
  strncpy(e2,x2+1,8);
  strncpy(m1,x1+9,23);
  strncpy(m2,x2+9,23);

  int i_s1 = b_to_i(s1,0,0);
  int i_s2 = b_to_i(s2,0,0);
  int i_e1 = b_to_i(e1,0,7);
  int i_e2 = b_to_i(e2,0,7);
  /*int i_m1 = b_to_i(m1,0,22);
    int i_m2 = b_to_i(m2,0,22);*/
  

  char s[2];
  char e_sub[10];
  //char e_subsub[10];
  char e_subsubsub[10];
  char e[9];
  char m1_sub[25]="1";
  char m2_sub[25]="1";
  char m_sub[49];
  char m[24];
  char m_subsub[24];

  int i_s = i_s1 * i_s2;
  i_to_b(s,i_s,1);
  strcat(m1_sub,m1);
  strcat(m2_sub,m2);
  int i_m1_sub = b_to_i(m1_sub,0,23);
  int i_m2_sub = b_to_i(m2_sub,0,23);
  long i_m_sub = (long) i_m1_sub * (long) i_m2_sub;
  i_to_b_long(m_sub,i_m_sub,48);
  if(m_sub[0]=='1'){
    strncpy(m_subsub,m_sub+1,23);
  }
  else{
    strncpy(m_subsub,m_sub+2,23);
  }
  int i_e_sub = i_e1 + i_e2;
  i_to_b(e_sub,i_e_sub,9);
  int i_e_subsub;
  if(i_e_sub > 126){
    i_e_subsub = i_e_sub - 126;
  }
  else{
    i_e_subsub = 0;
  }

  int i_e_subsubsub;

  if((m_sub[0]=='1')||(i_e_subsub < 1)){
    i_e_subsubsub = i_e_subsub;
  }
  else{
    i_e_subsubsub = i_e_subsub - 1;
  }
  i_to_b(e_subsubsub,i_e_subsubsub,9);

  if(i_e_subsubsub >= 255){
    ovf[0]='1';
  }
  else{
    ovf[0]='0';
  }

  if(ovf[0]=='1'){
    strcpy(e,"11111111");
  }
  else{
    strncpy(e,e_subsubsub+1,8);
  }
  if(ovf[0]=='1'){
    strcpy(m,"00000000000000000000000");
  }
  else{
    strcpy(m,m_subsub);
  }

  strcat(ans,s);
  strcat(ans,e);
  strcat(ans,m);
}



void fpu_fdiv(char x1[33],char x2[33],char ans[33],char ovf[2]){
  char s1[2]={'\0'};
  char s2[2]={'\0'};
  char e1[9]={'\0'};
  char e2[9]={'\0'};
  char m1[24]={'\0'};
  char m2[24]={'\0'};
 
  strncpy(s1,x1,1);
  strncpy(s2,x2,1);
  strncpy(e1,x1+1,8);
  strncpy(e2,x2+1,8);
  strncpy(m1,x1+9,23);
  strncpy(m2,x2+9,23);

  //int i_e1=b_to_i(e1,0,7);
  //int i_e2=b_to_i(e2,0,7);
  int i_m1=b_to_i(m1,0,22);
  int i_m2=b_to_i(m2,0,22);

  char s[2]={'\0'};
  char e[9]={'\0'};
  char e_sub[11]={'\0'};

  if((s1[0]=='0')||(s2[0]='0')){
    s[0]='0';
  }
  else{
    s[0]='1';
  }

  char e1_00[11]="00";
  strcat(e1_00,e1);
  int i_e1_00=b_to_i(e1_00,0,9);
  char e2_00[11]="00";
  strcat(e2_00,e2);
  int i_e2_00=b_to_i(e2_00,0,9);
  char sim1[11]="1001111111";
  int i_sim1=b_to_i(sim1,0,9);

  char sim2[11]="1001111110";
  int i_sim2=b_to_i(sim2,0,9);
  
  int i_e_sub;
  

  if(i_m1>=i_m2){
    i_e_sub=i_sim1 + i_e1_00 - i_e2_00;
  }
  else{
    i_e_sub=i_sim2+i_e1_00-i_e2_00;
  }
  
  
  i_to_b(e_sub,i_e_sub,10);

  char e_sub_70[9]={'\0'};
  strncpy(e_sub_70,e_sub+2,8);
  if(e_sub[0]=='1'){
    if(e_sub[1]=='1'){
      strcpy(e,"11111111");
    }
    else{
      strcpy(e,e_sub_70);
    }
  }
  else{
    strcpy(e,"00000000");
  }
  char m2i23[24]={'\0'};
  char m2ii23[24]={'\0'};
  char m1mulm2isubm2m2ii23[24]={'\0'};
  char m_sub23[24]={'\0'};
  char m[24]={'\0'};
  char m124[25]={'\0'};
  char m224[25]={'\0'};
  char m2ii24[25]={'\0'};
  char m2m2ii24[25]={'\0'};
  char m2isubm2m2ii24[25]={'\0'};
  char m2i25[26]={'\0'};
  char m2isubm2m2ii25[26]={'\0'};
  char m2m2ii48[49]={'\0'};
  char m1mulm2isubm2m2ii48[49]={'\0'};

  char m2_22_11[13]={'\0'};
  strncpy(m2_22_11,m2,12);
  finv1(m2i23,m2_22_11);
  finv2(m2ii23,m2_22_11);
  m124[0]='1';
  strcat(m124,m1);
  m224[0]='1';
  strcat(m224,m2);
  m2ii24[0]='1';
  strcat(m2ii24,m2ii23);
  m2i25[0]='1';
  strcat(m2i25,m2i23);
  strcat(m2i25,"0");
  int i_m224=b_to_i(m224,0,23);
  int i_m2ii24=b_to_i(m2ii24,0,23);
  long i_m2m2ii48=((long) i_m224) * ((long) i_m2ii24);
  i_to_b_long(m2m2ii48,i_m2m2ii48,48);
  if(m2m2ii48[0]=='1'){
    strncpy(m2m2ii24,m2m2ii48,24);
  }else{
    strncpy(m2m2ii24,m2m2ii48+1,24);
  }
  int i_m2i25=b_to_i(m2i25,0,24);
  char xm2m2ii24[26]={'\0'};
  xm2m2ii24[0]='0';
  strcat(xm2m2ii24,m2m2ii24);
  int i_xm2m2ii24=b_to_i(xm2m2ii24,0,24);
  int i_m2isubm2m2ii25=i_m2i25 - i_xm2m2ii24;
  i_to_b(m2isubm2m2ii25,i_m2isubm2m2ii25,25);
  if(m2isubm2m2ii25[0]=='1'){
    strncpy(m2isubm2m2ii24,m2isubm2m2ii25,24);
  }
  else{
    if(m2isubm2m2ii25[1]=='1'){
      strncpy(m2isubm2m2ii24,m2isubm2m2ii25+1,24);
    }
    else{
      strncpy(m2isubm2m2ii24,m2isubm2m2ii25,23);
      strcat(m2isubm2m2ii24,"0");
    }
  }
  int i_m124=b_to_i(m124,0,23);
  int i_m2isubm2m2ii24=b_to_i(m2isubm2m2ii24,0,23);
  long i_m1mulm2isubm2m2ii48=((long) i_m124) * ((long)i_m2isubm2m2ii24);
  i_to_b_long(m1mulm2isubm2m2ii48,i_m1mulm2isubm2m2ii48,48);
  if(m1mulm2isubm2m2ii48[0]=='1'){
    strncpy(m1mulm2isubm2m2ii23,m1mulm2isubm2m2ii48+1,23);
  }
  else{
    strncpy(m1mulm2isubm2m2ii23,m1mulm2isubm2m2ii48+2,23);
  }
  if((i_m1>=i_m2)&&(strncmp(m1,m2,2)==0)&&(strncmp(m1mulm2isubm2m2ii23,"11",2)==0)){
    strcpy(m_sub23,"00000000000000000000000");
  }
  else{
    if((i_m1<i_m2)&&(strncmp(m1,m2,2)==0)&&(strncmp(m1mulm2isubm2m2ii23,"00",2)==0)){
      strcpy(m_sub23,"11111111111111111111111");
    }
    else{
      strcpy(m_sub23,m1mulm2isubm2m2ii23);
    }
  }
  if((e_sub[0]=='0')||(e_sub[1]=='1')){
    strcpy(m,"00000000000000000000000");
  }
  else{
    strcpy(m,m_sub23);
  }
  strcat(ans,s);
  strcat(ans,e);
  strcat(ans,m);
  strncpy(ovf,e_sub+1,1);
}

void fpu_fsqrt(char x1[33],char ans[33],char ovf[2]){
  char s1[2]={'\0'};
  char e1[9]={'\0'};
  char m1[24]={'\0'};
 
  strncpy(s1,x1,1);
  strncpy(e1,x1+1,8);
  strncpy(m1,x1+9,23);

  int i_e1=b_to_i(e1,0,7);
  //int i_m1=b_to_i(m1,0,22);

  char eabs[9]={'\0'};
  char ehalf[9]={'\0'};
  char e[9]={'\0'};

  char sim1[9]="01111111";
  int i_sim1=b_to_i(sim1,0,8);

  int i_eabs;
  if(e1[0]=='1'){
    i_eabs=i_e1-i_sim1;
  }
  else{
    i_eabs=i_sim1-i_e1;
  }
  i_to_b(eabs,i_eabs,8);
  ehalf[0]='0';
  strncat(ehalf,eabs+1,7);
  int i_e;
  int i_ehalf=b_to_i(ehalf,0,7);
  if(e1[0]=='1'){
    i_e=i_sim1+i_ehalf;
  }
  else{
    i_e=i_sim1-i_ehalf;
  }
  i_to_b(e,i_e,8);

  char xs23[24]={'\0'};
  char xsi23[24]={'\0'};
  char xsqrt23[24]={'\0'};
  char xs24[25]={'\0'};
  char xsi24[25]={'\0'};
  char x24[25]={'\0'};
  char xxsi24[25]={'\0'};
  char xsqrt25[26]={'\0'};
  char xxsi48[49]={'\0'};

  char n[11]={'\0'};
  n[0]=e1[7];
  strncat(n,m1,9);
  fsqrt_table(xs23,n);
  fsqrtinv_tabel(xsi23,n);

  xs24[0]='1';
  strcat(xs24,xs23);
  xsi24[0]='1';
  strcat(xsi24,xsi23);
  x24[0]='1';
  strcat(x24,m1);
  int i_xsi24=b_to_i(xsi24,0,23);
  int i_x24=b_to_i(x24,0,23);
  long i_xxsi48=((long) i_xsi24) * ((long) i_x24);
  i_to_b_long(xxsi48,i_xxsi48,48);

  if(xxsi48[0]=='1'){
    strncat(xxsi24,xxsi48,24);
  }
  else{
    strncat(xxsi24,xxsi48+1,24);
  }

  int i_xs24=b_to_i(xs24,0,23);
  int i_xxsi24=b_to_i(xxsi24,0,23);
  int i_xsqrt25;
  if((strncmp(x24+1,"11",2)==0)&&(strncmp(xxsi24+1,"00",2)==0)){
    i_xsqrt25=i_xs24+i_xxsi24*2;
  }
  else{
    i_xsqrt25=i_xs24+i_xxsi24;
  }
  i_to_b(xsqrt25,i_xsqrt25,25);

  if((strncmp(m1,"111111111111111111111",21)==0)&&(strncmp(xsqrt25+1,"00",1)==0)){
    strcat(xsqrt23,"11111111111111111111111");
  }
  else{
    strncat(xsqrt23,xsqrt25+1,23);
  }

  strcat(ans,s1);
  strcat(ans,e);
  strcat(ans,xsqrt23);
}
    
  
  

  

/*void init_label(label *label){
  for(int i=0;i<20;i++){
    (label->name)[i]='\0';
  }
  }*/

/*int search(label labellist[15],char *name){
  for(int i=0;i<15;i++){
    if(strcmp(labellist[i].name,name)==0){
      return labellist[i].addr;
    }
  }
  return 0;
  }*/



void clean(char buf[256]){
  memset(buf,'\0',256);
}

int p(int i,int j){
  int v = 1;
  for(int k = 0;k<j;k++){
    v *= i;
  }
  return v;
}

void read_i_j(CPU *cpu,int addr,char *code,int i,int j){
  strcpy(cpu->s,"");
  strcat(cpu->s,(cpu->memory)[addr]);
  strcat(cpu->s,(cpu->memory)[addr+1]);
  strcat(cpu->s,(cpu->memory)[addr+2]);
  strcat(cpu->s,(cpu->memory)[addr+3]);
  strncpy(code,(cpu->s)+i,j-i+1);
  code[j-i+1]='\0';

  strcpy(cpu->s,"");

}

int change_ibit(int i,char *code){
  int v = 0;
  for(int k = 0;k<i;k++){
    if(code[k] == '1'){
      v += p(2,(i - k -1));
    }
  }
  return v;
}

int change_ibit_f(int i,char *code){
  int v = 0;
  for(int k = 0;k<i;k++){
    if(k==0){
      if(code[k] == '1'){
        v -= p(2,(i-k-1));
      }
    }
    else{
      if(code[k] == '1'){
        v += p(2,(i-k-1));
      }
    }
  }
  return v;
}

void change_float_to_string2(char *s,float f){

  union IntAndFloat target;
  target.fval = f;

  for(int i=0;i<32;i++){
    if((target.ival&0x80000000)== 0x80000000){
      s[i]='1';
    }
    else{
      s[i]='0';
    }
    target.ival = target.ival << 1;
  }
}

void change_float_to_string(char *s,int v){

  float f = (float) v;
  union IntAndFloat target;
  target.fval = f;

  for(int i=0;i<32;i++){
    if((target.ival&0x80000000)== 0x80000000){
      s[i]='1';
    }
    else{
      s[i]='0';
    }
    target.ival = target.ival << 1;
  }
}

/*bit列をfloatに*/

float change_float(char *f){
  int m2=change_ibit(23,f+9);
  int e=change_ibit(8,f+1);
  float m = (float) m2;


  for(int i=0;i<23;i++){
    m/=2.0;
  }
  m+=1.0;
  if((m==0)&&(e==0)){
    return 0.0;
  }
  else if(e==0){
    for(int i=0;i<127;i++){
      m/=2.0;
    }
  }
  else{
    int e2 = e - 127;
    if(e2>=0){
      for(int i=0;i<e2;i++){
        m*=2.0;
      }
    }
    else{
      for(int i=0;i<(-1)*e2;i++){
        m/=2.0;
      }
    }
  }
  return m;
}

int change_float_int(char *f){
  int m=change_ibit(23,f+9);
  int e=change_ibit(8,f+1);
  int v=0;
  if((m==0)&&(e==0)){
    return 0;
  }
  else if(e==0){
    for(int i=0;i<127;i++){
      m=m/2;
    }
    return m;
  }
  else{
    int e2 = e-127;
    if(e2>=0){
      for(int i=0;i<e2;i++){
        if(f[9+i]=='1'){
          v+=pow2(2,e2-1-i);
        }
      }
    }
    v+=pow2(2,e2);
    if(f[0]=='0'){
      return v;
    }
    else{
      return -v;
    }
  }
}


void change_int(char *s,int len,int v){
  if(v > 0){
    for(int k=0;k<len;k++){
      int n = (v >> (len - k - 1)) - ((v >> (len - k)) << 1);
      if(n==1){
        s[k] = '1';
      }
      else{
        s[k] = '0';
      }
    }
  }
  else if(v < 0){
    for(int k=0;k<len;k++){
      int l = -v;
      int n = (l >> (len - k - 1)) - ((l >> (len - k)) << 1);
      if(n==1){
        s[k] = '0';
      }
      else{
        s[k] = '1';
      }
    }
    inc(s,len);
  }
  else{
    for(int k=0;k<len;k++){
      s[k] = '0';
    }
  }
}


void change_float_to_int_string(char *i,char *f){
  int fi = change_float_int(f);/*stringのfloatをintになおす*/
  change_int(i,32,fi);
}

void slw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);

  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  unsigned int s = change_ibit(R,(cpu->reg)[rs]);
  unsigned int b = change_ibit(R,(cpu->reg)[rb]);

  unsigned int ns = s << b;

  change_int((cpu->reg)[ra],32,ns);
  *a+=4;
}

void srw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);

  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  unsigned int s = change_ibit(R,(cpu->reg)[rs]);
  unsigned int b = change_ibit(R,(cpu->reg)[rb]);

  unsigned int ns = s >> b;

  change_int((cpu->reg)[ra],32,ns);
  *a+=4;
}

void print_reg(CPU *cpu){
  for(int i=0;i<32;i++){
    printf("reg %d value %d code %s\n",i,change_ibit_f(32,(cpu->reg)[i]),(cpu->reg)[i]);
  }
  for(int i=0;i<32;i++){
    printf("freg %d value整数表示 %d code %s\n",i,change_ibit_f(32,(cpu->freg)[i]),(cpu->freg)[i]);
  }
  for(int i=0;i<8;i++){
    printf("cr %d code %s\n",i,(cpu->cr)[i]);
  }
  printf("lr code %s\n",(cpu->lr));
}

void printreg(CPU *cpu){
  for(int i=0;i<8;i++){
    printf("reg%d %d     ",i,change_ibit_f(32,(cpu->reg)[i]));
  }
  printf("\n");
  for(int i=8;i<16;i++){
    printf("reg%d %d     ",i,change_ibit_f(32,(cpu->reg)[i]));
  }
  printf("\n");
  for(int i=16;i<24;i++){
    printf("reg%d %d     ",i,change_ibit_f(32,(cpu->reg)[i]));
  }
  printf("\n");
  for(int i=24;i<32;i++){
    printf("reg%d %d     ",i,change_ibit_f(32,(cpu->reg)[i]));
  }
  printf("\n");
  printf("lr %d          \n",change_ibit_f(32,(cpu->lr)));
  for(int i=0;i<8;i++){
    printf("cr%d %s      ",i,(cpu->cr)[i]);
  }
  printf("\n");
}

void rot_l(char ans[33],char so[33],int n){
  strcpy(ans,so);
  char tmp;
  for(int i=0;i<n;i++){
	  tmp=ans[0];
    for(int j=0;j<32;j++){
      if(j==31){
        ans[j]=tmp;
      }
      else{
        ans[j]=ans[j+1];
      }
    }
  }
}

void make_mask(char mask[33],int mb,int me){
  for(int i=0;i<32;i++){
    if((i>=mb)&&(i<=me)){
      mask[i]='1';
    }
    else{
      mask[i]='0';
    }
  }
}

void and(char ans[33],char s1[33],char s2[33]){
  for(int i=0;i<32;i++){
    if((s1[i]=='1')&&(s2[i]=='1')){
      ans[i]='1';
    }
    else{
      ans[i]='0';
    }
  }
}
      
  

void out(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int ra = change_ibit(5,code_6_10);

  int value = change_ibit_f(R,(cpu->reg)[ra]);
  printf("レジスタ%dをoutした %c\n",ra,value);
  *a+=4;
}

void cmpi(CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4]={'\0'};
  read_i_j(cpu,addr,code_6_8,6,8);
  char code_10[2]={'\0'};
  read_i_j(cpu,addr,code_10,10,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);

  int ra = change_ibit(5,code_11_15);/*符号を考えないで数値化*/
  int value = change_ibit_f(R,(cpu->reg)[ra]);/*符号も考える*/
  int sim = change_ibit_f(16,code_16_31);
  int bf = change_ibit(3,code_6_8);
  
  if (value < sim){
    strcpy((cpu->cr)[bf],"0001");
  }
  else if(value > sim){
    strcpy((cpu->cr)[bf],"0010");
  }
  else{
    strcpy((cpu->cr)[bf],"0100");
  }
  *a += 4;
  //printf("cmpi cr%d reg%d %dを実行\n",bf,ra,sim);
}

void fcmpu(CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4]={'\0'};
  read_i_j(cpu,addr,code_6_8,6,8);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int fra = change_ibit(5,code_11_15);
  int frb = change_ibit(5,code_11_15);
  float va = change_float((cpu->freg)[fra]);
  float vb = change_float((cpu->freg)[frb]);
  int bf = change_ibit(3,code_6_8);

  if(va < vb){
    strcpy((cpu->cr)[bf],"0001");
  }
  else if(va > vb){
    strcpy((cpu->cr)[bf],"0010");
  }
  else{
    strcpy((cpu->cr)[bf],"0100");
  }
  *a+=4;
}

void cmp(CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4]={'\0'};
  read_i_j(cpu,addr,code_6_8,6,8);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);

  int va = change_ibit_f(R,(cpu->reg)[ra]);
  int vb = change_ibit_f(R,(cpu->reg)[rb]);
  int bf = change_ibit(3,code_6_8);

  if(va < vb){
    strcpy((cpu->cr)[bf],"0001");
  }
  else if(va > vb){
    strcpy((cpu->cr)[bf],"0010");
  }
  else{
    strcpy((cpu->cr)[bf],"0100");
  }
  *a+=4;
  //printf("cmp reg%d reg%dを実行\n",ra,rb);
}
  

void bne(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15]={'\0'};
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  cr = (cr - 2)/4;
  if(strcmp((cpu->cr)[cr],"0100")==0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  //printf("bne cr%d を実行\n",cr);
}

void bgt(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15]={'\0'};
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  cr = cr/4;
  if(strcmp((cpu->cr)[cr],"0010")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  //printf("bgt cr%dを実行\n",cr);
}

void beq(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15]={'\0'};
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  cr = cr/4;
  if(strcmp((cpu->cr)[cr],"0100")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  //printf("beq cr%dを実行\n",cr);
}



void blt(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15]={'\0'};
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  
  cr = cr/4;
  if(strcmp((cpu->cr)[cr],"0001")!=0){
    
    *a+=4;
  }
  else{
    
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  //printf("blt cr%dを実行\n",cr);
}

/*1byteの読み込み*/
void in(CPU *cpu,int *a){
  int addr = *a;
  int x;
  printf("1byte読み込み: ");
  scanf("%d",&x);
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int ra = change_ibit(5,code_6_10);
  change_int((cpu->reg)[ra],8,x);
  *a+=4;
}

void read(CPU *cpu,int *a){
  int addr =*a;
  int x;
  printf("4byte読み込み: ");
  scanf("%d",&x);
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int ra = change_ibit(5,code_6_10);
  change_int((cpu->reg)[ra],32,x);
  *a+=4;
}

void addi(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);

  int rt = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int si = change_ibit_f(16,code_16_31);

  if(ra==0){
    change_int((cpu->reg)[rt],32,si);
  }
  else{
    int x = change_ibit_f(R,(cpu->reg)[ra]);
    int y = x + si;
    
    change_int((cpu->reg)[rt],32,y);
    
  }
  *a+=4;
  //printf("addiを実行 レジスタ%dにレジスタ%dと%dの和を代入\n",rt,ra,si);
}

void fabs2(CPU *cpu,int *a){
  int addr =*a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int fra = change_ibit(5,code_11_15);
  strcpy((cpu->reg)[frd],(cpu->reg)[fra]);
  if((cpu->reg)[frd][0]=='1'){
    (cpu->reg)[frd][0]='0';
  }
  *a+=4;
}

void neg(CPU *cpu,int *a){
  int addr =*a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int rd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  hanten((cpu->reg)[rd],(cpu->reg)[ra],32);
  inc((cpu->reg)[rd],32);
  *a+=4;
}

void fneg(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frd = change_ibit(5,code_6_10);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int fra = change_ibit(5,code_16_20);
  strcpy((cpu->reg)[frd],(cpu->reg)[fra]);
  if((cpu->reg)[frd][0]=='0'){
    (cpu->reg)[frd][0]='1';
  }
  else{
    (cpu->reg)[frd][0]='0';
  }
  *a+=4;
}

  

void lis(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);
  int rt = change_ibit(5,code_6_10);
  int si = change_ibit_f(16,code_16_31);

  int ns = si << 16;
  change_int((cpu->reg)[rt],32,ns);
  *a+=4;
  //printf("lisを実行 レジスタ%dに%dをシフトしたものを代入\n",rt,si);
}

void blr(CPU *cpu,int *addr){
  int x = change_ibit_f(R,(cpu->lr));
  if(x==1){
    *addr+=4;
	exit(0);
  }
  else{
    *addr = x;
  }
  //printf("blrを実行\n");
}

void stw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);

  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int b;
  if(ra==0){
    b=0;
  }
  else{
    b = change_ibit_f(R,(cpu->reg)[ra]);
  }
  int d = change_ibit_f(16,code_16_31);

  int addr2 = b+d;


  strncpy((cpu->memory)[addr2],(cpu->reg)[rs]/*+32*/,8);
  strncpy((cpu->memory)[addr2+1],(cpu->reg)[rs]/*+40*/+8,8);
  strncpy((cpu->memory)[addr2+2],(cpu->reg)[rs]/*+48*/+16,8);
  strncpy((cpu->memory)[addr2+3],(cpu->reg)[rs]/*+56*/+24,8);

  *a+=4;
  //printf("stw reg%d %d(reg%d)を実行\n",rs,d,ra);
}

void mflr(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);

  int rd = change_ibit(5,code_6_10);

  strcpy((cpu->reg)[rd],cpu->lr);

  *a+=4;
  //printf("mflr reg%dを実行\n",rd);
}

void mr(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  strcpy((cpu->reg)[ra],(cpu->reg)[rs]);
  *a+=4;
  //printf("mr reg%d reg%dを実行\n",rs,ra);
}

void add(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int rt = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(R,(cpu->reg)[ra]);
  int y = change_ibit_f(R,(cpu->reg)[rb]);
  int z = x + y;

  change_int((cpu->reg)[rt],32,z);
  *a+=4;
  //printf("add reg%d reg%d reg%dを実行\n",rt,ra,rb);
}

void subf(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  int rt = change_ibit(5,code_6_10);
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(R,(cpu->reg)[ra]);
  int y = change_ibit_f(R,(cpu->reg)[rb]);
  int z = y - x;

  change_int((cpu->reg)[rt],32,z);
  *a+=4;
  //printf("subf reg%d reg%d reg%dを実行\n",rt,ra,rb);
}

void b(CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25]={'\0'};
  read_i_j(cpu,addr,code_6_29,6,29);
  int target = change_ibit_f(24,code_6_29) * 4;
  *a=target+*a;
  //printf("bを実行\n");
}

void bl(CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25]={'\0'};
  read_i_j(cpu,addr,code_6_29,6,29);
  int target = change_ibit_f(24,code_6_29) * 4;
  change_int((cpu->lr),32,addr+4);
  *a=target+*a;
  //printf("blを実行\n");
}

void lfd(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);
  int frt = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int d = change_ibit_f(16,code_16_31);
  int b;
  if(ra==0){
    b=0;
  }
  else{
    b=change_ibit_f(R,(cpu->reg)[ra]);
  }

  int ea = b + d;
  char s[33]={'\0'};
  strcat(s,(cpu->memory)[ea]);
  strcat(s,(cpu->memory)[ea+1]);
  strcat(s,(cpu->memory)[ea+2]);
  strcat(s,(cpu->memory)[ea+3]);

  strcpy((cpu->freg)[frt],s);
  *a+=4;
}

void lwz(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);

  int rt = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int d = change_ibit_f(16,code_16_31);

  int b;
  if(ra==0){
    b = 0;
  }
  else{
    b = change_ibit_f(R,(cpu->reg)[ra]);
  }
  int ea = b + d;
  //char s[65]="00000000000000000000000000000000";
  char s[33]={'\0'};
  /*for(int i=0;i<4;i++){
    printf("%d %s\n",ea,(cpu->memory)[ea+i]);
    }*/
  strcat(s,(cpu->memory)[ea]);
  strcat(s,(cpu->memory)[ea+1]);
  strcat(s,(cpu->memory)[ea+2]);
  strcat(s,(cpu->memory)[ea+3]);

  strcpy((cpu->reg)[rt],s);
  /*printf("reg%d %s\n",rt,(cpu->reg)[rt]);*/
  *a+=4;
  //printf("lwz reg%d %d(reg%d)を実行\n",rt,d,ra);
}

void mtlr(CPU *cpu,int *addr){
  int a=*addr;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,a,code_6_10,6,10);

  int rs = change_ibit(5,code_6_10);
  strcpy((cpu->lr),(cpu->reg)[rs]);
  //printf("b\n");
  *addr+=4;
  //printf("mtlr reg%dを実行\n",rs);
}

void stmw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);
  int d = change_ibit_f(16,code_16_31);

  int b;
  if(ra==0){
    b=0;
  }
  else{
    b = change_ibit(R,(cpu->reg)[ra]);
  }
  int ea = b + d;
  int r = rs;
  while(r <= 31){
    strncpy((cpu->memory)[ea],(cpu->reg)[r]/*+32*/,8);
    strncpy((cpu->memory)[ea+1],(cpu->reg)[r]/*+40*/+8,8);
    strncpy((cpu->memory)[ea+2],(cpu->reg)[r]/*+48*/+16,8);
    strncpy((cpu->memory)[ea+3],(cpu->reg)[r]/*+56*/+24,8);

    r+=1;
    ea+=4;
  }
  *a+=4;
  //printf("stmw reg%d %d(reg%d)を実行\n",rs,d,ra);
}

void rlwinm(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int sh = change_ibit(5,code_16_20);

  char code_21_25[6]={'\0'};
  read_i_j(cpu,addr,code_21_25,21,25);
  int mb = change_ibit(5,code_21_25);

  char code_26_30[6]={'\0'};
  read_i_j(cpu,addr,code_26_30,26,30);
  int me = change_ibit(5,code_26_30);

  int n = sh;
  char rc[33]={'\0'};
  rot_l(rc,(cpu->reg)[rs],n);/*左にnだけ回転*/
  char mask[33]={'\0'};
  make_mask(mask,mb,me);
  char ra_c[33]={'\0'};
  and(ra_c,rc,mask);
  //printf("mask = %s\n", mask);
  strcpy((cpu->reg)[ra],ra_c);
  *a+=4;
  //printf("rlwinm r%d r%d %d %d %dを実行\n",ra,rs,sh,mb,me);
}
  

void stwu(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);
  int d = change_ibit_f(16,code_16_31);

  int ea = change_ibit_f(R,(cpu->reg)[ra]) + d;
  strncpy((cpu->memory)[ea],(cpu->reg)[rs]/*+32*/,8);
  strncpy((cpu->memory)[ea+1],(cpu->reg)[rs]/*+40*/+8,8);
  strncpy((cpu->memory)[ea+2],(cpu->reg)[rs]/*+48*/+16,8);
  strncpy((cpu->memory)[ea+3],(cpu->reg)[rs]/*+56*/+24,8);

  change_int((cpu->reg)[ra],32,ea);
  *a+=4;
  //printf("stwu reg%d %d(reg%d)を実行\n",rs,d,ra);
}

void lmw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int rt = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17]={'\0'};
  read_i_j(cpu,addr,code_16_31,16,31);
  int d = change_ibit_f(16,code_16_31);

  int b;
  if(ra==0){
    b=0;
  }
  else{
    b=change_ibit_f(R,(cpu->reg)[ra]);
  }
  int ea = b + d;
  int r = rt;
  while(r <= 31){
    //char s[65] = "00000000000000000000000000000000";
    char s[33]={'\0'};
    strcat(s,(cpu->memory)[ea]);
    strcat(s,(cpu->memory)[ea+1]);
    strcat(s,(cpu->memory)[ea+2]);
    strcat(s,(cpu->memory)[ea+3]);
    ea += 4;
    strcpy((cpu->reg)[r],s);
    r+=1;
  }
  *a+=4;
  //printf("lmw reg%d %d(reg%d)を実行\n",rt,d,ra);
}
/*itof rft ra*/
void itof(CPU *cpu,int *a){
  int addr=*a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frt=change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);
  int v = b_to_i((cpu->reg)[ra],0,31);
  //printf("これだ%d\n",v);
  change_float_to_string((cpu->freg)[frt],v);
  *a+=4;
}

/*ftoi rft ra*/
void ftoi(CPU *cpu,int *a){
  int addr=*a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int ra=change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int frt = change_ibit(5,code_11_15);
  change_float_to_int_string((cpu->reg)[ra],(cpu->freg)[frt]);
  *a+=4;
}

/*floor fa fd*/
void floor2(CPU *cpu,int *a){
  int addr =*a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int fa = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int fd = change_ibit(5,code_11_15);
  float v = change_float((cpu->freg)[fd]);
  v = floorf(v);
  change_float_to_string((cpu->freg)[fa],v);
  *a+=4;
}


  
  

void fadd(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frt = change_ibit(5,code_6_10);

  char code_11_15[6] = {'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int fra = change_ibit(5,code_11_15);

  char code_16_20[6] = {'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int frb = change_ibit(5,code_16_20);

  char ovf[2]={'\0'};

  fpu_fadd((cpu->freg)[frt],(cpu->freg)[fra],(cpu->freg)[frb],ovf);
  *a+=4;
}

void fsub(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6] = {'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frt = change_ibit(5,code_6_10);

  char code_11_15[6] = {'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int fra = change_ibit(5,code_11_15);

  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int frb = change_ibit(5,code_16_20);

  char ovf[2] = {'\0'};

  fpu_fsub((cpu->freg)[frt],(cpu->freg)[fra],(cpu->freg)[frb],ovf);
  *a+=4;
}

void fmul(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6] = {'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frt = change_ibit(5,code_6_10);

  char code_11_15[6] = {'\0'};
  read_i_j(cpu,addr,code_11_15,11,15);
  int fra = change_ibit(5,code_11_15);

  char code_16_20[6] = {'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int frb = change_ibit(5,code_16_20);

  char ovf[2] = {'\0'};

  fpu_fmul((cpu->freg)[frt],(cpu->freg)[fra],(cpu->freg)[frb],ovf);
  *a += 4;
}

void fdiv(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int fra=change_ibit(5,code_11_15);
  char code_16_20[6]={'\0'};
  read_i_j(cpu,addr,code_16_20,16,20);
  int frb=change_ibit(5,code_16_20);
  char ovf[2]={'\0'};
  fpu_fdiv((cpu->freg)[fra],(cpu->freg)[frb],(cpu->freg)[frd],ovf);
  *a+=4;
}

void fsqrt(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int frd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  read_i_j(cpu,addr,code_6_10,6,10);
  int fra=change_ibit(5,code_11_15);
  char ovf[2]={'\0'};
  fpu_fsqrt((cpu->freg)[fra],(cpu->freg)[frd],ovf);
  *a+=4;
}

/*sは8bitの16進数である。iメモリのアドレスをさす*/
void r(unsigned char s,char memory[M][9],int i){
  for(int k=0;k<8;k++){
    unsigned char m = (s >> (7-k)) - ((s >> (8-k)) <<1);
    if(m==1){
      memory[i][k]='1';
    }
    else{
      memory[i][k]='0';
    }
  }
}


  


void zero_cpu(CPU *cpu){
  for(int i=0;i<R;i++){
    for(int k=0;k<32;k++){
      (cpu->reg)[k][i]='0';
    }
  }
  for(int i=0;i<R;i++){
    for(int k=0;k<32;k++){
      (cpu->freg)[k][i]='0';
    }
  }
  for(int i=0;i<R;i++){
    (cpu->lr)[i]='0';
  }
  for(int i=0;i<8;i++){
    for(int k=0;k<4;k++){
      (cpu->cr)[i][k]='0';
    }
  }
  change_int((cpu->reg)[1],R,2000);
  change_int((cpu->reg)[3],R,5000);
}

void print_cpu(CPU *cpu){
  for(int i=0;i<M;i++){
    if(i%4==3){
      printf("%s\n",(cpu->memory)[i]);
    }
    else if(i%4==0){
      printf("アドレス %d コード %s ",i,(cpu->memory)[i]);
    }
    else{
      printf("%s ",(cpu->memory)[i]);
    }
  }
}

void exec(CPU *cpu,label *labellist,code *codelist){
  int iaddr = (labellist[0]).addr;
  int addr=0;
  printf("ブレークポイントを入れますか? y or n\n");
  char r[2]={'\0'};
  char q[2]={'\0'};
  int addrx=-1;
  char name[20]={'\0'};
  scanf("%s",r);
  int check=0;
  if(r[0]=='y'){
    printf("ラベル名を入力してください\n");
    scanf("%s",name);
  }
  for(int i=0;i<30;i++){
    if(strcmp(name,(labellist[i]).name)==0){
      addrx=(labellist[i]).addr;
    }
  }
    
  while(1){
    //printf("addr %d addrx %d\n",addr,addrx);
    if(r[0]=='y'){
      if(addr==addrx){
        check=1;
      }
    }
    if(check==1){
      printf("aで実行した命令を表示\n");
      scanf("%s",q);
      //printf("%d %s\n",addr,q);
      if(q[0]=='a'){
        printf("%s\n",(codelist[(addr-iaddr)/4]).name);
        //print_reg(cpu);
      }
    }
    char code_0_5[7]={'\0'};
    char code_22_30[10]={'\0'};
    char code_21_30[11]={'\0'};
    char code_6_10[6]={'\0'};
    char code_30[2]={'\0'};
    char code_31[2]={'\0'};
    char code_26_30[6]={'\0'};
    read_i_j(cpu,addr,code_0_5,0,5);
    read_i_j(cpu,addr,code_22_30,22,30);
    read_i_j(cpu,addr,code_21_30,21,30);
    read_i_j(cpu,addr,code_6_10,6,10);
    read_i_j(cpu,addr,code_30,30,30);
    read_i_j(cpu,addr,code_31,31,31);
    read_i_j(cpu,addr,code_26_30,26,30);
    //printf("%s\n",code_0_5);
    if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_22_30,"100001010")==0){
        add(cpu,&addr);
      }
      else if(strcmp(code_22_30,"111111111")==0){
        //printf("aaaaaaaaaaaaa\n");
        itof(cpu,&addr);/*cの組み込みで代用*/
      }
      else if(strcmp(code_22_30,"000101000")==0){
        subf(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0110111100")==0){
        mr(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0101010011")==0){
        mflr(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0111010011")==0){
        mtlr(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0000000000")==0){
        cmp(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0000011000")==0){
        slw(cpu,&addr);
      }
      else if(strcmp(code_21_30,"1000011000")==0){
        srw(cpu,&addr);
      }
      else if(strcmp(code_22_30,"001101000")==0){
        neg(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"001111")==0){
      lis(cpu,&addr);
    }
    else if(strcmp(code_0_5,"001011")==0){
      cmpi(cpu,&addr);
    }
    else if(strcmp(code_0_5,"010000")==0){
      if(code_30[0]=='0'){
        if(strcmp(code_6_10,"00100")==0){
          bne(cpu,&addr);
        }
        else if(strcmp(code_6_10,"00010")==0){
          bgt(cpu,&addr);
        }
        else if(strcmp(code_6_10,"00001")==0){
          blt(cpu,&addr);
        }
        else if(strcmp(code_6_10,"01000")==0){
          beq(cpu,&addr);
        }
      }
    }
    else if(strcmp(code_0_5,"000010")==0){
      in(cpu,&addr);
    }
    else if(strcmp(code_0_5,"000011")==0){
      read(cpu,&addr);
    }
    else if(strcmp(code_0_5,"001110")==0){
      addi(cpu,&addr);
    }
    else if(strcmp(code_0_5,"000001")==0){
      out(cpu,&addr);
    }
    else if(strcmp(code_0_5,"010011")==0){
      if(strcmp(code_21_30,"0000010000")==0){
        blr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"100100")==0){
      stw(cpu,&addr);
    }
    else if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_21_30,"0101010011")==0){
        mflr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_21_30,"0110111100")==0){
        mr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"010010")==0){
      if(code_31[0] == '1'){
        bl(cpu,&addr);
      }
      else{
        b(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_21_30,"0111010011")==0){
        mtlr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"100101")==0){
      stwu(cpu,&addr);
    }
    else if(strcmp(code_0_5,"101110")==0){
      lmw(cpu,&addr);
    }
    else if(strcmp(code_0_5,"101111")==0){
      stmw(cpu,&addr);
    }
    else if(strcmp(code_0_5,"100000")==0){
      lwz(cpu,&addr);
    }
    else if(strcmp(code_0_5,"010101")==0){
      rlwinm(cpu,&addr);
    }
    else if(strcmp(code_0_5,"111111")==0){
      if(strcmp(code_26_30,"010101")==0){
        fadd(cpu,&addr);
      }
      else if(strcmp(code_26_30,"010100")==0){
        fsub(cpu,&addr);
      }
      else if(strcmp(code_26_30,"011001")==0){
        fmul(cpu,&addr);
      }
      else if(strcmp(code_26_30,"010010")==0){
        fdiv(cpu,&addr);
      }
      else if(strcmp(code_26_30,"111110")==0){
        fabs2(cpu,&addr);
      }
      else if(strcmp(code_26_30,"010110")==0){
        fsqrt(cpu,&addr);
      }
      else if(strcmp(code_26_30,"000000")==0){
        fneg(cpu,&addr);
      }
      else if(strcmp(code_22_30,"111111110")==0){
        ftoi(cpu,&addr);
      }
      else if(strcmp(code_22_30,"111111111")==0){
        floor2(cpu,&addr);
      }
    }
    else{
      break;
    }
    if(check==1){
      if(q[0]=='a'){
        print_reg(cpu);
      }
    }
  }
}


int main(int argc,char **argv){
  char u[33]="11000001000000000000000000000001";
  float u2=change_float(u);
  printf("aaaaa%f\n",u2);
  
  char ans[33]={'\0'};
  char x1[33]="00111111100110101110000101000111";
  char ovf[2]={'\0'};
  fpu_fsqrt(x1,ans,ovf);
  printf("%s\n",ans);
  //printf("%d -> %d\n",b_to_i(x1,0,31),b_to_i(ans,0,31));
  FILE *file2;
  file2=fopen(argv[2],"r");
  int addr = 4;
  int state=0;/*命令にたどり着いていない状態*/
  int lnum=0;
  int cnum=0;
  label labellist[30];
  code codelist[1000];
  char ch;
  int z=0;/*bufの位置*/
  char buf[256];
  for(int y=0;y<30;y++){
    init_label(&(labellist[y]));
  }
  for(int y=0;y<1000;y++){
    init_code(&(codelist[y]));
  }
  while((ch=fgetc(file2))!=EOF){
    if((state==0)&&(ch=='.')){
      state=1;
    }
    else if((state==0)&&(ch==':')){
      addr+=4;
    }
    else if((state==1)&&(ch=='g')){
      state=2;/*.globlにたどり着いた*/
    }
    else if(state==1){
      state=0;
    }
    else if((state==2)&&(ch=='\n')){
      state=3;/*.globl終了*/
    }
    else if((state==3)&&(ch=='\n')){
      clean(buf);
    }
    else if((state==3)&&(ch==':')){
      state=4;
    }
    else if((state==3)&&((ch==' ')||(ch=='\t'))){
    }
    else if(state==3){
      buf[z]=ch;
      z+=1;
    }
    else if((state==4)&&(ch=='\n')){
      strcpy(labellist[lnum].name,buf);
      labellist[lnum].addr=addr;
      clean(buf);
      z=0;
      lnum+=1;
      state=5;/*codeを読む*/
    }
    else if((state==5)&&(ch=='\n')){
      strcpy(codelist[cnum].name,buf);
      codelist[cnum].addr=addr;
      clean(buf);
      z=0;
      cnum+=1;
      addr+=4;
    }
    else if((state==5)&&(ch==':')){
      state=4;
    }
    else if(state==5){
      buf[z]=ch;
      z+=1;
    }
  }
  fclose(file2);
    

  /*int u=0;
  int t=1;
  printf("アドレス %d code %s\n",codelist[u].addr,codelist[u].name);
  printf("アドレス %d ラベル %s\n",labellist[t].addr,labellist[t].name);*/


  
  CPU cpu;
  init_cpu(&cpu);/*cpuの初期化*/

  FILE *file;
  file=fopen(argv[1],"rb");
  fseek(file,0,SEEK_END);
  const int size = ftell(file);
  rewind(file);
  unsigned char *memory = malloc(size*sizeof(unsigned char));
  fread(memory,sizeof(unsigned char),size,file);
  int x=0;
  int y=0;
  for(int m=0;m<size;m++){
    r(memory[x],cpu.memory,y);
    x+=1;
    y+=1;
  }
  fclose(file);

  zero_cpu(&cpu);
  //print_cpu(&cpu);
  //print_reg(&cpu);
  exec(&cpu,labellist,codelist);
  //print_reg(&cpu);
  
  return 0;
}

void finv2(char y[24],char x[13]){
if(strcmp(x,"000000000000")==0){
strcpy(y,"00000000000000000000000");
}
else if(strcmp(x,"000000000001")==0){
strcpy(y,"11111111110000000000011");
}
else if(strcmp(x,"000000000010")==0){
strcpy(y,"11111111100000000001100");
}
else if(strcmp(x,"000000000011")==0){
strcpy(y,"11111111010000000011011");
}
else if(strcmp(x,"000000000100")==0){
strcpy(y,"11111111000000000110000");
}
else if(strcmp(x,"000000000101")==0){
strcpy(y,"11111110110000001001011");
}
else if(strcmp(x,"000000000110")==0){
strcpy(y,"11111110100000001101100");
}
else if(strcmp(x,"000000000111")==0){
strcpy(y,"11111110010000010010011");
}
else if(strcmp(x,"000000001000")==0){
strcpy(y,"11111110000000011000000");
}
else if(strcmp(x,"000000001001")==0){
strcpy(y,"11111101110000011110010");
}
else if(strcmp(x,"000000001010")==0){
strcpy(y,"11111101100000100101011");
}
else if(strcmp(x,"000000001011")==0){
strcpy(y,"11111101010000101101010");
}
else if(strcmp(x,"000000001100")==0){
strcpy(y,"11111101000000110101110");
}
else if(strcmp(x,"000000001101")==0){
strcpy(y,"11111100110000111111001");
}
else if(strcmp(x,"000000001110")==0){
strcpy(y,"11111100100001001001001");
}
else if(strcmp(x,"000000001111")==0){
strcpy(y,"11111100010001010100000");
}
else if(strcmp(x,"000000010000")==0){
strcpy(y,"11111100000001011111100");
}
else if(strcmp(x,"000000010001")==0){
strcpy(y,"11111011110001101011110");
}
else if(strcmp(x,"000000010010")==0){
strcpy(y,"11111011100001111000110");
}
else if(strcmp(x,"000000010011")==0){
strcpy(y,"11111011010010000110100");
}
else if(strcmp(x,"000000010100")==0){
strcpy(y,"11111011000010010101000");
}
else if(strcmp(x,"000000010101")==0){
strcpy(y,"11111010110010100100010");
}
else if(strcmp(x,"000000010110")==0){
strcpy(y,"11111010100010110100010");
}
else if(strcmp(x,"000000010111")==0){
strcpy(y,"11111010010011000100111");
}
else if(strcmp(x,"000000011000")==0){
strcpy(y,"11111010000011010110011");
}
else if(strcmp(x,"000000011001")==0){
strcpy(y,"11111001110011101000100");
}
else if(strcmp(x,"000000011010")==0){
strcpy(y,"11111001100011111011011");
}
else if(strcmp(x,"000000011011")==0){
strcpy(y,"11111001010100001111000");
}
else if(strcmp(x,"000000011100")==0){
strcpy(y,"11111001000100100011011");
}
else if(strcmp(x,"000000011101")==0){
strcpy(y,"11111000110100111000011");
}
else if(strcmp(x,"000000011110")==0){
strcpy(y,"11111000100101001110010");
}
else if(strcmp(x,"000000011111")==0){
strcpy(y,"11111000010101100100110");
}
else if(strcmp(x,"000000100000")==0){
strcpy(y,"11111000000101111100000");
}
else if(strcmp(x,"000000100001")==0){
strcpy(y,"11110111110110010100000");
}
else if(strcmp(x,"000000100010")==0){
strcpy(y,"11110111100110101100110");
}
else if(strcmp(x,"000000100011")==0){
strcpy(y,"11110111010111000110010");
}
else if(strcmp(x,"000000100100")==0){
strcpy(y,"11110111000111100000011");
}
else if(strcmp(x,"000000100101")==0){
strcpy(y,"11110110110111111011010");
}
else if(strcmp(x,"000000100110")==0){
strcpy(y,"11110110101000010110111");
}
else if(strcmp(x,"000000100111")==0){
strcpy(y,"11110110011000110011010");
}
else if(strcmp(x,"000000101000")==0){
strcpy(y,"11110110001001010000010");
}
else if(strcmp(x,"000000101001")==0){
strcpy(y,"11110101111001101110001");
}
else if(strcmp(x,"000000101010")==0){
strcpy(y,"11110101101010001100101");
}
else if(strcmp(x,"000000101011")==0){
strcpy(y,"11110101011010101011110");
}
else if(strcmp(x,"000000101100")==0){
strcpy(y,"11110101001011001011110");
}
else if(strcmp(x,"000000101101")==0){
strcpy(y,"11110100111011101100011");
}
else if(strcmp(x,"000000101110")==0){
strcpy(y,"11110100101100001101110");
}
else if(strcmp(x,"000000101111")==0){
strcpy(y,"11110100011100101111111");
}
else if(strcmp(x,"000000110000")==0){
strcpy(y,"11110100001101010010110");
}
else if(strcmp(x,"000000110001")==0){
strcpy(y,"11110011111101110110010");
}
else if(strcmp(x,"000000110010")==0){
strcpy(y,"11110011101110011010100");
}
else if(strcmp(x,"000000110011")==0){
strcpy(y,"11110011011110111111011");
}
else if(strcmp(x,"000000110100")==0){
strcpy(y,"11110011001111100101001");
}
else if(strcmp(x,"000000110101")==0){
strcpy(y,"11110011000000001011100");
}
else if(strcmp(x,"000000110110")==0){
strcpy(y,"11110010110000110010101");
}
else if(strcmp(x,"000000110111")==0){
strcpy(y,"11110010100001011010011");
}
else if(strcmp(x,"000000111000")==0){
strcpy(y,"11110010010010000010111");
}
else if(strcmp(x,"000000111001")==0){
strcpy(y,"11110010000010101100001");
}
else if(strcmp(x,"000000111010")==0){
strcpy(y,"11110001110011010110001");
}
else if(strcmp(x,"000000111011")==0){
strcpy(y,"11110001100100000000110");
}
else if(strcmp(x,"000000111100")==0){
strcpy(y,"11110001010100101100001");
}
else if(strcmp(x,"000000111101")==0){
strcpy(y,"11110001000101011000001");
}
else if(strcmp(x,"000000111110")==0){
strcpy(y,"11110000110110000101000");
}
else if(strcmp(x,"000000111111")==0){
strcpy(y,"11110000100110110010011");
}
else if(strcmp(x,"000001000000")==0){
strcpy(y,"11110000010111100000101");
}
else if(strcmp(x,"000001000001")==0){
strcpy(y,"11110000001000001111100");
}
else if(strcmp(x,"000001000010")==0){
strcpy(y,"11101111111000111111001");
}
else if(strcmp(x,"000001000011")==0){
strcpy(y,"11101111101001101111011");
}
else if(strcmp(x,"000001000100")==0){
strcpy(y,"11101111011010100000011");
}
else if(strcmp(x,"000001000101")==0){
strcpy(y,"11101111001011010010001");
}
else if(strcmp(x,"000001000110")==0){
strcpy(y,"11101110111100000100100");
}
else if(strcmp(x,"000001000111")==0){
strcpy(y,"11101110101100110111101");
}
else if(strcmp(x,"000001001000")==0){
strcpy(y,"11101110011101101011011");
}
else if(strcmp(x,"000001001001")==0){
strcpy(y,"11101110001110011111111");
}
else if(strcmp(x,"000001001010")==0){
strcpy(y,"11101101111111010101001");
}
else if(strcmp(x,"000001001011")==0){
strcpy(y,"11101101110000001011000");
}
else if(strcmp(x,"000001001100")==0){
strcpy(y,"11101101100001000001101");
}
else if(strcmp(x,"000001001101")==0){
strcpy(y,"11101101010001111000111");
}
else if(strcmp(x,"000001001110")==0){
strcpy(y,"11101101000010110000111");
}
else if(strcmp(x,"000001001111")==0){
strcpy(y,"11101100110011101001101");
}
else if(strcmp(x,"000001010000")==0){
strcpy(y,"11101100100100100011000");
}
else if(strcmp(x,"000001010001")==0){
strcpy(y,"11101100010101011101001");
}
else if(strcmp(x,"000001010010")==0){
strcpy(y,"11101100000110010111111");
}
else if(strcmp(x,"000001010011")==0){
strcpy(y,"11101011110111010011010");
}
else if(strcmp(x,"000001010100")==0){
strcpy(y,"11101011101000001111100");
}
else if(strcmp(x,"000001010101")==0){
strcpy(y,"11101011011001001100010");
}
else if(strcmp(x,"000001010110")==0){
strcpy(y,"11101011001010001001111");
}
else if(strcmp(x,"000001010111")==0){
strcpy(y,"11101010111011001000001");
}
else if(strcmp(x,"000001011000")==0){
strcpy(y,"11101010101100000111000");
}
else if(strcmp(x,"000001011001")==0){
strcpy(y,"11101010011101000110101");
}
else if(strcmp(x,"000001011010")==0){
strcpy(y,"11101010001110000110111");
}
else if(strcmp(x,"000001011011")==0){
strcpy(y,"11101001111111000111111");
}
else if(strcmp(x,"000001011100")==0){
strcpy(y,"11101001110000001001100");
}
else if(strcmp(x,"000001011101")==0){
strcpy(y,"11101001100001001011111");
}
else if(strcmp(x,"000001011110")==0){
strcpy(y,"11101001010010001111000");
}
else if(strcmp(x,"000001011111")==0){
strcpy(y,"11101001000011010010101");
}
else if(strcmp(x,"000001100000")==0){
strcpy(y,"11101000110100010111001");
}
else if(strcmp(x,"000001100001")==0){
strcpy(y,"11101000100101011100001");
}
else if(strcmp(x,"000001100010")==0){
strcpy(y,"11101000010110100010000");
}
else if(strcmp(x,"000001100011")==0){
strcpy(y,"11101000000111101000011");
}
else if(strcmp(x,"000001100100")==0){
strcpy(y,"11100111111000101111100");
}
else if(strcmp(x,"000001100101")==0){
strcpy(y,"11100111101001110111011");
}
else if(strcmp(x,"000001100110")==0){
strcpy(y,"11100111011010111111111");
}
else if(strcmp(x,"000001100111")==0){
strcpy(y,"11100111001100001001000");
}
else if(strcmp(x,"000001101000")==0){
strcpy(y,"11100110111101010010111");
}
else if(strcmp(x,"000001101001")==0){
strcpy(y,"11100110101110011101100");
}
else if(strcmp(x,"000001101010")==0){
strcpy(y,"11100110011111101000101");
}
else if(strcmp(x,"000001101011")==0){
strcpy(y,"11100110010000110100101");
}
else if(strcmp(x,"000001101100")==0){
strcpy(y,"11100110000010000001001");
}
else if(strcmp(x,"000001101101")==0){
strcpy(y,"11100101110011001110011");
}
else if(strcmp(x,"000001101110")==0){
strcpy(y,"11100101100100011100010");
}
else if(strcmp(x,"000001101111")==0){
strcpy(y,"11100101010101101010111");
}
else if(strcmp(x,"000001110000")==0){
strcpy(y,"11100101000110111010001");
}
else if(strcmp(x,"000001110001")==0){
strcpy(y,"11100100111000001010001");
}
else if(strcmp(x,"000001110010")==0){
strcpy(y,"11100100101001011010110");
}
else if(strcmp(x,"000001110011")==0){
strcpy(y,"11100100011010101100000");
}
else if(strcmp(x,"000001110100")==0){
strcpy(y,"11100100001011111110000");
}
else if(strcmp(x,"000001110101")==0){
strcpy(y,"11100011111101010000101");
}
else if(strcmp(x,"000001110110")==0){
strcpy(y,"11100011101110100011111");
}
else if(strcmp(x,"000001110111")==0){
strcpy(y,"11100011011111110111111");
}
else if(strcmp(x,"000001111000")==0){
strcpy(y,"11100011010001001100100");
}
else if(strcmp(x,"000001111001")==0){
strcpy(y,"11100011000010100001111");
}
else if(strcmp(x,"000001111010")==0){
strcpy(y,"11100010110011110111110");
}
else if(strcmp(x,"000001111011")==0){
strcpy(y,"11100010100101001110100");
}
else if(strcmp(x,"000001111100")==0){
strcpy(y,"11100010010110100101110");
}
else if(strcmp(x,"000001111101")==0){
strcpy(y,"11100010000111111101110");
}
else if(strcmp(x,"000001111110")==0){
strcpy(y,"11100001111001010110011");
}
else if(strcmp(x,"000001111111")==0){
strcpy(y,"11100001101010101111101");
}
else if(strcmp(x,"000010000000")==0){
strcpy(y,"11100001011100001001101");
}
else if(strcmp(x,"000010000001")==0){
strcpy(y,"11100001001101100100010");
}
else if(strcmp(x,"000010000010")==0){
strcpy(y,"11100000111110111111100");
}
else if(strcmp(x,"000010000011")==0){
strcpy(y,"11100000110000011011100");
}
else if(strcmp(x,"000010000100")==0){
strcpy(y,"11100000100001111000001");
}
else if(strcmp(x,"000010000101")==0){
strcpy(y,"11100000010011010101011");
}
else if(strcmp(x,"000010000110")==0){
strcpy(y,"11100000000100110011011");
}
else if(strcmp(x,"000010000111")==0){
strcpy(y,"11011111110110010010000");
}
else if(strcmp(x,"000010001000")==0){
strcpy(y,"11011111100111110001010");
}
else if(strcmp(x,"000010001001")==0){
strcpy(y,"11011111011001010001001");
}
else if(strcmp(x,"000010001010")==0){
strcpy(y,"11011111001010110001101");
}
else if(strcmp(x,"000010001011")==0){
strcpy(y,"11011110111100010010111");
}
else if(strcmp(x,"000010001100")==0){
strcpy(y,"11011110101101110100110");
}
else if(strcmp(x,"000010001101")==0){
strcpy(y,"11011110011111010111011");
}
else if(strcmp(x,"000010001110")==0){
strcpy(y,"11011110010000111010100");
}
else if(strcmp(x,"000010001111")==0){
strcpy(y,"11011110000010011110011");
}
else if(strcmp(x,"000010010000")==0){
strcpy(y,"11011101110100000010111");
}
else if(strcmp(x,"000010010001")==0){
strcpy(y,"11011101100101101000000");
}
else if(strcmp(x,"000010010010")==0){
strcpy(y,"11011101010111001101111");
}
else if(strcmp(x,"000010010011")==0){
strcpy(y,"11011101001000110100010");
}
else if(strcmp(x,"000010010100")==0){
strcpy(y,"11011100111010011011011");
}
else if(strcmp(x,"000010010101")==0){
strcpy(y,"11011100101100000011001");
}
else if(strcmp(x,"000010010110")==0){
strcpy(y,"11011100011101101011101");
}
else if(strcmp(x,"000010010111")==0){
strcpy(y,"11011100001111010100101");
}
else if(strcmp(x,"000010011000")==0){
strcpy(y,"11011100000000111110011");
}
else if(strcmp(x,"000010011001")==0){
strcpy(y,"11011011110010101000110");
}
else if(strcmp(x,"000010011010")==0){
strcpy(y,"11011011100100010011110");
}
else if(strcmp(x,"000010011011")==0){
strcpy(y,"11011011010101111111011");
}
else if(strcmp(x,"000010011100")==0){
strcpy(y,"11011011000111101011101");
}
else if(strcmp(x,"000010011101")==0){
strcpy(y,"11011010111001011000101");
}
else if(strcmp(x,"000010011110")==0){
strcpy(y,"11011010101011000110010");
}
else if(strcmp(x,"000010011111")==0){
strcpy(y,"11011010011100110100100");
}
else if(strcmp(x,"000010100000")==0){
strcpy(y,"11011010001110100011011");
}
else if(strcmp(x,"000010100001")==0){
strcpy(y,"11011010000000010010111");
}
else if(strcmp(x,"000010100010")==0){
strcpy(y,"11011001110010000011000");
}
else if(strcmp(x,"000010100011")==0){
strcpy(y,"11011001100011110011111");
}
else if(strcmp(x,"000010100100")==0){
strcpy(y,"11011001010101100101010");
}
else if(strcmp(x,"000010100101")==0){
strcpy(y,"11011001000111010111011");
}
else if(strcmp(x,"000010100110")==0){
strcpy(y,"11011000111001001010001");
}
else if(strcmp(x,"000010100111")==0){
strcpy(y,"11011000101010111101100");
}
else if(strcmp(x,"000010101000")==0){
strcpy(y,"11011000011100110001100");
}
else if(strcmp(x,"000010101001")==0){
strcpy(y,"11011000001110100110001");
}
else if(strcmp(x,"000010101010")==0){
strcpy(y,"11011000000000011011011");
}
else if(strcmp(x,"000010101011")==0){
strcpy(y,"11010111110010010001011");
}
else if(strcmp(x,"000010101100")==0){
strcpy(y,"11010111100100000111111");
}
else if(strcmp(x,"000010101101")==0){
strcpy(y,"11010111010101111111001");
}
else if(strcmp(x,"000010101110")==0){
strcpy(y,"11010111000111110110111");
}
else if(strcmp(x,"000010101111")==0){
strcpy(y,"11010110111001101111011");
}
else if(strcmp(x,"000010110000")==0){
strcpy(y,"11010110101011101000100");
}
else if(strcmp(x,"000010110001")==0){
strcpy(y,"11010110011101100010010");
}
else if(strcmp(x,"000010110010")==0){
strcpy(y,"11010110001111011100101");
}
else if(strcmp(x,"000010110011")==0){
strcpy(y,"11010110000001010111101");
}
else if(strcmp(x,"000010110100")==0){
strcpy(y,"11010101110011010011010");
}
else if(strcmp(x,"000010110101")==0){
strcpy(y,"11010101100101001111100");
}
else if(strcmp(x,"000010110110")==0){
strcpy(y,"11010101010111001100011");
}
else if(strcmp(x,"000010110111")==0){
strcpy(y,"11010101001001001001111");
}
else if(strcmp(x,"000010111000")==0){
strcpy(y,"11010100111011001000001");
}
else if(strcmp(x,"000010111001")==0){
strcpy(y,"11010100101101000110111");
}
else if(strcmp(x,"000010111010")==0){
strcpy(y,"11010100011111000110010");
}
else if(strcmp(x,"000010111011")==0){
strcpy(y,"11010100010001000110011");
}
else if(strcmp(x,"000010111100")==0){
strcpy(y,"11010100000011000111000");
}
else if(strcmp(x,"000010111101")==0){
strcpy(y,"11010011110101001000010");
}
else if(strcmp(x,"000010111110")==0){
strcpy(y,"11010011100111001010010");
}
else if(strcmp(x,"000010111111")==0){
strcpy(y,"11010011011001001100110");
}
else if(strcmp(x,"000011000000")==0){
strcpy(y,"11010011001011001111111");
}
else if(strcmp(x,"000011000001")==0){
strcpy(y,"11010010111101010011110");
}
else if(strcmp(x,"000011000010")==0){
strcpy(y,"11010010101111011000001");
}
else if(strcmp(x,"000011000011")==0){
strcpy(y,"11010010100001011101010");
}
else if(strcmp(x,"000011000100")==0){
strcpy(y,"11010010010011100010111");
}
else if(strcmp(x,"000011000101")==0){
strcpy(y,"11010010000101101001001");
}
else if(strcmp(x,"000011000110")==0){
strcpy(y,"11010001110111110000000");
}
else if(strcmp(x,"000011000111")==0){
strcpy(y,"11010001101001110111101");
}
else if(strcmp(x,"000011001000")==0){
strcpy(y,"11010001011011111111110");
}
else if(strcmp(x,"000011001001")==0){
strcpy(y,"11010001001110001000100");
}
else if(strcmp(x,"000011001010")==0){
strcpy(y,"11010001000000010001111");
}
else if(strcmp(x,"000011001011")==0){
strcpy(y,"11010000110010011011111");
}
else if(strcmp(x,"000011001100")==0){
strcpy(y,"11010000100100100110100");
}
else if(strcmp(x,"000011001101")==0){
strcpy(y,"11010000010110110001110");
}
else if(strcmp(x,"000011001110")==0){
strcpy(y,"11010000001000111101101");
}
else if(strcmp(x,"000011001111")==0){
strcpy(y,"11001111111011001010001");
}
else if(strcmp(x,"000011010000")==0){
strcpy(y,"11001111101101010111010");
}
else if(strcmp(x,"000011010001")==0){
strcpy(y,"11001111011111100100111");
}
else if(strcmp(x,"000011010010")==0){
strcpy(y,"11001111010001110011010");
}
else if(strcmp(x,"000011010011")==0){
strcpy(y,"11001111000100000010010");
}
else if(strcmp(x,"000011010100")==0){
strcpy(y,"11001110110110010001110");
}
else if(strcmp(x,"000011010101")==0){
strcpy(y,"11001110101000100001111");
}
else if(strcmp(x,"000011010110")==0){
strcpy(y,"11001110011010110010101");
}
else if(strcmp(x,"000011010111")==0){
strcpy(y,"11001110001101000100001");
}
else if(strcmp(x,"000011011000")==0){
strcpy(y,"11001101111111010110001");
}
else if(strcmp(x,"000011011001")==0){
strcpy(y,"11001101110001101000101");
}
else if(strcmp(x,"000011011010")==0){
strcpy(y,"11001101100011111011111");
}
else if(strcmp(x,"000011011011")==0){
strcpy(y,"11001101010110001111110");
}
else if(strcmp(x,"000011011100")==0){
strcpy(y,"11001101001000100100001");
}
else if(strcmp(x,"000011011101")==0){
strcpy(y,"11001100111010111001010");
}
else if(strcmp(x,"000011011110")==0){
strcpy(y,"11001100101101001110111");
}
else if(strcmp(x,"000011011111")==0){
strcpy(y,"11001100011111100101001");
}
else if(strcmp(x,"000011100000")==0){
strcpy(y,"11001100010001111100000");
}
else if(strcmp(x,"000011100001")==0){
strcpy(y,"11001100000100010011100");
}
else if(strcmp(x,"000011100010")==0){
strcpy(y,"11001011110110101011100");
}
else if(strcmp(x,"000011100011")==0){
strcpy(y,"11001011101001000100010");
}
else if(strcmp(x,"000011100100")==0){
strcpy(y,"11001011011011011101100");
}
else if(strcmp(x,"000011100101")==0){
strcpy(y,"11001011001101110111011");
}
else if(strcmp(x,"000011100110")==0){
strcpy(y,"11001011000000010001111");
}
else if(strcmp(x,"000011100111")==0){
strcpy(y,"11001010110010101101000");
}
else if(strcmp(x,"000011101000")==0){
strcpy(y,"11001010100101001000110");
}
else if(strcmp(x,"000011101001")==0){
strcpy(y,"11001010010111100101000");
}
else if(strcmp(x,"000011101010")==0){
strcpy(y,"11001010001010000010000");
}
else if(strcmp(x,"000011101011")==0){
strcpy(y,"11001001111100011111100");
}
else if(strcmp(x,"000011101100")==0){
strcpy(y,"11001001101110111101100");
}
else if(strcmp(x,"000011101101")==0){
strcpy(y,"11001001100001011100010");
}
else if(strcmp(x,"000011101110")==0){
strcpy(y,"11001001010011111011100");
}
else if(strcmp(x,"000011101111")==0){
strcpy(y,"11001001000110011011100");
}
else if(strcmp(x,"000011110000")==0){
strcpy(y,"11001000111000111100000");
}
else if(strcmp(x,"000011110001")==0){
strcpy(y,"11001000101011011101000");
}
else if(strcmp(x,"000011110010")==0){
strcpy(y,"11001000011101111110110");
}
else if(strcmp(x,"000011110011")==0){
strcpy(y,"11001000010000100001000");
}
else if(strcmp(x,"000011110100")==0){
strcpy(y,"11001000000011000011111");
}
else if(strcmp(x,"000011110101")==0){
strcpy(y,"11000111110101100111011");
}
else if(strcmp(x,"000011110110")==0){
strcpy(y,"11000111101000001011100");
}
else if(strcmp(x,"000011110111")==0){
strcpy(y,"11000111011010110000001");
}
else if(strcmp(x,"000011111000")==0){
strcpy(y,"11000111001101010101011");
}
else if(strcmp(x,"000011111001")==0){
strcpy(y,"11000110111111111011010");
}
else if(strcmp(x,"000011111010")==0){
strcpy(y,"11000110110010100001110");
}
else if(strcmp(x,"000011111011")==0){
strcpy(y,"11000110100101001000110");
}
else if(strcmp(x,"000011111100")==0){
strcpy(y,"11000110010111110000011");
}
else if(strcmp(x,"000011111101")==0){
strcpy(y,"11000110001010011000101");
}
else if(strcmp(x,"000011111110")==0){
strcpy(y,"11000101111101000001011");
}
else if(strcmp(x,"000011111111")==0){
strcpy(y,"11000101101111101010111");
}
else if(strcmp(x,"000100000000")==0){
strcpy(y,"11000101100010010100111");
}
else if(strcmp(x,"000100000001")==0){
strcpy(y,"11000101010100111111011");
}
else if(strcmp(x,"000100000010")==0){
strcpy(y,"11000101000111101010100");
}
else if(strcmp(x,"000100000011")==0){
strcpy(y,"11000100111010010110011");
}
else if(strcmp(x,"000100000100")==0){
strcpy(y,"11000100101101000010101");
}
else if(strcmp(x,"000100000101")==0){
strcpy(y,"11000100011111101111101");
}
else if(strcmp(x,"000100000110")==0){
strcpy(y,"11000100010010011101001");
}
else if(strcmp(x,"000100000111")==0){
strcpy(y,"11000100000101001011010");
}
else if(strcmp(x,"000100001000")==0){
strcpy(y,"11000011110111111001111");
}
else if(strcmp(x,"000100001001")==0){
strcpy(y,"11000011101010101001001");
}
else if(strcmp(x,"000100001010")==0){
strcpy(y,"11000011011101011001000");
}
else if(strcmp(x,"000100001011")==0){
strcpy(y,"11000011010000001001011");
}
else if(strcmp(x,"000100001100")==0){
strcpy(y,"11000011000010111010100");
}
else if(strcmp(x,"000100001101")==0){
strcpy(y,"11000010110101101100000");
}
else if(strcmp(x,"000100001110")==0){
strcpy(y,"11000010101000011110010");
}
else if(strcmp(x,"000100001111")==0){
strcpy(y,"11000010011011010001000");
}
else if(strcmp(x,"000100010000")==0){
strcpy(y,"11000010001110000100011");
}
else if(strcmp(x,"000100010001")==0){
strcpy(y,"11000010000000111000010");
}
else if(strcmp(x,"000100010010")==0){
strcpy(y,"11000001110011101100110");
}
else if(strcmp(x,"000100010011")==0){
strcpy(y,"11000001100110100001111");
}
else if(strcmp(x,"000100010100")==0){
strcpy(y,"11000001011001010111100");
}
else if(strcmp(x,"000100010101")==0){
strcpy(y,"11000001001100001101110");
}
else if(strcmp(x,"000100010110")==0){
strcpy(y,"11000000111111000100100");
}
else if(strcmp(x,"000100010111")==0){
strcpy(y,"11000000110001111011111");
}
else if(strcmp(x,"000100011000")==0){
strcpy(y,"11000000100100110011111");
}
else if(strcmp(x,"000100011001")==0){
strcpy(y,"11000000010111101100100");
}
else if(strcmp(x,"000100011010")==0){
strcpy(y,"11000000001010100101100");
}
else if(strcmp(x,"000100011011")==0){
strcpy(y,"10111111111101011111010");
}
else if(strcmp(x,"000100011100")==0){
strcpy(y,"10111111110000011001100");
}
else if(strcmp(x,"000100011101")==0){
strcpy(y,"10111111100011010100011");
}
else if(strcmp(x,"000100011110")==0){
strcpy(y,"10111111010110001111110");
}
else if(strcmp(x,"000100011111")==0){
strcpy(y,"10111111001001001011110");
}
else if(strcmp(x,"000100100000")==0){
strcpy(y,"10111110111100001000010");
}
else if(strcmp(x,"000100100001")==0){
strcpy(y,"10111110101111000101011");
}
else if(strcmp(x,"000100100010")==0){
strcpy(y,"10111110100010000011001");
}
else if(strcmp(x,"000100100011")==0){
strcpy(y,"10111110010101000001011");
}
else if(strcmp(x,"000100100100")==0){
strcpy(y,"10111110001000000000010");
}
else if(strcmp(x,"000100100101")==0){
strcpy(y,"10111101111010111111101");
}
else if(strcmp(x,"000100100110")==0){
strcpy(y,"10111101101101111111101");
}
else if(strcmp(x,"000100100111")==0){
strcpy(y,"10111101100001000000001");
}
else if(strcmp(x,"000100101000")==0){
strcpy(y,"10111101010100000001010");
}
else if(strcmp(x,"000100101001")==0){
strcpy(y,"10111101000111000011000");
}
else if(strcmp(x,"000100101010")==0){
strcpy(y,"10111100111010000101010");
}
else if(strcmp(x,"000100101011")==0){
strcpy(y,"10111100101101001000000");
}
else if(strcmp(x,"000100101100")==0){
strcpy(y,"10111100100000001011011");
}
else if(strcmp(x,"000100101101")==0){
strcpy(y,"10111100010011001111011");
}
else if(strcmp(x,"000100101110")==0){
strcpy(y,"10111100000110010011111");
}
else if(strcmp(x,"000100101111")==0){
strcpy(y,"10111011111001011001000");
}
else if(strcmp(x,"000100110000")==0){
strcpy(y,"10111011101100011110101");
}
else if(strcmp(x,"000100110001")==0){
strcpy(y,"10111011011111100100110");
}
else if(strcmp(x,"000100110010")==0){
strcpy(y,"10111011010010101011100");
}
else if(strcmp(x,"000100110011")==0){
strcpy(y,"10111011000101110010111");
}
else if(strcmp(x,"000100110100")==0){
strcpy(y,"10111010111000111010110");
}
else if(strcmp(x,"000100110101")==0){
strcpy(y,"10111010101100000011010");
}
else if(strcmp(x,"000100110110")==0){
strcpy(y,"10111010011111001100010");
}
else if(strcmp(x,"000100110111")==0){
strcpy(y,"10111010010010010101110");
}
else if(strcmp(x,"000100111000")==0){
strcpy(y,"10111010000101011111111");
}
else if(strcmp(x,"000100111001")==0){
strcpy(y,"10111001111000101010101");
}
else if(strcmp(x,"000100111010")==0){
strcpy(y,"10111001101011110101111");
}
else if(strcmp(x,"000100111011")==0){
strcpy(y,"10111001011111000001101");
}
else if(strcmp(x,"000100111100")==0){
strcpy(y,"10111001010010001110000");
}
else if(strcmp(x,"000100111101")==0){
strcpy(y,"10111001000101011011000");
}
else if(strcmp(x,"000100111110")==0){
strcpy(y,"10111000111000101000100");
}
else if(strcmp(x,"000100111111")==0){
strcpy(y,"10111000101011110110100");
}
else if(strcmp(x,"000101000000")==0){
strcpy(y,"10111000011111000101001");
}
else if(strcmp(x,"000101000001")==0){
strcpy(y,"10111000010010010100010");
}
else if(strcmp(x,"000101000010")==0){
strcpy(y,"10111000000101100011111");
}
else if(strcmp(x,"000101000011")==0){
strcpy(y,"10110111111000110100001");
}
else if(strcmp(x,"000101000100")==0){
strcpy(y,"10110111101100000101000");
}
else if(strcmp(x,"000101000101")==0){
strcpy(y,"10110111011111010110011");
}
else if(strcmp(x,"000101000110")==0){
strcpy(y,"10110111010010101000010");
}
else if(strcmp(x,"000101000111")==0){
strcpy(y,"10110111000101111010110");
}
else if(strcmp(x,"000101001000")==0){
strcpy(y,"10110110111001001101110");
}
else if(strcmp(x,"000101001001")==0){
strcpy(y,"10110110101100100001010");
}
else if(strcmp(x,"000101001010")==0){
strcpy(y,"10110110011111110101011");
}
else if(strcmp(x,"000101001011")==0){
strcpy(y,"10110110010011001010001");
}
else if(strcmp(x,"000101001100")==0){
strcpy(y,"10110110000110011111010");
}
else if(strcmp(x,"000101001101")==0){
strcpy(y,"10110101111001110101001");
}
else if(strcmp(x,"000101001110")==0){
strcpy(y,"10110101101101001011011");
}
else if(strcmp(x,"000101001111")==0){
strcpy(y,"10110101100000100010010");
}
else if(strcmp(x,"000101010000")==0){
strcpy(y,"10110101010011111001101");
}
else if(strcmp(x,"000101010001")==0){
strcpy(y,"10110101000111010001101");
}
else if(strcmp(x,"000101010010")==0){
strcpy(y,"10110100111010101010001");
}
else if(strcmp(x,"000101010011")==0){
strcpy(y,"10110100101110000011001");
}
else if(strcmp(x,"000101010100")==0){
strcpy(y,"10110100100001011100110");
}
else if(strcmp(x,"000101010101")==0){
strcpy(y,"10110100010100110110111");
}
else if(strcmp(x,"000101010110")==0){
strcpy(y,"10110100001000010001101");
}
else if(strcmp(x,"000101010111")==0){
strcpy(y,"10110011111011101100111");
}
else if(strcmp(x,"000101011000")==0){
strcpy(y,"10110011101111001000101");
}
else if(strcmp(x,"000101011001")==0){
strcpy(y,"10110011100010100100111");
}
else if(strcmp(x,"000101011010")==0){
strcpy(y,"10110011010110000001110");
}
else if(strcmp(x,"000101011011")==0){
strcpy(y,"10110011001001011111001");
}
else if(strcmp(x,"000101011100")==0){
strcpy(y,"10110010111100111101001");
}
else if(strcmp(x,"000101011101")==0){
strcpy(y,"10110010110000011011101");
}
else if(strcmp(x,"000101011110")==0){
strcpy(y,"10110010100011111010101");
}
else if(strcmp(x,"000101011111")==0){
strcpy(y,"10110010010111011010010");
}
else if(strcmp(x,"000101100000")==0){
strcpy(y,"10110010001010111010011");
}
else if(strcmp(x,"000101100001")==0){
strcpy(y,"10110001111110011011000");
}
else if(strcmp(x,"000101100010")==0){
strcpy(y,"10110001110001111100001");
}
else if(strcmp(x,"000101100011")==0){
strcpy(y,"10110001100101011101111");
}
else if(strcmp(x,"000101100100")==0){
strcpy(y,"10110001011001000000001");
}
else if(strcmp(x,"000101100101")==0){
strcpy(y,"10110001001100100010111");
}
else if(strcmp(x,"000101100110")==0){
strcpy(y,"10110001000000000110010");
}
else if(strcmp(x,"000101100111")==0){
strcpy(y,"10110000110011101010001");
}
else if(strcmp(x,"000101101000")==0){
strcpy(y,"10110000100111001110100");
}
else if(strcmp(x,"000101101001")==0){
strcpy(y,"10110000011010110011100");
}
else if(strcmp(x,"000101101010")==0){
strcpy(y,"10110000001110011001000");
}
else if(strcmp(x,"000101101011")==0){
strcpy(y,"10110000000001111111000");
}
else if(strcmp(x,"000101101100")==0){
strcpy(y,"10101111110101100101100");
}
else if(strcmp(x,"000101101101")==0){
strcpy(y,"10101111101001001100101");
}
else if(strcmp(x,"000101101110")==0){
strcpy(y,"10101111011100110100010");
}
else if(strcmp(x,"000101101111")==0){
strcpy(y,"10101111010000011100011");
}
else if(strcmp(x,"000101110000")==0){
strcpy(y,"10101111000100000101000");
}
else if(strcmp(x,"000101110001")==0){
strcpy(y,"10101110110111101110010");
}
else if(strcmp(x,"000101110010")==0){
strcpy(y,"10101110101011011000000");
}
else if(strcmp(x,"000101110011")==0){
strcpy(y,"10101110011111000010010");
}
else if(strcmp(x,"000101110100")==0){
strcpy(y,"10101110010010101101001");
}
else if(strcmp(x,"000101110101")==0){
strcpy(y,"10101110000110011000011");
}
else if(strcmp(x,"000101110110")==0){
strcpy(y,"10101101111010000100010");
}
else if(strcmp(x,"000101110111")==0){
strcpy(y,"10101101101101110000101");
}
else if(strcmp(x,"000101111000")==0){
strcpy(y,"10101101100001011101101");
}
else if(strcmp(x,"000101111001")==0){
strcpy(y,"10101101010101001011000");
}
else if(strcmp(x,"000101111010")==0){
strcpy(y,"10101101001000111001000");
}
else if(strcmp(x,"000101111011")==0){
strcpy(y,"10101100111100100111100");
}
else if(strcmp(x,"000101111100")==0){
strcpy(y,"10101100110000010110100");
}
else if(strcmp(x,"000101111101")==0){
strcpy(y,"10101100100100000110001");
}
else if(strcmp(x,"000101111110")==0){
strcpy(y,"10101100010111110110001");
}
else if(strcmp(x,"000101111111")==0){
strcpy(y,"10101100001011100110110");
}
else if(strcmp(x,"000110000000")==0){
strcpy(y,"10101011111111010111111");
}
else if(strcmp(x,"000110000001")==0){
strcpy(y,"10101011110011001001100");
}
else if(strcmp(x,"000110000010")==0){
strcpy(y,"10101011100110111011110");
}
else if(strcmp(x,"000110000011")==0){
strcpy(y,"10101011011010101110011");
}
else if(strcmp(x,"000110000100")==0){
strcpy(y,"10101011001110100001101");
}
else if(strcmp(x,"000110000101")==0){
strcpy(y,"10101011000010010101011");
}
else if(strcmp(x,"000110000110")==0){
strcpy(y,"10101010110110001001101");
}
else if(strcmp(x,"000110000111")==0){
strcpy(y,"10101010101001111110011");
}
else if(strcmp(x,"000110001000")==0){
strcpy(y,"10101010011101110011110");
}
else if(strcmp(x,"000110001001")==0){
strcpy(y,"10101010010001101001100");
}
else if(strcmp(x,"000110001010")==0){
strcpy(y,"10101010000101011111111");
}
else if(strcmp(x,"000110001011")==0){
strcpy(y,"10101001111001010110110");
}
else if(strcmp(x,"000110001100")==0){
strcpy(y,"10101001101101001110001");
}
else if(strcmp(x,"000110001101")==0){
strcpy(y,"10101001100001000110000");
}
else if(strcmp(x,"000110001110")==0){
strcpy(y,"10101001010100111110100");
}
else if(strcmp(x,"000110001111")==0){
strcpy(y,"10101001001000110111011");
}
else if(strcmp(x,"000110010000")==0){
strcpy(y,"10101000111100110000111");
}
else if(strcmp(x,"000110010001")==0){
strcpy(y,"10101000110000101010111");
}
else if(strcmp(x,"000110010010")==0){
strcpy(y,"10101000100100100101011");
}
else if(strcmp(x,"000110010011")==0){
strcpy(y,"10101000011000100000011");
}
else if(strcmp(x,"000110010100")==0){
strcpy(y,"10101000001100011011111");
}
else if(strcmp(x,"000110010101")==0){
strcpy(y,"10101000000000010111111");
}
else if(strcmp(x,"000110010110")==0){
strcpy(y,"10100111110100010100100");
}
else if(strcmp(x,"000110010111")==0){
strcpy(y,"10100111101000010001100");
}
else if(strcmp(x,"000110011000")==0){
strcpy(y,"10100111011100001111001");
}
else if(strcmp(x,"000110011001")==0){
strcpy(y,"10100111010000001101001");
}
else if(strcmp(x,"000110011010")==0){
strcpy(y,"10100111000100001011110");
}
else if(strcmp(x,"000110011011")==0){
strcpy(y,"10100110111000001010111");
}
else if(strcmp(x,"000110011100")==0){
strcpy(y,"10100110101100001010100");
}
else if(strcmp(x,"000110011101")==0){
strcpy(y,"10100110100000001010101");
}
else if(strcmp(x,"000110011110")==0){
strcpy(y,"10100110010100001011010");
}
else if(strcmp(x,"000110011111")==0){
strcpy(y,"10100110001000001100100");
}
else if(strcmp(x,"000110100000")==0){
strcpy(y,"10100101111100001110001");
}
else if(strcmp(x,"000110100001")==0){
strcpy(y,"10100101110000010000010");
}
else if(strcmp(x,"000110100010")==0){
strcpy(y,"10100101100100010011000");
}
else if(strcmp(x,"000110100011")==0){
strcpy(y,"10100101011000010110001");
}
else if(strcmp(x,"000110100100")==0){
strcpy(y,"10100101001100011001111");
}
else if(strcmp(x,"000110100101")==0){
strcpy(y,"10100101000000011110001");
}
else if(strcmp(x,"000110100110")==0){
strcpy(y,"10100100110100100010111");
}
else if(strcmp(x,"000110100111")==0){
strcpy(y,"10100100101000101000000");
}
else if(strcmp(x,"000110101000")==0){
strcpy(y,"10100100011100101101110");
}
else if(strcmp(x,"000110101001")==0){
strcpy(y,"10100100010000110100000");
}
else if(strcmp(x,"000110101010")==0){
strcpy(y,"10100100000100111010110");
}
else if(strcmp(x,"000110101011")==0){
strcpy(y,"10100011111001000010000");
}
else if(strcmp(x,"000110101100")==0){
strcpy(y,"10100011101101001001110");
}
else if(strcmp(x,"000110101101")==0){
strcpy(y,"10100011100001010010000");
}
else if(strcmp(x,"000110101110")==0){
strcpy(y,"10100011010101011010110");
}
else if(strcmp(x,"000110101111")==0){
strcpy(y,"10100011001001100100000");
}
else if(strcmp(x,"000110110000")==0){
strcpy(y,"10100010111101101101110");
}
else if(strcmp(x,"000110110001")==0){
strcpy(y,"10100010110001111000000");
}
else if(strcmp(x,"000110110010")==0){
strcpy(y,"10100010100110000010111");
}
else if(strcmp(x,"000110110011")==0){
strcpy(y,"10100010011010001110001");
}
else if(strcmp(x,"000110110100")==0){
strcpy(y,"10100010001110011001111");
}
else if(strcmp(x,"000110110101")==0){
strcpy(y,"10100010000010100110001");
}
else if(strcmp(x,"000110110110")==0){
strcpy(y,"10100001110110110010111");
}
else if(strcmp(x,"000110110111")==0){
strcpy(y,"10100001101011000000001");
}
else if(strcmp(x,"000110111000")==0){
strcpy(y,"10100001011111001101111");
}
else if(strcmp(x,"000110111001")==0){
strcpy(y,"10100001010011011100010");
}
else if(strcmp(x,"000110111010")==0){
strcpy(y,"10100001000111101011000");
}
else if(strcmp(x,"000110111011")==0){
strcpy(y,"10100000111011111010010");
}
else if(strcmp(x,"000110111100")==0){
strcpy(y,"10100000110000001010000");
}
else if(strcmp(x,"000110111101")==0){
strcpy(y,"10100000100100011010010");
}
else if(strcmp(x,"000110111110")==0){
strcpy(y,"10100000011000101011000");
}
else if(strcmp(x,"000110111111")==0){
strcpy(y,"10100000001100111100010");
}
else if(strcmp(x,"000111000000")==0){
strcpy(y,"10100000000001001110000");
}
else if(strcmp(x,"000111000001")==0){
strcpy(y,"10011111110101100000010");
}
else if(strcmp(x,"000111000010")==0){
strcpy(y,"10011111101001110011000");
}
else if(strcmp(x,"000111000011")==0){
strcpy(y,"10011111011110000110010");
}
else if(strcmp(x,"000111000100")==0){
strcpy(y,"10011111010010011001111");
}
else if(strcmp(x,"000111000101")==0){
strcpy(y,"10011111000110101110001");
}
else if(strcmp(x,"000111000110")==0){
strcpy(y,"10011110111011000010111");
}
else if(strcmp(x,"000111000111")==0){
strcpy(y,"10011110101111011000001");
}
else if(strcmp(x,"000111001000")==0){
strcpy(y,"10011110100011101101110");
}
else if(strcmp(x,"000111001001")==0){
strcpy(y,"10011110011000000100000");
}
else if(strcmp(x,"000111001010")==0){
strcpy(y,"10011110001100011010101");
}
else if(strcmp(x,"000111001011")==0){
strcpy(y,"10011110000000110001110");
}
else if(strcmp(x,"000111001100")==0){
strcpy(y,"10011101110101001001100");
}
else if(strcmp(x,"000111001101")==0){
strcpy(y,"10011101101001100001101");
}
else if(strcmp(x,"000111001110")==0){
strcpy(y,"10011101011101111010010");
}
else if(strcmp(x,"000111001111")==0){
strcpy(y,"10011101010010010011011");
}
else if(strcmp(x,"000111010000")==0){
strcpy(y,"10011101000110101101000");
}
else if(strcmp(x,"000111010001")==0){
strcpy(y,"10011100111011000111001");
}
else if(strcmp(x,"000111010010")==0){
strcpy(y,"10011100101111100001101");
}
else if(strcmp(x,"000111010011")==0){
strcpy(y,"10011100100011111100110");
}
else if(strcmp(x,"000111010100")==0){
strcpy(y,"10011100011000011000011");
}
else if(strcmp(x,"000111010101")==0){
strcpy(y,"10011100001100110100011");
}
else if(strcmp(x,"000111010110")==0){
strcpy(y,"10011100000001010000111");
}
else if(strcmp(x,"000111010111")==0){
strcpy(y,"10011011110101101110000");
}
else if(strcmp(x,"000111011000")==0){
strcpy(y,"10011011101010001011100");
}
else if(strcmp(x,"000111011001")==0){
strcpy(y,"10011011011110101001100");
}
else if(strcmp(x,"000111011010")==0){
strcpy(y,"10011011010011001000000");
}
else if(strcmp(x,"000111011011")==0){
strcpy(y,"10011011000111100110111");
}
else if(strcmp(x,"000111011100")==0){
strcpy(y,"10011010111100000110011");
}
else if(strcmp(x,"000111011101")==0){
strcpy(y,"10011010110000100110010");
}
else if(strcmp(x,"000111011110")==0){
strcpy(y,"10011010100101000110110");
}
else if(strcmp(x,"000111011111")==0){
strcpy(y,"10011010011001100111101");
}
else if(strcmp(x,"000111100000")==0){
strcpy(y,"10011010001110001001000");
}
else if(strcmp(x,"000111100001")==0){
strcpy(y,"10011010000010101010111");
}
else if(strcmp(x,"000111100010")==0){
strcpy(y,"10011001110111001101001");
}
else if(strcmp(x,"000111100011")==0){
strcpy(y,"10011001101011110000000");
}
else if(strcmp(x,"000111100100")==0){
strcpy(y,"10011001100000010011010");
}
else if(strcmp(x,"000111100101")==0){
strcpy(y,"10011001010100110111001");
}
else if(strcmp(x,"000111100110")==0){
strcpy(y,"10011001001001011011011");
}
else if(strcmp(x,"000111100111")==0){
strcpy(y,"10011000111110000000001");
}
else if(strcmp(x,"000111101000")==0){
strcpy(y,"10011000110010100101010");
}
else if(strcmp(x,"000111101001")==0){
strcpy(y,"10011000100111001011000");
}
else if(strcmp(x,"000111101010")==0){
strcpy(y,"10011000011011110001001");
}
else if(strcmp(x,"000111101011")==0){
strcpy(y,"10011000010000010111110");
}
else if(strcmp(x,"000111101100")==0){
strcpy(y,"10011000000100111110111");
}
else if(strcmp(x,"000111101101")==0){
strcpy(y,"10010111111001100110100");
}
else if(strcmp(x,"000111101110")==0){
strcpy(y,"10010111101110001110101");
}
else if(strcmp(x,"000111101111")==0){
strcpy(y,"10010111100010110111001");
}
else if(strcmp(x,"000111110000")==0){
strcpy(y,"10010111010111100000010");
}
else if(strcmp(x,"000111110001")==0){
strcpy(y,"10010111001100001001110");
}
else if(strcmp(x,"000111110010")==0){
strcpy(y,"10010111000000110011110");
}
else if(strcmp(x,"000111110011")==0){
strcpy(y,"10010110110101011110001");
}
else if(strcmp(x,"000111110100")==0){
strcpy(y,"10010110101010001001001");
}
else if(strcmp(x,"000111110101")==0){
strcpy(y,"10010110011110110100100");
}
else if(strcmp(x,"000111110110")==0){
strcpy(y,"10010110010011100000011");
}
else if(strcmp(x,"000111110111")==0){
strcpy(y,"10010110001000001100110");
}
else if(strcmp(x,"000111111000")==0){
strcpy(y,"10010101111100111001100");
}
else if(strcmp(x,"000111111001")==0){
strcpy(y,"10010101110001100110110");
}
else if(strcmp(x,"000111111010")==0){
strcpy(y,"10010101100110010100100");
}
else if(strcmp(x,"000111111011")==0){
strcpy(y,"10010101011011000010110");
}
else if(strcmp(x,"000111111100")==0){
strcpy(y,"10010101001111110001100");
}
else if(strcmp(x,"000111111101")==0){
strcpy(y,"10010101000100100000101");
}
else if(strcmp(x,"000111111110")==0){
strcpy(y,"10010100111001010000010");
}
else if(strcmp(x,"000111111111")==0){
strcpy(y,"10010100101110000000011");
}
else if(strcmp(x,"001000000000")==0){
strcpy(y,"10010100100010110001000");
}
else if(strcmp(x,"001000000001")==0){
strcpy(y,"10010100010111100010000");
}
else if(strcmp(x,"001000000010")==0){
strcpy(y,"10010100001100010011100");
}
else if(strcmp(x,"001000000011")==0){
strcpy(y,"10010100000001000101100");
}
else if(strcmp(x,"001000000100")==0){
strcpy(y,"10010011110101111000000");
}
else if(strcmp(x,"001000000101")==0){
strcpy(y,"10010011101010101010111");
}
else if(strcmp(x,"001000000110")==0){
strcpy(y,"10010011011111011110010");
}
else if(strcmp(x,"001000000111")==0){
strcpy(y,"10010011010100010010001");
}
else if(strcmp(x,"001000001000")==0){
strcpy(y,"10010011001001000110011");
}
else if(strcmp(x,"001000001001")==0){
strcpy(y,"10010010111101111011010");
}
else if(strcmp(x,"001000001010")==0){
strcpy(y,"10010010110010110000100");
}
else if(strcmp(x,"001000001011")==0){
strcpy(y,"10010010100111100110001");
}
else if(strcmp(x,"001000001100")==0){
strcpy(y,"10010010011100011100011");
}
else if(strcmp(x,"001000001101")==0){
strcpy(y,"10010010010001010011000");
}
else if(strcmp(x,"001000001110")==0){
strcpy(y,"10010010000110001010000");
}
else if(strcmp(x,"001000001111")==0){
strcpy(y,"10010001111011000001101");
}
else if(strcmp(x,"001000010000")==0){
strcpy(y,"10010001101111111001101");
}
else if(strcmp(x,"001000010001")==0){
strcpy(y,"10010001100100110010001");
}
else if(strcmp(x,"001000010010")==0){
strcpy(y,"10010001011001101011001");
}
else if(strcmp(x,"001000010011")==0){
strcpy(y,"10010001001110100100100");
}
else if(strcmp(x,"001000010100")==0){
strcpy(y,"10010001000011011110011");
}
else if(strcmp(x,"001000010101")==0){
strcpy(y,"10010000111000011000101");
}
else if(strcmp(x,"001000010110")==0){
strcpy(y,"10010000101101010011100");
}
else if(strcmp(x,"001000010111")==0){
strcpy(y,"10010000100010001110110");
}
else if(strcmp(x,"001000011000")==0){
strcpy(y,"10010000010111001010011");
}
else if(strcmp(x,"001000011001")==0){
strcpy(y,"10010000001100000110100");
}
else if(strcmp(x,"001000011010")==0){
strcpy(y,"10010000000001000011001");
}
else if(strcmp(x,"001000011011")==0){
strcpy(y,"10001111110110000000010");
}
else if(strcmp(x,"001000011100")==0){
strcpy(y,"10001111101010111101110");
}
else if(strcmp(x,"001000011101")==0){
strcpy(y,"10001111011111111011110");
}
else if(strcmp(x,"001000011110")==0){
strcpy(y,"10001111010100111010010");
}
else if(strcmp(x,"001000011111")==0){
strcpy(y,"10001111001001111001001");
}
else if(strcmp(x,"001000100000")==0){
strcpy(y,"10001110111110111000100");
}
else if(strcmp(x,"001000100001")==0){
strcpy(y,"10001110110011111000011");
}
else if(strcmp(x,"001000100010")==0){
strcpy(y,"10001110101000111000101");
}
else if(strcmp(x,"001000100011")==0){
strcpy(y,"10001110011101111001011");
}
else if(strcmp(x,"001000100100")==0){
strcpy(y,"10001110010010111010100");
}
else if(strcmp(x,"001000100101")==0){
strcpy(y,"10001110000111111100001");
}
else if(strcmp(x,"001000100110")==0){
strcpy(y,"10001101111100111110010");
}
else if(strcmp(x,"001000100111")==0){
strcpy(y,"10001101110010000000110");
}
else if(strcmp(x,"001000101000")==0){
strcpy(y,"10001101100111000011110");
}
else if(strcmp(x,"001000101001")==0){
strcpy(y,"10001101011100000111010");
}
else if(strcmp(x,"001000101010")==0){
strcpy(y,"10001101010001001011001");
}
else if(strcmp(x,"001000101011")==0){
strcpy(y,"10001101000110001111100");
}
else if(strcmp(x,"001000101100")==0){
strcpy(y,"10001100111011010100010");
}
else if(strcmp(x,"001000101101")==0){
strcpy(y,"10001100110000011001100");
}
else if(strcmp(x,"001000101110")==0){
strcpy(y,"10001100100101011111010");
}
else if(strcmp(x,"001000101111")==0){
strcpy(y,"10001100011010100101011");
}
else if(strcmp(x,"001000110000")==0){
strcpy(y,"10001100001111101100000");
}
else if(strcmp(x,"001000110001")==0){
strcpy(y,"10001100000100110011000");
}
else if(strcmp(x,"001000110010")==0){
strcpy(y,"10001011111001111010100");
}
else if(strcmp(x,"001000110011")==0){
strcpy(y,"10001011101111000010100");
}
else if(strcmp(x,"001000110100")==0){
strcpy(y,"10001011100100001010111");
}
else if(strcmp(x,"001000110101")==0){
strcpy(y,"10001011011001010011110");
}
else if(strcmp(x,"001000110110")==0){
strcpy(y,"10001011001110011101000");
}
else if(strcmp(x,"001000110111")==0){
strcpy(y,"10001011000011100110110");
}
else if(strcmp(x,"001000111000")==0){
strcpy(y,"10001010111000110000111");
}
else if(strcmp(x,"001000111001")==0){
strcpy(y,"10001010101101111011100");
}
else if(strcmp(x,"001000111010")==0){
strcpy(y,"10001010100011000110101");
}
else if(strcmp(x,"001000111011")==0){
strcpy(y,"10001010011000010010001");
}
else if(strcmp(x,"001000111100")==0){
strcpy(y,"10001010001101011110001");
}
else if(strcmp(x,"001000111101")==0){
strcpy(y,"10001010000010101010100");
}
else if(strcmp(x,"001000111110")==0){
strcpy(y,"10001001110111110111011");
}
else if(strcmp(x,"001000111111")==0){
strcpy(y,"10001001101101000100101");
}
else if(strcmp(x,"001001000000")==0){
strcpy(y,"10001001100010010010011");
}
else if(strcmp(x,"001001000001")==0){
strcpy(y,"10001001010111100000101");
}
else if(strcmp(x,"001001000010")==0){
strcpy(y,"10001001001100101111010");
}
else if(strcmp(x,"001001000011")==0){
strcpy(y,"10001001000001111110010");
}
else if(strcmp(x,"001001000100")==0){
strcpy(y,"10001000110111001101111");
}
else if(strcmp(x,"001001000101")==0){
strcpy(y,"10001000101100011101110");
}
else if(strcmp(x,"001001000110")==0){
strcpy(y,"10001000100001101110001");
}
else if(strcmp(x,"001001000111")==0){
strcpy(y,"10001000010110111111000");
}
else if(strcmp(x,"001001001000")==0){
strcpy(y,"10001000001100010000010");
}
else if(strcmp(x,"001001001001")==0){
strcpy(y,"10001000000001100010000");
}
else if(strcmp(x,"001001001010")==0){
strcpy(y,"10000111110110110100001");
}
else if(strcmp(x,"001001001011")==0){
strcpy(y,"10000111101100000110110");
}
else if(strcmp(x,"001001001100")==0){
strcpy(y,"10000111100001011001110");
}
else if(strcmp(x,"001001001101")==0){
strcpy(y,"10000111010110101101010");
}
else if(strcmp(x,"001001001110")==0){
strcpy(y,"10000111001100000001001");
}
else if(strcmp(x,"001001001111")==0){
strcpy(y,"10000111000001010101100");
}
else if(strcmp(x,"001001010000")==0){
strcpy(y,"10000110110110101010011");
}
else if(strcmp(x,"001001010001")==0){
strcpy(y,"10000110101011111111100");
}
else if(strcmp(x,"001001010010")==0){
strcpy(y,"10000110100001010101010");
}
else if(strcmp(x,"001001010011")==0){
strcpy(y,"10000110010110101011010");
}
else if(strcmp(x,"001001010100")==0){
strcpy(y,"10000110001100000001111");
}
else if(strcmp(x,"001001010101")==0){
strcpy(y,"10000110000001011000110");
}
else if(strcmp(x,"001001010110")==0){
strcpy(y,"10000101110110110000010");
}
else if(strcmp(x,"001001010111")==0){
strcpy(y,"10000101101100001000000");
}
else if(strcmp(x,"001001011000")==0){
strcpy(y,"10000101100001100000011");
}
else if(strcmp(x,"001001011001")==0){
strcpy(y,"10000101010110111001000");
}
else if(strcmp(x,"001001011010")==0){
strcpy(y,"10000101001100010010001");
}
else if(strcmp(x,"001001011011")==0){
strcpy(y,"10000101000001101011110");
}
else if(strcmp(x,"001001011100")==0){
strcpy(y,"10000100110111000101110");
}
else if(strcmp(x,"001001011101")==0){
strcpy(y,"10000100101100100000010");
}
else if(strcmp(x,"001001011110")==0){
strcpy(y,"10000100100001111011000");
}
else if(strcmp(x,"001001011111")==0){
strcpy(y,"10000100010111010110011");
}
else if(strcmp(x,"001001100000")==0){
strcpy(y,"10000100001100110010001");
}
else if(strcmp(x,"001001100001")==0){
strcpy(y,"10000100000010001110010");
}
else if(strcmp(x,"001001100010")==0){
strcpy(y,"10000011110111101010111");
}
else if(strcmp(x,"001001100011")==0){
strcpy(y,"10000011101101000111111");
}
else if(strcmp(x,"001001100100")==0){
strcpy(y,"10000011100010100101011");
}
else if(strcmp(x,"001001100101")==0){
strcpy(y,"10000011011000000011010");
}
else if(strcmp(x,"001001100110")==0){
strcpy(y,"10000011001101100001100");
}
else if(strcmp(x,"001001100111")==0){
strcpy(y,"10000011000011000000010");
}
else if(strcmp(x,"001001101000")==0){
strcpy(y,"10000010111000011111100");
}
else if(strcmp(x,"001001101001")==0){
strcpy(y,"10000010101101111111001");
}
else if(strcmp(x,"001001101010")==0){
strcpy(y,"10000010100011011111001");
}
else if(strcmp(x,"001001101011")==0){
strcpy(y,"10000010011000111111101");
}
else if(strcmp(x,"001001101100")==0){
strcpy(y,"10000010001110100000100");
}
else if(strcmp(x,"001001101101")==0){
strcpy(y,"10000010000100000001110");
}
else if(strcmp(x,"001001101110")==0){
strcpy(y,"10000001111001100011100");
}
else if(strcmp(x,"001001101111")==0){
strcpy(y,"10000001101111000101101");
}
else if(strcmp(x,"001001110000")==0){
strcpy(y,"10000001100100101000010");
}
else if(strcmp(x,"001001110001")==0){
strcpy(y,"10000001011010001011010");
}
else if(strcmp(x,"001001110010")==0){
strcpy(y,"10000001001111101110110");
}
else if(strcmp(x,"001001110011")==0){
strcpy(y,"10000001000101010010101");
}
else if(strcmp(x,"001001110100")==0){
strcpy(y,"10000000111010110110111");
}
else if(strcmp(x,"001001110101")==0){
strcpy(y,"10000000110000011011101");
}
else if(strcmp(x,"001001110110")==0){
strcpy(y,"10000000100110000000110");
}
else if(strcmp(x,"001001110111")==0){
strcpy(y,"10000000011011100110010");
}
else if(strcmp(x,"001001111000")==0){
strcpy(y,"10000000010001001100010");
}
else if(strcmp(x,"001001111001")==0){
strcpy(y,"10000000000110110010101");
}
else if(strcmp(x,"001001111010")==0){
strcpy(y,"01111111111100011001100");
}
else if(strcmp(x,"001001111011")==0){
strcpy(y,"01111111110010000000110");
}
else if(strcmp(x,"001001111100")==0){
strcpy(y,"01111111100111101000011");
}
else if(strcmp(x,"001001111101")==0){
strcpy(y,"01111111011101010000100");
}
else if(strcmp(x,"001001111110")==0){
strcpy(y,"01111111010010111001000");
}
else if(strcmp(x,"001001111111")==0){
strcpy(y,"01111111001000100010000");
}
else if(strcmp(x,"001010000000")==0){
strcpy(y,"01111110111110001011011");
}
else if(strcmp(x,"001010000001")==0){
strcpy(y,"01111110110011110101001");
}
else if(strcmp(x,"001010000010")==0){
strcpy(y,"01111110101001011111010");
}
else if(strcmp(x,"001010000011")==0){
strcpy(y,"01111110011111001001111");
}
else if(strcmp(x,"001010000100")==0){
strcpy(y,"01111110010100110100111");
}
else if(strcmp(x,"001010000101")==0){
strcpy(y,"01111110001010100000011");
}
else if(strcmp(x,"001010000110")==0){
strcpy(y,"01111110000000001100010");
}
else if(strcmp(x,"001010000111")==0){
strcpy(y,"01111101110101111000100");
}
else if(strcmp(x,"001010001000")==0){
strcpy(y,"01111101101011100101010");
}
else if(strcmp(x,"001010001001")==0){
strcpy(y,"01111101100001010010011");
}
else if(strcmp(x,"001010001010")==0){
strcpy(y,"01111101010110111111111");
}
else if(strcmp(x,"001010001011")==0){
strcpy(y,"01111101001100101101111");
}
else if(strcmp(x,"001010001100")==0){
strcpy(y,"01111101000010011100001");
}
else if(strcmp(x,"001010001101")==0){
strcpy(y,"01111100111000001011000");
}
else if(strcmp(x,"001010001110")==0){
strcpy(y,"01111100101101111010001");
}
else if(strcmp(x,"001010001111")==0){
strcpy(y,"01111100100011101001110");
}
else if(strcmp(x,"001010010000")==0){
strcpy(y,"01111100011001011001110");
}
else if(strcmp(x,"001010010001")==0){
strcpy(y,"01111100001111001010010");
}
else if(strcmp(x,"001010010010")==0){
strcpy(y,"01111100000100111011001");
}
else if(strcmp(x,"001010010011")==0){
strcpy(y,"01111011111010101100011");
}
else if(strcmp(x,"001010010100")==0){
strcpy(y,"01111011110000011110000");
}
else if(strcmp(x,"001010010101")==0){
strcpy(y,"01111011100110010000001");
}
else if(strcmp(x,"001010010110")==0){
strcpy(y,"01111011011100000010101");
}
else if(strcmp(x,"001010010111")==0){
strcpy(y,"01111011010001110101100");
}
else if(strcmp(x,"001010011000")==0){
strcpy(y,"01111011000111101000111");
}
else if(strcmp(x,"001010011001")==0){
strcpy(y,"01111010111101011100101");
}
else if(strcmp(x,"001010011010")==0){
strcpy(y,"01111010110011010000110");
}
else if(strcmp(x,"001010011011")==0){
strcpy(y,"01111010101001000101010");
}
else if(strcmp(x,"001010011100")==0){
strcpy(y,"01111010011110111010010");
}
else if(strcmp(x,"001010011101")==0){
strcpy(y,"01111010010100101111101");
}
else if(strcmp(x,"001010011110")==0){
strcpy(y,"01111010001010100101100");
}
else if(strcmp(x,"001010011111")==0){
strcpy(y,"01111010000000011011101");
}
else if(strcmp(x,"001010100000")==0){
strcpy(y,"01111001110110010010010");
}
else if(strcmp(x,"001010100001")==0){
strcpy(y,"01111001101100001001010");
}
else if(strcmp(x,"001010100010")==0){
strcpy(y,"01111001100010000000101");
}
else if(strcmp(x,"001010100011")==0){
strcpy(y,"01111001010111111000100");
}
else if(strcmp(x,"001010100100")==0){
strcpy(y,"01111001001101110000110");
}
else if(strcmp(x,"001010100101")==0){
strcpy(y,"01111001000011101001011");
}
else if(strcmp(x,"001010100110")==0){
strcpy(y,"01111000111001100010100");
}
else if(strcmp(x,"001010100111")==0){
strcpy(y,"01111000101111011011111");
}
else if(strcmp(x,"001010101000")==0){
strcpy(y,"01111000100101010101110");
}
else if(strcmp(x,"001010101001")==0){
strcpy(y,"01111000011011010000000");
}
else if(strcmp(x,"001010101010")==0){
strcpy(y,"01111000010001001010110");
}
else if(strcmp(x,"001010101011")==0){
strcpy(y,"01111000000111000101110");
}
else if(strcmp(x,"001010101100")==0){
strcpy(y,"01110111111101000001010");
}
else if(strcmp(x,"001010101101")==0){
strcpy(y,"01110111110010111101001");
}
else if(strcmp(x,"001010101110")==0){
strcpy(y,"01110111101000111001100");
}
else if(strcmp(x,"001010101111")==0){
strcpy(y,"01110111011110110110001");
}
else if(strcmp(x,"001010110000")==0){
strcpy(y,"01110111010100110011010");
}
else if(strcmp(x,"001010110001")==0){
strcpy(y,"01110111001010110000110");
}
else if(strcmp(x,"001010110010")==0){
strcpy(y,"01110111000000101110110");
}
else if(strcmp(x,"001010110011")==0){
strcpy(y,"01110110110110101101000");
}
else if(strcmp(x,"001010110100")==0){
strcpy(y,"01110110101100101011110");
}
else if(strcmp(x,"001010110101")==0){
strcpy(y,"01110110100010101010111");
}
else if(strcmp(x,"001010110110")==0){
strcpy(y,"01110110011000101010011");
}
else if(strcmp(x,"001010110111")==0){
strcpy(y,"01110110001110101010010");
}
else if(strcmp(x,"001010111000")==0){
strcpy(y,"01110110000100101010101");
}
else if(strcmp(x,"001010111001")==0){
strcpy(y,"01110101111010101011010");
}
else if(strcmp(x,"001010111010")==0){
strcpy(y,"01110101110000101100011");
}
else if(strcmp(x,"001010111011")==0){
strcpy(y,"01110101100110101101111");
}
else if(strcmp(x,"001010111100")==0){
strcpy(y,"01110101011100101111111");
}
else if(strcmp(x,"001010111101")==0){
strcpy(y,"01110101010010110010001");
}
else if(strcmp(x,"001010111110")==0){
strcpy(y,"01110101001000110100111");
}
else if(strcmp(x,"001010111111")==0){
strcpy(y,"01110100111110111000000");
}
else if(strcmp(x,"001011000000")==0){
strcpy(y,"01110100110100111011100");
}
else if(strcmp(x,"001011000001")==0){
strcpy(y,"01110100101010111111011");
}
else if(strcmp(x,"001011000010")==0){
strcpy(y,"01110100100001000011110");
}
else if(strcmp(x,"001011000011")==0){
strcpy(y,"01110100010111001000011");
}
else if(strcmp(x,"001011000100")==0){
strcpy(y,"01110100001101001101100");
}
else if(strcmp(x,"001011000101")==0){
strcpy(y,"01110100000011010011000");
}
else if(strcmp(x,"001011000110")==0){
strcpy(y,"01110011111001011000111");
}
else if(strcmp(x,"001011000111")==0){
strcpy(y,"01110011101111011111001");
}
else if(strcmp(x,"001011001000")==0){
strcpy(y,"01110011100101100101111");
}
else if(strcmp(x,"001011001001")==0){
strcpy(y,"01110011011011101100111");
}
else if(strcmp(x,"001011001010")==0){
strcpy(y,"01110011010001110100011");
}
else if(strcmp(x,"001011001011")==0){
strcpy(y,"01110011000111111100010");
}
else if(strcmp(x,"001011001100")==0){
strcpy(y,"01110010111110000100100");
}
else if(strcmp(x,"001011001101")==0){
strcpy(y,"01110010110100001101001");
}
else if(strcmp(x,"001011001110")==0){
strcpy(y,"01110010101010010110010");
}
else if(strcmp(x,"001011001111")==0){
strcpy(y,"01110010100000011111101");
}
else if(strcmp(x,"001011010000")==0){
strcpy(y,"01110010010110101001100");
}
else if(strcmp(x,"001011010001")==0){
strcpy(y,"01110010001100110011110");
}
else if(strcmp(x,"001011010010")==0){
strcpy(y,"01110010000010111110011");
}
else if(strcmp(x,"001011010011")==0){
strcpy(y,"01110001111001001001011");
}
else if(strcmp(x,"001011010100")==0){
strcpy(y,"01110001101111010100110");
}
else if(strcmp(x,"001011010101")==0){
strcpy(y,"01110001100101100000100");
}
else if(strcmp(x,"001011010110")==0){
strcpy(y,"01110001011011101100110");
}
else if(strcmp(x,"001011010111")==0){
strcpy(y,"01110001010001111001010");
}
else if(strcmp(x,"001011011000")==0){
strcpy(y,"01110001001000000110010");
}
else if(strcmp(x,"001011011001")==0){
strcpy(y,"01110000111110010011101");
}
else if(strcmp(x,"001011011010")==0){
strcpy(y,"01110000110100100001011");
}
else if(strcmp(x,"001011011011")==0){
strcpy(y,"01110000101010101111100");
}
else if(strcmp(x,"001011011100")==0){
strcpy(y,"01110000100000111110000");
}
else if(strcmp(x,"001011011101")==0){
strcpy(y,"01110000010111001100111");
}
else if(strcmp(x,"001011011110")==0){
strcpy(y,"01110000001101011100010");
}
else if(strcmp(x,"001011011111")==0){
strcpy(y,"01110000000011101011111");
}
else if(strcmp(x,"001011100000")==0){
strcpy(y,"01101111111001111100000");
}
else if(strcmp(x,"001011100001")==0){
strcpy(y,"01101111110000001100011");
}
else if(strcmp(x,"001011100010")==0){
strcpy(y,"01101111100110011101010");
}
else if(strcmp(x,"001011100011")==0){
strcpy(y,"01101111011100101110100");
}
else if(strcmp(x,"001011100100")==0){
strcpy(y,"01101111010011000000001");
}
else if(strcmp(x,"001011100101")==0){
strcpy(y,"01101111001001010010001");
}
else if(strcmp(x,"001011100110")==0){
strcpy(y,"01101110111111100100100");
}
else if(strcmp(x,"001011100111")==0){
strcpy(y,"01101110110101110111010");
}
else if(strcmp(x,"001011101000")==0){
strcpy(y,"01101110101100001010100");
}
else if(strcmp(x,"001011101001")==0){
strcpy(y,"01101110100010011110000");
}
else if(strcmp(x,"001011101010")==0){
strcpy(y,"01101110011000110010000");
}
else if(strcmp(x,"001011101011")==0){
strcpy(y,"01101110001111000110010");
}
else if(strcmp(x,"001011101100")==0){
strcpy(y,"01101110000101011011000");
}
else if(strcmp(x,"001011101101")==0){
strcpy(y,"01101101111011110000000");
}
else if(strcmp(x,"001011101110")==0){
strcpy(y,"01101101110010000101100");
}
else if(strcmp(x,"001011101111")==0){
strcpy(y,"01101101101000011011011");
}
else if(strcmp(x,"001011110000")==0){
strcpy(y,"01101101011110110001101");
}
else if(strcmp(x,"001011110001")==0){
strcpy(y,"01101101010101001000010");
}
else if(strcmp(x,"001011110010")==0){
strcpy(y,"01101101001011011111010");
}
else if(strcmp(x,"001011110011")==0){
strcpy(y,"01101101000001110110101");
}
else if(strcmp(x,"001011110100")==0){
strcpy(y,"01101100111000001110011");
}
else if(strcmp(x,"001011110101")==0){
strcpy(y,"01101100101110100110100");
}
else if(strcmp(x,"001011110110")==0){
strcpy(y,"01101100100100111111000");
}
else if(strcmp(x,"001011110111")==0){
strcpy(y,"01101100011011010111111");
}
else if(strcmp(x,"001011111000")==0){
strcpy(y,"01101100010001110001001");
}
else if(strcmp(x,"001011111001")==0){
strcpy(y,"01101100001000001010111");
}
else if(strcmp(x,"001011111010")==0){
strcpy(y,"01101011111110100100111");
}
else if(strcmp(x,"001011111011")==0){
strcpy(y,"01101011110100111111010");
}
else if(strcmp(x,"001011111100")==0){
strcpy(y,"01101011101011011010001");
}
else if(strcmp(x,"001011111101")==0){
strcpy(y,"01101011100001110101010");
}
else if(strcmp(x,"001011111110")==0){
strcpy(y,"01101011011000010000110");
}
else if(strcmp(x,"001011111111")==0){
strcpy(y,"01101011001110101100110");
}
else if(strcmp(x,"001100000000")==0){
strcpy(y,"01101011000101001001000");
}
else if(strcmp(x,"001100000001")==0){
strcpy(y,"01101010111011100101110");
}
else if(strcmp(x,"001100000010")==0){
strcpy(y,"01101010110010000010110");
}
else if(strcmp(x,"001100000011")==0){
strcpy(y,"01101010101000100000010");
}
else if(strcmp(x,"001100000100")==0){
strcpy(y,"01101010011110111110000");
}
else if(strcmp(x,"001100000101")==0){
strcpy(y,"01101010010101011100010");
}
else if(strcmp(x,"001100000110")==0){
strcpy(y,"01101010001011111010110");
}
else if(strcmp(x,"001100000111")==0){
strcpy(y,"01101010000010011001110");
}
else if(strcmp(x,"001100001000")==0){
strcpy(y,"01101001111000111001000");
}
else if(strcmp(x,"001100001001")==0){
strcpy(y,"01101001101111011000110");
}
else if(strcmp(x,"001100001010")==0){
strcpy(y,"01101001100101111000110");
}
else if(strcmp(x,"001100001011")==0){
strcpy(y,"01101001011100011001010");
}
else if(strcmp(x,"001100001100")==0){
strcpy(y,"01101001010010111010001");
}
else if(strcmp(x,"001100001101")==0){
strcpy(y,"01101001001001011011010");
}
else if(strcmp(x,"001100001110")==0){
strcpy(y,"01101000111111111100110");
}
else if(strcmp(x,"001100001111")==0){
strcpy(y,"01101000110110011110110");
}
else if(strcmp(x,"001100010000")==0){
strcpy(y,"01101000101101000001000");
}
else if(strcmp(x,"001100010001")==0){
strcpy(y,"01101000100011100011110");
}
else if(strcmp(x,"001100010010")==0){
strcpy(y,"01101000011010000110110");
}
else if(strcmp(x,"001100010011")==0){
strcpy(y,"01101000010000101010010");
}
else if(strcmp(x,"001100010100")==0){
strcpy(y,"01101000000111001110000");
}
else if(strcmp(x,"001100010101")==0){
strcpy(y,"01100111111101110010001");
}
else if(strcmp(x,"001100010110")==0){
strcpy(y,"01100111110100010110101");
}
else if(strcmp(x,"001100010111")==0){
strcpy(y,"01100111101010111011101");
}
else if(strcmp(x,"001100011000")==0){
strcpy(y,"01100111100001100000111");
}
else if(strcmp(x,"001100011001")==0){
strcpy(y,"01100111011000000110100");
}
else if(strcmp(x,"001100011010")==0){
strcpy(y,"01100111001110101100100");
}
else if(strcmp(x,"001100011011")==0){
strcpy(y,"01100111000101010010111");
}
else if(strcmp(x,"001100011100")==0){
strcpy(y,"01100110111011111001101");
}
else if(strcmp(x,"001100011101")==0){
strcpy(y,"01100110110010100000110");
}
else if(strcmp(x,"001100011110")==0){
strcpy(y,"01100110101001001000010");
}
else if(strcmp(x,"001100011111")==0){
strcpy(y,"01100110011111110000001");
}
else if(strcmp(x,"001100100000")==0){
strcpy(y,"01100110010110011000011");
}
else if(strcmp(x,"001100100001")==0){
strcpy(y,"01100110001101000001000");
}
else if(strcmp(x,"001100100010")==0){
strcpy(y,"01100110000011101001111");
}
else if(strcmp(x,"001100100011")==0){
strcpy(y,"01100101111010010011010");
}
else if(strcmp(x,"001100100100")==0){
strcpy(y,"01100101110000111100111");
}
else if(strcmp(x,"001100100101")==0){
strcpy(y,"01100101100111100111000");
}
else if(strcmp(x,"001100100110")==0){
strcpy(y,"01100101011110010001011");
}
else if(strcmp(x,"001100100111")==0){
strcpy(y,"01100101010100111100010");
}
else if(strcmp(x,"001100101000")==0){
strcpy(y,"01100101001011100111011");
}
else if(strcmp(x,"001100101001")==0){
strcpy(y,"01100101000010010010111");
}
else if(strcmp(x,"001100101010")==0){
strcpy(y,"01100100111000111110110");
}
else if(strcmp(x,"001100101011")==0){
strcpy(y,"01100100101111101011000");
}
else if(strcmp(x,"001100101100")==0){
strcpy(y,"01100100100110010111101");
}
else if(strcmp(x,"001100101101")==0){
strcpy(y,"01100100011101000100101");
}
else if(strcmp(x,"001100101110")==0){
strcpy(y,"01100100010011110001111");
}
else if(strcmp(x,"001100101111")==0){
strcpy(y,"01100100001010011111101");
}
else if(strcmp(x,"001100110000")==0){
strcpy(y,"01100100000001001101110");
}
else if(strcmp(x,"001100110001")==0){
strcpy(y,"01100011110111111100001");
}
else if(strcmp(x,"001100110010")==0){
strcpy(y,"01100011101110101010111");
}
else if(strcmp(x,"001100110011")==0){
strcpy(y,"01100011100101011010001");
}
else if(strcmp(x,"001100110100")==0){
strcpy(y,"01100011011100001001101");
}
else if(strcmp(x,"001100110101")==0){
strcpy(y,"01100011010010111001100");
}
else if(strcmp(x,"001100110110")==0){
strcpy(y,"01100011001001101001110");
}
else if(strcmp(x,"001100110111")==0){
strcpy(y,"01100011000000011010010");
}
else if(strcmp(x,"001100111000")==0){
strcpy(y,"01100010110111001011010");
}
else if(strcmp(x,"001100111001")==0){
strcpy(y,"01100010101101111100101");
}
else if(strcmp(x,"001100111010")==0){
strcpy(y,"01100010100100101110010");
}
else if(strcmp(x,"001100111011")==0){
strcpy(y,"01100010011011100000011");
}
else if(strcmp(x,"001100111100")==0){
strcpy(y,"01100010010010010010110");
}
else if(strcmp(x,"001100111101")==0){
strcpy(y,"01100010001001000101100");
}
else if(strcmp(x,"001100111110")==0){
strcpy(y,"01100001111111111000101");
}
else if(strcmp(x,"001100111111")==0){
strcpy(y,"01100001110110101100001");
}
else if(strcmp(x,"001101000000")==0){
strcpy(y,"01100001101101011111111");
}
else if(strcmp(x,"001101000001")==0){
strcpy(y,"01100001100100010100001");
}
else if(strcmp(x,"001101000010")==0){
strcpy(y,"01100001011011001000101");
}
else if(strcmp(x,"001101000011")==0){
strcpy(y,"01100001010001111101100");
}
else if(strcmp(x,"001101000100")==0){
strcpy(y,"01100001001000110010110");
}
else if(strcmp(x,"001101000101")==0){
strcpy(y,"01100000111111101000011");
}
else if(strcmp(x,"001101000110")==0){
strcpy(y,"01100000110110011110011");
}
else if(strcmp(x,"001101000111")==0){
strcpy(y,"01100000101101010100110");
}
else if(strcmp(x,"001101001000")==0){
strcpy(y,"01100000100100001011011");
}
else if(strcmp(x,"001101001001")==0){
strcpy(y,"01100000011011000010100");
}
else if(strcmp(x,"001101001010")==0){
strcpy(y,"01100000010001111001111");
}
else if(strcmp(x,"001101001011")==0){
strcpy(y,"01100000001000110001101");
}
else if(strcmp(x,"001101001100")==0){
strcpy(y,"01011111111111101001110");
}
else if(strcmp(x,"001101001101")==0){
strcpy(y,"01011111110110100010010");
}
else if(strcmp(x,"001101001110")==0){
strcpy(y,"01011111101101011011000");
}
else if(strcmp(x,"001101001111")==0){
strcpy(y,"01011111100100010100010");
}
else if(strcmp(x,"001101010000")==0){
strcpy(y,"01011111011011001101110");
}
else if(strcmp(x,"001101010001")==0){
strcpy(y,"01011111010010000111101");
}
else if(strcmp(x,"001101010010")==0){
strcpy(y,"01011111001001000001111");
}
else if(strcmp(x,"001101010011")==0){
strcpy(y,"01011110111111111100011");
}
else if(strcmp(x,"001101010100")==0){
strcpy(y,"01011110110110110111011");
}
else if(strcmp(x,"001101010101")==0){
strcpy(y,"01011110101101110010101");
}
else if(strcmp(x,"001101010110")==0){
strcpy(y,"01011110100100101110010");
}
else if(strcmp(x,"001101010111")==0){
strcpy(y,"01011110011011101010010");
}
else if(strcmp(x,"001101011000")==0){
strcpy(y,"01011110010010100110101");
}
else if(strcmp(x,"001101011001")==0){
strcpy(y,"01011110001001100011011");
}
else if(strcmp(x,"001101011010")==0){
strcpy(y,"01011110000000100000011");
}
else if(strcmp(x,"001101011011")==0){
strcpy(y,"01011101110111011101110");
}
else if(strcmp(x,"001101011100")==0){
strcpy(y,"01011101101110011011100");
}
else if(strcmp(x,"001101011101")==0){
strcpy(y,"01011101100101011001101");
}
else if(strcmp(x,"001101011110")==0){
strcpy(y,"01011101011100011000001");
}
else if(strcmp(x,"001101011111")==0){
strcpy(y,"01011101010011010110111");
}
else if(strcmp(x,"001101100000")==0){
strcpy(y,"01011101001010010110000");
}
else if(strcmp(x,"001101100001")==0){
strcpy(y,"01011101000001010101100");
}
else if(strcmp(x,"001101100010")==0){
strcpy(y,"01011100111000010101011");
}
else if(strcmp(x,"001101100011")==0){
strcpy(y,"01011100101111010101100");
}
else if(strcmp(x,"001101100100")==0){
strcpy(y,"01011100100110010110001");
}
else if(strcmp(x,"001101100101")==0){
strcpy(y,"01011100011101010111000");
}
else if(strcmp(x,"001101100110")==0){
strcpy(y,"01011100010100011000010");
}
else if(strcmp(x,"001101100111")==0){
strcpy(y,"01011100001011011001110");
}
else if(strcmp(x,"001101101000")==0){
strcpy(y,"01011100000010011011110");
}
else if(strcmp(x,"001101101001")==0){
strcpy(y,"01011011111001011110000");
}
else if(strcmp(x,"001101101010")==0){
strcpy(y,"01011011110000100000101");
}
else if(strcmp(x,"001101101011")==0){
strcpy(y,"01011011100111100011101");
}
else if(strcmp(x,"001101101100")==0){
strcpy(y,"01011011011110100110111");
}
else if(strcmp(x,"001101101101")==0){
strcpy(y,"01011011010101101010100");
}
else if(strcmp(x,"001101101110")==0){
strcpy(y,"01011011001100101110100");
}
else if(strcmp(x,"001101101111")==0){
strcpy(y,"01011011000011110010111");
}
else if(strcmp(x,"001101110000")==0){
strcpy(y,"01011010111010110111101");
}
else if(strcmp(x,"001101110001")==0){
strcpy(y,"01011010110001111100101");
}
else if(strcmp(x,"001101110010")==0){
strcpy(y,"01011010101001000010000");
}
else if(strcmp(x,"001101110011")==0){
strcpy(y,"01011010100000000111110");
}
else if(strcmp(x,"001101110100")==0){
strcpy(y,"01011010010111001101110");
}
else if(strcmp(x,"001101110101")==0){
strcpy(y,"01011010001110010100010");
}
else if(strcmp(x,"001101110110")==0){
strcpy(y,"01011010000101011011000");
}
else if(strcmp(x,"001101110111")==0){
strcpy(y,"01011001111100100010001");
}
else if(strcmp(x,"001101111000")==0){
strcpy(y,"01011001110011101001100");
}
else if(strcmp(x,"001101111001")==0){
strcpy(y,"01011001101010110001010");
}
else if(strcmp(x,"001101111010")==0){
strcpy(y,"01011001100001111001011");
}
else if(strcmp(x,"001101111011")==0){
strcpy(y,"01011001011001000001111");
}
else if(strcmp(x,"001101111100")==0){
strcpy(y,"01011001010000001010101");
}
else if(strcmp(x,"001101111101")==0){
strcpy(y,"01011001000111010011111");
}
else if(strcmp(x,"001101111110")==0){
strcpy(y,"01011000111110011101011");
}
else if(strcmp(x,"001101111111")==0){
strcpy(y,"01011000110101100111001");
}
else if(strcmp(x,"001110000000")==0){
strcpy(y,"01011000101100110001011");
}
else if(strcmp(x,"001110000001")==0){
strcpy(y,"01011000100011111011111");
}
else if(strcmp(x,"001110000010")==0){
strcpy(y,"01011000011011000110101");
}
else if(strcmp(x,"001110000011")==0){
strcpy(y,"01011000010010010001111");
}
else if(strcmp(x,"001110000100")==0){
strcpy(y,"01011000001001011101011");
}
else if(strcmp(x,"001110000101")==0){
strcpy(y,"01011000000000101001010");
}
else if(strcmp(x,"001110000110")==0){
strcpy(y,"01010111110111110101100");
}
else if(strcmp(x,"001110000111")==0){
strcpy(y,"01010111101111000010000");
}
else if(strcmp(x,"001110001000")==0){
strcpy(y,"01010111100110001110111");
}
else if(strcmp(x,"001110001001")==0){
strcpy(y,"01010111011101011100001");
}
else if(strcmp(x,"001110001010")==0){
strcpy(y,"01010111010100101001101");
}
else if(strcmp(x,"001110001011")==0){
strcpy(y,"01010111001011110111100");
}
else if(strcmp(x,"001110001100")==0){
strcpy(y,"01010111000011000101110");
}
else if(strcmp(x,"001110001101")==0){
strcpy(y,"01010110111010010100011");
}
else if(strcmp(x,"001110001110")==0){
strcpy(y,"01010110110001100011010");
}
else if(strcmp(x,"001110001111")==0){
strcpy(y,"01010110101000110010100");
}
else if(strcmp(x,"001110010000")==0){
strcpy(y,"01010110100000000010001");
}
else if(strcmp(x,"001110010001")==0){
strcpy(y,"01010110010111010010000");
}
else if(strcmp(x,"001110010010")==0){
strcpy(y,"01010110001110100010010");
}
else if(strcmp(x,"001110010011")==0){
strcpy(y,"01010110000101110010110");
}
else if(strcmp(x,"001110010100")==0){
strcpy(y,"01010101111101000011110");
}
else if(strcmp(x,"001110010101")==0){
strcpy(y,"01010101110100010101000");
}
else if(strcmp(x,"001110010110")==0){
strcpy(y,"01010101101011100110101");
}
else if(strcmp(x,"001110010111")==0){
strcpy(y,"01010101100010111000100");
}
else if(strcmp(x,"001110011000")==0){
strcpy(y,"01010101011010001010110");
}
else if(strcmp(x,"001110011001")==0){
strcpy(y,"01010101010001011101011");
}
else if(strcmp(x,"001110011010")==0){
strcpy(y,"01010101001000110000010");
}
else if(strcmp(x,"001110011011")==0){
strcpy(y,"01010101000000000011100");
}
else if(strcmp(x,"001110011100")==0){
strcpy(y,"01010100110111010111001");
}
else if(strcmp(x,"001110011101")==0){
strcpy(y,"01010100101110101011000");
}
else if(strcmp(x,"001110011110")==0){
strcpy(y,"01010100100101111111010");
}
else if(strcmp(x,"001110011111")==0){
strcpy(y,"01010100011101010011111");
}
else if(strcmp(x,"001110100000")==0){
strcpy(y,"01010100010100101000110");
}
else if(strcmp(x,"001110100001")==0){
strcpy(y,"01010100001011111110000");
}
else if(strcmp(x,"001110100010")==0){
strcpy(y,"01010100000011010011101");
}
else if(strcmp(x,"001110100011")==0){
strcpy(y,"01010011111010101001100");
}
else if(strcmp(x,"001110100100")==0){
strcpy(y,"01010011110001111111110");
}
else if(strcmp(x,"001110100101")==0){
strcpy(y,"01010011101001010110010");
}
else if(strcmp(x,"001110100110")==0){
strcpy(y,"01010011100000101101001");
}
else if(strcmp(x,"001110100111")==0){
strcpy(y,"01010011011000000100011");
}
else if(strcmp(x,"001110101000")==0){
strcpy(y,"01010011001111011100000");
}
else if(strcmp(x,"001110101001")==0){
strcpy(y,"01010011000110110011111");
}
else if(strcmp(x,"001110101010")==0){
strcpy(y,"01010010111110001100000");
}
else if(strcmp(x,"001110101011")==0){
strcpy(y,"01010010110101100100101");
}
else if(strcmp(x,"001110101100")==0){
strcpy(y,"01010010101100111101100");
}
else if(strcmp(x,"001110101101")==0){
strcpy(y,"01010010100100010110101");
}
else if(strcmp(x,"001110101110")==0){
strcpy(y,"01010010011011110000010");
}
else if(strcmp(x,"001110101111")==0){
strcpy(y,"01010010010011001010001");
}
else if(strcmp(x,"001110110000")==0){
strcpy(y,"01010010001010100100010");
}
else if(strcmp(x,"001110110001")==0){
strcpy(y,"01010010000001111110110");
}
else if(strcmp(x,"001110110010")==0){
strcpy(y,"01010001111001011001101");
}
else if(strcmp(x,"001110110011")==0){
strcpy(y,"01010001110000110100110");
}
else if(strcmp(x,"001110110100")==0){
strcpy(y,"01010001101000010000010");
}
else if(strcmp(x,"001110110101")==0){
strcpy(y,"01010001011111101100001");
}
else if(strcmp(x,"001110110110")==0){
strcpy(y,"01010001010111001000010");
}
else if(strcmp(x,"001110110111")==0){
strcpy(y,"01010001001110100100101");
}
else if(strcmp(x,"001110111000")==0){
strcpy(y,"01010001000110000001100");
}
else if(strcmp(x,"001110111001")==0){
strcpy(y,"01010000111101011110101");
}
else if(strcmp(x,"001110111010")==0){
strcpy(y,"01010000110100111100000");
}
else if(strcmp(x,"001110111011")==0){
strcpy(y,"01010000101100011001110");
}
else if(strcmp(x,"001110111100")==0){
strcpy(y,"01010000100011110111111");
}
else if(strcmp(x,"001110111101")==0){
strcpy(y,"01010000011011010110011");
}
else if(strcmp(x,"001110111110")==0){
strcpy(y,"01010000010010110101000");
}
else if(strcmp(x,"001110111111")==0){
strcpy(y,"01010000001010010100001");
}
else if(strcmp(x,"001111000000")==0){
strcpy(y,"01010000000001110011100");
}
else if(strcmp(x,"001111000001")==0){
strcpy(y,"01001111111001010011010");
}
else if(strcmp(x,"001111000010")==0){
strcpy(y,"01001111110000110011010");
}
else if(strcmp(x,"001111000011")==0){
strcpy(y,"01001111101000010011101");
}
else if(strcmp(x,"001111000100")==0){
strcpy(y,"01001111011111110100010");
}
else if(strcmp(x,"001111000101")==0){
strcpy(y,"01001111010111010101010");
}
else if(strcmp(x,"001111000110")==0){
strcpy(y,"01001111001110110110101");
}
else if(strcmp(x,"001111000111")==0){
strcpy(y,"01001111000110011000010");
}
else if(strcmp(x,"001111001000")==0){
strcpy(y,"01001110111101111010010");
}
else if(strcmp(x,"001111001001")==0){
strcpy(y,"01001110110101011100100");
}
else if(strcmp(x,"001111001010")==0){
strcpy(y,"01001110101100111111001");
}
else if(strcmp(x,"001111001011")==0){
strcpy(y,"01001110100100100010000");
}
else if(strcmp(x,"001111001100")==0){
strcpy(y,"01001110011100000101010");
}
else if(strcmp(x,"001111001101")==0){
strcpy(y,"01001110010011101000111");
}
else if(strcmp(x,"001111001110")==0){
strcpy(y,"01001110001011001100110");
}
else if(strcmp(x,"001111001111")==0){
strcpy(y,"01001110000010110001000");
}
else if(strcmp(x,"001111010000")==0){
strcpy(y,"01001101111010010101100");
}
else if(strcmp(x,"001111010001")==0){
strcpy(y,"01001101110001111010011");
}
else if(strcmp(x,"001111010010")==0){
strcpy(y,"01001101101001011111100");
}
else if(strcmp(x,"001111010011")==0){
strcpy(y,"01001101100001000101000");
}
else if(strcmp(x,"001111010100")==0){
strcpy(y,"01001101011000101010110");
}
else if(strcmp(x,"001111010101")==0){
strcpy(y,"01001101010000010000111");
}
else if(strcmp(x,"001111010110")==0){
strcpy(y,"01001101000111110111011");
}
else if(strcmp(x,"001111010111")==0){
strcpy(y,"01001100111111011110001");
}
else if(strcmp(x,"001111011000")==0){
strcpy(y,"01001100110111000101001");
}
else if(strcmp(x,"001111011001")==0){
strcpy(y,"01001100101110101100100");
}
else if(strcmp(x,"001111011010")==0){
strcpy(y,"01001100100110010100010");
}
else if(strcmp(x,"001111011011")==0){
strcpy(y,"01001100011101111100010");
}
else if(strcmp(x,"001111011100")==0){
strcpy(y,"01001100010101100100101");
}
else if(strcmp(x,"001111011101")==0){
strcpy(y,"01001100001101001101010");
}
else if(strcmp(x,"001111011110")==0){
strcpy(y,"01001100000100110110010");
}
else if(strcmp(x,"001111011111")==0){
strcpy(y,"01001011111100011111100");
}
else if(strcmp(x,"001111100000")==0){
strcpy(y,"01001011110100001001001");
}
else if(strcmp(x,"001111100001")==0){
strcpy(y,"01001011101011110011000");
}
else if(strcmp(x,"001111100010")==0){
strcpy(y,"01001011100011011101010");
}
else if(strcmp(x,"001111100011")==0){
strcpy(y,"01001011011011000111110");
}
else if(strcmp(x,"001111100100")==0){
strcpy(y,"01001011010010110010101");
}
else if(strcmp(x,"001111100101")==0){
strcpy(y,"01001011001010011101111");
}
else if(strcmp(x,"001111100110")==0){
strcpy(y,"01001011000010001001010");
}
else if(strcmp(x,"001111100111")==0){
strcpy(y,"01001010111001110101001");
}
else if(strcmp(x,"001111101000")==0){
strcpy(y,"01001010110001100001010");
}
else if(strcmp(x,"001111101001")==0){
strcpy(y,"01001010101001001101101");
}
else if(strcmp(x,"001111101010")==0){
strcpy(y,"01001010100000111010011");
}
else if(strcmp(x,"001111101011")==0){
strcpy(y,"01001010011000100111100");
}
else if(strcmp(x,"001111101100")==0){
strcpy(y,"01001010010000010100110");
}
else if(strcmp(x,"001111101101")==0){
strcpy(y,"01001010001000000010100");
}
else if(strcmp(x,"001111101110")==0){
strcpy(y,"01001001111111110000100");
}
else if(strcmp(x,"001111101111")==0){
strcpy(y,"01001001110111011110110");
}
else if(strcmp(x,"001111110000")==0){
strcpy(y,"01001001101111001101011");
}
else if(strcmp(x,"001111110001")==0){
strcpy(y,"01001001100110111100010");
}
else if(strcmp(x,"001111110010")==0){
strcpy(y,"01001001011110101011100");
}
else if(strcmp(x,"001111110011")==0){
strcpy(y,"01001001010110011011001");
}
else if(strcmp(x,"001111110100")==0){
strcpy(y,"01001001001110001010111");
}
else if(strcmp(x,"001111110101")==0){
strcpy(y,"01001001000101111011001");
}
else if(strcmp(x,"001111110110")==0){
strcpy(y,"01001000111101101011100");
}
else if(strcmp(x,"001111110111")==0){
strcpy(y,"01001000110101011100011");
}
else if(strcmp(x,"001111111000")==0){
strcpy(y,"01001000101101001101011");
}
else if(strcmp(x,"001111111001")==0){
strcpy(y,"01001000100100111110111");
}
else if(strcmp(x,"001111111010")==0){
strcpy(y,"01001000011100110000100");
}
else if(strcmp(x,"001111111011")==0){
strcpy(y,"01001000010100100010101");
}
else if(strcmp(x,"001111111100")==0){
strcpy(y,"01001000001100010100111");
}
else if(strcmp(x,"001111111101")==0){
strcpy(y,"01001000000100000111100");
}
else if(strcmp(x,"001111111110")==0){
strcpy(y,"01000111111011111010100");
}
else if(strcmp(x,"001111111111")==0){
strcpy(y,"01000111110011101101110");
}
else if(strcmp(x,"010000000000")==0){
strcpy(y,"01000111101011100001010");
}
else if(strcmp(x,"010000000001")==0){
strcpy(y,"01000111100011010101001");
}
else if(strcmp(x,"010000000010")==0){
strcpy(y,"01000111011011001001011");
}
else if(strcmp(x,"010000000011")==0){
strcpy(y,"01000111010010111101110");
}
else if(strcmp(x,"010000000100")==0){
strcpy(y,"01000111001010110010101");
}
else if(strcmp(x,"010000000101")==0){
strcpy(y,"01000111000010100111101");
}
else if(strcmp(x,"010000000110")==0){
strcpy(y,"01000110111010011101001");
}
else if(strcmp(x,"010000000111")==0){
strcpy(y,"01000110110010010010110");
}
else if(strcmp(x,"010000001000")==0){
strcpy(y,"01000110101010001000110");
}
else if(strcmp(x,"010000001001")==0){
strcpy(y,"01000110100001111111001");
}
else if(strcmp(x,"010000001010")==0){
strcpy(y,"01000110011001110101110");
}
else if(strcmp(x,"010000001011")==0){
strcpy(y,"01000110010001101100101");
}
else if(strcmp(x,"010000001100")==0){
strcpy(y,"01000110001001100011111");
}
else if(strcmp(x,"010000001101")==0){
strcpy(y,"01000110000001011011011");
}
else if(strcmp(x,"010000001110")==0){
strcpy(y,"01000101111001010011010");
}
else if(strcmp(x,"010000001111")==0){
strcpy(y,"01000101110001001011011");
}
else if(strcmp(x,"010000010000")==0){
strcpy(y,"01000101101001000011111");
}
else if(strcmp(x,"010000010001")==0){
strcpy(y,"01000101100000111100101");
}
else if(strcmp(x,"010000010010")==0){
strcpy(y,"01000101011000110101101");
}
else if(strcmp(x,"010000010011")==0){
strcpy(y,"01000101010000101111000");
}
else if(strcmp(x,"010000010100")==0){
strcpy(y,"01000101001000101000101");
}
else if(strcmp(x,"010000010101")==0){
strcpy(y,"01000101000000100010101");
}
else if(strcmp(x,"010000010110")==0){
strcpy(y,"01000100111000011100111");
}
else if(strcmp(x,"010000010111")==0){
strcpy(y,"01000100110000010111011");
}
else if(strcmp(x,"010000011000")==0){
strcpy(y,"01000100101000010010010");
}
else if(strcmp(x,"010000011001")==0){
strcpy(y,"01000100100000001101100");
}
else if(strcmp(x,"010000011010")==0){
strcpy(y,"01000100011000001000111");
}
else if(strcmp(x,"010000011011")==0){
strcpy(y,"01000100010000000100110");
}
else if(strcmp(x,"010000011100")==0){
strcpy(y,"01000100001000000000110");
}
else if(strcmp(x,"010000011101")==0){
strcpy(y,"01000011111111111101001");
}
else if(strcmp(x,"010000011110")==0){
strcpy(y,"01000011110111111001110");
}
else if(strcmp(x,"010000011111")==0){
strcpy(y,"01000011101111110110110");
}
else if(strcmp(x,"010000100000")==0){
strcpy(y,"01000011100111110100000");
}
else if(strcmp(x,"010000100001")==0){
strcpy(y,"01000011011111110001101");
}
else if(strcmp(x,"010000100010")==0){
strcpy(y,"01000011010111101111100");
}
else if(strcmp(x,"010000100011")==0){
strcpy(y,"01000011001111101101101");
}
else if(strcmp(x,"010000100100")==0){
strcpy(y,"01000011000111101100001");
}
else if(strcmp(x,"010000100101")==0){
strcpy(y,"01000010111111101010111");
}
else if(strcmp(x,"010000100110")==0){
strcpy(y,"01000010110111101010000");
}
else if(strcmp(x,"010000100111")==0){
strcpy(y,"01000010101111101001011");
}
else if(strcmp(x,"010000101000")==0){
strcpy(y,"01000010100111101001000");
}
else if(strcmp(x,"010000101001")==0){
strcpy(y,"01000010011111101001000");
}
else if(strcmp(x,"010000101010")==0){
strcpy(y,"01000010010111101001010");
}
else if(strcmp(x,"010000101011")==0){
strcpy(y,"01000010001111101001110");
}
else if(strcmp(x,"010000101100")==0){
strcpy(y,"01000010000111101010101");
}
else if(strcmp(x,"010000101101")==0){
strcpy(y,"01000001111111101011110");
}
else if(strcmp(x,"010000101110")==0){
strcpy(y,"01000001110111101101010");
}
else if(strcmp(x,"010000101111")==0){
strcpy(y,"01000001101111101111000");
}
else if(strcmp(x,"010000110000")==0){
strcpy(y,"01000001100111110001000");
}
else if(strcmp(x,"010000110001")==0){
strcpy(y,"01000001011111110011010");
}
else if(strcmp(x,"010000110010")==0){
strcpy(y,"01000001010111110110000");
}
else if(strcmp(x,"010000110011")==0){
strcpy(y,"01000001001111111000111");
}
else if(strcmp(x,"010000110100")==0){
strcpy(y,"01000001000111111100001");
}
else if(strcmp(x,"010000110101")==0){
strcpy(y,"01000000111111111111101");
}
else if(strcmp(x,"010000110110")==0){
strcpy(y,"01000000111000000011011");
}
else if(strcmp(x,"010000110111")==0){
strcpy(y,"01000000110000000111100");
}
else if(strcmp(x,"010000111000")==0){
strcpy(y,"01000000101000001011111");
}
else if(strcmp(x,"010000111001")==0){
strcpy(y,"01000000100000010000101");
}
else if(strcmp(x,"010000111010")==0){
strcpy(y,"01000000011000010101101");
}
else if(strcmp(x,"010000111011")==0){
strcpy(y,"01000000010000011010111");
}
else if(strcmp(x,"010000111100")==0){
strcpy(y,"01000000001000100000100");
}
else if(strcmp(x,"010000111101")==0){
strcpy(y,"01000000000000100110010");
}
else if(strcmp(x,"010000111110")==0){
strcpy(y,"00111111111000101100100");
}
else if(strcmp(x,"010000111111")==0){
strcpy(y,"00111111110000110010111");
}
else if(strcmp(x,"010001000000")==0){
strcpy(y,"00111111101000111001101");
}
else if(strcmp(x,"010001000001")==0){
strcpy(y,"00111111100001000000110");
}
else if(strcmp(x,"010001000010")==0){
strcpy(y,"00111111011001001000000");
}
else if(strcmp(x,"010001000011")==0){
strcpy(y,"00111111010001001111101");
}
else if(strcmp(x,"010001000100")==0){
strcpy(y,"00111111001001010111101");
}
else if(strcmp(x,"010001000101")==0){
strcpy(y,"00111111000001011111110");
}
else if(strcmp(x,"010001000110")==0){
strcpy(y,"00111110111001101000010");
}
else if(strcmp(x,"010001000111")==0){
strcpy(y,"00111110110001110001000");
}
else if(strcmp(x,"010001001000")==0){
strcpy(y,"00111110101001111010001");
}
else if(strcmp(x,"010001001001")==0){
strcpy(y,"00111110100010000011100");
}
else if(strcmp(x,"010001001010")==0){
strcpy(y,"00111110011010001101001");
}
else if(strcmp(x,"010001001011")==0){
strcpy(y,"00111110010010010111001");
}
else if(strcmp(x,"010001001100")==0){
strcpy(y,"00111110001010100001011");
}
else if(strcmp(x,"010001001101")==0){
strcpy(y,"00111110000010101011111");
}
else if(strcmp(x,"010001001110")==0){
strcpy(y,"00111101111010110110110");
}
else if(strcmp(x,"010001001111")==0){
strcpy(y,"00111101110011000001110");
}
else if(strcmp(x,"010001010000")==0){
strcpy(y,"00111101101011001101010");
}
else if(strcmp(x,"010001010001")==0){
strcpy(y,"00111101100011011000111");
}
else if(strcmp(x,"010001010010")==0){
strcpy(y,"00111101011011100100111");
}
else if(strcmp(x,"010001010011")==0){
strcpy(y,"00111101010011110001001");
}
else if(strcmp(x,"010001010100")==0){
strcpy(y,"00111101001011111101101");
}
else if(strcmp(x,"010001010101")==0){
strcpy(y,"00111101000100001010100");
}
else if(strcmp(x,"010001010110")==0){
strcpy(y,"00111100111100010111101");
}
else if(strcmp(x,"010001010111")==0){
strcpy(y,"00111100110100100101000");
}
else if(strcmp(x,"010001011000")==0){
strcpy(y,"00111100101100110010110");
}
else if(strcmp(x,"010001011001")==0){
strcpy(y,"00111100100101000000110");
}
else if(strcmp(x,"010001011010")==0){
strcpy(y,"00111100011101001111000");
}
else if(strcmp(x,"010001011011")==0){
strcpy(y,"00111100010101011101100");
}
else if(strcmp(x,"010001011100")==0){
strcpy(y,"00111100001101101100011");
}
else if(strcmp(x,"010001011101")==0){
strcpy(y,"00111100000101111011100");
}
else if(strcmp(x,"010001011110")==0){
strcpy(y,"00111011111110001011000");
}
else if(strcmp(x,"010001011111")==0){
strcpy(y,"00111011110110011010101");
}
else if(strcmp(x,"010001100000")==0){
strcpy(y,"00111011101110101010101");
}
else if(strcmp(x,"010001100001")==0){
strcpy(y,"00111011100110111010111");
}
else if(strcmp(x,"010001100010")==0){
strcpy(y,"00111011011111001011100");
}
else if(strcmp(x,"010001100011")==0){
strcpy(y,"00111011010111011100010");
}
else if(strcmp(x,"010001100100")==0){
strcpy(y,"00111011001111101101011");
}
else if(strcmp(x,"010001100101")==0){
strcpy(y,"00111011000111111110111");
}
else if(strcmp(x,"010001100110")==0){
strcpy(y,"00111011000000010000100");
}
else if(strcmp(x,"010001100111")==0){
strcpy(y,"00111010111000100010100");
}
else if(strcmp(x,"010001101000")==0){
strcpy(y,"00111010110000110100110");
}
else if(strcmp(x,"010001101001")==0){
strcpy(y,"00111010101001000111011");
}
else if(strcmp(x,"010001101010")==0){
strcpy(y,"00111010100001011010001");
}
else if(strcmp(x,"010001101011")==0){
strcpy(y,"00111010011001101101010");
}
else if(strcmp(x,"010001101100")==0){
strcpy(y,"00111010010010000000101");
}
else if(strcmp(x,"010001101101")==0){
strcpy(y,"00111010001010010100011");
}
else if(strcmp(x,"010001101110")==0){
strcpy(y,"00111010000010101000011");
}
else if(strcmp(x,"010001101111")==0){
strcpy(y,"00111001111010111100100");
}
else if(strcmp(x,"010001110000")==0){
strcpy(y,"00111001110011010001001");
}
else if(strcmp(x,"010001110001")==0){
strcpy(y,"00111001101011100101111");
}
else if(strcmp(x,"010001110010")==0){
strcpy(y,"00111001100011111011000");
}
else if(strcmp(x,"010001110011")==0){
strcpy(y,"00111001011100010000011");
}
else if(strcmp(x,"010001110100")==0){
strcpy(y,"00111001010100100110000");
}
else if(strcmp(x,"010001110101")==0){
strcpy(y,"00111001001100111011111");
}
else if(strcmp(x,"010001110110")==0){
strcpy(y,"00111001000101010010001");
}
else if(strcmp(x,"010001110111")==0){
strcpy(y,"00111000111101101000101");
}
else if(strcmp(x,"010001111000")==0){
strcpy(y,"00111000110101111111011");
}
else if(strcmp(x,"010001111001")==0){
strcpy(y,"00111000101110010110100");
}
else if(strcmp(x,"010001111010")==0){
strcpy(y,"00111000100110101101110");
}
else if(strcmp(x,"010001111011")==0){
strcpy(y,"00111000011111000101011");
}
else if(strcmp(x,"010001111100")==0){
strcpy(y,"00111000010111011101010");
}
else if(strcmp(x,"010001111101")==0){
strcpy(y,"00111000001111110101100");
}
else if(strcmp(x,"010001111110")==0){
strcpy(y,"00111000001000001101111");
}
else if(strcmp(x,"010001111111")==0){
strcpy(y,"00111000000000100110101");
}
else if(strcmp(x,"010010000000")==0){
strcpy(y,"00110111111000111111101");
}
else if(strcmp(x,"010010000001")==0){
strcpy(y,"00110111110001011001000");
}
else if(strcmp(x,"010010000010")==0){
strcpy(y,"00110111101001110010100");
}
else if(strcmp(x,"010010000011")==0){
strcpy(y,"00110111100010001100011");
}
else if(strcmp(x,"010010000100")==0){
strcpy(y,"00110111011010100110100");
}
else if(strcmp(x,"010010000101")==0){
strcpy(y,"00110111010011000000111");
}
else if(strcmp(x,"010010000110")==0){
strcpy(y,"00110111001011011011100");
}
else if(strcmp(x,"010010000111")==0){
strcpy(y,"00110111000011110110100");
}
else if(strcmp(x,"010010001000")==0){
strcpy(y,"00110110111100010001110");
}
else if(strcmp(x,"010010001001")==0){
strcpy(y,"00110110110100101101010");
}
else if(strcmp(x,"010010001010")==0){
strcpy(y,"00110110101101001001000");
}
else if(strcmp(x,"010010001011")==0){
strcpy(y,"00110110100101100101000");
}
else if(strcmp(x,"010010001100")==0){
strcpy(y,"00110110011110000001011");
}
else if(strcmp(x,"010010001101")==0){
strcpy(y,"00110110010110011110000");
}
else if(strcmp(x,"010010001110")==0){
strcpy(y,"00110110001110111010111");
}
else if(strcmp(x,"010010001111")==0){
strcpy(y,"00110110000111011000000");
}
else if(strcmp(x,"010010010000")==0){
strcpy(y,"00110101111111110101100");
}
else if(strcmp(x,"010010010001")==0){
strcpy(y,"00110101111000010011010");
}
else if(strcmp(x,"010010010010")==0){
strcpy(y,"00110101110000110001001");
}
else if(strcmp(x,"010010010011")==0){
strcpy(y,"00110101101001001111011");
}
else if(strcmp(x,"010010010100")==0){
strcpy(y,"00110101100001101110000");
}
else if(strcmp(x,"010010010101")==0){
strcpy(y,"00110101011010001100110");
}
else if(strcmp(x,"010010010110")==0){
strcpy(y,"00110101010010101011111");
}
else if(strcmp(x,"010010010111")==0){
strcpy(y,"00110101001011001011010");
}
else if(strcmp(x,"010010011000")==0){
strcpy(y,"00110101000011101010111");
}
else if(strcmp(x,"010010011001")==0){
strcpy(y,"00110100111100001010110");
}
else if(strcmp(x,"010010011010")==0){
strcpy(y,"00110100110100101010111");
}
else if(strcmp(x,"010010011011")==0){
strcpy(y,"00110100101101001011011");
}
else if(strcmp(x,"010010011100")==0){
strcpy(y,"00110100100101101100001");
}
else if(strcmp(x,"010010011101")==0){
strcpy(y,"00110100011110001101001");
}
else if(strcmp(x,"010010011110")==0){
strcpy(y,"00110100010110101110011");
}
else if(strcmp(x,"010010011111")==0){
strcpy(y,"00110100001111001111111");
}
else if(strcmp(x,"010010100000")==0){
strcpy(y,"00110100000111110001110");
}
else if(strcmp(x,"010010100001")==0){
strcpy(y,"00110100000000010011110");
}
else if(strcmp(x,"010010100010")==0){
strcpy(y,"00110011111000110110001");
}
else if(strcmp(x,"010010100011")==0){
strcpy(y,"00110011110001011000110");
}
else if(strcmp(x,"010010100100")==0){
strcpy(y,"00110011101001111011101");
}
else if(strcmp(x,"010010100101")==0){
strcpy(y,"00110011100010011110110");
}
else if(strcmp(x,"010010100110")==0){
strcpy(y,"00110011011011000010010");
}
else if(strcmp(x,"010010100111")==0){
strcpy(y,"00110011010011100110000");
}
else if(strcmp(x,"010010101000")==0){
strcpy(y,"00110011001100001001111");
}
else if(strcmp(x,"010010101001")==0){
strcpy(y,"00110011000100101110001");
}
else if(strcmp(x,"010010101010")==0){
strcpy(y,"00110010111101010010101");
}
else if(strcmp(x,"010010101011")==0){
strcpy(y,"00110010110101110111100");
}
else if(strcmp(x,"010010101100")==0){
strcpy(y,"00110010101110011100100");
}
else if(strcmp(x,"010010101101")==0){
strcpy(y,"00110010100111000001111");
}
else if(strcmp(x,"010010101110")==0){
strcpy(y,"00110010011111100111100");
}
else if(strcmp(x,"010010101111")==0){
strcpy(y,"00110010011000001101010");
}
else if(strcmp(x,"010010110000")==0){
strcpy(y,"00110010010000110011011");
}
else if(strcmp(x,"010010110001")==0){
strcpy(y,"00110010001001011001111");
}
else if(strcmp(x,"010010110010")==0){
strcpy(y,"00110010000010000000100");
}
else if(strcmp(x,"010010110011")==0){
strcpy(y,"00110001111010100111011");
}
else if(strcmp(x,"010010110100")==0){
strcpy(y,"00110001110011001110101");
}
else if(strcmp(x,"010010110101")==0){
strcpy(y,"00110001101011110110001");
}
else if(strcmp(x,"010010110110")==0){
strcpy(y,"00110001100100011101111");
}
else if(strcmp(x,"010010110111")==0){
strcpy(y,"00110001011101000101111");
}
else if(strcmp(x,"010010111000")==0){
strcpy(y,"00110001010101101110001");
}
else if(strcmp(x,"010010111001")==0){
strcpy(y,"00110001001110010110101");
}
else if(strcmp(x,"010010111010")==0){
strcpy(y,"00110001000110111111100");
}
else if(strcmp(x,"010010111011")==0){
strcpy(y,"00110000111111101000100");
}
else if(strcmp(x,"010010111100")==0){
strcpy(y,"00110000111000010001111");
}
else if(strcmp(x,"010010111101")==0){
strcpy(y,"00110000110000111011100");
}
else if(strcmp(x,"010010111110")==0){
strcpy(y,"00110000101001100101011");
}
else if(strcmp(x,"010010111111")==0){
strcpy(y,"00110000100010001111100");
}
else if(strcmp(x,"010011000000")==0){
strcpy(y,"00110000011010111001111");
}
else if(strcmp(x,"010011000001")==0){
strcpy(y,"00110000010011100100100");
}
else if(strcmp(x,"010011000010")==0){
strcpy(y,"00110000001100001111100");
}
else if(strcmp(x,"010011000011")==0){
strcpy(y,"00110000000100111010101");
}
else if(strcmp(x,"010011000100")==0){
strcpy(y,"00101111111101100110001");
}
else if(strcmp(x,"010011000101")==0){
strcpy(y,"00101111110110010001111");
}
else if(strcmp(x,"010011000110")==0){
strcpy(y,"00101111101110111101111");
}
else if(strcmp(x,"010011000111")==0){
strcpy(y,"00101111100111101010001");
}
else if(strcmp(x,"010011001000")==0){
strcpy(y,"00101111100000010110101");
}
else if(strcmp(x,"010011001001")==0){
strcpy(y,"00101111011001000011011");
}
else if(strcmp(x,"010011001010")==0){
strcpy(y,"00101111010001110000011");
}
else if(strcmp(x,"010011001011")==0){
strcpy(y,"00101111001010011101110");
}
else if(strcmp(x,"010011001100")==0){
strcpy(y,"00101111000011001011010");
}
else if(strcmp(x,"010011001101")==0){
strcpy(y,"00101110111011111001001");
}
else if(strcmp(x,"010011001110")==0){
strcpy(y,"00101110110100100111010");
}
else if(strcmp(x,"010011001111")==0){
strcpy(y,"00101110101101010101101");
}
else if(strcmp(x,"010011010000")==0){
strcpy(y,"00101110100110000100010");
}
else if(strcmp(x,"010011010001")==0){
strcpy(y,"00101110011110110011001");
}
else if(strcmp(x,"010011010010")==0){
strcpy(y,"00101110010111100010010");
}
else if(strcmp(x,"010011010011")==0){
strcpy(y,"00101110010000010001101");
}
else if(strcmp(x,"010011010100")==0){
strcpy(y,"00101110001001000001010");
}
else if(strcmp(x,"010011010101")==0){
strcpy(y,"00101110000001110001010");
}
else if(strcmp(x,"010011010110")==0){
strcpy(y,"00101101111010100001011");
}
else if(strcmp(x,"010011010111")==0){
strcpy(y,"00101101110011010001111");
}
else if(strcmp(x,"010011011000")==0){
strcpy(y,"00101101101100000010100");
}
else if(strcmp(x,"010011011001")==0){
strcpy(y,"00101101100100110011100");
}
else if(strcmp(x,"010011011010")==0){
strcpy(y,"00101101011101100100110");
}
else if(strcmp(x,"010011011011")==0){
strcpy(y,"00101101010110010110010");
}
else if(strcmp(x,"010011011100")==0){
strcpy(y,"00101101001111001000000");
}
else if(strcmp(x,"010011011101")==0){
strcpy(y,"00101101000111111010000");
}
else if(strcmp(x,"010011011110")==0){
strcpy(y,"00101101000000101100010");
}
else if(strcmp(x,"010011011111")==0){
strcpy(y,"00101100111001011110110");
}
else if(strcmp(x,"010011100000")==0){
strcpy(y,"00101100110010010001101");
}
else if(strcmp(x,"010011100001")==0){
strcpy(y,"00101100101011000100101");
}
else if(strcmp(x,"010011100010")==0){
strcpy(y,"00101100100011110111111");
}
else if(strcmp(x,"010011100011")==0){
strcpy(y,"00101100011100101011100");
}
else if(strcmp(x,"010011100100")==0){
strcpy(y,"00101100010101011111011");
}
else if(strcmp(x,"010011100101")==0){
strcpy(y,"00101100001110010011011");
}
else if(strcmp(x,"010011100110")==0){
strcpy(y,"00101100000111000111110");
}
else if(strcmp(x,"010011100111")==0){
strcpy(y,"00101011111111111100011");
}
else if(strcmp(x,"010011101000")==0){
strcpy(y,"00101011111000110001001");
}
else if(strcmp(x,"010011101001")==0){
strcpy(y,"00101011110001100110010");
}
else if(strcmp(x,"010011101010")==0){
strcpy(y,"00101011101010011011101");
}
else if(strcmp(x,"010011101011")==0){
strcpy(y,"00101011100011010001010");
}
else if(strcmp(x,"010011101100")==0){
strcpy(y,"00101011011100000111001");
}
else if(strcmp(x,"010011101101")==0){
strcpy(y,"00101011010100111101010");
}
else if(strcmp(x,"010011101110")==0){
strcpy(y,"00101011001101110011101");
}
else if(strcmp(x,"010011101111")==0){
strcpy(y,"00101011000110101010011");
}
else if(strcmp(x,"010011110000")==0){
strcpy(y,"00101010111111100001010");
}
else if(strcmp(x,"010011110001")==0){
strcpy(y,"00101010111000011000011");
}
else if(strcmp(x,"010011110010")==0){
strcpy(y,"00101010110001001111110");
}
else if(strcmp(x,"010011110011")==0){
strcpy(y,"00101010101010000111100");
}
else if(strcmp(x,"010011110100")==0){
strcpy(y,"00101010100010111111011");
}
else if(strcmp(x,"010011110101")==0){
strcpy(y,"00101010011011110111101");
}
else if(strcmp(x,"010011110110")==0){
strcpy(y,"00101010010100110000000");
}
else if(strcmp(x,"010011110111")==0){
strcpy(y,"00101010001101101000110");
}
else if(strcmp(x,"010011111000")==0){
strcpy(y,"00101010000110100001101");
}
else if(strcmp(x,"010011111001")==0){
strcpy(y,"00101001111111011010111");
}
else if(strcmp(x,"010011111010")==0){
strcpy(y,"00101001111000010100010");
}
else if(strcmp(x,"010011111011")==0){
strcpy(y,"00101001110001001110000");
}
else if(strcmp(x,"010011111100")==0){
strcpy(y,"00101001101010001000000");
}
else if(strcmp(x,"010011111101")==0){
strcpy(y,"00101001100011000010010");
}
else if(strcmp(x,"010011111110")==0){
strcpy(y,"00101001011011111100101");
}
else if(strcmp(x,"010011111111")==0){
strcpy(y,"00101001010100110111011");
}
else if(strcmp(x,"010100000000")==0){
strcpy(y,"00101001001101110010011");
}
else if(strcmp(x,"010100000001")==0){
strcpy(y,"00101001000110101101101");
}
else if(strcmp(x,"010100000010")==0){
strcpy(y,"00101000111111101001001");
}
else if(strcmp(x,"010100000011")==0){
strcpy(y,"00101000111000100100110");
}
else if(strcmp(x,"010100000100")==0){
strcpy(y,"00101000110001100000110");
}
else if(strcmp(x,"010100000101")==0){
strcpy(y,"00101000101010011101000");
}
else if(strcmp(x,"010100000110")==0){
strcpy(y,"00101000100011011001100");
}
else if(strcmp(x,"010100000111")==0){
strcpy(y,"00101000011100010110010");
}
else if(strcmp(x,"010100001000")==0){
strcpy(y,"00101000010101010011010");
}
else if(strcmp(x,"010100001001")==0){
strcpy(y,"00101000001110010000100");
}
else if(strcmp(x,"010100001010")==0){
strcpy(y,"00101000000111001110000");
}
else if(strcmp(x,"010100001011")==0){
strcpy(y,"00101000000000001011110");
}
else if(strcmp(x,"010100001100")==0){
strcpy(y,"00100111111001001001110");
}
else if(strcmp(x,"010100001101")==0){
strcpy(y,"00100111110010001000000");
}
else if(strcmp(x,"010100001110")==0){
strcpy(y,"00100111101011000110100");
}
else if(strcmp(x,"010100001111")==0){
strcpy(y,"00100111100100000101010");
}
else if(strcmp(x,"010100010000")==0){
strcpy(y,"00100111011101000100001");
}
else if(strcmp(x,"010100010001")==0){
strcpy(y,"00100111010110000011011");
}
else if(strcmp(x,"010100010010")==0){
strcpy(y,"00100111001111000010111");
}
else if(strcmp(x,"010100010011")==0){
strcpy(y,"00100111001000000010101");
}
else if(strcmp(x,"010100010100")==0){
strcpy(y,"00100111000001000010101");
}
else if(strcmp(x,"010100010101")==0){
strcpy(y,"00100110111010000010111");
}
else if(strcmp(x,"010100010110")==0){
strcpy(y,"00100110110011000011011");
}
else if(strcmp(x,"010100010111")==0){
strcpy(y,"00100110101100000100001");
}
else if(strcmp(x,"010100011000")==0){
strcpy(y,"00100110100101000101001");
}
else if(strcmp(x,"010100011001")==0){
strcpy(y,"00100110011110000110011");
}
else if(strcmp(x,"010100011010")==0){
strcpy(y,"00100110010111000111111");
}
else if(strcmp(x,"010100011011")==0){
strcpy(y,"00100110010000001001101");
}
else if(strcmp(x,"010100011100")==0){
strcpy(y,"00100110001001001011100");
}
else if(strcmp(x,"010100011101")==0){
strcpy(y,"00100110000010001101110");
}
else if(strcmp(x,"010100011110")==0){
strcpy(y,"00100101111011010000010");
}
else if(strcmp(x,"010100011111")==0){
strcpy(y,"00100101110100010011000");
}
else if(strcmp(x,"010100100000")==0){
strcpy(y,"00100101101101010110000");
}
else if(strcmp(x,"010100100001")==0){
strcpy(y,"00100101100110011001001");
}
else if(strcmp(x,"010100100010")==0){
strcpy(y,"00100101011111011100101");
}
else if(strcmp(x,"010100100011")==0){
strcpy(y,"00100101011000100000011");
}
else if(strcmp(x,"010100100100")==0){
strcpy(y,"00100101010001100100010");
}
else if(strcmp(x,"010100100101")==0){
strcpy(y,"00100101001010101000100");
}
else if(strcmp(x,"010100100110")==0){
strcpy(y,"00100101000011101101000");
}
else if(strcmp(x,"010100100111")==0){
strcpy(y,"00100100111100110001101");
}
else if(strcmp(x,"010100101000")==0){
strcpy(y,"00100100110101110110101");
}
else if(strcmp(x,"010100101001")==0){
strcpy(y,"00100100101110111011110");
}
else if(strcmp(x,"010100101010")==0){
strcpy(y,"00100100101000000001001");
}
else if(strcmp(x,"010100101011")==0){
strcpy(y,"00100100100001000110111");
}
else if(strcmp(x,"010100101100")==0){
strcpy(y,"00100100011010001100110");
}
else if(strcmp(x,"010100101101")==0){
strcpy(y,"00100100010011010011000");
}
else if(strcmp(x,"010100101110")==0){
strcpy(y,"00100100001100011001011");
}
else if(strcmp(x,"010100101111")==0){
strcpy(y,"00100100000101100000000");
}
else if(strcmp(x,"010100110000")==0){
strcpy(y,"00100011111110100110111");
}
else if(strcmp(x,"010100110001")==0){
strcpy(y,"00100011110111101110000");
}
else if(strcmp(x,"010100110010")==0){
strcpy(y,"00100011110000110101011");
}
else if(strcmp(x,"010100110011")==0){
strcpy(y,"00100011101001111101000");
}
else if(strcmp(x,"010100110100")==0){
strcpy(y,"00100011100011000100111");
}
else if(strcmp(x,"010100110101")==0){
strcpy(y,"00100011011100001101000");
}
else if(strcmp(x,"010100110110")==0){
strcpy(y,"00100011010101010101011");
}
else if(strcmp(x,"010100110111")==0){
strcpy(y,"00100011001110011110000");
}
else if(strcmp(x,"010100111000")==0){
strcpy(y,"00100011000111100110111");
}
else if(strcmp(x,"010100111001")==0){
strcpy(y,"00100011000000101111111");
}
else if(strcmp(x,"010100111010")==0){
strcpy(y,"00100010111001111001010");
}
else if(strcmp(x,"010100111011")==0){
strcpy(y,"00100010110011000010110");
}
else if(strcmp(x,"010100111100")==0){
strcpy(y,"00100010101100001100101");
}
else if(strcmp(x,"010100111101")==0){
strcpy(y,"00100010100101010110101");
}
else if(strcmp(x,"010100111110")==0){
strcpy(y,"00100010011110100001000");
}
else if(strcmp(x,"010100111111")==0){
strcpy(y,"00100010010111101011100");
}
else if(strcmp(x,"010101000000")==0){
strcpy(y,"00100010010000110110010");
}
else if(strcmp(x,"010101000001")==0){
strcpy(y,"00100010001010000001010");
}
else if(strcmp(x,"010101000010")==0){
strcpy(y,"00100010000011001100100");
}
else if(strcmp(x,"010101000011")==0){
strcpy(y,"00100001111100011000000");
}
else if(strcmp(x,"010101000100")==0){
strcpy(y,"00100001110101100011110");
}
else if(strcmp(x,"010101000101")==0){
strcpy(y,"00100001101110101111110");
}
else if(strcmp(x,"010101000110")==0){
strcpy(y,"00100001100111111100000");
}
else if(strcmp(x,"010101000111")==0){
strcpy(y,"00100001100001001000100");
}
else if(strcmp(x,"010101001000")==0){
strcpy(y,"00100001011010010101001");
}
else if(strcmp(x,"010101001001")==0){
strcpy(y,"00100001010011100010001");
}
else if(strcmp(x,"010101001010")==0){
strcpy(y,"00100001001100101111010");
}
else if(strcmp(x,"010101001011")==0){
strcpy(y,"00100001000101111100110");
}
else if(strcmp(x,"010101001100")==0){
strcpy(y,"00100000111111001010011");
}
else if(strcmp(x,"010101001101")==0){
strcpy(y,"00100000111000011000010");
}
else if(strcmp(x,"010101001110")==0){
strcpy(y,"00100000110001100110011");
}
else if(strcmp(x,"010101001111")==0){
strcpy(y,"00100000101010110100110");
}
else if(strcmp(x,"010101010000")==0){
strcpy(y,"00100000100100000011011");
}
else if(strcmp(x,"010101010001")==0){
strcpy(y,"00100000011101010010010");
}
else if(strcmp(x,"010101010010")==0){
strcpy(y,"00100000010110100001011");
}
else if(strcmp(x,"010101010011")==0){
strcpy(y,"00100000001111110000101");
}
else if(strcmp(x,"010101010100")==0){
strcpy(y,"00100000001001000000010");
}
else if(strcmp(x,"010101010101")==0){
strcpy(y,"00100000000010010000000");
}
else if(strcmp(x,"010101010110")==0){
strcpy(y,"00011111111011100000000");
}
else if(strcmp(x,"010101010111")==0){
strcpy(y,"00011111110100110000011");
}
else if(strcmp(x,"010101011000")==0){
strcpy(y,"00011111101110000000111");
}
else if(strcmp(x,"010101011001")==0){
strcpy(y,"00011111100111010001101");
}
else if(strcmp(x,"010101011010")==0){
strcpy(y,"00011111100000100010101");
}
else if(strcmp(x,"010101011011")==0){
strcpy(y,"00011111011001110011110");
}
else if(strcmp(x,"010101011100")==0){
strcpy(y,"00011111010011000101010");
}
else if(strcmp(x,"010101011101")==0){
strcpy(y,"00011111001100010111000");
}
else if(strcmp(x,"010101011110")==0){
strcpy(y,"00011111000101101000111");
}
else if(strcmp(x,"010101011111")==0){
strcpy(y,"00011110111110111011000");
}
else if(strcmp(x,"010101100000")==0){
strcpy(y,"00011110111000001101100");
}
else if(strcmp(x,"010101100001")==0){
strcpy(y,"00011110110001100000001");
}
else if(strcmp(x,"010101100010")==0){
strcpy(y,"00011110101010110011000");
}
else if(strcmp(x,"010101100011")==0){
strcpy(y,"00011110100100000110001");
}
else if(strcmp(x,"010101100100")==0){
strcpy(y,"00011110011101011001011");
}
else if(strcmp(x,"010101100101")==0){
strcpy(y,"00011110010110101101000");
}
else if(strcmp(x,"010101100110")==0){
strcpy(y,"00011110010000000000111");
}
else if(strcmp(x,"010101100111")==0){
strcpy(y,"00011110001001010100111");
}
else if(strcmp(x,"010101101000")==0){
strcpy(y,"00011110000010101001001");
}
else if(strcmp(x,"010101101001")==0){
strcpy(y,"00011101111011111101101");
}
else if(strcmp(x,"010101101010")==0){
strcpy(y,"00011101110101010010011");
}
else if(strcmp(x,"010101101011")==0){
strcpy(y,"00011101101110100111011");
}
else if(strcmp(x,"010101101100")==0){
strcpy(y,"00011101100111111100101");
}
else if(strcmp(x,"010101101101")==0){
strcpy(y,"00011101100001010010001");
}
else if(strcmp(x,"010101101110")==0){
strcpy(y,"00011101011010100111110");
}
else if(strcmp(x,"010101101111")==0){
strcpy(y,"00011101010011111101101");
}
else if(strcmp(x,"010101110000")==0){
strcpy(y,"00011101001101010011111");
}
else if(strcmp(x,"010101110001")==0){
strcpy(y,"00011101000110101010010");
}
else if(strcmp(x,"010101110010")==0){
strcpy(y,"00011101000000000000111");
}
else if(strcmp(x,"010101110011")==0){
strcpy(y,"00011100111001010111101");
}
else if(strcmp(x,"010101110100")==0){
strcpy(y,"00011100110010101110110");
}
else if(strcmp(x,"010101110101")==0){
strcpy(y,"00011100101100000110001");
}
else if(strcmp(x,"010101110110")==0){
strcpy(y,"00011100100101011101101");
}
else if(strcmp(x,"010101110111")==0){
strcpy(y,"00011100011110110101011");
}
else if(strcmp(x,"010101111000")==0){
strcpy(y,"00011100011000001101011");
}
else if(strcmp(x,"010101111001")==0){
strcpy(y,"00011100010001100101101");
}
else if(strcmp(x,"010101111010")==0){
strcpy(y,"00011100001010111110001");
}
else if(strcmp(x,"010101111011")==0){
strcpy(y,"00011100000100010110110");
}
else if(strcmp(x,"010101111100")==0){
strcpy(y,"00011011111101101111110");
}
else if(strcmp(x,"010101111101")==0){
strcpy(y,"00011011110111001000111");
}
else if(strcmp(x,"010101111110")==0){
strcpy(y,"00011011110000100010010");
}
else if(strcmp(x,"010101111111")==0){
strcpy(y,"00011011101001111011111");
}
else if(strcmp(x,"010110000000")==0){
strcpy(y,"00011011100011010101110");
}
else if(strcmp(x,"010110000001")==0){
strcpy(y,"00011011011100101111111");
}
else if(strcmp(x,"010110000010")==0){
strcpy(y,"00011011010110001010001");
}
else if(strcmp(x,"010110000011")==0){
strcpy(y,"00011011001111100100110");
}
else if(strcmp(x,"010110000100")==0){
strcpy(y,"00011011001000111111100");
}
else if(strcmp(x,"010110000101")==0){
strcpy(y,"00011011000010011010100");
}
else if(strcmp(x,"010110000110")==0){
strcpy(y,"00011010111011110101110");
}
else if(strcmp(x,"010110000111")==0){
strcpy(y,"00011010110101010001001");
}
else if(strcmp(x,"010110001000")==0){
strcpy(y,"00011010101110101100111");
}
else if(strcmp(x,"010110001001")==0){
strcpy(y,"00011010101000001000110");
}
else if(strcmp(x,"010110001010")==0){
strcpy(y,"00011010100001100100111");
}
else if(strcmp(x,"010110001011")==0){
strcpy(y,"00011010011011000001010");
}
else if(strcmp(x,"010110001100")==0){
strcpy(y,"00011010010100011101111");
}
else if(strcmp(x,"010110001101")==0){
strcpy(y,"00011010001101111010110");
}
else if(strcmp(x,"010110001110")==0){
strcpy(y,"00011010000111010111110");
}
else if(strcmp(x,"010110001111")==0){
strcpy(y,"00011010000000110101001");
}
else if(strcmp(x,"010110010000")==0){
strcpy(y,"00011001111010010010101");
}
else if(strcmp(x,"010110010001")==0){
strcpy(y,"00011001110011110000011");
}
else if(strcmp(x,"010110010010")==0){
strcpy(y,"00011001101101001110011");
}
else if(strcmp(x,"010110010011")==0){
strcpy(y,"00011001100110101100100");
}
else if(strcmp(x,"010110010100")==0){
strcpy(y,"00011001100000001010111");
}
else if(strcmp(x,"010110010101")==0){
strcpy(y,"00011001011001101001101");
}
else if(strcmp(x,"010110010110")==0){
strcpy(y,"00011001010011001000100");
}
else if(strcmp(x,"010110010111")==0){
strcpy(y,"00011001001100100111100");
}
else if(strcmp(x,"010110011000")==0){
strcpy(y,"00011001000110000110111");
}
else if(strcmp(x,"010110011001")==0){
strcpy(y,"00011000111111100110100");
}
else if(strcmp(x,"010110011010")==0){
strcpy(y,"00011000111001000110010");
}
else if(strcmp(x,"010110011011")==0){
strcpy(y,"00011000110010100110010");
}
else if(strcmp(x,"010110011100")==0){
strcpy(y,"00011000101100000110100");
}
else if(strcmp(x,"010110011101")==0){
strcpy(y,"00011000100101100110111");
}
else if(strcmp(x,"010110011110")==0){
strcpy(y,"00011000011111000111101");
}
else if(strcmp(x,"010110011111")==0){
strcpy(y,"00011000011000101000100");
}
else if(strcmp(x,"010110100000")==0){
strcpy(y,"00011000010010001001101");
}
else if(strcmp(x,"010110100001")==0){
strcpy(y,"00011000001011101011000");
}
else if(strcmp(x,"010110100010")==0){
strcpy(y,"00011000000101001100101");
}
else if(strcmp(x,"010110100011")==0){
strcpy(y,"00010111111110101110011");
}
else if(strcmp(x,"010110100100")==0){
strcpy(y,"00010111111000010000011");
}
else if(strcmp(x,"010110100101")==0){
strcpy(y,"00010111110001110010101");
}
else if(strcmp(x,"010110100110")==0){
strcpy(y,"00010111101011010101001");
}
else if(strcmp(x,"010110100111")==0){
strcpy(y,"00010111100100110111111");
}
else if(strcmp(x,"010110101000")==0){
strcpy(y,"00010111011110011010110");
}
else if(strcmp(x,"010110101001")==0){
strcpy(y,"00010111010111111101111");
}
else if(strcmp(x,"010110101010")==0){
strcpy(y,"00010111010001100001010");
}
else if(strcmp(x,"010110101011")==0){
strcpy(y,"00010111001011000100111");
}
else if(strcmp(x,"010110101100")==0){
strcpy(y,"00010111000100101000110");
}
else if(strcmp(x,"010110101101")==0){
strcpy(y,"00010110111110001100110");
}
else if(strcmp(x,"010110101110")==0){
strcpy(y,"00010110110111110001000");
}
else if(strcmp(x,"010110101111")==0){
strcpy(y,"00010110110001010101100");
}
else if(strcmp(x,"010110110000")==0){
strcpy(y,"00010110101010111010010");
}
else if(strcmp(x,"010110110001")==0){
strcpy(y,"00010110100100011111001");
}
else if(strcmp(x,"010110110010")==0){
strcpy(y,"00010110011110000100010");
}
else if(strcmp(x,"010110110011")==0){
strcpy(y,"00010110010111101001101");
}
else if(strcmp(x,"010110110100")==0){
strcpy(y,"00010110010001001111010");
}
else if(strcmp(x,"010110110101")==0){
strcpy(y,"00010110001010110101001");
}
else if(strcmp(x,"010110110110")==0){
strcpy(y,"00010110000100011011001");
}
else if(strcmp(x,"010110110111")==0){
strcpy(y,"00010101111110000001011");
}
else if(strcmp(x,"010110111000")==0){
strcpy(y,"00010101110111100111111");
}
else if(strcmp(x,"010110111001")==0){
strcpy(y,"00010101110001001110101");
}
else if(strcmp(x,"010110111010")==0){
strcpy(y,"00010101101010110101100");
}
else if(strcmp(x,"010110111011")==0){
strcpy(y,"00010101100100011100101");
}
else if(strcmp(x,"010110111100")==0){
strcpy(y,"00010101011110000100000");
}
else if(strcmp(x,"010110111101")==0){
strcpy(y,"00010101010111101011101");
}
else if(strcmp(x,"010110111110")==0){
strcpy(y,"00010101010001010011011");
}
else if(strcmp(x,"010110111111")==0){
strcpy(y,"00010101001010111011011");
}
else if(strcmp(x,"010111000000")==0){
strcpy(y,"00010101000100100011101");
}
else if(strcmp(x,"010111000001")==0){
strcpy(y,"00010100111110001100001");
}
else if(strcmp(x,"010111000010")==0){
strcpy(y,"00010100110111110100111");
}
else if(strcmp(x,"010111000011")==0){
strcpy(y,"00010100110001011101110");
}
else if(strcmp(x,"010111000100")==0){
strcpy(y,"00010100101011000110111");
}
else if(strcmp(x,"010111000101")==0){
strcpy(y,"00010100100100110000010");
}
else if(strcmp(x,"010111000110")==0){
strcpy(y,"00010100011110011001110");
}
else if(strcmp(x,"010111000111")==0){
strcpy(y,"00010100011000000011100");
}
else if(strcmp(x,"010111001000")==0){
strcpy(y,"00010100010001101101100");
}
else if(strcmp(x,"010111001001")==0){
strcpy(y,"00010100001011010111110");
}
else if(strcmp(x,"010111001010")==0){
strcpy(y,"00010100000101000010010");
}
else if(strcmp(x,"010111001011")==0){
strcpy(y,"00010011111110101100111");
}
else if(strcmp(x,"010111001100")==0){
strcpy(y,"00010011111000010111110");
}
else if(strcmp(x,"010111001101")==0){
strcpy(y,"00010011110010000010110");
}
else if(strcmp(x,"010111001110")==0){
strcpy(y,"00010011101011101110001");
}
else if(strcmp(x,"010111001111")==0){
strcpy(y,"00010011100101011001101");
}
else if(strcmp(x,"010111010000")==0){
strcpy(y,"00010011011111000101011");
}
else if(strcmp(x,"010111010001")==0){
strcpy(y,"00010011011000110001011");
}
else if(strcmp(x,"010111010010")==0){
strcpy(y,"00010011010010011101100");
}
else if(strcmp(x,"010111010011")==0){
strcpy(y,"00010011001100001001111");
}
else if(strcmp(x,"010111010100")==0){
strcpy(y,"00010011000101110110100");
}
else if(strcmp(x,"010111010101")==0){
strcpy(y,"00010010111111100011011");
}
else if(strcmp(x,"010111010110")==0){
strcpy(y,"00010010111001010000011");
}
else if(strcmp(x,"010111010111")==0){
strcpy(y,"00010010110010111101101");
}
else if(strcmp(x,"010111011000")==0){
strcpy(y,"00010010101100101011001");
}
else if(strcmp(x,"010111011001")==0){
strcpy(y,"00010010100110011000110");
}
else if(strcmp(x,"010111011010")==0){
strcpy(y,"00010010100000000110110");
}
else if(strcmp(x,"010111011011")==0){
strcpy(y,"00010010011001110100110");
}
else if(strcmp(x,"010111011100")==0){
strcpy(y,"00010010010011100011001");
}
else if(strcmp(x,"010111011101")==0){
strcpy(y,"00010010001101010001110");
}
else if(strcmp(x,"010111011110")==0){
strcpy(y,"00010010000111000000100");
}
else if(strcmp(x,"010111011111")==0){
strcpy(y,"00010010000000101111100");
}
else if(strcmp(x,"010111100000")==0){
strcpy(y,"00010001111010011110101");
}
else if(strcmp(x,"010111100001")==0){
strcpy(y,"00010001110100001110000");
}
else if(strcmp(x,"010111100010")==0){
strcpy(y,"00010001101101111101101");
}
else if(strcmp(x,"010111100011")==0){
strcpy(y,"00010001100111101101100");
}
else if(strcmp(x,"010111100100")==0){
strcpy(y,"00010001100001011101101");
}
else if(strcmp(x,"010111100101")==0){
strcpy(y,"00010001011011001101111");
}
else if(strcmp(x,"010111100110")==0){
strcpy(y,"00010001010100111110011");
}
else if(strcmp(x,"010111100111")==0){
strcpy(y,"00010001001110101111000");
}
else if(strcmp(x,"010111101000")==0){
strcpy(y,"00010001001000011111111");
}
else if(strcmp(x,"010111101001")==0){
strcpy(y,"00010001000010010001000");
}
else if(strcmp(x,"010111101010")==0){
strcpy(y,"00010000111100000010011");
}
else if(strcmp(x,"010111101011")==0){
strcpy(y,"00010000110101110011111");
}
else if(strcmp(x,"010111101100")==0){
strcpy(y,"00010000101111100101110");
}
else if(strcmp(x,"010111101101")==0){
strcpy(y,"00010000101001010111101");
}
else if(strcmp(x,"010111101110")==0){
strcpy(y,"00010000100011001001111");
}
else if(strcmp(x,"010111101111")==0){
strcpy(y,"00010000011100111100010");
}
else if(strcmp(x,"010111110000")==0){
strcpy(y,"00010000010110101110111");
}
else if(strcmp(x,"010111110001")==0){
strcpy(y,"00010000010000100001110");
}
else if(strcmp(x,"010111110010")==0){
strcpy(y,"00010000001010010100110");
}
else if(strcmp(x,"010111110011")==0){
strcpy(y,"00010000000100001000000");
}
else if(strcmp(x,"010111110100")==0){
strcpy(y,"00001111111101111011011");
}
else if(strcmp(x,"010111110101")==0){
strcpy(y,"00001111110111101111001");
}
else if(strcmp(x,"010111110110")==0){
strcpy(y,"00001111110001100011000");
}
else if(strcmp(x,"010111110111")==0){
strcpy(y,"00001111101011010111001");
}
else if(strcmp(x,"010111111000")==0){
strcpy(y,"00001111100101001011011");
}
else if(strcmp(x,"010111111001")==0){
strcpy(y,"00001111011110111111111");
}
else if(strcmp(x,"010111111010")==0){
strcpy(y,"00001111011000110100101");
}
else if(strcmp(x,"010111111011")==0){
strcpy(y,"00001111010010101001101");
}
else if(strcmp(x,"010111111100")==0){
strcpy(y,"00001111001100011110110");
}
else if(strcmp(x,"010111111101")==0){
strcpy(y,"00001111000110010100001");
}
else if(strcmp(x,"010111111110")==0){
strcpy(y,"00001111000000001001101");
}
else if(strcmp(x,"010111111111")==0){
strcpy(y,"00001110111001111111011");
}
else if(strcmp(x,"011000000000")==0){
strcpy(y,"00001110110011110101011");
}
else if(strcmp(x,"011000000001")==0){
strcpy(y,"00001110101101101011101");
}
else if(strcmp(x,"011000000010")==0){
strcpy(y,"00001110100111100010000");
}
else if(strcmp(x,"011000000011")==0){
strcpy(y,"00001110100001011000101");
}
else if(strcmp(x,"011000000100")==0){
strcpy(y,"00001110011011001111100");
}
else if(strcmp(x,"011000000101")==0){
strcpy(y,"00001110010101000110100");
}
else if(strcmp(x,"011000000110")==0){
strcpy(y,"00001110001110111101110");
}
else if(strcmp(x,"011000000111")==0){
strcpy(y,"00001110001000110101010");
}
else if(strcmp(x,"011000001000")==0){
strcpy(y,"00001110000010101100111");
}
else if(strcmp(x,"011000001001")==0){
strcpy(y,"00001101111100100100110");
}
else if(strcmp(x,"011000001010")==0){
strcpy(y,"00001101110110011100111");
}
else if(strcmp(x,"011000001011")==0){
strcpy(y,"00001101110000010101001");
}
else if(strcmp(x,"011000001100")==0){
strcpy(y,"00001101101010001101101");
}
else if(strcmp(x,"011000001101")==0){
strcpy(y,"00001101100100000110011");
}
else if(strcmp(x,"011000001110")==0){
strcpy(y,"00001101011101111111010");
}
else if(strcmp(x,"011000001111")==0){
strcpy(y,"00001101010111111000011");
}
else if(strcmp(x,"011000010000")==0){
strcpy(y,"00001101010001110001110");
}
else if(strcmp(x,"011000010001")==0){
strcpy(y,"00001101001011101011010");
}
else if(strcmp(x,"011000010010")==0){
strcpy(y,"00001101000101100101000");
}
else if(strcmp(x,"011000010011")==0){
strcpy(y,"00001100111111011110111");
}
else if(strcmp(x,"011000010100")==0){
strcpy(y,"00001100111001011001001");
}
else if(strcmp(x,"011000010101")==0){
strcpy(y,"00001100110011010011100");
}
else if(strcmp(x,"011000010110")==0){
strcpy(y,"00001100101101001110000");
}
else if(strcmp(x,"011000010111")==0){
strcpy(y,"00001100100111001000110");
}
else if(strcmp(x,"011000011000")==0){
strcpy(y,"00001100100001000011110");
}
else if(strcmp(x,"011000011001")==0){
strcpy(y,"00001100011010111111000");
}
else if(strcmp(x,"011000011010")==0){
strcpy(y,"00001100010100111010011");
}
else if(strcmp(x,"011000011011")==0){
strcpy(y,"00001100001110110110000");
}
else if(strcmp(x,"011000011100")==0){
strcpy(y,"00001100001000110001110");
}
else if(strcmp(x,"011000011101")==0){
strcpy(y,"00001100000010101101110");
}
else if(strcmp(x,"011000011110")==0){
strcpy(y,"00001011111100101010000");
}
else if(strcmp(x,"011000011111")==0){
strcpy(y,"00001011110110100110100");
}
else if(strcmp(x,"011000100000")==0){
strcpy(y,"00001011110000100011001");
}
else if(strcmp(x,"011000100001")==0){
strcpy(y,"00001011101010011111111");
}
else if(strcmp(x,"011000100010")==0){
strcpy(y,"00001011100100011101000");
}
else if(strcmp(x,"011000100011")==0){
strcpy(y,"00001011011110011010010");
}
else if(strcmp(x,"011000100100")==0){
strcpy(y,"00001011011000010111101");
}
else if(strcmp(x,"011000100101")==0){
strcpy(y,"00001011010010010101010");
}
else if(strcmp(x,"011000100110")==0){
strcpy(y,"00001011001100010011001");
}
else if(strcmp(x,"011000100111")==0){
strcpy(y,"00001011000110010001010");
}
else if(strcmp(x,"011000101000")==0){
strcpy(y,"00001011000000001111100");
}
else if(strcmp(x,"011000101001")==0){
strcpy(y,"00001010111010001110000");
}
else if(strcmp(x,"011000101010")==0){
strcpy(y,"00001010110100001100101");
}
else if(strcmp(x,"011000101011")==0){
strcpy(y,"00001010101110001011100");
}
else if(strcmp(x,"011000101100")==0){
strcpy(y,"00001010101000001010101");
}
else if(strcmp(x,"011000101101")==0){
strcpy(y,"00001010100010001001111");
}
else if(strcmp(x,"011000101110")==0){
strcpy(y,"00001010011100001001011");
}
else if(strcmp(x,"011000101111")==0){
strcpy(y,"00001010010110001001001");
}
else if(strcmp(x,"011000110000")==0){
strcpy(y,"00001010010000001001000");
}
else if(strcmp(x,"011000110001")==0){
strcpy(y,"00001010001010001001000");
}
else if(strcmp(x,"011000110010")==0){
strcpy(y,"00001010000100001001011");
}
else if(strcmp(x,"011000110011")==0){
strcpy(y,"00001001111110001001111");
}
else if(strcmp(x,"011000110100")==0){
strcpy(y,"00001001111000001010101");
}
else if(strcmp(x,"011000110101")==0){
strcpy(y,"00001001110010001011100");
}
else if(strcmp(x,"011000110110")==0){
strcpy(y,"00001001101100001100101");
}
else if(strcmp(x,"011000110111")==0){
strcpy(y,"00001001100110001101111");
}
else if(strcmp(x,"011000111000")==0){
strcpy(y,"00001001100000001111011");
}
else if(strcmp(x,"011000111001")==0){
strcpy(y,"00001001011010010001001");
}
else if(strcmp(x,"011000111010")==0){
strcpy(y,"00001001010100010011000");
}
else if(strcmp(x,"011000111011")==0){
strcpy(y,"00001001001110010101001");
}
else if(strcmp(x,"011000111100")==0){
strcpy(y,"00001001001000010111100");
}
else if(strcmp(x,"011000111101")==0){
strcpy(y,"00001001000010011010000");
}
else if(strcmp(x,"011000111110")==0){
strcpy(y,"00001000111100011100110");
}
else if(strcmp(x,"011000111111")==0){
strcpy(y,"00001000110110011111101");
}
else if(strcmp(x,"011001000000")==0){
strcpy(y,"00001000110000100010110");
}
else if(strcmp(x,"011001000001")==0){
strcpy(y,"00001000101010100110001");
}
else if(strcmp(x,"011001000010")==0){
strcpy(y,"00001000100100101001101");
}
else if(strcmp(x,"011001000011")==0){
strcpy(y,"00001000011110101101011");
}
else if(strcmp(x,"011001000100")==0){
strcpy(y,"00001000011000110001010");
}
else if(strcmp(x,"011001000101")==0){
strcpy(y,"00001000010010110101011");
}
else if(strcmp(x,"011001000110")==0){
strcpy(y,"00001000001100111001110");
}
else if(strcmp(x,"011001000111")==0){
strcpy(y,"00001000000110111110010");
}
else if(strcmp(x,"011001001000")==0){
strcpy(y,"00001000000001000011000");
}
else if(strcmp(x,"011001001001")==0){
strcpy(y,"00000111111011000111111");
}
else if(strcmp(x,"011001001010")==0){
strcpy(y,"00000111110101001101000");
}
else if(strcmp(x,"011001001011")==0){
strcpy(y,"00000111101111010010011");
}
else if(strcmp(x,"011001001100")==0){
strcpy(y,"00000111101001010111111");
}
else if(strcmp(x,"011001001101")==0){
strcpy(y,"00000111100011011101101");
}
else if(strcmp(x,"011001001110")==0){
strcpy(y,"00000111011101100011100");
}
else if(strcmp(x,"011001001111")==0){
strcpy(y,"00000111010111101001101");
}
else if(strcmp(x,"011001010000")==0){
strcpy(y,"00000111010001101111111");
}
else if(strcmp(x,"011001010001")==0){
strcpy(y,"00000111001011110110100");
}
else if(strcmp(x,"011001010010")==0){
strcpy(y,"00000111000101111101001");
}
else if(strcmp(x,"011001010011")==0){
strcpy(y,"00000111000000000100001");
}
else if(strcmp(x,"011001010100")==0){
strcpy(y,"00000110111010001011001");
}
else if(strcmp(x,"011001010101")==0){
strcpy(y,"00000110110100010010100");
}
else if(strcmp(x,"011001010110")==0){
strcpy(y,"00000110101110011010000");
}
else if(strcmp(x,"011001010111")==0){
strcpy(y,"00000110101000100001101");
}
else if(strcmp(x,"011001011000")==0){
strcpy(y,"00000110100010101001101");
}
else if(strcmp(x,"011001011001")==0){
strcpy(y,"00000110011100110001101");
}
else if(strcmp(x,"011001011010")==0){
strcpy(y,"00000110010110111010000");
}
else if(strcmp(x,"011001011011")==0){
strcpy(y,"00000110010001000010100");
}
else if(strcmp(x,"011001011100")==0){
strcpy(y,"00000110001011001011001");
}
else if(strcmp(x,"011001011101")==0){
strcpy(y,"00000110000101010100000");
}
else if(strcmp(x,"011001011110")==0){
strcpy(y,"00000101111111011101001");
}
else if(strcmp(x,"011001011111")==0){
strcpy(y,"00000101111001100110011");
}
else if(strcmp(x,"011001100000")==0){
strcpy(y,"00000101110011101111111");
}
else if(strcmp(x,"011001100001")==0){
strcpy(y,"00000101101101111001100");
}
else if(strcmp(x,"011001100010")==0){
strcpy(y,"00000101101000000011011");
}
else if(strcmp(x,"011001100011")==0){
strcpy(y,"00000101100010001101100");
}
else if(strcmp(x,"011001100100")==0){
strcpy(y,"00000101011100010111110");
}
else if(strcmp(x,"011001100101")==0){
strcpy(y,"00000101010110100010001");
}
else if(strcmp(x,"011001100110")==0){
strcpy(y,"00000101010000101100110");
}
else if(strcmp(x,"011001100111")==0){
strcpy(y,"00000101001010110111101");
}
else if(strcmp(x,"011001101000")==0){
strcpy(y,"00000101000101000010101");
}
else if(strcmp(x,"011001101001")==0){
strcpy(y,"00000100111111001101111");
}
else if(strcmp(x,"011001101010")==0){
strcpy(y,"00000100111001011001011");
}
else if(strcmp(x,"011001101011")==0){
strcpy(y,"00000100110011100101000");
}
else if(strcmp(x,"011001101100")==0){
strcpy(y,"00000100101101110000110");
}
else if(strcmp(x,"011001101101")==0){
strcpy(y,"00000100100111111100110");
}
else if(strcmp(x,"011001101110")==0){
strcpy(y,"00000100100010001001000");
}
else if(strcmp(x,"011001101111")==0){
strcpy(y,"00000100011100010101011");
}
else if(strcmp(x,"011001110000")==0){
strcpy(y,"00000100010110100010000");
}
else if(strcmp(x,"011001110001")==0){
strcpy(y,"00000100010000101110110");
}
else if(strcmp(x,"011001110010")==0){
strcpy(y,"00000100001010111011110");
}
else if(strcmp(x,"011001110011")==0){
strcpy(y,"00000100000101001000111");
}
else if(strcmp(x,"011001110100")==0){
strcpy(y,"00000011111111010110010");
}
else if(strcmp(x,"011001110101")==0){
strcpy(y,"00000011111001100011111");
}
else if(strcmp(x,"011001110110")==0){
strcpy(y,"00000011110011110001101");
}
else if(strcmp(x,"011001110111")==0){
strcpy(y,"00000011101101111111100");
}
else if(strcmp(x,"011001111000")==0){
strcpy(y,"00000011101000001101110");
}
else if(strcmp(x,"011001111001")==0){
strcpy(y,"00000011100010011100000");
}
else if(strcmp(x,"011001111010")==0){
strcpy(y,"00000011011100101010100");
}
else if(strcmp(x,"011001111011")==0){
strcpy(y,"00000011010110111001010");
}
else if(strcmp(x,"011001111100")==0){
strcpy(y,"00000011010001001000001");
}
else if(strcmp(x,"011001111101")==0){
strcpy(y,"00000011001011010111010");
}
else if(strcmp(x,"011001111110")==0){
strcpy(y,"00000011000101100110101");
}
else if(strcmp(x,"011001111111")==0){
strcpy(y,"00000010111111110110001");
}
else if(strcmp(x,"011010000000")==0){
strcpy(y,"00000010111010000101110");
}
else if(strcmp(x,"011010000001")==0){
strcpy(y,"00000010110100010101101");
}
else if(strcmp(x,"011010000010")==0){
strcpy(y,"00000010101110100101101");
}
else if(strcmp(x,"011010000011")==0){
strcpy(y,"00000010101000110110000");
}
else if(strcmp(x,"011010000100")==0){
strcpy(y,"00000010100011000110011");
}
else if(strcmp(x,"011010000101")==0){
strcpy(y,"00000010011101010111000");
}
else if(strcmp(x,"011010000110")==0){
strcpy(y,"00000010010111100111111");
}
else if(strcmp(x,"011010000111")==0){
strcpy(y,"00000010010001111000111");
}
else if(strcmp(x,"011010001000")==0){
strcpy(y,"00000010001100001010001");
}
else if(strcmp(x,"011010001001")==0){
strcpy(y,"00000010000110011011100");
}
else if(strcmp(x,"011010001010")==0){
strcpy(y,"00000010000000101101001");
}
else if(strcmp(x,"011010001011")==0){
strcpy(y,"00000001111010111110111");
}
else if(strcmp(x,"011010001100")==0){
strcpy(y,"00000001110101010000111");
}
else if(strcmp(x,"011010001101")==0){
strcpy(y,"00000001101111100011000");
}
else if(strcmp(x,"011010001110")==0){
strcpy(y,"00000001101001110101011");
}
else if(strcmp(x,"011010001111")==0){
strcpy(y,"00000001100100000111111");
}
else if(strcmp(x,"011010010000")==0){
strcpy(y,"00000001011110011010101");
}
else if(strcmp(x,"011010010001")==0){
strcpy(y,"00000001011000101101100");
}
else if(strcmp(x,"011010010010")==0){
strcpy(y,"00000001010011000000101");
}
else if(strcmp(x,"011010010011")==0){
strcpy(y,"00000001001101010100000");
}
else if(strcmp(x,"011010010100")==0){
strcpy(y,"00000001000111100111100");
}
else if(strcmp(x,"011010010101")==0){
strcpy(y,"00000001000001111011001");
}
else if(strcmp(x,"011010010110")==0){
strcpy(y,"00000000111100001111000");
}
else if(strcmp(x,"011010010111")==0){
strcpy(y,"00000000110110100011000");
}
else if(strcmp(x,"011010011000")==0){
strcpy(y,"00000000110000110111010");
}
else if(strcmp(x,"011010011001")==0){
strcpy(y,"00000000101011001011110");
}
else if(strcmp(x,"011010011010")==0){
strcpy(y,"00000000100101100000011");
}
else if(strcmp(x,"011010011011")==0){
strcpy(y,"00000000011111110101001");
}
else if(strcmp(x,"011010011100")==0){
strcpy(y,"00000000011010001010001");
}
else if(strcmp(x,"011010011101")==0){
strcpy(y,"00000000010100011111011");
}
else if(strcmp(x,"011010011110")==0){
strcpy(y,"00000000001110110100110");
}
else if(strcmp(x,"011010011111")==0){
strcpy(y,"00000000001001001010010");
}
else if(strcmp(x,"011010100000")==0){
strcpy(y,"00000000000011100000000");
}
else if(strcmp(x,"011010100001")==0){
strcpy(y,"11111111111011101100000");
}
else if(strcmp(x,"011010100010")==0){
strcpy(y,"11111111110000011000010");
}
else if(strcmp(x,"011010100011")==0){
strcpy(y,"11111111100101000100111");
}
else if(strcmp(x,"011010100100")==0){
strcpy(y,"11111111011001110001111");
}
else if(strcmp(x,"011010100101")==0){
strcpy(y,"11111111001110011111010");
}
else if(strcmp(x,"011010100110")==0){
strcpy(y,"11111111000011001101000");
}
else if(strcmp(x,"011010100111")==0){
strcpy(y,"11111110110111111011001");
}
else if(strcmp(x,"011010101000")==0){
strcpy(y,"11111110101100101001101");
}
else if(strcmp(x,"011010101001")==0){
strcpy(y,"11111110100001011000100");
}
else if(strcmp(x,"011010101010")==0){
strcpy(y,"11111110010110000111110");
}
else if(strcmp(x,"011010101011")==0){
strcpy(y,"11111110001010110111011");
}
else if(strcmp(x,"011010101100")==0){
strcpy(y,"11111101111111100111011");
}
else if(strcmp(x,"011010101101")==0){
strcpy(y,"11111101110100010111101");
}
else if(strcmp(x,"011010101110")==0){
strcpy(y,"11111101101001001000011");
}
else if(strcmp(x,"011010101111")==0){
strcpy(y,"11111101011101111001100");
}
else if(strcmp(x,"011010110000")==0){
strcpy(y,"11111101010010101011000");
}
else if(strcmp(x,"011010110001")==0){
strcpy(y,"11111101000111011100111");
}
else if(strcmp(x,"011010110010")==0){
strcpy(y,"11111100111100001111000");
}
else if(strcmp(x,"011010110011")==0){
strcpy(y,"11111100110001000001101");
}
else if(strcmp(x,"011010110100")==0){
strcpy(y,"11111100100101110100101");
}
else if(strcmp(x,"011010110101")==0){
strcpy(y,"11111100011010100111111");
}
else if(strcmp(x,"011010110110")==0){
strcpy(y,"11111100001111011011101");
}
else if(strcmp(x,"011010110111")==0){
strcpy(y,"11111100000100001111101");
}
else if(strcmp(x,"011010111000")==0){
strcpy(y,"11111011111001000100001");
}
else if(strcmp(x,"011010111001")==0){
strcpy(y,"11111011101101111000111");
}
else if(strcmp(x,"011010111010")==0){
strcpy(y,"11111011100010101110001");
}
else if(strcmp(x,"011010111011")==0){
strcpy(y,"11111011010111100011101");
}
else if(strcmp(x,"011010111100")==0){
strcpy(y,"11111011001100011001100");
}
else if(strcmp(x,"011010111101")==0){
strcpy(y,"11111011000001001111111");
}
else if(strcmp(x,"011010111110")==0){
strcpy(y,"11111010110110000110100");
}
else if(strcmp(x,"011010111111")==0){
strcpy(y,"11111010101010111101100");
}
else if(strcmp(x,"011011000000")==0){
strcpy(y,"11111010011111110100111");
}
else if(strcmp(x,"011011000001")==0){
strcpy(y,"11111010010100101100101");
}
else if(strcmp(x,"011011000010")==0){
strcpy(y,"11111010001001100100110");
}
else if(strcmp(x,"011011000011")==0){
strcpy(y,"11111001111110011101010");
}
else if(strcmp(x,"011011000100")==0){
strcpy(y,"11111001110011010110000");
}
else if(strcmp(x,"011011000101")==0){
strcpy(y,"11111001101000001111010");
}
else if(strcmp(x,"011011000110")==0){
strcpy(y,"11111001011101001000111");
}
else if(strcmp(x,"011011000111")==0){
strcpy(y,"11111001010010000010110");
}
else if(strcmp(x,"011011001000")==0){
strcpy(y,"11111001000110111101001");
}
else if(strcmp(x,"011011001001")==0){
strcpy(y,"11111000111011110111110");
}
else if(strcmp(x,"011011001010")==0){
strcpy(y,"11111000110000110010111");
}
else if(strcmp(x,"011011001011")==0){
strcpy(y,"11111000100101101110010");
}
else if(strcmp(x,"011011001100")==0){
strcpy(y,"11111000011010101010000");
}
else if(strcmp(x,"011011001101")==0){
strcpy(y,"11111000001111100110001");
}
else if(strcmp(x,"011011001110")==0){
strcpy(y,"11111000000100100010101");
}
else if(strcmp(x,"011011001111")==0){
strcpy(y,"11110111111001011111100");
}
else if(strcmp(x,"011011010000")==0){
strcpy(y,"11110111101110011100110");
}
else if(strcmp(x,"011011010001")==0){
strcpy(y,"11110111100011011010010");
}
else if(strcmp(x,"011011010010")==0){
strcpy(y,"11110111011000011000010");
}
else if(strcmp(x,"011011010011")==0){
strcpy(y,"11110111001101010110100");
}
else if(strcmp(x,"011011010100")==0){
strcpy(y,"11110111000010010101010");
}
else if(strcmp(x,"011011010101")==0){
strcpy(y,"11110110110111010100010");
}
else if(strcmp(x,"011011010110")==0){
strcpy(y,"11110110101100010011101");
}
else if(strcmp(x,"011011010111")==0){
strcpy(y,"11110110100001010011011");
}
else if(strcmp(x,"011011011000")==0){
strcpy(y,"11110110010110010011100");
}
else if(strcmp(x,"011011011001")==0){
strcpy(y,"11110110001011010100000");
}
else if(strcmp(x,"011011011010")==0){
strcpy(y,"11110110000000010100111");
}
else if(strcmp(x,"011011011011")==0){
strcpy(y,"11110101110101010110000");
}
else if(strcmp(x,"011011011100")==0){
strcpy(y,"11110101101010010111101");
}
else if(strcmp(x,"011011011101")==0){
strcpy(y,"11110101011111011001100");
}
else if(strcmp(x,"011011011110")==0){
strcpy(y,"11110101010100011011111");
}
else if(strcmp(x,"011011011111")==0){
strcpy(y,"11110101001001011110100");
}
else if(strcmp(x,"011011100000")==0){
strcpy(y,"11110100111110100001100");
}
else if(strcmp(x,"011011100001")==0){
strcpy(y,"11110100110011100100111");
}
else if(strcmp(x,"011011100010")==0){
strcpy(y,"11110100101000101000100");
}
else if(strcmp(x,"011011100011")==0){
strcpy(y,"11110100011101101100101");
}
else if(strcmp(x,"011011100100")==0){
strcpy(y,"11110100010010110001000");
}
else if(strcmp(x,"011011100101")==0){
strcpy(y,"11110100000111110101111");
}
else if(strcmp(x,"011011100110")==0){
strcpy(y,"11110011111100111011000");
}
else if(strcmp(x,"011011100111")==0){
strcpy(y,"11110011110010000000100");
}
else if(strcmp(x,"011011101000")==0){
strcpy(y,"11110011100111000110011");
}
else if(strcmp(x,"011011101001")==0){
strcpy(y,"11110011011100001100101");
}
else if(strcmp(x,"011011101010")==0){
strcpy(y,"11110011010001010011001");
}
else if(strcmp(x,"011011101011")==0){
strcpy(y,"11110011000110011010001");
}
else if(strcmp(x,"011011101100")==0){
strcpy(y,"11110010111011100001011");
}
else if(strcmp(x,"011011101101")==0){
strcpy(y,"11110010110000101001000");
}
else if(strcmp(x,"011011101110")==0){
strcpy(y,"11110010100101110001000");
}
else if(strcmp(x,"011011101111")==0){
strcpy(y,"11110010011010111001011");
}
else if(strcmp(x,"011011110000")==0){
strcpy(y,"11110010010000000010001");
}
else if(strcmp(x,"011011110001")==0){
strcpy(y,"11110010000101001011010");
}
else if(strcmp(x,"011011110010")==0){
strcpy(y,"11110001111010010100101");
}
else if(strcmp(x,"011011110011")==0){
strcpy(y,"11110001101111011110011");
}
else if(strcmp(x,"011011110100")==0){
strcpy(y,"11110001100100101000100");
}
else if(strcmp(x,"011011110101")==0){
strcpy(y,"11110001011001110011000");
}
else if(strcmp(x,"011011110110")==0){
strcpy(y,"11110001001110111101111");
}
else if(strcmp(x,"011011110111")==0){
strcpy(y,"11110001000100001001000");
}
else if(strcmp(x,"011011111000")==0){
strcpy(y,"11110000111001010100101");
}
else if(strcmp(x,"011011111001")==0){
strcpy(y,"11110000101110100000100");
}
else if(strcmp(x,"011011111010")==0){
strcpy(y,"11110000100011101100110");
}
else if(strcmp(x,"011011111011")==0){
strcpy(y,"11110000011000111001011");
}
else if(strcmp(x,"011011111100")==0){
strcpy(y,"11110000001110000110011");
}
else if(strcmp(x,"011011111101")==0){
strcpy(y,"11110000000011010011101");
}
else if(strcmp(x,"011011111110")==0){
strcpy(y,"11101111111000100001011");
}
else if(strcmp(x,"011011111111")==0){
strcpy(y,"11101111101101101111011");
}
else if(strcmp(x,"011100000000")==0){
strcpy(y,"11101111100010111101110");
}
else if(strcmp(x,"011100000001")==0){
strcpy(y,"11101111011000001100011");
}
else if(strcmp(x,"011100000010")==0){
strcpy(y,"11101111001101011011100");
}
else if(strcmp(x,"011100000011")==0){
strcpy(y,"11101111000010101010111");
}
else if(strcmp(x,"011100000100")==0){
strcpy(y,"11101110110111111010101");
}
else if(strcmp(x,"011100000101")==0){
strcpy(y,"11101110101101001010110");
}
else if(strcmp(x,"011100000110")==0){
strcpy(y,"11101110100010011011010");
}
else if(strcmp(x,"011100000111")==0){
strcpy(y,"11101110010111101100001");
}
else if(strcmp(x,"011100001000")==0){
strcpy(y,"11101110001100111101010");
}
else if(strcmp(x,"011100001001")==0){
strcpy(y,"11101110000010001110110");
}
else if(strcmp(x,"011100001010")==0){
strcpy(y,"11101101110111100000101");
}
else if(strcmp(x,"011100001011")==0){
strcpy(y,"11101101101100110010111");
}
else if(strcmp(x,"011100001100")==0){
strcpy(y,"11101101100010000101100");
}
else if(strcmp(x,"011100001101")==0){
strcpy(y,"11101101010111011000011");
}
else if(strcmp(x,"011100001110")==0){
strcpy(y,"11101101001100101011101");
}
else if(strcmp(x,"011100001111")==0){
strcpy(y,"11101101000001111111010");
}
else if(strcmp(x,"011100010000")==0){
strcpy(y,"11101100110111010011010");
}
else if(strcmp(x,"011100010001")==0){
strcpy(y,"11101100101100100111100");
}
else if(strcmp(x,"011100010010")==0){
strcpy(y,"11101100100001111100001");
}
else if(strcmp(x,"011100010011")==0){
strcpy(y,"11101100010111010001001");
}
else if(strcmp(x,"011100010100")==0){
strcpy(y,"11101100001100100110100");
}
else if(strcmp(x,"011100010101")==0){
strcpy(y,"11101100000001111100010");
}
else if(strcmp(x,"011100010110")==0){
strcpy(y,"11101011110111010010010");
}
else if(strcmp(x,"011100010111")==0){
strcpy(y,"11101011101100101000101");
}
else if(strcmp(x,"011100011000")==0){
strcpy(y,"11101011100001111111011");
}
else if(strcmp(x,"011100011001")==0){
strcpy(y,"11101011010111010110100");
}
else if(strcmp(x,"011100011010")==0){
strcpy(y,"11101011001100101101111");
}
else if(strcmp(x,"011100011011")==0){
strcpy(y,"11101011000010000101101");
}
else if(strcmp(x,"011100011100")==0){
strcpy(y,"11101010110111011101110");
}
else if(strcmp(x,"011100011101")==0){
strcpy(y,"11101010101100110110010");
}
else if(strcmp(x,"011100011110")==0){
strcpy(y,"11101010100010001111000");
}
else if(strcmp(x,"011100011111")==0){
strcpy(y,"11101010010111101000010");
}
else if(strcmp(x,"011100100000")==0){
strcpy(y,"11101010001101000001101");
}
else if(strcmp(x,"011100100001")==0){
strcpy(y,"11101010000010011011100");
}
else if(strcmp(x,"011100100010")==0){
strcpy(y,"11101001110111110101110");
}
else if(strcmp(x,"011100100011")==0){
strcpy(y,"11101001101101010000010");
}
else if(strcmp(x,"011100100100")==0){
strcpy(y,"11101001100010101011001");
}
else if(strcmp(x,"011100100101")==0){
strcpy(y,"11101001011000000110010");
}
else if(strcmp(x,"011100100110")==0){
strcpy(y,"11101001001101100001111");
}
else if(strcmp(x,"011100100111")==0){
strcpy(y,"11101001000010111101110");
}
else if(strcmp(x,"011100101000")==0){
strcpy(y,"11101000111000011010000");
}
else if(strcmp(x,"011100101001")==0){
strcpy(y,"11101000101101110110100");
}
else if(strcmp(x,"011100101010")==0){
strcpy(y,"11101000100011010011100");
}
else if(strcmp(x,"011100101011")==0){
strcpy(y,"11101000011000110000110");
}
else if(strcmp(x,"011100101100")==0){
strcpy(y,"11101000001110001110011");
}
else if(strcmp(x,"011100101101")==0){
strcpy(y,"11101000000011101100010");
}
else if(strcmp(x,"011100101110")==0){
strcpy(y,"11100111111001001010101");
}
else if(strcmp(x,"011100101111")==0){
strcpy(y,"11100111101110101001001");
}
else if(strcmp(x,"011100110000")==0){
strcpy(y,"11100111100100001000001");
}
else if(strcmp(x,"011100110001")==0){
strcpy(y,"11100111011001100111100");
}
else if(strcmp(x,"011100110010")==0){
strcpy(y,"11100111001111000111001");
}
else if(strcmp(x,"011100110011")==0){
strcpy(y,"11100111000100100111001");
}
else if(strcmp(x,"011100110100")==0){
strcpy(y,"11100110111010000111011");
}
else if(strcmp(x,"011100110101")==0){
strcpy(y,"11100110101111101000001");
}
else if(strcmp(x,"011100110110")==0){
strcpy(y,"11100110100101001001001");
}
else if(strcmp(x,"011100110111")==0){
strcpy(y,"11100110011010101010011");
}
else if(strcmp(x,"011100111000")==0){
strcpy(y,"11100110010000001100001");
}
else if(strcmp(x,"011100111001")==0){
strcpy(y,"11100110000101101110001");
}
else if(strcmp(x,"011100111010")==0){
strcpy(y,"11100101111011010000100");
}
else if(strcmp(x,"011100111011")==0){
strcpy(y,"11100101110000110011001");
}
else if(strcmp(x,"011100111100")==0){
strcpy(y,"11100101100110010110001");
}
else if(strcmp(x,"011100111101")==0){
strcpy(y,"11100101011011111001100");
}
else if(strcmp(x,"011100111110")==0){
strcpy(y,"11100101010001011101010");
}
else if(strcmp(x,"011100111111")==0){
strcpy(y,"11100101000111000001010");
}
else if(strcmp(x,"011101000000")==0){
strcpy(y,"11100100111100100101101");
}
else if(strcmp(x,"011101000001")==0){
strcpy(y,"11100100110010001010011");
}
else if(strcmp(x,"011101000010")==0){
strcpy(y,"11100100100111101111100");
}
else if(strcmp(x,"011101000011")==0){
strcpy(y,"11100100011101010100111");
}
else if(strcmp(x,"011101000100")==0){
strcpy(y,"11100100010010111010100");
}
else if(strcmp(x,"011101000101")==0){
strcpy(y,"11100100001000100000101");
}
else if(strcmp(x,"011101000110")==0){
strcpy(y,"11100011111110000111000");
}
else if(strcmp(x,"011101000111")==0){
strcpy(y,"11100011110011101101110");
}
else if(strcmp(x,"011101001000")==0){
strcpy(y,"11100011101001010100110");
}
else if(strcmp(x,"011101001001")==0){
strcpy(y,"11100011011110111100010");
}
else if(strcmp(x,"011101001010")==0){
strcpy(y,"11100011010100100011111");
}
else if(strcmp(x,"011101001011")==0){
strcpy(y,"11100011001010001100000");
}
else if(strcmp(x,"011101001100")==0){
strcpy(y,"11100010111111110100011");
}
else if(strcmp(x,"011101001101")==0){
strcpy(y,"11100010110101011101001");
}
else if(strcmp(x,"011101001110")==0){
strcpy(y,"11100010101011000110010");
}
else if(strcmp(x,"011101001111")==0){
strcpy(y,"11100010100000101111101");
}
else if(strcmp(x,"011101010000")==0){
strcpy(y,"11100010010110011001011");
}
else if(strcmp(x,"011101010001")==0){
strcpy(y,"11100010001100000011011");
}
else if(strcmp(x,"011101010010")==0){
strcpy(y,"11100010000001101101110");
}
else if(strcmp(x,"011101010011")==0){
strcpy(y,"11100001110111011000100");
}
else if(strcmp(x,"011101010100")==0){
strcpy(y,"11100001101101000011101");
}
else if(strcmp(x,"011101010101")==0){
strcpy(y,"11100001100010101111000");
}
else if(strcmp(x,"011101010110")==0){
strcpy(y,"11100001011000011010110");
}
else if(strcmp(x,"011101010111")==0){
strcpy(y,"11100001001110000110110");
}
else if(strcmp(x,"011101011000")==0){
strcpy(y,"11100001000011110011001");
}
else if(strcmp(x,"011101011001")==0){
strcpy(y,"11100000111001011111111");
}
else if(strcmp(x,"011101011010")==0){
strcpy(y,"11100000101111001101000");
}
else if(strcmp(x,"011101011011")==0){
strcpy(y,"11100000100100111010011");
}
else if(strcmp(x,"011101011100")==0){
strcpy(y,"11100000011010101000000");
}
else if(strcmp(x,"011101011101")==0){
strcpy(y,"11100000010000010110001");
}
else if(strcmp(x,"011101011110")==0){
strcpy(y,"11100000000110000100100");
}
else if(strcmp(x,"011101011111")==0){
strcpy(y,"11011111111011110011001");
}
else if(strcmp(x,"011101100000")==0){
strcpy(y,"11011111110001100010001");
}
else if(strcmp(x,"011101100001")==0){
strcpy(y,"11011111100111010001100");
}
else if(strcmp(x,"011101100010")==0){
strcpy(y,"11011111011101000001010");
}
else if(strcmp(x,"011101100011")==0){
strcpy(y,"11011111010010110001010");
}
else if(strcmp(x,"011101100100")==0){
strcpy(y,"11011111001000100001101");
}
else if(strcmp(x,"011101100101")==0){
strcpy(y,"11011110111110010010010");
}
else if(strcmp(x,"011101100110")==0){
strcpy(y,"11011110110100000011010");
}
else if(strcmp(x,"011101100111")==0){
strcpy(y,"11011110101001110100101");
}
else if(strcmp(x,"011101101000")==0){
strcpy(y,"11011110011111100110010");
}
else if(strcmp(x,"011101101001")==0){
strcpy(y,"11011110010101011000010");
}
else if(strcmp(x,"011101101010")==0){
strcpy(y,"11011110001011001010101");
}
else if(strcmp(x,"011101101011")==0){
strcpy(y,"11011110000000111101010");
}
else if(strcmp(x,"011101101100")==0){
strcpy(y,"11011101110110110000010");
}
else if(strcmp(x,"011101101101")==0){
strcpy(y,"11011101101100100011100");
}
else if(strcmp(x,"011101101110")==0){
strcpy(y,"11011101100010010111001");
}
else if(strcmp(x,"011101101111")==0){
strcpy(y,"11011101011000001011001");
}
else if(strcmp(x,"011101110000")==0){
strcpy(y,"11011101001101111111011");
}
else if(strcmp(x,"011101110001")==0){
strcpy(y,"11011101000011110100000");
}
else if(strcmp(x,"011101110010")==0){
strcpy(y,"11011100111001101000111");
}
else if(strcmp(x,"011101110011")==0){
strcpy(y,"11011100101111011110001");
}
else if(strcmp(x,"011101110100")==0){
strcpy(y,"11011100100101010011110");
}
else if(strcmp(x,"011101110101")==0){
strcpy(y,"11011100011011001001101");
}
else if(strcmp(x,"011101110110")==0){
strcpy(y,"11011100010000111111111");
}
else if(strcmp(x,"011101110111")==0){
strcpy(y,"11011100000110110110011");
}
else if(strcmp(x,"011101111000")==0){
strcpy(y,"11011011111100101101010");
}
else if(strcmp(x,"011101111001")==0){
strcpy(y,"11011011110010100100100");
}
else if(strcmp(x,"011101111010")==0){
strcpy(y,"11011011101000011100000");
}
else if(strcmp(x,"011101111011")==0){
strcpy(y,"11011011011110010011111");
}
else if(strcmp(x,"011101111100")==0){
strcpy(y,"11011011010100001100000");
}
else if(strcmp(x,"011101111101")==0){
strcpy(y,"11011011001010000100100");
}
else if(strcmp(x,"011101111110")==0){
strcpy(y,"11011010111111111101010");
}
else if(strcmp(x,"011101111111")==0){
strcpy(y,"11011010110101110110011");
}
else if(strcmp(x,"011110000000")==0){
strcpy(y,"11011010101011101111111");
}
else if(strcmp(x,"011110000001")==0){
strcpy(y,"11011010100001101001101");
}
else if(strcmp(x,"011110000010")==0){
strcpy(y,"11011010010111100011110");
}
else if(strcmp(x,"011110000011")==0){
strcpy(y,"11011010001101011110010");
}
else if(strcmp(x,"011110000100")==0){
strcpy(y,"11011010000011011001000");
}
else if(strcmp(x,"011110000101")==0){
strcpy(y,"11011001111001010100000");
}
else if(strcmp(x,"011110000110")==0){
strcpy(y,"11011001101111001111011");
}
else if(strcmp(x,"011110000111")==0){
strcpy(y,"11011001100101001011001");
}
else if(strcmp(x,"011110001000")==0){
strcpy(y,"11011001011011000111001");
}
else if(strcmp(x,"011110001001")==0){
strcpy(y,"11011001010001000011100");
}
else if(strcmp(x,"011110001010")==0){
strcpy(y,"11011001000111000000010");
}
else if(strcmp(x,"011110001011")==0){
strcpy(y,"11011000111100111101010");
}
else if(strcmp(x,"011110001100")==0){
strcpy(y,"11011000110010111010100");
}
else if(strcmp(x,"011110001101")==0){
strcpy(y,"11011000101000111000001");
}
else if(strcmp(x,"011110001110")==0){
strcpy(y,"11011000011110110110001");
}
else if(strcmp(x,"011110001111")==0){
strcpy(y,"11011000010100110100011");
}
else if(strcmp(x,"011110010000")==0){
strcpy(y,"11011000001010110011000");
}
else if(strcmp(x,"011110010001")==0){
strcpy(y,"11011000000000110001111");
}
else if(strcmp(x,"011110010010")==0){
strcpy(y,"11010111110110110001001");
}
else if(strcmp(x,"011110010011")==0){
strcpy(y,"11010111101100110000101");
}
else if(strcmp(x,"011110010100")==0){
strcpy(y,"11010111100010110000100");
}
else if(strcmp(x,"011110010101")==0){
strcpy(y,"11010111011000110000110");
}
else if(strcmp(x,"011110010110")==0){
strcpy(y,"11010111001110110001010");
}
else if(strcmp(x,"011110010111")==0){
strcpy(y,"11010111000100110010000");
}
else if(strcmp(x,"011110011000")==0){
strcpy(y,"11010110111010110011001");
}
else if(strcmp(x,"011110011001")==0){
strcpy(y,"11010110110000110100101");
}
else if(strcmp(x,"011110011010")==0){
strcpy(y,"11010110100110110110011");
}
else if(strcmp(x,"011110011011")==0){
strcpy(y,"11010110011100111000100");
}
else if(strcmp(x,"011110011100")==0){
strcpy(y,"11010110010010111010111");
}
else if(strcmp(x,"011110011101")==0){
strcpy(y,"11010110001000111101101");
}
else if(strcmp(x,"011110011110")==0){
strcpy(y,"11010101111111000000101");
}
else if(strcmp(x,"011110011111")==0){
strcpy(y,"11010101110101000100000");
}
else if(strcmp(x,"011110100000")==0){
strcpy(y,"11010101101011000111101");
}
else if(strcmp(x,"011110100001")==0){
strcpy(y,"11010101100001001011101");
}
else if(strcmp(x,"011110100010")==0){
strcpy(y,"11010101010111010000000");
}
else if(strcmp(x,"011110100011")==0){
strcpy(y,"11010101001101010100101");
}
else if(strcmp(x,"011110100100")==0){
strcpy(y,"11010101000011011001100");
}
else if(strcmp(x,"011110100101")==0){
strcpy(y,"11010100111001011110110");
}
else if(strcmp(x,"011110100110")==0){
strcpy(y,"11010100101111100100011");
}
else if(strcmp(x,"011110100111")==0){
strcpy(y,"11010100100101101010010");
}
else if(strcmp(x,"011110101000")==0){
strcpy(y,"11010100011011110000011");
}
else if(strcmp(x,"011110101001")==0){
strcpy(y,"11010100010001110110111");
}
else if(strcmp(x,"011110101010")==0){
strcpy(y,"11010100000111111101110");
}
else if(strcmp(x,"011110101011")==0){
strcpy(y,"11010011111110000100111");
}
else if(strcmp(x,"011110101100")==0){
strcpy(y,"11010011110100001100010");
}
else if(strcmp(x,"011110101101")==0){
strcpy(y,"11010011101010010100000");
}
else if(strcmp(x,"011110101110")==0){
strcpy(y,"11010011100000011100001");
}
else if(strcmp(x,"011110101111")==0){
strcpy(y,"11010011010110100100100");
}
else if(strcmp(x,"011110110000")==0){
strcpy(y,"11010011001100101101001");
}
else if(strcmp(x,"011110110001")==0){
strcpy(y,"11010011000010110110001");
}
else if(strcmp(x,"011110110010")==0){
strcpy(y,"11010010111000111111100");
}
else if(strcmp(x,"011110110011")==0){
strcpy(y,"11010010101111001001001");
}
else if(strcmp(x,"011110110100")==0){
strcpy(y,"11010010100101010011001");
}
else if(strcmp(x,"011110110101")==0){
strcpy(y,"11010010011011011101011");
}
else if(strcmp(x,"011110110110")==0){
strcpy(y,"11010010010001100111111");
}
else if(strcmp(x,"011110110111")==0){
strcpy(y,"11010010000111110010110");
}
else if(strcmp(x,"011110111000")==0){
strcpy(y,"11010001111101111110000");
}
else if(strcmp(x,"011110111001")==0){
strcpy(y,"11010001110100001001100");
}
else if(strcmp(x,"011110111010")==0){
strcpy(y,"11010001101010010101010");
}
else if(strcmp(x,"011110111011")==0){
strcpy(y,"11010001100000100001011");
}
else if(strcmp(x,"011110111100")==0){
strcpy(y,"11010001010110101101110");
}
else if(strcmp(x,"011110111101")==0){
strcpy(y,"11010001001100111010100");
}
else if(strcmp(x,"011110111110")==0){
strcpy(y,"11010001000011000111101");
}
else if(strcmp(x,"011110111111")==0){
strcpy(y,"11010000111001010101000");
}
else if(strcmp(x,"011111000000")==0){
strcpy(y,"11010000101111100010101");
}
else if(strcmp(x,"011111000001")==0){
strcpy(y,"11010000100101110000101");
}
else if(strcmp(x,"011111000010")==0){
strcpy(y,"11010000011011111110111");
}
else if(strcmp(x,"011111000011")==0){
strcpy(y,"11010000010010001101100");
}
else if(strcmp(x,"011111000100")==0){
strcpy(y,"11010000001000011100011");
}
else if(strcmp(x,"011111000101")==0){
strcpy(y,"11001111111110101011101");
}
else if(strcmp(x,"011111000110")==0){
strcpy(y,"11001111110100111011001");
}
else if(strcmp(x,"011111000111")==0){
strcpy(y,"11001111101011001010111");
}
else if(strcmp(x,"011111001000")==0){
strcpy(y,"11001111100001011011000");
}
else if(strcmp(x,"011111001001")==0){
strcpy(y,"11001111010111101011100");
}
else if(strcmp(x,"011111001010")==0){
strcpy(y,"11001111001101111100010");
}
else if(strcmp(x,"011111001011")==0){
strcpy(y,"11001111000100001101010");
}
else if(strcmp(x,"011111001100")==0){
strcpy(y,"11001110111010011110101");
}
else if(strcmp(x,"011111001101")==0){
strcpy(y,"11001110110000110000010");
}
else if(strcmp(x,"011111001110")==0){
strcpy(y,"11001110100111000010010");
}
else if(strcmp(x,"011111001111")==0){
strcpy(y,"11001110011101010100100");
}
else if(strcmp(x,"011111010000")==0){
strcpy(y,"11001110010011100111001");
}
else if(strcmp(x,"011111010001")==0){
strcpy(y,"11001110001001111010000");
}
else if(strcmp(x,"011111010010")==0){
strcpy(y,"11001110000000001101010");
}
else if(strcmp(x,"011111010011")==0){
strcpy(y,"11001101110110100000110");
}
else if(strcmp(x,"011111010100")==0){
strcpy(y,"11001101101100110100100");
}
else if(strcmp(x,"011111010101")==0){
strcpy(y,"11001101100011001000101");
}
else if(strcmp(x,"011111010110")==0){
strcpy(y,"11001101011001011101001");
}
else if(strcmp(x,"011111010111")==0){
strcpy(y,"11001101001111110001110");
}
else if(strcmp(x,"011111011000")==0){
strcpy(y,"11001101000110000110111");
}
else if(strcmp(x,"011111011001")==0){
strcpy(y,"11001100111100011100001");
}
else if(strcmp(x,"011111011010")==0){
strcpy(y,"11001100110010110001110");
}
else if(strcmp(x,"011111011011")==0){
strcpy(y,"11001100101001000111110");
}
else if(strcmp(x,"011111011100")==0){
strcpy(y,"11001100011111011110000");
}
else if(strcmp(x,"011111011101")==0){
strcpy(y,"11001100010101110100100");
}
else if(strcmp(x,"011111011110")==0){
strcpy(y,"11001100001100001011011");
}
else if(strcmp(x,"011111011111")==0){
strcpy(y,"11001100000010100010100");
}
else if(strcmp(x,"011111100000")==0){
strcpy(y,"11001011111000111010000");
}
else if(strcmp(x,"011111100001")==0){
strcpy(y,"11001011101111010001110");
}
else if(strcmp(x,"011111100010")==0){
strcpy(y,"11001011100101101001110");
}
else if(strcmp(x,"011111100011")==0){
strcpy(y,"11001011011100000010001");
}
else if(strcmp(x,"011111100100")==0){
strcpy(y,"11001011010010011010110");
}
else if(strcmp(x,"011111100101")==0){
strcpy(y,"11001011001000110011110");
}
else if(strcmp(x,"011111100110")==0){
strcpy(y,"11001010111111001101000");
}
else if(strcmp(x,"011111100111")==0){
strcpy(y,"11001010110101100110101");
}
else if(strcmp(x,"011111101000")==0){
strcpy(y,"11001010101100000000100");
}
else if(strcmp(x,"011111101001")==0){
strcpy(y,"11001010100010011010101");
}
else if(strcmp(x,"011111101010")==0){
strcpy(y,"11001010011000110101001");
}
else if(strcmp(x,"011111101011")==0){
strcpy(y,"11001010001111001111111");
}
else if(strcmp(x,"011111101100")==0){
strcpy(y,"11001010000101101010111");
}
else if(strcmp(x,"011111101101")==0){
strcpy(y,"11001001111100000110010");
}
else if(strcmp(x,"011111101110")==0){
strcpy(y,"11001001110010100010000");
}
else if(strcmp(x,"011111101111")==0){
strcpy(y,"11001001101000111101111");
}
else if(strcmp(x,"011111110000")==0){
strcpy(y,"11001001011111011010010");
}
else if(strcmp(x,"011111110001")==0){
strcpy(y,"11001001010101110110110");
}
else if(strcmp(x,"011111110010")==0){
strcpy(y,"11001001001100010011101");
}
else if(strcmp(x,"011111110011")==0){
strcpy(y,"11001001000010110000110");
}
else if(strcmp(x,"011111110100")==0){
strcpy(y,"11001000111001001110010");
}
else if(strcmp(x,"011111110101")==0){
strcpy(y,"11001000101111101100000");
}
else if(strcmp(x,"011111110110")==0){
strcpy(y,"11001000100110001010001");
}
else if(strcmp(x,"011111110111")==0){
strcpy(y,"11001000011100101000100");
}
else if(strcmp(x,"011111111000")==0){
strcpy(y,"11001000010011000111001");
}
else if(strcmp(x,"011111111001")==0){
strcpy(y,"11001000001001100110001");
}
else if(strcmp(x,"011111111010")==0){
strcpy(y,"11001000000000000101011");
}
else if(strcmp(x,"011111111011")==0){
strcpy(y,"11000111110110100100111");
}
else if(strcmp(x,"011111111100")==0){
strcpy(y,"11000111101101000100110");
}
else if(strcmp(x,"011111111101")==0){
strcpy(y,"11000111100011100100111");
}
else if(strcmp(x,"011111111110")==0){
strcpy(y,"11000111011010000101011");
}
else if(strcmp(x,"011111111111")==0){
strcpy(y,"11000111010000100110001");
}
else if(strcmp(x,"100000000000")==0){
strcpy(y,"11000111000111000111001");
}
else if(strcmp(x,"100000000001")==0){
strcpy(y,"11000110111101101000100");
}
else if(strcmp(x,"100000000010")==0){
strcpy(y,"11000110110100001010001");
}
else if(strcmp(x,"100000000011")==0){
strcpy(y,"11000110101010101100000");
}
else if(strcmp(x,"100000000100")==0){
strcpy(y,"11000110100001001110010");
}
else if(strcmp(x,"100000000101")==0){
strcpy(y,"11000110010111110000110");
}
else if(strcmp(x,"100000000110")==0){
strcpy(y,"11000110001110010011100");
}
else if(strcmp(x,"100000000111")==0){
strcpy(y,"11000110000100110110101");
}
else if(strcmp(x,"100000001000")==0){
strcpy(y,"11000101111011011010000");
}
else if(strcmp(x,"100000001001")==0){
strcpy(y,"11000101110001111101110");
}
else if(strcmp(x,"100000001010")==0){
strcpy(y,"11000101101000100001110");
}
else if(strcmp(x,"100000001011")==0){
strcpy(y,"11000101011111000110000");
}
else if(strcmp(x,"100000001100")==0){
strcpy(y,"11000101010101101010101");
}
else if(strcmp(x,"100000001101")==0){
strcpy(y,"11000101001100001111100");
}
else if(strcmp(x,"100000001110")==0){
strcpy(y,"11000101000010110100101");
}
else if(strcmp(x,"100000001111")==0){
strcpy(y,"11000100111001011010001");
}
else if(strcmp(x,"100000010000")==0){
strcpy(y,"11000100101111111111111");
}
else if(strcmp(x,"100000010001")==0){
strcpy(y,"11000100100110100101111");
}
else if(strcmp(x,"100000010010")==0){
strcpy(y,"11000100011101001100010");
}
else if(strcmp(x,"100000010011")==0){
strcpy(y,"11000100010011110010111");
}
else if(strcmp(x,"100000010100")==0){
strcpy(y,"11000100001010011001111");
}
else if(strcmp(x,"100000010101")==0){
strcpy(y,"11000100000001000001000");
}
else if(strcmp(x,"100000010110")==0){
strcpy(y,"11000011110111101000100");
}
else if(strcmp(x,"100000010111")==0){
strcpy(y,"11000011101110010000011");
}
else if(strcmp(x,"100000011000")==0){
strcpy(y,"11000011100100111000100");
}
else if(strcmp(x,"100000011001")==0){
strcpy(y,"11000011011011100000111");
}
else if(strcmp(x,"100000011010")==0){
strcpy(y,"11000011010010001001100");
}
else if(strcmp(x,"100000011011")==0){
strcpy(y,"11000011001000110010100");
}
else if(strcmp(x,"100000011100")==0){
strcpy(y,"11000010111111011011110");
}
else if(strcmp(x,"100000011101")==0){
strcpy(y,"11000010110110000101010");
}
else if(strcmp(x,"100000011110")==0){
strcpy(y,"11000010101100101111001");
}
else if(strcmp(x,"100000011111")==0){
strcpy(y,"11000010100011011001010");
}
else if(strcmp(x,"100000100000")==0){
strcpy(y,"11000010011010000011110");
}
else if(strcmp(x,"100000100001")==0){
strcpy(y,"11000010010000101110011");
}
else if(strcmp(x,"100000100010")==0){
strcpy(y,"11000010000111011001011");
}
else if(strcmp(x,"100000100011")==0){
strcpy(y,"11000001111110000100110");
}
else if(strcmp(x,"100000100100")==0){
strcpy(y,"11000001110100110000010");
}
else if(strcmp(x,"100000100101")==0){
strcpy(y,"11000001101011011100001");
}
else if(strcmp(x,"100000100110")==0){
strcpy(y,"11000001100010001000011");
}
else if(strcmp(x,"100000100111")==0){
strcpy(y,"11000001011000110100110");
}
else if(strcmp(x,"100000101000")==0){
strcpy(y,"11000001001111100001100");
}
else if(strcmp(x,"100000101001")==0){
strcpy(y,"11000001000110001110100");
}
else if(strcmp(x,"100000101010")==0){
strcpy(y,"11000000111100111011111");
}
else if(strcmp(x,"100000101011")==0){
strcpy(y,"11000000110011101001100");
}
else if(strcmp(x,"100000101100")==0){
strcpy(y,"11000000101010010111011");
}
else if(strcmp(x,"100000101101")==0){
strcpy(y,"11000000100001000101100");
}
else if(strcmp(x,"100000101110")==0){
strcpy(y,"11000000010111110100000");
}
else if(strcmp(x,"100000101111")==0){
strcpy(y,"11000000001110100010110");
}
else if(strcmp(x,"100000110000")==0){
strcpy(y,"11000000000101010001110");
}
else if(strcmp(x,"100000110001")==0){
strcpy(y,"10111111111100000001001");
}
else if(strcmp(x,"100000110010")==0){
strcpy(y,"10111111110010110000110");
}
else if(strcmp(x,"100000110011")==0){
strcpy(y,"10111111101001100000101");
}
else if(strcmp(x,"100000110100")==0){
strcpy(y,"10111111100000010000111");
}
else if(strcmp(x,"100000110101")==0){
strcpy(y,"10111111010111000001011");
}
else if(strcmp(x,"100000110110")==0){
strcpy(y,"10111111001101110010001");
}
else if(strcmp(x,"100000110111")==0){
strcpy(y,"10111111000100100011001");
}
else if(strcmp(x,"100000111000")==0){
strcpy(y,"10111110111011010100100");
}
else if(strcmp(x,"100000111001")==0){
strcpy(y,"10111110110010000110001");
}
else if(strcmp(x,"100000111010")==0){
strcpy(y,"10111110101000111000000");
}
else if(strcmp(x,"100000111011")==0){
strcpy(y,"10111110011111101010010");
}
else if(strcmp(x,"100000111100")==0){
strcpy(y,"10111110010110011100110");
}
else if(strcmp(x,"100000111101")==0){
strcpy(y,"10111110001101001111100");
}
else if(strcmp(x,"100000111110")==0){
strcpy(y,"10111110000100000010100");
}
else if(strcmp(x,"100000111111")==0){
strcpy(y,"10111101111010110101111");
}
else if(strcmp(x,"100001000000")==0){
strcpy(y,"10111101110001101001100");
}
else if(strcmp(x,"100001000001")==0){
strcpy(y,"10111101101000011101011");
}
else if(strcmp(x,"100001000010")==0){
strcpy(y,"10111101011111010001100");
}
else if(strcmp(x,"100001000011")==0){
strcpy(y,"10111101010110000110000");
}
else if(strcmp(x,"100001000100")==0){
strcpy(y,"10111101001100111010110");
}
else if(strcmp(x,"100001000101")==0){
strcpy(y,"10111101000011101111110");
}
else if(strcmp(x,"100001000110")==0){
strcpy(y,"10111100111010100101001");
}
else if(strcmp(x,"100001000111")==0){
strcpy(y,"10111100110001011010110");
}
else if(strcmp(x,"100001001000")==0){
strcpy(y,"10111100101000010000101");
}
else if(strcmp(x,"100001001001")==0){
strcpy(y,"10111100011111000110110");
}
else if(strcmp(x,"100001001010")==0){
strcpy(y,"10111100010101111101010");
}
else if(strcmp(x,"100001001011")==0){
strcpy(y,"10111100001100110100000");
}
else if(strcmp(x,"100001001100")==0){
strcpy(y,"10111100000011101011000");
}
else if(strcmp(x,"100001001101")==0){
strcpy(y,"10111011111010100010010");
}
else if(strcmp(x,"100001001110")==0){
strcpy(y,"10111011110001011001111");
}
else if(strcmp(x,"100001001111")==0){
strcpy(y,"10111011101000010001110");
}
else if(strcmp(x,"100001010000")==0){
strcpy(y,"10111011011111001001111");
}
else if(strcmp(x,"100001010001")==0){
strcpy(y,"10111011010110000010010");
}
else if(strcmp(x,"100001010010")==0){
strcpy(y,"10111011001100111011000");
}
else if(strcmp(x,"100001010011")==0){
strcpy(y,"10111011000011110100000");
}
else if(strcmp(x,"100001010100")==0){
strcpy(y,"10111010111010101101010");
}
else if(strcmp(x,"100001010101")==0){
strcpy(y,"10111010110001100110111");
}
else if(strcmp(x,"100001010110")==0){
strcpy(y,"10111010101000100000101");
}
else if(strcmp(x,"100001010111")==0){
strcpy(y,"10111010011111011010110");
}
else if(strcmp(x,"100001011000")==0){
strcpy(y,"10111010010110010101001");
}
else if(strcmp(x,"100001011001")==0){
strcpy(y,"10111010001101001111111");
}
else if(strcmp(x,"100001011010")==0){
strcpy(y,"10111010000100001010110");
}
else if(strcmp(x,"100001011011")==0){
strcpy(y,"10111001111011000110000");
}
else if(strcmp(x,"100001011100")==0){
strcpy(y,"10111001110010000001100");
}
else if(strcmp(x,"100001011101")==0){
strcpy(y,"10111001101000111101010");
}
else if(strcmp(x,"100001011110")==0){
strcpy(y,"10111001011111111001011");
}
else if(strcmp(x,"100001011111")==0){
strcpy(y,"10111001010110110101110");
}
else if(strcmp(x,"100001100000")==0){
strcpy(y,"10111001001101110010011");
}
else if(strcmp(x,"100001100001")==0){
strcpy(y,"10111001000100101111010");
}
else if(strcmp(x,"100001100010")==0){
strcpy(y,"10111000111011101100011");
}
else if(strcmp(x,"100001100011")==0){
strcpy(y,"10111000110010101001111");
}
else if(strcmp(x,"100001100100")==0){
strcpy(y,"10111000101001100111101");
}
else if(strcmp(x,"100001100101")==0){
strcpy(y,"10111000100000100101101");
}
else if(strcmp(x,"100001100110")==0){
strcpy(y,"10111000010111100011111");
}
else if(strcmp(x,"100001100111")==0){
strcpy(y,"10111000001110100010100");
}
else if(strcmp(x,"100001101000")==0){
strcpy(y,"10111000000101100001011");
}
else if(strcmp(x,"100001101001")==0){
strcpy(y,"10110111111100100000100");
}
else if(strcmp(x,"100001101010")==0){
strcpy(y,"10110111110011011111111");
}
else if(strcmp(x,"100001101011")==0){
strcpy(y,"10110111101010011111100");
}
else if(strcmp(x,"100001101100")==0){
strcpy(y,"10110111100001011111100");
}
else if(strcmp(x,"100001101101")==0){
strcpy(y,"10110111011000011111110");
}
else if(strcmp(x,"100001101110")==0){
strcpy(y,"10110111001111100000010");
}
else if(strcmp(x,"100001101111")==0){
strcpy(y,"10110111000110100001000");
}
else if(strcmp(x,"100001110000")==0){
strcpy(y,"10110110111101100010000");
}
else if(strcmp(x,"100001110001")==0){
strcpy(y,"10110110110100100011011");
}
else if(strcmp(x,"100001110010")==0){
strcpy(y,"10110110101011100101000");
}
else if(strcmp(x,"100001110011")==0){
strcpy(y,"10110110100010100110111");
}
else if(strcmp(x,"100001110100")==0){
strcpy(y,"10110110011001101001000");
}
else if(strcmp(x,"100001110101")==0){
strcpy(y,"10110110010000101011100");
}
else if(strcmp(x,"100001110110")==0){
strcpy(y,"10110110000111101110010");
}
else if(strcmp(x,"100001110111")==0){
strcpy(y,"10110101111110110001001");
}
else if(strcmp(x,"100001111000")==0){
strcpy(y,"10110101110101110100011");
}
else if(strcmp(x,"100001111001")==0){
strcpy(y,"10110101101100111000000");
}
else if(strcmp(x,"100001111010")==0){
strcpy(y,"10110101100011111011110");
}
else if(strcmp(x,"100001111011")==0){
strcpy(y,"10110101011010111111111");
}
else if(strcmp(x,"100001111100")==0){
strcpy(y,"10110101010010000100010");
}
else if(strcmp(x,"100001111101")==0){
strcpy(y,"10110101001001001000111");
}
else if(strcmp(x,"100001111110")==0){
strcpy(y,"10110101000000001101110");
}
else if(strcmp(x,"100001111111")==0){
strcpy(y,"10110100110111010010111");
}
else if(strcmp(x,"100010000000")==0){
strcpy(y,"10110100101110011000011");
}
else if(strcmp(x,"100010000001")==0){
strcpy(y,"10110100100101011110001");
}
else if(strcmp(x,"100010000010")==0){
strcpy(y,"10110100011100100100001");
}
else if(strcmp(x,"100010000011")==0){
strcpy(y,"10110100010011101010011");
}
else if(strcmp(x,"100010000100")==0){
strcpy(y,"10110100001010110000111");
}
else if(strcmp(x,"100010000101")==0){
strcpy(y,"10110100000001110111110");
}
else if(strcmp(x,"100010000110")==0){
strcpy(y,"10110011111000111110110");
}
else if(strcmp(x,"100010000111")==0){
strcpy(y,"10110011110000000110001");
}
else if(strcmp(x,"100010001000")==0){
strcpy(y,"10110011100111001101110");
}
else if(strcmp(x,"100010001001")==0){
strcpy(y,"10110011011110010101101");
}
else if(strcmp(x,"100010001010")==0){
strcpy(y,"10110011010101011101111");
}
else if(strcmp(x,"100010001011")==0){
strcpy(y,"10110011001100100110010");
}
else if(strcmp(x,"100010001100")==0){
strcpy(y,"10110011000011101111000");
}
else if(strcmp(x,"100010001101")==0){
strcpy(y,"10110010111010111000000");
}
else if(strcmp(x,"100010001110")==0){
strcpy(y,"10110010110010000001010");
}
else if(strcmp(x,"100010001111")==0){
strcpy(y,"10110010101001001010110");
}
else if(strcmp(x,"100010010000")==0){
strcpy(y,"10110010100000010100100");
}
else if(strcmp(x,"100010010001")==0){
strcpy(y,"10110010010111011110101");
}
else if(strcmp(x,"100010010010")==0){
strcpy(y,"10110010001110101000111");
}
else if(strcmp(x,"100010010011")==0){
strcpy(y,"10110010000101110011100");
}
else if(strcmp(x,"100010010100")==0){
strcpy(y,"10110001111100111110011");
}
else if(strcmp(x,"100010010101")==0){
strcpy(y,"10110001110100001001100");
}
else if(strcmp(x,"100010010110")==0){
strcpy(y,"10110001101011010100111");
}
else if(strcmp(x,"100010010111")==0){
strcpy(y,"10110001100010100000101");
}
else if(strcmp(x,"100010011000")==0){
strcpy(y,"10110001011001101100100");
}
else if(strcmp(x,"100010011001")==0){
strcpy(y,"10110001010000111000110");
}
else if(strcmp(x,"100010011010")==0){
strcpy(y,"10110001001000000101010");
}
else if(strcmp(x,"100010011011")==0){
strcpy(y,"10110000111111010010000");
}
else if(strcmp(x,"100010011100")==0){
strcpy(y,"10110000110110011111000");
}
else if(strcmp(x,"100010011101")==0){
strcpy(y,"10110000101101101100011");
}
else if(strcmp(x,"100010011110")==0){
strcpy(y,"10110000100100111001111");
}
else if(strcmp(x,"100010011111")==0){
strcpy(y,"10110000011100000111110");
}
else if(strcmp(x,"100010100000")==0){
strcpy(y,"10110000010011010101110");
}
else if(strcmp(x,"100010100001")==0){
strcpy(y,"10110000001010100100001");
}
else if(strcmp(x,"100010100010")==0){
strcpy(y,"10110000000001110010110");
}
else if(strcmp(x,"100010100011")==0){
strcpy(y,"10101111111001000001101");
}
else if(strcmp(x,"100010100100")==0){
strcpy(y,"10101111110000010000111");
}
else if(strcmp(x,"100010100101")==0){
strcpy(y,"10101111100111100000010");
}
else if(strcmp(x,"100010100110")==0){
strcpy(y,"10101111011110110000000");
}
else if(strcmp(x,"100010100111")==0){
strcpy(y,"10101111010101111111111");
}
else if(strcmp(x,"100010101000")==0){
strcpy(y,"10101111001101010000001");
}
else if(strcmp(x,"100010101001")==0){
strcpy(y,"10101111000100100000101");
}
else if(strcmp(x,"100010101010")==0){
strcpy(y,"10101110111011110001011");
}
else if(strcmp(x,"100010101011")==0){
strcpy(y,"10101110110011000010011");
}
else if(strcmp(x,"100010101100")==0){
strcpy(y,"10101110101010010011110");
}
else if(strcmp(x,"100010101101")==0){
strcpy(y,"10101110100001100101010");
}
else if(strcmp(x,"100010101110")==0){
strcpy(y,"10101110011000110111001");
}
else if(strcmp(x,"100010101111")==0){
strcpy(y,"10101110010000001001001");
}
else if(strcmp(x,"100010110000")==0){
strcpy(y,"10101110000111011011100");
}
else if(strcmp(x,"100010110001")==0){
strcpy(y,"10101101111110101110001");
}
else if(strcmp(x,"100010110010")==0){
strcpy(y,"10101101110110000001000");
}
else if(strcmp(x,"100010110011")==0){
strcpy(y,"10101101101101010100001");
}
else if(strcmp(x,"100010110100")==0){
strcpy(y,"10101101100100100111101");
}
else if(strcmp(x,"100010110101")==0){
strcpy(y,"10101101011011111011010");
}
else if(strcmp(x,"100010110110")==0){
strcpy(y,"10101101010011001111001");
}
else if(strcmp(x,"100010110111")==0){
strcpy(y,"10101101001010100011011");
}
else if(strcmp(x,"100010111000")==0){
strcpy(y,"10101101000001110111111");
}
else if(strcmp(x,"100010111001")==0){
strcpy(y,"10101100111001001100101");
}
else if(strcmp(x,"100010111010")==0){
strcpy(y,"10101100110000100001100");
}
else if(strcmp(x,"100010111011")==0){
strcpy(y,"10101100100111110110111");
}
else if(strcmp(x,"100010111100")==0){
strcpy(y,"10101100011111001100011");
}
else if(strcmp(x,"100010111101")==0){
strcpy(y,"10101100010110100010001");
}
else if(strcmp(x,"100010111110")==0){
strcpy(y,"10101100001101111000001");
}
else if(strcmp(x,"100010111111")==0){
strcpy(y,"10101100000101001110100");
}
else if(strcmp(x,"100011000000")==0){
strcpy(y,"10101011111100100101000");
}
else if(strcmp(x,"100011000001")==0){
strcpy(y,"10101011110011111011111");
}
else if(strcmp(x,"100011000010")==0){
strcpy(y,"10101011101011010010111");
}
else if(strcmp(x,"100011000011")==0){
strcpy(y,"10101011100010101010010");
}
else if(strcmp(x,"100011000100")==0){
strcpy(y,"10101011011010000001111");
}
else if(strcmp(x,"100011000101")==0){
strcpy(y,"10101011010001011001110");
}
else if(strcmp(x,"100011000110")==0){
strcpy(y,"10101011001000110001111");
}
else if(strcmp(x,"100011000111")==0){
strcpy(y,"10101011000000001010010");
}
else if(strcmp(x,"100011001000")==0){
strcpy(y,"10101010110111100011000");
}
else if(strcmp(x,"100011001001")==0){
strcpy(y,"10101010101110111011111");
}
else if(strcmp(x,"100011001010")==0){
strcpy(y,"10101010100110010101000");
}
else if(strcmp(x,"100011001011")==0){
strcpy(y,"10101010011101101110100");
}
else if(strcmp(x,"100011001100")==0){
strcpy(y,"10101010010101001000001");
}
else if(strcmp(x,"100011001101")==0){
strcpy(y,"10101010001100100010001");
}
else if(strcmp(x,"100011001110")==0){
strcpy(y,"10101010000011111100011");
}
else if(strcmp(x,"100011001111")==0){
strcpy(y,"10101001111011010110111");
}
else if(strcmp(x,"100011010000")==0){
strcpy(y,"10101001110010110001100");
}
else if(strcmp(x,"100011010001")==0){
strcpy(y,"10101001101010001100100");
}
else if(strcmp(x,"100011010010")==0){
strcpy(y,"10101001100001100111110");
}
else if(strcmp(x,"100011010011")==0){
strcpy(y,"10101001011001000011011");
}
else if(strcmp(x,"100011010100")==0){
strcpy(y,"10101001010000011111001");
}
else if(strcmp(x,"100011010101")==0){
strcpy(y,"10101001000111111011001");
}
else if(strcmp(x,"100011010110")==0){
strcpy(y,"10101000111111010111011");
}
else if(strcmp(x,"100011010111")==0){
strcpy(y,"10101000110110110100000");
}
else if(strcmp(x,"100011011000")==0){
strcpy(y,"10101000101110010000110");
}
else if(strcmp(x,"100011011001")==0){
strcpy(y,"10101000100101101101111");
}
else if(strcmp(x,"100011011010")==0){
strcpy(y,"10101000011101001011001");
}
else if(strcmp(x,"100011011011")==0){
strcpy(y,"10101000010100101000110");
}
else if(strcmp(x,"100011011100")==0){
strcpy(y,"10101000001100000110101");
}
else if(strcmp(x,"100011011101")==0){
strcpy(y,"10101000000011100100101");
}
else if(strcmp(x,"100011011110")==0){
strcpy(y,"10100111111011000011000");
}
else if(strcmp(x,"100011011111")==0){
strcpy(y,"10100111110010100001101");
}
else if(strcmp(x,"100011100000")==0){
strcpy(y,"10100111101010000000100");
}
else if(strcmp(x,"100011100001")==0){
strcpy(y,"10100111100001011111101");
}
else if(strcmp(x,"100011100010")==0){
strcpy(y,"10100111011000111111000");
}
else if(strcmp(x,"100011100011")==0){
strcpy(y,"10100111010000011110101");
}
else if(strcmp(x,"100011100100")==0){
strcpy(y,"10100111000111111110100");
}
else if(strcmp(x,"100011100101")==0){
strcpy(y,"10100110111111011110101");
}
else if(strcmp(x,"100011100110")==0){
strcpy(y,"10100110110110111111001");
}
else if(strcmp(x,"100011100111")==0){
strcpy(y,"10100110101110011111110");
}
else if(strcmp(x,"100011101000")==0){
strcpy(y,"10100110100110000000101");
}
else if(strcmp(x,"100011101001")==0){
strcpy(y,"10100110011101100001111");
}
else if(strcmp(x,"100011101010")==0){
strcpy(y,"10100110010101000011010");
}
else if(strcmp(x,"100011101011")==0){
strcpy(y,"10100110001100100101000");
}
else if(strcmp(x,"100011101100")==0){
strcpy(y,"10100110000100000110111");
}
else if(strcmp(x,"100011101101")==0){
strcpy(y,"10100101111011101001001");
}
else if(strcmp(x,"100011101110")==0){
strcpy(y,"10100101110011001011100");
}
else if(strcmp(x,"100011101111")==0){
strcpy(y,"10100101101010101110010");
}
else if(strcmp(x,"100011110000")==0){
strcpy(y,"10100101100010010001001");
}
else if(strcmp(x,"100011110001")==0){
strcpy(y,"10100101011001110100011");
}
else if(strcmp(x,"100011110010")==0){
strcpy(y,"10100101010001010111111");
}
else if(strcmp(x,"100011110011")==0){
strcpy(y,"10100101001000111011101");
}
else if(strcmp(x,"100011110100")==0){
strcpy(y,"10100101000000011111100");
}
else if(strcmp(x,"100011110101")==0){
strcpy(y,"10100100111000000011110");
}
else if(strcmp(x,"100011110110")==0){
strcpy(y,"10100100101111101000010");
}
else if(strcmp(x,"100011110111")==0){
strcpy(y,"10100100100111001101000");
}
else if(strcmp(x,"100011111000")==0){
strcpy(y,"10100100011110110010000");
}
else if(strcmp(x,"100011111001")==0){
strcpy(y,"10100100010110010111010");
}
else if(strcmp(x,"100011111010")==0){
strcpy(y,"10100100001101111100101");
}
else if(strcmp(x,"100011111011")==0){
strcpy(y,"10100100000101100010011");
}
else if(strcmp(x,"100011111100")==0){
strcpy(y,"10100011111101001000011");
}
else if(strcmp(x,"100011111101")==0){
strcpy(y,"10100011110100101110101");
}
else if(strcmp(x,"100011111110")==0){
strcpy(y,"10100011101100010101001");
}
else if(strcmp(x,"100011111111")==0){
strcpy(y,"10100011100011111011111");
}
else if(strcmp(x,"100100000000")==0){
strcpy(y,"10100011011011100010111");
}
else if(strcmp(x,"100100000001")==0){
strcpy(y,"10100011010011001010001");
}
else if(strcmp(x,"100100000010")==0){
strcpy(y,"10100011001010110001101");
}
else if(strcmp(x,"100100000011")==0){
strcpy(y,"10100011000010011001011");
}
else if(strcmp(x,"100100000100")==0){
strcpy(y,"10100010111010000001100");
}
else if(strcmp(x,"100100000101")==0){
strcpy(y,"10100010110001101001110");
}
else if(strcmp(x,"100100000110")==0){
strcpy(y,"10100010101001010010010");
}
else if(strcmp(x,"100100000111")==0){
strcpy(y,"10100010100000111011000");
}
else if(strcmp(x,"100100001000")==0){
strcpy(y,"10100010011000100100000");
}
else if(strcmp(x,"100100001001")==0){
strcpy(y,"10100010010000001101010");
}
else if(strcmp(x,"100100001010")==0){
strcpy(y,"10100010000111110110110");
}
else if(strcmp(x,"100100001011")==0){
strcpy(y,"10100001111111100000100");
}
else if(strcmp(x,"100100001100")==0){
strcpy(y,"10100001110111001010100");
}
else if(strcmp(x,"100100001101")==0){
strcpy(y,"10100001101110110100110");
}
else if(strcmp(x,"100100001110")==0){
strcpy(y,"10100001100110011111011");
}
else if(strcmp(x,"100100001111")==0){
strcpy(y,"10100001011110001010001");
}
else if(strcmp(x,"100100010000")==0){
strcpy(y,"10100001010101110101001");
}
else if(strcmp(x,"100100010001")==0){
strcpy(y,"10100001001101100000011");
}
else if(strcmp(x,"100100010010")==0){
strcpy(y,"10100001000101001011111");
}
else if(strcmp(x,"100100010011")==0){
strcpy(y,"10100000111100110111101");
}
else if(strcmp(x,"100100010100")==0){
strcpy(y,"10100000110100100011101");
}
else if(strcmp(x,"100100010101")==0){
strcpy(y,"10100000101100001111111");
}
else if(strcmp(x,"100100010110")==0){
strcpy(y,"10100000100011111100011");
}
else if(strcmp(x,"100100010111")==0){
strcpy(y,"10100000011011101001001");
}
else if(strcmp(x,"100100011000")==0){
strcpy(y,"10100000010011010110001");
}
else if(strcmp(x,"100100011001")==0){
strcpy(y,"10100000001011000011011");
}
else if(strcmp(x,"100100011010")==0){
strcpy(y,"10100000000010110000111");
}
else if(strcmp(x,"100100011011")==0){
strcpy(y,"10011111111010011110101");
}
else if(strcmp(x,"100100011100")==0){
strcpy(y,"10011111110010001100101");
}
else if(strcmp(x,"100100011101")==0){
strcpy(y,"10011111101001111010111");
}
else if(strcmp(x,"100100011110")==0){
strcpy(y,"10011111100001101001011");
}
else if(strcmp(x,"100100011111")==0){
strcpy(y,"10011111011001011000001");
}
else if(strcmp(x,"100100100000")==0){
strcpy(y,"10011111010001000111000");
}
else if(strcmp(x,"100100100001")==0){
strcpy(y,"10011111001000110110010");
}
else if(strcmp(x,"100100100010")==0){
strcpy(y,"10011111000000100101110");
}
else if(strcmp(x,"100100100011")==0){
strcpy(y,"10011110111000010101100");
}
else if(strcmp(x,"100100100100")==0){
strcpy(y,"10011110110000000101011");
}
else if(strcmp(x,"100100100101")==0){
strcpy(y,"10011110100111110101101");
}
else if(strcmp(x,"100100100110")==0){
strcpy(y,"10011110011111100110001");
}
else if(strcmp(x,"100100100111")==0){
strcpy(y,"10011110010111010110110");
}
else if(strcmp(x,"100100101000")==0){
strcpy(y,"10011110001111000111110");
}
else if(strcmp(x,"100100101001")==0){
strcpy(y,"10011110000110111000111");
}
else if(strcmp(x,"100100101010")==0){
strcpy(y,"10011101111110101010011");
}
else if(strcmp(x,"100100101011")==0){
strcpy(y,"10011101110110011100000");
}
else if(strcmp(x,"100100101100")==0){
strcpy(y,"10011101101110001110000");
}
else if(strcmp(x,"100100101101")==0){
strcpy(y,"10011101100110000000001");
}
else if(strcmp(x,"100100101110")==0){
strcpy(y,"10011101011101110010101");
}
else if(strcmp(x,"100100101111")==0){
strcpy(y,"10011101010101100101010");
}
else if(strcmp(x,"100100110000")==0){
strcpy(y,"10011101001101011000001");
}
else if(strcmp(x,"100100110001")==0){
strcpy(y,"10011101000101001011010");
}
else if(strcmp(x,"100100110010")==0){
strcpy(y,"10011100111100111110110");
}
else if(strcmp(x,"100100110011")==0){
strcpy(y,"10011100110100110010011");
}
else if(strcmp(x,"100100110100")==0){
strcpy(y,"10011100101100100110010");
}
else if(strcmp(x,"100100110101")==0){
strcpy(y,"10011100100100011010011");
}
else if(strcmp(x,"100100110110")==0){
strcpy(y,"10011100011100001110110");
}
else if(strcmp(x,"100100110111")==0){
strcpy(y,"10011100010100000011011");
}
else if(strcmp(x,"100100111000")==0){
strcpy(y,"10011100001011111000010");
}
else if(strcmp(x,"100100111001")==0){
strcpy(y,"10011100000011101101010");
}
else if(strcmp(x,"100100111010")==0){
strcpy(y,"10011011111011100010101");
}
else if(strcmp(x,"100100111011")==0){
strcpy(y,"10011011110011011000010");
}
else if(strcmp(x,"100100111100")==0){
strcpy(y,"10011011101011001110000");
}
else if(strcmp(x,"100100111101")==0){
strcpy(y,"10011011100011000100001");
}
else if(strcmp(x,"100100111110")==0){
strcpy(y,"10011011011010111010011");
}
else if(strcmp(x,"100100111111")==0){
strcpy(y,"10011011010010110001000");
}
else if(strcmp(x,"100101000000")==0){
strcpy(y,"10011011001010100111110");
}
else if(strcmp(x,"100101000001")==0){
strcpy(y,"10011011000010011110111");
}
else if(strcmp(x,"100101000010")==0){
strcpy(y,"10011010111010010110001");
}
else if(strcmp(x,"100101000011")==0){
strcpy(y,"10011010110010001101101");
}
else if(strcmp(x,"100101000100")==0){
strcpy(y,"10011010101010000101011");
}
else if(strcmp(x,"100101000101")==0){
strcpy(y,"10011010100001111101011");
}
else if(strcmp(x,"100101000110")==0){
strcpy(y,"10011010011001110101101");
}
else if(strcmp(x,"100101000111")==0){
strcpy(y,"10011010010001101110001");
}
else if(strcmp(x,"100101001000")==0){
strcpy(y,"10011010001001100110111");
}
else if(strcmp(x,"100101001001")==0){
strcpy(y,"10011010000001011111111");
}
else if(strcmp(x,"100101001010")==0){
strcpy(y,"10011001111001011001000");
}
else if(strcmp(x,"100101001011")==0){
strcpy(y,"10011001110001010010100");
}
else if(strcmp(x,"100101001100")==0){
strcpy(y,"10011001101001001100001");
}
else if(strcmp(x,"100101001101")==0){
strcpy(y,"10011001100001000110001");
}
else if(strcmp(x,"100101001110")==0){
strcpy(y,"10011001011001000000010");
}
else if(strcmp(x,"100101001111")==0){
strcpy(y,"10011001010000111010110");
}
else if(strcmp(x,"100101010000")==0){
strcpy(y,"10011001001000110101011");
}
else if(strcmp(x,"100101010001")==0){
strcpy(y,"10011001000000110000010");
}
else if(strcmp(x,"100101010010")==0){
strcpy(y,"10011000111000101011011");
}
else if(strcmp(x,"100101010011")==0){
strcpy(y,"10011000110000100110110");
}
else if(strcmp(x,"100101010100")==0){
strcpy(y,"10011000101000100010011");
}
else if(strcmp(x,"100101010101")==0){
strcpy(y,"10011000100000011110001");
}
else if(strcmp(x,"100101010110")==0){
strcpy(y,"10011000011000011010010");
}
else if(strcmp(x,"100101010111")==0){
strcpy(y,"10011000010000010110101");
}
else if(strcmp(x,"100101011000")==0){
strcpy(y,"10011000001000010011001");
}
else if(strcmp(x,"100101011001")==0){
strcpy(y,"10011000000000001111111");
}
else if(strcmp(x,"100101011010")==0){
strcpy(y,"10010111111000001101000");
}
else if(strcmp(x,"100101011011")==0){
strcpy(y,"10010111110000001010010");
}
else if(strcmp(x,"100101011100")==0){
strcpy(y,"10010111101000000111110");
}
else if(strcmp(x,"100101011101")==0){
strcpy(y,"10010111100000000101100");
}
else if(strcmp(x,"100101011110")==0){
strcpy(y,"10010111011000000011100");
}
else if(strcmp(x,"100101011111")==0){
strcpy(y,"10010111010000000001110");
}
else if(strcmp(x,"100101100000")==0){
strcpy(y,"10010111001000000000001");
}
else if(strcmp(x,"100101100001")==0){
strcpy(y,"10010110111111111110111");
}
else if(strcmp(x,"100101100010")==0){
strcpy(y,"10010110110111111101111");
}
else if(strcmp(x,"100101100011")==0){
strcpy(y,"10010110101111111101000");
}
else if(strcmp(x,"100101100100")==0){
strcpy(y,"10010110100111111100011");
}
else if(strcmp(x,"100101100101")==0){
strcpy(y,"10010110011111111100000");
}
else if(strcmp(x,"100101100110")==0){
strcpy(y,"10010110010111111011111");
}
else if(strcmp(x,"100101100111")==0){
strcpy(y,"10010110001111111100000");
}
else if(strcmp(x,"100101101000")==0){
strcpy(y,"10010110000111111100011");
}
else if(strcmp(x,"100101101001")==0){
strcpy(y,"10010101111111111101000");
}
else if(strcmp(x,"100101101010")==0){
strcpy(y,"10010101110111111101111");
}
else if(strcmp(x,"100101101011")==0){
strcpy(y,"10010101101111111110111");
}
else if(strcmp(x,"100101101100")==0){
strcpy(y,"10010101101000000000010");
}
else if(strcmp(x,"100101101101")==0){
strcpy(y,"10010101100000000001110");
}
else if(strcmp(x,"100101101110")==0){
strcpy(y,"10010101011000000011100");
}
else if(strcmp(x,"100101101111")==0){
strcpy(y,"10010101010000000101100");
}
else if(strcmp(x,"100101110000")==0){
strcpy(y,"10010101001000000111110");
}
else if(strcmp(x,"100101110001")==0){
strcpy(y,"10010101000000001010010");
}
else if(strcmp(x,"100101110010")==0){
strcpy(y,"10010100111000001100111");
}
else if(strcmp(x,"100101110011")==0){
strcpy(y,"10010100110000001111111");
}
else if(strcmp(x,"100101110100")==0){
strcpy(y,"10010100101000010011000");
}
else if(strcmp(x,"100101110101")==0){
strcpy(y,"10010100100000010110100");
}
else if(strcmp(x,"100101110110")==0){
strcpy(y,"10010100011000011010001");
}
else if(strcmp(x,"100101110111")==0){
strcpy(y,"10010100010000011110000");
}
else if(strcmp(x,"100101111000")==0){
strcpy(y,"10010100001000100010001");
}
else if(strcmp(x,"100101111001")==0){
strcpy(y,"10010100000000100110011");
}
else if(strcmp(x,"100101111010")==0){
strcpy(y,"10010011111000101011000");
}
else if(strcmp(x,"100101111011")==0){
strcpy(y,"10010011110000101111111");
}
else if(strcmp(x,"100101111100")==0){
strcpy(y,"10010011101000110100111");
}
else if(strcmp(x,"100101111101")==0){
strcpy(y,"10010011100000111010001");
}
else if(strcmp(x,"100101111110")==0){
strcpy(y,"10010011011000111111101");
}
else if(strcmp(x,"100101111111")==0){
strcpy(y,"10010011010001000101011");
}
else if(strcmp(x,"100110000000")==0){
strcpy(y,"10010011001001001011011");
}
else if(strcmp(x,"100110000001")==0){
strcpy(y,"10010011000001010001101");
}
else if(strcmp(x,"100110000010")==0){
strcpy(y,"10010010111001011000000");
}
else if(strcmp(x,"100110000011")==0){
strcpy(y,"10010010110001011110110");
}
else if(strcmp(x,"100110000100")==0){
strcpy(y,"10010010101001100101101");
}
else if(strcmp(x,"100110000101")==0){
strcpy(y,"10010010100001101100110");
}
else if(strcmp(x,"100110000110")==0){
strcpy(y,"10010010011001110100001");
}
else if(strcmp(x,"100110000111")==0){
strcpy(y,"10010010010001111011110");
}
else if(strcmp(x,"100110001000")==0){
strcpy(y,"10010010001010000011101");
}
else if(strcmp(x,"100110001001")==0){
strcpy(y,"10010010000010001011101");
}
else if(strcmp(x,"100110001010")==0){
strcpy(y,"10010001111010010100000");
}
else if(strcmp(x,"100110001011")==0){
strcpy(y,"10010001110010011100100");
}
else if(strcmp(x,"100110001100")==0){
strcpy(y,"10010001101010100101010");
}
else if(strcmp(x,"100110001101")==0){
strcpy(y,"10010001100010101110010");
}
else if(strcmp(x,"100110001110")==0){
strcpy(y,"10010001011010110111011");
}
else if(strcmp(x,"100110001111")==0){
strcpy(y,"10010001010011000000111");
}
else if(strcmp(x,"100110010000")==0){
strcpy(y,"10010001001011001010101");
}
else if(strcmp(x,"100110010001")==0){
strcpy(y,"10010001000011010100100");
}
else if(strcmp(x,"100110010010")==0){
strcpy(y,"10010000111011011110101");
}
else if(strcmp(x,"100110010011")==0){
strcpy(y,"10010000110011101001000");
}
else if(strcmp(x,"100110010100")==0){
strcpy(y,"10010000101011110011101");
}
else if(strcmp(x,"100110010101")==0){
strcpy(y,"10010000100011111110011");
}
else if(strcmp(x,"100110010110")==0){
strcpy(y,"10010000011100001001100");
}
else if(strcmp(x,"100110010111")==0){
strcpy(y,"10010000010100010100110");
}
else if(strcmp(x,"100110011000")==0){
strcpy(y,"10010000001100100000010");
}
else if(strcmp(x,"100110011001")==0){
strcpy(y,"10010000000100101100000");
}
else if(strcmp(x,"100110011010")==0){
strcpy(y,"10001111111100111000000");
}
else if(strcmp(x,"100110011011")==0){
strcpy(y,"10001111110101000100010");
}
else if(strcmp(x,"100110011100")==0){
strcpy(y,"10001111101101010000101");
}
else if(strcmp(x,"100110011101")==0){
strcpy(y,"10001111100101011101011");
}
else if(strcmp(x,"100110011110")==0){
strcpy(y,"10001111011101101010010");
}
else if(strcmp(x,"100110011111")==0){
strcpy(y,"10001111010101110111011");
}
else if(strcmp(x,"100110100000")==0){
strcpy(y,"10001111001110000100101");
}
else if(strcmp(x,"100110100001")==0){
strcpy(y,"10001111000110010010010");
}
else if(strcmp(x,"100110100010")==0){
strcpy(y,"10001110111110100000000");
}
else if(strcmp(x,"100110100011")==0){
strcpy(y,"10001110110110101110001");
}
else if(strcmp(x,"100110100100")==0){
strcpy(y,"10001110101110111100011");
}
else if(strcmp(x,"100110100101")==0){
strcpy(y,"10001110100111001010111");
}
else if(strcmp(x,"100110100110")==0){
strcpy(y,"10001110011111011001100");
}
else if(strcmp(x,"100110100111")==0){
strcpy(y,"10001110010111101000100");
}
else if(strcmp(x,"100110101000")==0){
strcpy(y,"10001110001111110111101");
}
else if(strcmp(x,"100110101001")==0){
strcpy(y,"10001110001000000111000");
}
else if(strcmp(x,"100110101010")==0){
strcpy(y,"10001110000000010110101");
}
else if(strcmp(x,"100110101011")==0){
strcpy(y,"10001101111000100110100");
}
else if(strcmp(x,"100110101100")==0){
strcpy(y,"10001101110000110110101");
}
else if(strcmp(x,"100110101101")==0){
strcpy(y,"10001101101001000110111");
}
else if(strcmp(x,"100110101110")==0){
strcpy(y,"10001101100001010111011");
}
else if(strcmp(x,"100110101111")==0){
strcpy(y,"10001101011001101000001");
}
else if(strcmp(x,"100110110000")==0){
strcpy(y,"10001101010001111001001");
}
else if(strcmp(x,"100110110001")==0){
strcpy(y,"10001101001010001010011");
}
else if(strcmp(x,"100110110010")==0){
strcpy(y,"10001101000010011011110");
}
else if(strcmp(x,"100110110011")==0){
strcpy(y,"10001100111010101101100");
}
else if(strcmp(x,"100110110100")==0){
strcpy(y,"10001100110010111111011");
}
else if(strcmp(x,"100110110101")==0){
strcpy(y,"10001100101011010001100");
}
else if(strcmp(x,"100110110110")==0){
strcpy(y,"10001100100011100011110");
}
else if(strcmp(x,"100110110111")==0){
strcpy(y,"10001100011011110110011");
}
else if(strcmp(x,"100110111000")==0){
strcpy(y,"10001100010100001001001");
}
else if(strcmp(x,"100110111001")==0){
strcpy(y,"10001100001100011100001");
}
else if(strcmp(x,"100110111010")==0){
strcpy(y,"10001100000100101111011");
}
else if(strcmp(x,"100110111011")==0){
strcpy(y,"10001011111101000010110");
}
else if(strcmp(x,"100110111100")==0){
strcpy(y,"10001011110101010110100");
}
else if(strcmp(x,"100110111101")==0){
strcpy(y,"10001011101101101010011");
}
else if(strcmp(x,"100110111110")==0){
strcpy(y,"10001011100101111110100");
}
else if(strcmp(x,"100110111111")==0){
strcpy(y,"10001011011110010010111");
}
else if(strcmp(x,"100111000000")==0){
strcpy(y,"10001011010110100111100");
}
else if(strcmp(x,"100111000001")==0){
strcpy(y,"10001011001110111100010");
}
else if(strcmp(x,"100111000010")==0){
strcpy(y,"10001011000111010001010");
}
else if(strcmp(x,"100111000011")==0){
strcpy(y,"10001010111111100110100");
}
else if(strcmp(x,"100111000100")==0){
strcpy(y,"10001010110111111100000");
}
else if(strcmp(x,"100111000101")==0){
strcpy(y,"10001010110000010001101");
}
else if(strcmp(x,"100111000110")==0){
strcpy(y,"10001010101000100111101");
}
else if(strcmp(x,"100111000111")==0){
strcpy(y,"10001010100000111101110");
}
else if(strcmp(x,"100111001000")==0){
strcpy(y,"10001010011001010100001");
}
else if(strcmp(x,"100111001001")==0){
strcpy(y,"10001010010001101010101");
}
else if(strcmp(x,"100111001010")==0){
strcpy(y,"10001010001010000001100");
}
else if(strcmp(x,"100111001011")==0){
strcpy(y,"10001010000010011000100");
}
else if(strcmp(x,"100111001100")==0){
strcpy(y,"10001001111010101111110");
}
else if(strcmp(x,"100111001101")==0){
strcpy(y,"10001001110011000111010");
}
else if(strcmp(x,"100111001110")==0){
strcpy(y,"10001001101011011110111");
}
else if(strcmp(x,"100111001111")==0){
strcpy(y,"10001001100011110110111");
}
else if(strcmp(x,"100111010000")==0){
strcpy(y,"10001001011100001111000");
}
else if(strcmp(x,"100111010001")==0){
strcpy(y,"10001001010100100111011");
}
else if(strcmp(x,"100111010010")==0){
strcpy(y,"10001001001100111111111");
}
else if(strcmp(x,"100111010011")==0){
strcpy(y,"10001001000101011000110");
}
else if(strcmp(x,"100111010100")==0){
strcpy(y,"10001000111101110001110");
}
else if(strcmp(x,"100111010101")==0){
strcpy(y,"10001000110110001011000");
}
else if(strcmp(x,"100111010110")==0){
strcpy(y,"10001000101110100100011");
}
else if(strcmp(x,"100111010111")==0){
strcpy(y,"10001000100110111110001");
}
else if(strcmp(x,"100111011000")==0){
strcpy(y,"10001000011111011000000");
}
else if(strcmp(x,"100111011001")==0){
strcpy(y,"10001000010111110010001");
}
else if(strcmp(x,"100111011010")==0){
strcpy(y,"10001000010000001100100");
}
else if(strcmp(x,"100111011011")==0){
strcpy(y,"10001000001000100111000");
}
else if(strcmp(x,"100111011100")==0){
strcpy(y,"10001000000001000001111");
}
else if(strcmp(x,"100111011101")==0){
strcpy(y,"10000111111001011100111");
}
else if(strcmp(x,"100111011110")==0){
strcpy(y,"10000111110001111000001");
}
else if(strcmp(x,"100111011111")==0){
strcpy(y,"10000111101010010011100");
}
else if(strcmp(x,"100111100000")==0){
strcpy(y,"10000111100010101111001");
}
else if(strcmp(x,"100111100001")==0){
strcpy(y,"10000111011011001011000");
}
else if(strcmp(x,"100111100010")==0){
strcpy(y,"10000111010011100111001");
}
else if(strcmp(x,"100111100011")==0){
strcpy(y,"10000111001100000011100");
}
else if(strcmp(x,"100111100100")==0){
strcpy(y,"10000111000100100000000");
}
else if(strcmp(x,"100111100101")==0){
strcpy(y,"10000110111100111100110");
}
else if(strcmp(x,"100111100110")==0){
strcpy(y,"10000110110101011001110");
}
else if(strcmp(x,"100111100111")==0){
strcpy(y,"10000110101101110111000");
}
else if(strcmp(x,"100111101000")==0){
strcpy(y,"10000110100110010100011");
}
else if(strcmp(x,"100111101001")==0){
strcpy(y,"10000110011110110010000");
}
else if(strcmp(x,"100111101010")==0){
strcpy(y,"10000110010111001111111");
}
else if(strcmp(x,"100111101011")==0){
strcpy(y,"10000110001111101101111");
}
else if(strcmp(x,"100111101100")==0){
strcpy(y,"10000110001000001100010");
}
else if(strcmp(x,"100111101101")==0){
strcpy(y,"10000110000000101010110");
}
else if(strcmp(x,"100111101110")==0){
strcpy(y,"10000101111001001001011");
}
else if(strcmp(x,"100111101111")==0){
strcpy(y,"10000101110001101000011");
}
else if(strcmp(x,"100111110000")==0){
strcpy(y,"10000101101010000111100");
}
else if(strcmp(x,"100111110001")==0){
strcpy(y,"10000101100010100110111");
}
else if(strcmp(x,"100111110010")==0){
strcpy(y,"10000101011011000110100");
}
else if(strcmp(x,"100111110011")==0){
strcpy(y,"10000101010011100110010");
}
else if(strcmp(x,"100111110100")==0){
strcpy(y,"10000101001100000110011");
}
else if(strcmp(x,"100111110101")==0){
strcpy(y,"10000101000100100110100");
}
else if(strcmp(x,"100111110110")==0){
strcpy(y,"10000100111101000111000");
}
else if(strcmp(x,"100111110111")==0){
strcpy(y,"10000100110101100111110");
}
else if(strcmp(x,"100111111000")==0){
strcpy(y,"10000100101110001000101");
}
else if(strcmp(x,"100111111001")==0){
strcpy(y,"10000100100110101001110");
}
else if(strcmp(x,"100111111010")==0){
strcpy(y,"10000100011111001011000");
}
else if(strcmp(x,"100111111011")==0){
strcpy(y,"10000100010111101100100");
}
else if(strcmp(x,"100111111100")==0){
strcpy(y,"10000100010000001110010");
}
else if(strcmp(x,"100111111101")==0){
strcpy(y,"10000100001000110000010");
}
else if(strcmp(x,"100111111110")==0){
strcpy(y,"10000100000001010010100");
}
else if(strcmp(x,"100111111111")==0){
strcpy(y,"10000011111001110100111");
}
else if(strcmp(x,"101000000000")==0){
strcpy(y,"10000011110010010111100");
}
else if(strcmp(x,"101000000001")==0){
strcpy(y,"10000011101010111010010");
}
else if(strcmp(x,"101000000010")==0){
strcpy(y,"10000011100011011101011");
}
else if(strcmp(x,"101000000011")==0){
strcpy(y,"10000011011100000000101");
}
else if(strcmp(x,"101000000100")==0){
strcpy(y,"10000011010100100100001");
}
else if(strcmp(x,"101000000101")==0){
strcpy(y,"10000011001101000111110");
}
else if(strcmp(x,"101000000110")==0){
strcpy(y,"10000011000101101011110");
}
else if(strcmp(x,"101000000111")==0){
strcpy(y,"10000010111110001111110");
}
else if(strcmp(x,"101000001000")==0){
strcpy(y,"10000010110110110100001");
}
else if(strcmp(x,"101000001001")==0){
strcpy(y,"10000010101111011000110");
}
else if(strcmp(x,"101000001010")==0){
strcpy(y,"10000010100111111101100");
}
else if(strcmp(x,"101000001011")==0){
strcpy(y,"10000010100000100010011");
}
else if(strcmp(x,"101000001100")==0){
strcpy(y,"10000010011001000111101");
}
else if(strcmp(x,"101000001101")==0){
strcpy(y,"10000010010001101101000");
}
else if(strcmp(x,"101000001110")==0){
strcpy(y,"10000010001010010010101");
}
else if(strcmp(x,"101000001111")==0){
strcpy(y,"10000010000010111000100");
}
else if(strcmp(x,"101000010000")==0){
strcpy(y,"10000001111011011110100");
}
else if(strcmp(x,"101000010001")==0){
strcpy(y,"10000001110100000100110");
}
else if(strcmp(x,"101000010010")==0){
strcpy(y,"10000001101100101011010");
}
else if(strcmp(x,"101000010011")==0){
strcpy(y,"10000001100101010001111");
}
else if(strcmp(x,"101000010100")==0){
strcpy(y,"10000001011101111000110");
}
else if(strcmp(x,"101000010101")==0){
strcpy(y,"10000001010110011111111");
}
else if(strcmp(x,"101000010110")==0){
strcpy(y,"10000001001111000111010");
}
else if(strcmp(x,"101000010111")==0){
strcpy(y,"10000001000111101110110");
}
else if(strcmp(x,"101000011000")==0){
strcpy(y,"10000001000000010110100");
}
else if(strcmp(x,"101000011001")==0){
strcpy(y,"10000000111000111110100");
}
else if(strcmp(x,"101000011010")==0){
strcpy(y,"10000000110001100110101");
}
else if(strcmp(x,"101000011011")==0){
strcpy(y,"10000000101010001111000");
}
else if(strcmp(x,"101000011100")==0){
strcpy(y,"10000000100010110111101");
}
else if(strcmp(x,"101000011101")==0){
strcpy(y,"10000000011011100000011");
}
else if(strcmp(x,"101000011110")==0){
strcpy(y,"10000000010100001001011");
}
else if(strcmp(x,"101000011111")==0){
strcpy(y,"10000000001100110010101");
}
else if(strcmp(x,"101000100000")==0){
strcpy(y,"10000000000101011100001");
}
else if(strcmp(x,"101000100001")==0){
strcpy(y,"01111111111110000101110");
}
else if(strcmp(x,"101000100010")==0){
strcpy(y,"01111111110110101111101");
}
else if(strcmp(x,"101000100011")==0){
strcpy(y,"01111111101111011001101");
}
else if(strcmp(x,"101000100100")==0){
strcpy(y,"01111111101000000011111");
}
else if(strcmp(x,"101000100101")==0){
strcpy(y,"01111111100000101110011");
}
else if(strcmp(x,"101000100110")==0){
strcpy(y,"01111111011001011001001");
}
else if(strcmp(x,"101000100111")==0){
strcpy(y,"01111111010010000100000");
}
else if(strcmp(x,"101000101000")==0){
strcpy(y,"01111111001010101111001");
}
else if(strcmp(x,"101000101001")==0){
strcpy(y,"01111111000011011010100");
}
else if(strcmp(x,"101000101010")==0){
strcpy(y,"01111110111100000110000");
}
else if(strcmp(x,"101000101011")==0){
strcpy(y,"01111110110100110001110");
}
else if(strcmp(x,"101000101100")==0){
strcpy(y,"01111110101101011101110");
}
else if(strcmp(x,"101000101101")==0){
strcpy(y,"01111110100110001001111");
}
else if(strcmp(x,"101000101110")==0){
strcpy(y,"01111110011110110110010");
}
else if(strcmp(x,"101000101111")==0){
strcpy(y,"01111110010111100010111");
}
else if(strcmp(x,"101000110000")==0){
strcpy(y,"01111110010000001111101");
}
else if(strcmp(x,"101000110001")==0){
strcpy(y,"01111110001000111100101");
}
else if(strcmp(x,"101000110010")==0){
strcpy(y,"01111110000001101001111");
}
else if(strcmp(x,"101000110011")==0){
strcpy(y,"01111101111010010111011");
}
else if(strcmp(x,"101000110100")==0){
strcpy(y,"01111101110011000101000");
}
else if(strcmp(x,"101000110101")==0){
strcpy(y,"01111101101011110010110");
}
else if(strcmp(x,"101000110110")==0){
strcpy(y,"01111101100100100000111");
}
else if(strcmp(x,"101000110111")==0){
strcpy(y,"01111101011101001111001");
}
else if(strcmp(x,"101000111000")==0){
strcpy(y,"01111101010101111101101");
}
else if(strcmp(x,"101000111001")==0){
strcpy(y,"01111101001110101100010");
}
else if(strcmp(x,"101000111010")==0){
strcpy(y,"01111101000111011011001");
}
else if(strcmp(x,"101000111011")==0){
strcpy(y,"01111101000000001010010");
}
else if(strcmp(x,"101000111100")==0){
strcpy(y,"01111100111000111001100");
}
else if(strcmp(x,"101000111101")==0){
strcpy(y,"01111100110001101001000");
}
else if(strcmp(x,"101000111110")==0){
strcpy(y,"01111100101010011000110");
}
else if(strcmp(x,"101000111111")==0){
strcpy(y,"01111100100011001000101");
}
else if(strcmp(x,"101001000000")==0){
strcpy(y,"01111100011011111000110");
}
else if(strcmp(x,"101001000001")==0){
strcpy(y,"01111100010100101001001");
}
else if(strcmp(x,"101001000010")==0){
strcpy(y,"01111100001101011001101");
}
else if(strcmp(x,"101001000011")==0){
strcpy(y,"01111100000110001010011");
}
else if(strcmp(x,"101001000100")==0){
strcpy(y,"01111011111110111011011");
}
else if(strcmp(x,"101001000101")==0){
strcpy(y,"01111011110111101100100");
}
else if(strcmp(x,"101001000110")==0){
strcpy(y,"01111011110000011101111");
}
else if(strcmp(x,"101001000111")==0){
strcpy(y,"01111011101001001111100");
}
else if(strcmp(x,"101001001000")==0){
strcpy(y,"01111011100010000001010");
}
else if(strcmp(x,"101001001001")==0){
strcpy(y,"01111011011010110011010");
}
else if(strcmp(x,"101001001010")==0){
strcpy(y,"01111011010011100101011");
}
else if(strcmp(x,"101001001011")==0){
strcpy(y,"01111011001100010111111");
}
else if(strcmp(x,"101001001100")==0){
strcpy(y,"01111011000101001010011");
}
else if(strcmp(x,"101001001101")==0){
strcpy(y,"01111010111101111101010");
}
else if(strcmp(x,"101001001110")==0){
strcpy(y,"01111010110110110000010");
}
else if(strcmp(x,"101001001111")==0){
strcpy(y,"01111010101111100011100");
}
else if(strcmp(x,"101001010000")==0){
strcpy(y,"01111010101000010110111");
}
else if(strcmp(x,"101001010001")==0){
strcpy(y,"01111010100001001010100");
}
else if(strcmp(x,"101001010010")==0){
strcpy(y,"01111010011001111110011");
}
else if(strcmp(x,"101001010011")==0){
strcpy(y,"01111010010010110010011");
}
else if(strcmp(x,"101001010100")==0){
strcpy(y,"01111010001011100110101");
}
else if(strcmp(x,"101001010101")==0){
strcpy(y,"01111010000100011011001");
}
else if(strcmp(x,"101001010110")==0){
strcpy(y,"01111001111101001111110");
}
else if(strcmp(x,"101001010111")==0){
strcpy(y,"01111001110110000100101");
}
else if(strcmp(x,"101001011000")==0){
strcpy(y,"01111001101110111001101");
}
else if(strcmp(x,"101001011001")==0){
strcpy(y,"01111001100111101110111");
}
else if(strcmp(x,"101001011010")==0){
strcpy(y,"01111001100000100100011");
}
else if(strcmp(x,"101001011011")==0){
strcpy(y,"01111001011001011010001");
}
else if(strcmp(x,"101001011100")==0){
strcpy(y,"01111001010010010000000");
}
else if(strcmp(x,"101001011101")==0){
strcpy(y,"01111001001011000110000");
}
else if(strcmp(x,"101001011110")==0){
strcpy(y,"01111001000011111100011");
}
else if(strcmp(x,"101001011111")==0){
strcpy(y,"01111000111100110010110");
}
else if(strcmp(x,"101001100000")==0){
strcpy(y,"01111000110101101001100");
}
else if(strcmp(x,"101001100001")==0){
strcpy(y,"01111000101110100000011");
}
else if(strcmp(x,"101001100010")==0){
strcpy(y,"01111000100111010111100");
}
else if(strcmp(x,"101001100011")==0){
strcpy(y,"01111000100000001110110");
}
else if(strcmp(x,"101001100100")==0){
strcpy(y,"01111000011001000110010");
}
else if(strcmp(x,"101001100101")==0){
strcpy(y,"01111000010001111110000");
}
else if(strcmp(x,"101001100110")==0){
strcpy(y,"01111000001010110101111");
}
else if(strcmp(x,"101001100111")==0){
strcpy(y,"01111000000011101110000");
}
else if(strcmp(x,"101001101000")==0){
strcpy(y,"01110111111100100110011");
}
else if(strcmp(x,"101001101001")==0){
strcpy(y,"01110111110101011110111");
}
else if(strcmp(x,"101001101010")==0){
strcpy(y,"01110111101110010111101");
}
else if(strcmp(x,"101001101011")==0){
strcpy(y,"01110111100111010000100");
}
else if(strcmp(x,"101001101100")==0){
strcpy(y,"01110111100000001001101");
}
else if(strcmp(x,"101001101101")==0){
strcpy(y,"01110111011001000010111");
}
else if(strcmp(x,"101001101110")==0){
strcpy(y,"01110111010001111100100");
}
else if(strcmp(x,"101001101111")==0){
strcpy(y,"01110111001010110110001");
}
else if(strcmp(x,"101001110000")==0){
strcpy(y,"01110111000011110000001");
}
else if(strcmp(x,"101001110001")==0){
strcpy(y,"01110110111100101010010");
}
else if(strcmp(x,"101001110010")==0){
strcpy(y,"01110110110101100100101");
}
else if(strcmp(x,"101001110011")==0){
strcpy(y,"01110110101110011111001");
}
else if(strcmp(x,"101001110100")==0){
strcpy(y,"01110110100111011001111");
}
else if(strcmp(x,"101001110101")==0){
strcpy(y,"01110110100000010100110");
}
else if(strcmp(x,"101001110110")==0){
strcpy(y,"01110110011001001111111");
}
else if(strcmp(x,"101001110111")==0){
strcpy(y,"01110110010010001011010");
}
else if(strcmp(x,"101001111000")==0){
strcpy(y,"01110110001011000110110");
}
else if(strcmp(x,"101001111001")==0){
strcpy(y,"01110110000100000010100");
}
else if(strcmp(x,"101001111010")==0){
strcpy(y,"01110101111100111110011");
}
else if(strcmp(x,"101001111011")==0){
strcpy(y,"01110101110101111010101");
}
else if(strcmp(x,"101001111100")==0){
strcpy(y,"01110101101110110110111");
}
else if(strcmp(x,"101001111101")==0){
strcpy(y,"01110101100111110011100");
}
else if(strcmp(x,"101001111110")==0){
strcpy(y,"01110101100000110000001");
}
else if(strcmp(x,"101001111111")==0){
strcpy(y,"01110101011001101101001");
}
else if(strcmp(x,"101010000000")==0){
strcpy(y,"01110101010010101010010");
}
else if(strcmp(x,"101010000001")==0){
strcpy(y,"01110101001011100111101");
}
else if(strcmp(x,"101010000010")==0){
strcpy(y,"01110101000100100101001");
}
else if(strcmp(x,"101010000011")==0){
strcpy(y,"01110100111101100010111");
}
else if(strcmp(x,"101010000100")==0){
strcpy(y,"01110100110110100000110");
}
else if(strcmp(x,"101010000101")==0){
strcpy(y,"01110100101111011110111");
}
else if(strcmp(x,"101010000110")==0){
strcpy(y,"01110100101000011101010");
}
else if(strcmp(x,"101010000111")==0){
strcpy(y,"01110100100001011011110");
}
else if(strcmp(x,"101010001000")==0){
strcpy(y,"01110100011010011010100");
}
else if(strcmp(x,"101010001001")==0){
strcpy(y,"01110100010011011001011");
}
else if(strcmp(x,"101010001010")==0){
strcpy(y,"01110100001100011000100");
}
else if(strcmp(x,"101010001011")==0){
strcpy(y,"01110100000101010111111");
}
else if(strcmp(x,"101010001100")==0){
strcpy(y,"01110011111110010111011");
}
else if(strcmp(x,"101010001101")==0){
strcpy(y,"01110011110111010111001");
}
else if(strcmp(x,"101010001110")==0){
strcpy(y,"01110011110000010111000");
}
else if(strcmp(x,"101010001111")==0){
strcpy(y,"01110011101001010111001");
}
else if(strcmp(x,"101010010000")==0){
strcpy(y,"01110011100010010111011");
}
else if(strcmp(x,"101010010001")==0){
strcpy(y,"01110011011011010111111");
}
else if(strcmp(x,"101010010010")==0){
strcpy(y,"01110011010100011000101");
}
else if(strcmp(x,"101010010011")==0){
strcpy(y,"01110011001101011001100");
}
else if(strcmp(x,"101010010100")==0){
strcpy(y,"01110011000110011010101");
}
else if(strcmp(x,"101010010101")==0){
strcpy(y,"01110010111111011011111");
}
else if(strcmp(x,"101010010110")==0){
strcpy(y,"01110010111000011101011");
}
else if(strcmp(x,"101010010111")==0){
strcpy(y,"01110010110001011111001");
}
else if(strcmp(x,"101010011000")==0){
strcpy(y,"01110010101010100001000");
}
else if(strcmp(x,"101010011001")==0){
strcpy(y,"01110010100011100011000");
}
else if(strcmp(x,"101010011010")==0){
strcpy(y,"01110010011100100101011");
}
else if(strcmp(x,"101010011011")==0){
strcpy(y,"01110010010101100111110");
}
else if(strcmp(x,"101010011100")==0){
strcpy(y,"01110010001110101010100");
}
else if(strcmp(x,"101010011101")==0){
strcpy(y,"01110010000111101101011");
}
else if(strcmp(x,"101010011110")==0){
strcpy(y,"01110010000000110000011");
}
else if(strcmp(x,"101010011111")==0){
strcpy(y,"01110001111001110011101");
}
else if(strcmp(x,"101010100000")==0){
strcpy(y,"01110001110010110111001");
}
else if(strcmp(x,"101010100001")==0){
strcpy(y,"01110001101011111010110");
}
else if(strcmp(x,"101010100010")==0){
strcpy(y,"01110001100100111110101");
}
else if(strcmp(x,"101010100011")==0){
strcpy(y,"01110001011110000010101");
}
else if(strcmp(x,"101010100100")==0){
strcpy(y,"01110001010111000110111");
}
else if(strcmp(x,"101010100101")==0){
strcpy(y,"01110001010000001011011");
}
else if(strcmp(x,"101010100110")==0){
strcpy(y,"01110001001001010000000");
}
else if(strcmp(x,"101010100111")==0){
strcpy(y,"01110001000010010100110");
}
else if(strcmp(x,"101010101000")==0){
strcpy(y,"01110000111011011001110");
}
else if(strcmp(x,"101010101001")==0){
strcpy(y,"01110000110100011111000");
}
else if(strcmp(x,"101010101010")==0){
strcpy(y,"01110000101101100100011");
}
else if(strcmp(x,"101010101011")==0){
strcpy(y,"01110000100110101010000");
}
else if(strcmp(x,"101010101100")==0){
strcpy(y,"01110000011111101111110");
}
else if(strcmp(x,"101010101101")==0){
strcpy(y,"01110000011000110101110");
}
else if(strcmp(x,"101010101110")==0){
strcpy(y,"01110000010001111100000");
}
else if(strcmp(x,"101010101111")==0){
strcpy(y,"01110000001011000010011");
}
else if(strcmp(x,"101010110000")==0){
strcpy(y,"01110000000100001000111");
}
else if(strcmp(x,"101010110001")==0){
strcpy(y,"01101111111101001111101");
}
else if(strcmp(x,"101010110010")==0){
strcpy(y,"01101111110110010110101");
}
else if(strcmp(x,"101010110011")==0){
strcpy(y,"01101111101111011101110");
}
else if(strcmp(x,"101010110100")==0){
strcpy(y,"01101111101000100101001");
}
else if(strcmp(x,"101010110101")==0){
strcpy(y,"01101111100001101100101");
}
else if(strcmp(x,"101010110110")==0){
strcpy(y,"01101111011010110100011");
}
else if(strcmp(x,"101010110111")==0){
strcpy(y,"01101111010011111100011");
}
else if(strcmp(x,"101010111000")==0){
strcpy(y,"01101111001101000100011");
}
else if(strcmp(x,"101010111001")==0){
strcpy(y,"01101111000110001100110");
}
else if(strcmp(x,"101010111010")==0){
strcpy(y,"01101110111111010101010");
}
else if(strcmp(x,"101010111011")==0){
strcpy(y,"01101110111000011110000");
}
else if(strcmp(x,"101010111100")==0){
strcpy(y,"01101110110001100110111");
}
else if(strcmp(x,"101010111101")==0){
strcpy(y,"01101110101010101111111");
}
else if(strcmp(x,"101010111110")==0){
strcpy(y,"01101110100011111001001");
}
else if(strcmp(x,"101010111111")==0){
strcpy(y,"01101110011101000010101");
}
else if(strcmp(x,"101011000000")==0){
strcpy(y,"01101110010110001100010");
}
else if(strcmp(x,"101011000001")==0){
strcpy(y,"01101110001111010110001");
}
else if(strcmp(x,"101011000010")==0){
strcpy(y,"01101110001000100000010");
}
else if(strcmp(x,"101011000011")==0){
strcpy(y,"01101110000001101010011");
}
else if(strcmp(x,"101011000100")==0){
strcpy(y,"01101101111010110100111");
}
else if(strcmp(x,"101011000101")==0){
strcpy(y,"01101101110011111111100");
}
else if(strcmp(x,"101011000110")==0){
strcpy(y,"01101101101101001010010");
}
else if(strcmp(x,"101011000111")==0){
strcpy(y,"01101101100110010101010");
}
else if(strcmp(x,"101011001000")==0){
strcpy(y,"01101101011111100000100");
}
else if(strcmp(x,"101011001001")==0){
strcpy(y,"01101101011000101011111");
}
else if(strcmp(x,"101011001010")==0){
strcpy(y,"01101101010001110111011");
}
else if(strcmp(x,"101011001011")==0){
strcpy(y,"01101101001011000011001");
}
else if(strcmp(x,"101011001100")==0){
strcpy(y,"01101101000100001111001");
}
else if(strcmp(x,"101011001101")==0){
strcpy(y,"01101100111101011011010");
}
else if(strcmp(x,"101011001110")==0){
strcpy(y,"01101100110110100111101");
}
else if(strcmp(x,"101011001111")==0){
strcpy(y,"01101100101111110100001");
}
else if(strcmp(x,"101011010000")==0){
strcpy(y,"01101100101001000000111");
}
else if(strcmp(x,"101011010001")==0){
strcpy(y,"01101100100010001101110");
}
else if(strcmp(x,"101011010010")==0){
strcpy(y,"01101100011011011010111");
}
else if(strcmp(x,"101011010011")==0){
strcpy(y,"01101100010100101000001");
}
else if(strcmp(x,"101011010100")==0){
strcpy(y,"01101100001101110101101");
}
else if(strcmp(x,"101011010101")==0){
strcpy(y,"01101100000111000011010");
}
else if(strcmp(x,"101011010110")==0){
strcpy(y,"01101100000000010001001");
}
else if(strcmp(x,"101011010111")==0){
strcpy(y,"01101011111001011111010");
}
else if(strcmp(x,"101011011000")==0){
strcpy(y,"01101011110010101101011");
}
else if(strcmp(x,"101011011001")==0){
strcpy(y,"01101011101011111011111");
}
else if(strcmp(x,"101011011010")==0){
strcpy(y,"01101011100101001010100");
}
else if(strcmp(x,"101011011011")==0){
strcpy(y,"01101011011110011001010");
}
else if(strcmp(x,"101011011100")==0){
strcpy(y,"01101011010111101000010");
}
else if(strcmp(x,"101011011101")==0){
strcpy(y,"01101011010000110111011");
}
else if(strcmp(x,"101011011110")==0){
strcpy(y,"01101011001010000110110");
}
else if(strcmp(x,"101011011111")==0){
strcpy(y,"01101011000011010110011");
}
else if(strcmp(x,"101011100000")==0){
strcpy(y,"01101010111100100110001");
}
else if(strcmp(x,"101011100001")==0){
strcpy(y,"01101010110101110110000");
}
else if(strcmp(x,"101011100010")==0){
strcpy(y,"01101010101111000110001");
}
else if(strcmp(x,"101011100011")==0){
strcpy(y,"01101010101000010110100");
}
else if(strcmp(x,"101011100100")==0){
strcpy(y,"01101010100001100111000");
}
else if(strcmp(x,"101011100101")==0){
strcpy(y,"01101010011010110111101");
}
else if(strcmp(x,"101011100110")==0){
strcpy(y,"01101010010100001000100");
}
else if(strcmp(x,"101011100111")==0){
strcpy(y,"01101010001101011001101");
}
else if(strcmp(x,"101011101000")==0){
strcpy(y,"01101010000110101010111");
}
else if(strcmp(x,"101011101001")==0){
strcpy(y,"01101001111111111100010");
}
else if(strcmp(x,"101011101010")==0){
strcpy(y,"01101001111001001101111");
}
else if(strcmp(x,"101011101011")==0){
strcpy(y,"01101001110010011111110");
}
else if(strcmp(x,"101011101100")==0){
strcpy(y,"01101001101011110001110");
}
else if(strcmp(x,"101011101101")==0){
strcpy(y,"01101001100101000011111");
}
else if(strcmp(x,"101011101110")==0){
strcpy(y,"01101001011110010110010");
}
else if(strcmp(x,"101011101111")==0){
strcpy(y,"01101001010111101000111");
}
else if(strcmp(x,"101011110000")==0){
strcpy(y,"01101001010000111011101");
}
else if(strcmp(x,"101011110001")==0){
strcpy(y,"01101001001010001110100");
}
else if(strcmp(x,"101011110010")==0){
strcpy(y,"01101001000011100001101");
}
else if(strcmp(x,"101011110011")==0){
strcpy(y,"01101000111100110101000");
}
else if(strcmp(x,"101011110100")==0){
strcpy(y,"01101000110110001000100");
}
else if(strcmp(x,"101011110101")==0){
strcpy(y,"01101000101111011100001");
}
else if(strcmp(x,"101011110110")==0){
strcpy(y,"01101000101000110000000");
}
else if(strcmp(x,"101011110111")==0){
strcpy(y,"01101000100010000100000");
}
else if(strcmp(x,"101011111000")==0){
strcpy(y,"01101000011011011000010");
}
else if(strcmp(x,"101011111001")==0){
strcpy(y,"01101000010100101100110");
}
else if(strcmp(x,"101011111010")==0){
strcpy(y,"01101000001110000001011");
}
else if(strcmp(x,"101011111011")==0){
strcpy(y,"01101000000111010110001");
}
else if(strcmp(x,"101011111100")==0){
strcpy(y,"01101000000000101011001");
}
else if(strcmp(x,"101011111101")==0){
strcpy(y,"01100111111010000000010");
}
else if(strcmp(x,"101011111110")==0){
strcpy(y,"01100111110011010101101");
}
else if(strcmp(x,"101011111111")==0){
strcpy(y,"01100111101100101011001");
}
else if(strcmp(x,"101100000000")==0){
strcpy(y,"01100111100110000000111");
}
else if(strcmp(x,"101100000001")==0){
strcpy(y,"01100111011111010110110");
}
else if(strcmp(x,"101100000010")==0){
strcpy(y,"01100111011000101100111");
}
else if(strcmp(x,"101100000011")==0){
strcpy(y,"01100111010010000011001");
}
else if(strcmp(x,"101100000100")==0){
strcpy(y,"01100111001011011001101");
}
else if(strcmp(x,"101100000101")==0){
strcpy(y,"01100111000100110000010");
}
else if(strcmp(x,"101100000110")==0){
strcpy(y,"01100110111110000111001");
}
else if(strcmp(x,"101100000111")==0){
strcpy(y,"01100110110111011110001");
}
else if(strcmp(x,"101100001000")==0){
strcpy(y,"01100110110000110101010");
}
else if(strcmp(x,"101100001001")==0){
strcpy(y,"01100110101010001100110");
}
else if(strcmp(x,"101100001010")==0){
strcpy(y,"01100110100011100100010");
}
else if(strcmp(x,"101100001011")==0){
strcpy(y,"01100110011100111100000");
}
else if(strcmp(x,"101100001100")==0){
strcpy(y,"01100110010110010100000");
}
else if(strcmp(x,"101100001101")==0){
strcpy(y,"01100110001111101100000");
}
else if(strcmp(x,"101100001110")==0){
strcpy(y,"01100110001001000100011");
}
else if(strcmp(x,"101100001111")==0){
strcpy(y,"01100110000010011100111");
}
else if(strcmp(x,"101100010000")==0){
strcpy(y,"01100101111011110101100");
}
else if(strcmp(x,"101100010001")==0){
strcpy(y,"01100101110101001110011");
}
else if(strcmp(x,"101100010010")==0){
strcpy(y,"01100101101110100111011");
}
else if(strcmp(x,"101100010011")==0){
strcpy(y,"01100101101000000000101");
}
else if(strcmp(x,"101100010100")==0){
strcpy(y,"01100101100001011010000");
}
else if(strcmp(x,"101100010101")==0){
strcpy(y,"01100101011010110011101");
}
else if(strcmp(x,"101100010110")==0){
strcpy(y,"01100101010100001101011");
}
else if(strcmp(x,"101100010111")==0){
strcpy(y,"01100101001101100111011");
}
else if(strcmp(x,"101100011000")==0){
strcpy(y,"01100101000111000001100");
}
else if(strcmp(x,"101100011001")==0){
strcpy(y,"01100101000000011011110");
}
else if(strcmp(x,"101100011010")==0){
strcpy(y,"01100100111001110110010");
}
else if(strcmp(x,"101100011011")==0){
strcpy(y,"01100100110011010001000");
}
else if(strcmp(x,"101100011100")==0){
strcpy(y,"01100100101100101011110");
}
else if(strcmp(x,"101100011101")==0){
strcpy(y,"01100100100110000110111");
}
else if(strcmp(x,"101100011110")==0){
strcpy(y,"01100100011111100010001");
}
else if(strcmp(x,"101100011111")==0){
strcpy(y,"01100100011000111101100");
}
else if(strcmp(x,"101100100000")==0){
strcpy(y,"01100100010010011001001");
}
else if(strcmp(x,"101100100001")==0){
strcpy(y,"01100100001011110100111");
}
else if(strcmp(x,"101100100010")==0){
strcpy(y,"01100100000101010000110");
}
else if(strcmp(x,"101100100011")==0){
strcpy(y,"01100011111110101100111");
}
else if(strcmp(x,"101100100100")==0){
strcpy(y,"01100011111000001001010");
}
else if(strcmp(x,"101100100101")==0){
strcpy(y,"01100011110001100101110");
}
else if(strcmp(x,"101100100110")==0){
strcpy(y,"01100011101011000010011");
}
else if(strcmp(x,"101100100111")==0){
strcpy(y,"01100011100100011111010");
}
else if(strcmp(x,"101100101000")==0){
strcpy(y,"01100011011101111100010");
}
else if(strcmp(x,"101100101001")==0){
strcpy(y,"01100011010111011001100");
}
else if(strcmp(x,"101100101010")==0){
strcpy(y,"01100011010000110110111");
}
else if(strcmp(x,"101100101011")==0){
strcpy(y,"01100011001010010100100");
}
else if(strcmp(x,"101100101100")==0){
strcpy(y,"01100011000011110010010");
}
else if(strcmp(x,"101100101101")==0){
strcpy(y,"01100010111101010000010");
}
else if(strcmp(x,"101100101110")==0){
strcpy(y,"01100010110110101110011");
}
else if(strcmp(x,"101100101111")==0){
strcpy(y,"01100010110000001100101");
}
else if(strcmp(x,"101100110000")==0){
strcpy(y,"01100010101001101011001");
}
else if(strcmp(x,"101100110001")==0){
strcpy(y,"01100010100011001001110");
}
else if(strcmp(x,"101100110010")==0){
strcpy(y,"01100010011100101000101");
}
else if(strcmp(x,"101100110011")==0){
strcpy(y,"01100010010110000111101");
}
else if(strcmp(x,"101100110100")==0){
strcpy(y,"01100010001111100110111");
}
else if(strcmp(x,"101100110101")==0){
strcpy(y,"01100010001001000110010");
}
else if(strcmp(x,"101100110110")==0){
strcpy(y,"01100010000010100101110");
}
else if(strcmp(x,"101100110111")==0){
strcpy(y,"01100001111100000101100");
}
else if(strcmp(x,"101100111000")==0){
strcpy(y,"01100001110101100101011");
}
else if(strcmp(x,"101100111001")==0){
strcpy(y,"01100001101111000101100");
}
else if(strcmp(x,"101100111010")==0){
strcpy(y,"01100001101000100101110");
}
else if(strcmp(x,"101100111011")==0){
strcpy(y,"01100001100010000110010");
}
else if(strcmp(x,"101100111100")==0){
strcpy(y,"01100001011011100110111");
}
else if(strcmp(x,"101100111101")==0){
strcpy(y,"01100001010101000111110");
}
else if(strcmp(x,"101100111110")==0){
strcpy(y,"01100001001110101000110");
}
else if(strcmp(x,"101100111111")==0){
strcpy(y,"01100001001000001001111");
}
else if(strcmp(x,"101101000000")==0){
strcpy(y,"01100001000001101011010");
}
else if(strcmp(x,"101101000001")==0){
strcpy(y,"01100000111011001100110");
}
else if(strcmp(x,"101101000010")==0){
strcpy(y,"01100000110100101110100");
}
else if(strcmp(x,"101101000011")==0){
strcpy(y,"01100000101110010000011");
}
else if(strcmp(x,"101101000100")==0){
strcpy(y,"01100000100111110010011");
}
else if(strcmp(x,"101101000101")==0){
strcpy(y,"01100000100001010100101");
}
else if(strcmp(x,"101101000110")==0){
strcpy(y,"01100000011010110111000");
}
else if(strcmp(x,"101101000111")==0){
strcpy(y,"01100000010100011001101");
}
else if(strcmp(x,"101101001000")==0){
strcpy(y,"01100000001101111100011");
}
else if(strcmp(x,"101101001001")==0){
strcpy(y,"01100000000111011111011");
}
else if(strcmp(x,"101101001010")==0){
strcpy(y,"01100000000001000010100");
}
else if(strcmp(x,"101101001011")==0){
strcpy(y,"01011111111010100101110");
}
else if(strcmp(x,"101101001100")==0){
strcpy(y,"01011111110100001001010");
}
else if(strcmp(x,"101101001101")==0){
strcpy(y,"01011111101101101100111");
}
else if(strcmp(x,"101101001110")==0){
strcpy(y,"01011111100111010000110");
}
else if(strcmp(x,"101101001111")==0){
strcpy(y,"01011111100000110100110");
}
else if(strcmp(x,"101101010000")==0){
strcpy(y,"01011111011010011001000");
}
else if(strcmp(x,"101101010001")==0){
strcpy(y,"01011111010011111101011");
}
else if(strcmp(x,"101101010010")==0){
strcpy(y,"01011111001101100001111");
}
else if(strcmp(x,"101101010011")==0){
strcpy(y,"01011111000111000110101");
}
else if(strcmp(x,"101101010100")==0){
strcpy(y,"01011111000000101011100");
}
else if(strcmp(x,"101101010101")==0){
strcpy(y,"01011110111010010000100");
}
else if(strcmp(x,"101101010110")==0){
strcpy(y,"01011110110011110101110");
}
else if(strcmp(x,"101101010111")==0){
strcpy(y,"01011110101101011011010");
}
else if(strcmp(x,"101101011000")==0){
strcpy(y,"01011110100111000000111");
}
else if(strcmp(x,"101101011001")==0){
strcpy(y,"01011110100000100110101");
}
else if(strcmp(x,"101101011010")==0){
strcpy(y,"01011110011010001100100");
}
else if(strcmp(x,"101101011011")==0){
strcpy(y,"01011110010011110010101");
}
else if(strcmp(x,"101101011100")==0){
strcpy(y,"01011110001101011001000");
}
else if(strcmp(x,"101101011101")==0){
strcpy(y,"01011110000110111111100");
}
else if(strcmp(x,"101101011110")==0){
strcpy(y,"01011110000000100110001");
}
else if(strcmp(x,"101101011111")==0){
strcpy(y,"01011101111010001100111");
}
else if(strcmp(x,"101101100000")==0){
strcpy(y,"01011101110011110011111");
}
else if(strcmp(x,"101101100001")==0){
strcpy(y,"01011101101101011011001");
}
else if(strcmp(x,"101101100010")==0){
strcpy(y,"01011101100111000010100");
}
else if(strcmp(x,"101101100011")==0){
strcpy(y,"01011101100000101010000");
}
else if(strcmp(x,"101101100100")==0){
strcpy(y,"01011101011010010001110");
}
else if(strcmp(x,"101101100101")==0){
strcpy(y,"01011101010011111001101");
}
else if(strcmp(x,"101101100110")==0){
strcpy(y,"01011101001101100001101");
}
else if(strcmp(x,"101101100111")==0){
strcpy(y,"01011101000111001001111");
}
else if(strcmp(x,"101101101000")==0){
strcpy(y,"01011101000000110010010");
}
else if(strcmp(x,"101101101001")==0){
strcpy(y,"01011100111010011010111");
}
else if(strcmp(x,"101101101010")==0){
strcpy(y,"01011100110100000011101");
}
else if(strcmp(x,"101101101011")==0){
strcpy(y,"01011100101101101100100");
}
else if(strcmp(x,"101101101100")==0){
strcpy(y,"01011100100111010101101");
}
else if(strcmp(x,"101101101101")==0){
strcpy(y,"01011100100000111110111");
}
else if(strcmp(x,"101101101110")==0){
strcpy(y,"01011100011010101000010");
}
else if(strcmp(x,"101101101111")==0){
strcpy(y,"01011100010100010001111");
}
else if(strcmp(x,"101101110000")==0){
strcpy(y,"01011100001101111011110");
}
else if(strcmp(x,"101101110001")==0){
strcpy(y,"01011100000111100101101");
}
else if(strcmp(x,"101101110010")==0){
strcpy(y,"01011100000001001111111");
}
else if(strcmp(x,"101101110011")==0){
strcpy(y,"01011011111010111010001");
}
else if(strcmp(x,"101101110100")==0){
strcpy(y,"01011011110100100100101");
}
else if(strcmp(x,"101101110101")==0){
strcpy(y,"01011011101110001111010");
}
else if(strcmp(x,"101101110110")==0){
strcpy(y,"01011011100111111010001");
}
else if(strcmp(x,"101101110111")==0){
strcpy(y,"01011011100001100101001");
}
else if(strcmp(x,"101101111000")==0){
strcpy(y,"01011011011011010000010");
}
else if(strcmp(x,"101101111001")==0){
strcpy(y,"01011011010100111011101");
}
else if(strcmp(x,"101101111010")==0){
strcpy(y,"01011011001110100111001");
}
else if(strcmp(x,"101101111011")==0){
strcpy(y,"01011011001000010010111");
}
else if(strcmp(x,"101101111100")==0){
strcpy(y,"01011011000001111110110");
}
else if(strcmp(x,"101101111101")==0){
strcpy(y,"01011010111011101010110");
}
else if(strcmp(x,"101101111110")==0){
strcpy(y,"01011010110101010111000");
}
else if(strcmp(x,"101101111111")==0){
strcpy(y,"01011010101111000011011");
}
else if(strcmp(x,"101110000000")==0){
strcpy(y,"01011010101000101111111");
}
else if(strcmp(x,"101110000001")==0){
strcpy(y,"01011010100010011100101");
}
else if(strcmp(x,"101110000010")==0){
strcpy(y,"01011010011100001001100");
}
else if(strcmp(x,"101110000011")==0){
strcpy(y,"01011010010101110110101");
}
else if(strcmp(x,"101110000100")==0){
strcpy(y,"01011010001111100011111");
}
else if(strcmp(x,"101110000101")==0){
strcpy(y,"01011010001001010001010");
}
else if(strcmp(x,"101110000110")==0){
strcpy(y,"01011010000010111110111");
}
else if(strcmp(x,"101110000111")==0){
strcpy(y,"01011001111100101100101");
}
else if(strcmp(x,"101110001000")==0){
strcpy(y,"01011001110110011010100");
}
else if(strcmp(x,"101110001001")==0){
strcpy(y,"01011001110000001000101");
}
else if(strcmp(x,"101110001010")==0){
strcpy(y,"01011001101001110110111");
}
else if(strcmp(x,"101110001011")==0){
strcpy(y,"01011001100011100101011");
}
else if(strcmp(x,"101110001100")==0){
strcpy(y,"01011001011101010100000");
}
else if(strcmp(x,"101110001101")==0){
strcpy(y,"01011001010111000010110");
}
else if(strcmp(x,"101110001110")==0){
strcpy(y,"01011001010000110001101");
}
else if(strcmp(x,"101110001111")==0){
strcpy(y,"01011001001010100000110");
}
else if(strcmp(x,"101110010000")==0){
strcpy(y,"01011001000100010000001");
}
else if(strcmp(x,"101110010001")==0){
strcpy(y,"01011000111101111111100");
}
else if(strcmp(x,"101110010010")==0){
strcpy(y,"01011000110111101111001");
}
else if(strcmp(x,"101110010011")==0){
strcpy(y,"01011000110001011111000");
}
else if(strcmp(x,"101110010100")==0){
strcpy(y,"01011000101011001111000");
}
else if(strcmp(x,"101110010101")==0){
strcpy(y,"01011000100100111111001");
}
else if(strcmp(x,"101110010110")==0){
strcpy(y,"01011000011110101111011");
}
else if(strcmp(x,"101110010111")==0){
strcpy(y,"01011000011000011111111");
}
else if(strcmp(x,"101110011000")==0){
strcpy(y,"01011000010010010000100");
}
else if(strcmp(x,"101110011001")==0){
strcpy(y,"01011000001100000001011");
}
else if(strcmp(x,"101110011010")==0){
strcpy(y,"01011000000101110010011");
}
else if(strcmp(x,"101110011011")==0){
strcpy(y,"01010111111111100011100");
}
else if(strcmp(x,"101110011100")==0){
strcpy(y,"01010111111001010100111");
}
else if(strcmp(x,"101110011101")==0){
strcpy(y,"01010111110011000110011");
}
else if(strcmp(x,"101110011110")==0){
strcpy(y,"01010111101100111000000");
}
else if(strcmp(x,"101110011111")==0){
strcpy(y,"01010111100110101001111");
}
else if(strcmp(x,"101110100000")==0){
strcpy(y,"01010111100000011011111");
}
else if(strcmp(x,"101110100001")==0){
strcpy(y,"01010111011010001110000");
}
else if(strcmp(x,"101110100010")==0){
strcpy(y,"01010111010100000000011");
}
else if(strcmp(x,"101110100011")==0){
strcpy(y,"01010111001101110010111");
}
else if(strcmp(x,"101110100100")==0){
strcpy(y,"01010111000111100101101");
}
else if(strcmp(x,"101110100101")==0){
strcpy(y,"01010111000001011000100");
}
else if(strcmp(x,"101110100110")==0){
strcpy(y,"01010110111011001011100");
}
else if(strcmp(x,"101110100111")==0){
strcpy(y,"01010110110100111110101");
}
else if(strcmp(x,"101110101000")==0){
strcpy(y,"01010110101110110010000");
}
else if(strcmp(x,"101110101001")==0){
strcpy(y,"01010110101000100101100");
}
else if(strcmp(x,"101110101010")==0){
strcpy(y,"01010110100010011001010");
}
else if(strcmp(x,"101110101011")==0){
strcpy(y,"01010110011100001101001");
}
else if(strcmp(x,"101110101100")==0){
strcpy(y,"01010110010110000001001");
}
else if(strcmp(x,"101110101101")==0){
strcpy(y,"01010110001111110101010");
}
else if(strcmp(x,"101110101110")==0){
strcpy(y,"01010110001001101001101");
}
else if(strcmp(x,"101110101111")==0){
strcpy(y,"01010110000011011110010");
}
else if(strcmp(x,"101110110000")==0){
strcpy(y,"01010101111101010010111");
}
else if(strcmp(x,"101110110001")==0){
strcpy(y,"01010101110111000111110");
}
else if(strcmp(x,"101110110010")==0){
strcpy(y,"01010101110000111100110");
}
else if(strcmp(x,"101110110011")==0){
strcpy(y,"01010101101010110010000");
}
else if(strcmp(x,"101110110100")==0){
strcpy(y,"01010101100100100111011");
}
else if(strcmp(x,"101110110101")==0){
strcpy(y,"01010101011110011100111");
}
else if(strcmp(x,"101110110110")==0){
strcpy(y,"01010101011000010010101");
}
else if(strcmp(x,"101110110111")==0){
strcpy(y,"01010101010010001000100");
}
else if(strcmp(x,"101110111000")==0){
strcpy(y,"01010101001011111110100");
}
else if(strcmp(x,"101110111001")==0){
strcpy(y,"01010101000101110100101");
}
else if(strcmp(x,"101110111010")==0){
strcpy(y,"01010100111111101011000");
}
else if(strcmp(x,"101110111011")==0){
strcpy(y,"01010100111001100001101");
}
else if(strcmp(x,"101110111100")==0){
strcpy(y,"01010100110011011000010");
}
else if(strcmp(x,"101110111101")==0){
strcpy(y,"01010100101101001111001");
}
else if(strcmp(x,"101110111110")==0){
strcpy(y,"01010100100111000110001");
}
else if(strcmp(x,"101110111111")==0){
strcpy(y,"01010100100000111101011");
}
else if(strcmp(x,"101111000000")==0){
strcpy(y,"01010100011010110100110");
}
else if(strcmp(x,"101111000001")==0){
strcpy(y,"01010100010100101100010");
}
else if(strcmp(x,"101111000010")==0){
strcpy(y,"01010100001110100100000");
}
else if(strcmp(x,"101111000011")==0){
strcpy(y,"01010100001000011011110");
}
else if(strcmp(x,"101111000100")==0){
strcpy(y,"01010100000010010011111");
}
else if(strcmp(x,"101111000101")==0){
strcpy(y,"01010011111100001100000");
}
else if(strcmp(x,"101111000110")==0){
strcpy(y,"01010011110110000100011");
}
else if(strcmp(x,"101111000111")==0){
strcpy(y,"01010011101111111100111");
}
else if(strcmp(x,"101111001000")==0){
strcpy(y,"01010011101001110101101");
}
else if(strcmp(x,"101111001001")==0){
strcpy(y,"01010011100011101110011");
}
else if(strcmp(x,"101111001010")==0){
strcpy(y,"01010011011101100111100");
}
else if(strcmp(x,"101111001011")==0){
strcpy(y,"01010011010111100000101");
}
else if(strcmp(x,"101111001100")==0){
strcpy(y,"01010011010001011010000");
}
else if(strcmp(x,"101111001101")==0){
strcpy(y,"01010011001011010011100");
}
else if(strcmp(x,"101111001110")==0){
strcpy(y,"01010011000101001101001");
}
else if(strcmp(x,"101111001111")==0){
strcpy(y,"01010010111111000111000");
}
else if(strcmp(x,"101111010000")==0){
strcpy(y,"01010010111001000001000");
}
else if(strcmp(x,"101111010001")==0){
strcpy(y,"01010010110010111011001");
}
else if(strcmp(x,"101111010010")==0){
strcpy(y,"01010010101100110101100");
}
else if(strcmp(x,"101111010011")==0){
strcpy(y,"01010010100110110000000");
}
else if(strcmp(x,"101111010100")==0){
strcpy(y,"01010010100000101010101");
}
else if(strcmp(x,"101111010101")==0){
strcpy(y,"01010010011010100101100");
}
else if(strcmp(x,"101111010110")==0){
strcpy(y,"01010010010100100000100");
}
else if(strcmp(x,"101111010111")==0){
strcpy(y,"01010010001110011011101");
}
else if(strcmp(x,"101111011000")==0){
strcpy(y,"01010010001000010110111");
}
else if(strcmp(x,"101111011001")==0){
strcpy(y,"01010010000010010010011");
}
else if(strcmp(x,"101111011010")==0){
strcpy(y,"01010001111100001110000");
}
else if(strcmp(x,"101111011011")==0){
strcpy(y,"01010001110110001001111");
}
else if(strcmp(x,"101111011100")==0){
strcpy(y,"01010001110000000101111");
}
else if(strcmp(x,"101111011101")==0){
strcpy(y,"01010001101010000010000");
}
else if(strcmp(x,"101111011110")==0){
strcpy(y,"01010001100011111110010");
}
else if(strcmp(x,"101111011111")==0){
strcpy(y,"01010001011101111010110");
}
else if(strcmp(x,"101111100000")==0){
strcpy(y,"01010001010111110111011");
}
else if(strcmp(x,"101111100001")==0){
strcpy(y,"01010001010001110100001");
}
else if(strcmp(x,"101111100010")==0){
strcpy(y,"01010001001011110001000");
}
else if(strcmp(x,"101111100011")==0){
strcpy(y,"01010001000101101110001");
}
else if(strcmp(x,"101111100100")==0){
strcpy(y,"01010000111111101011011");
}
else if(strcmp(x,"101111100101")==0){
strcpy(y,"01010000111001101000111");
}
else if(strcmp(x,"101111100110")==0){
strcpy(y,"01010000110011100110100");
}
else if(strcmp(x,"101111100111")==0){
strcpy(y,"01010000101101100100010");
}
else if(strcmp(x,"101111101000")==0){
strcpy(y,"01010000100111100010001");
}
else if(strcmp(x,"101111101001")==0){
strcpy(y,"01010000100001100000010");
}
else if(strcmp(x,"101111101010")==0){
strcpy(y,"01010000011011011110100");
}
else if(strcmp(x,"101111101011")==0){
strcpy(y,"01010000010101011100111");
}
else if(strcmp(x,"101111101100")==0){
strcpy(y,"01010000001111011011100");
}
else if(strcmp(x,"101111101101")==0){
strcpy(y,"01010000001001011010001");
}
else if(strcmp(x,"101111101110")==0){
strcpy(y,"01010000000011011001001");
}
else if(strcmp(x,"101111101111")==0){
strcpy(y,"01001111111101011000001");
}
else if(strcmp(x,"101111110000")==0){
strcpy(y,"01001111110111010111011");
}
else if(strcmp(x,"101111110001")==0){
strcpy(y,"01001111110001010110110");
}
else if(strcmp(x,"101111110010")==0){
strcpy(y,"01001111101011010110010");
}
else if(strcmp(x,"101111110011")==0){
strcpy(y,"01001111100101010110000");
}
else if(strcmp(x,"101111110100")==0){
strcpy(y,"01001111011111010101110");
}
else if(strcmp(x,"101111110101")==0){
strcpy(y,"01001111011001010101111");
}
else if(strcmp(x,"101111110110")==0){
strcpy(y,"01001111010011010110000");
}
else if(strcmp(x,"101111110111")==0){
strcpy(y,"01001111001101010110011");
}
else if(strcmp(x,"101111111000")==0){
strcpy(y,"01001111000111010110111");
}
else if(strcmp(x,"101111111001")==0){
strcpy(y,"01001111000001010111100");
}
else if(strcmp(x,"101111111010")==0){
strcpy(y,"01001110111011011000011");
}
else if(strcmp(x,"101111111011")==0){
strcpy(y,"01001110110101011001011");
}
else if(strcmp(x,"101111111100")==0){
strcpy(y,"01001110101111011010100");
}
else if(strcmp(x,"101111111101")==0){
strcpy(y,"01001110101001011011110");
}
else if(strcmp(x,"101111111110")==0){
strcpy(y,"01001110100011011101010");
}
else if(strcmp(x,"101111111111")==0){
strcpy(y,"01001110011101011110111");
}
else if(strcmp(x,"110000000000")==0){
strcpy(y,"01001110010111100000101");
}
else if(strcmp(x,"110000000001")==0){
strcpy(y,"01001110010001100010101");
}
else if(strcmp(x,"110000000010")==0){
strcpy(y,"01001110001011100100110");
}
else if(strcmp(x,"110000000011")==0){
strcpy(y,"01001110000101100111000");
}
else if(strcmp(x,"110000000100")==0){
strcpy(y,"01001101111111101001011");
}
else if(strcmp(x,"110000000101")==0){
strcpy(y,"01001101111001101100000");
}
else if(strcmp(x,"110000000110")==0){
strcpy(y,"01001101110011101110110");
}
else if(strcmp(x,"110000000111")==0){
strcpy(y,"01001101101101110001101");
}
else if(strcmp(x,"110000001000")==0){
strcpy(y,"01001101100111110100110");
}
else if(strcmp(x,"110000001001")==0){
strcpy(y,"01001101100001110111111");
}
else if(strcmp(x,"110000001010")==0){
strcpy(y,"01001101011011111011010");
}
else if(strcmp(x,"110000001011")==0){
strcpy(y,"01001101010101111110111");
}
else if(strcmp(x,"110000001100")==0){
strcpy(y,"01001101010000000010100");
}
else if(strcmp(x,"110000001101")==0){
strcpy(y,"01001101001010000110011");
}
else if(strcmp(x,"110000001110")==0){
strcpy(y,"01001101000100001010011");
}
else if(strcmp(x,"110000001111")==0){
strcpy(y,"01001100111110001110101");
}
else if(strcmp(x,"110000010000")==0){
strcpy(y,"01001100111000010010111");
}
else if(strcmp(x,"110000010001")==0){
strcpy(y,"01001100110010010111011");
}
else if(strcmp(x,"110000010010")==0){
strcpy(y,"01001100101100011100000");
}
else if(strcmp(x,"110000010011")==0){
strcpy(y,"01001100100110100000111");
}
else if(strcmp(x,"110000010100")==0){
strcpy(y,"01001100100000100101111");
}
else if(strcmp(x,"110000010101")==0){
strcpy(y,"01001100011010101011000");
}
else if(strcmp(x,"110000010110")==0){
strcpy(y,"01001100010100110000010");
}
else if(strcmp(x,"110000010111")==0){
strcpy(y,"01001100001110110101110");
}
else if(strcmp(x,"110000011000")==0){
strcpy(y,"01001100001000111011010");
}
else if(strcmp(x,"110000011001")==0){
strcpy(y,"01001100000011000001000");
}
else if(strcmp(x,"110000011010")==0){
strcpy(y,"01001011111101000111000");
}
else if(strcmp(x,"110000011011")==0){
strcpy(y,"01001011110111001101000");
}
else if(strcmp(x,"110000011100")==0){
strcpy(y,"01001011110001010011010");
}
else if(strcmp(x,"110000011101")==0){
strcpy(y,"01001011101011011001101");
}
else if(strcmp(x,"110000011110")==0){
strcpy(y,"01001011100101100000010");
}
else if(strcmp(x,"110000011111")==0){
strcpy(y,"01001011011111100110111");
}
else if(strcmp(x,"110000100000")==0){
strcpy(y,"01001011011001101101110");
}
else if(strcmp(x,"110000100001")==0){
strcpy(y,"01001011010011110100110");
}
else if(strcmp(x,"110000100010")==0){
strcpy(y,"01001011001101111100000");
}
else if(strcmp(x,"110000100011")==0){
strcpy(y,"01001011001000000011010");
}
else if(strcmp(x,"110000100100")==0){
strcpy(y,"01001011000010001010110");
}
else if(strcmp(x,"110000100101")==0){
strcpy(y,"01001010111100010010011");
}
else if(strcmp(x,"110000100110")==0){
strcpy(y,"01001010110110011010010");
}
else if(strcmp(x,"110000100111")==0){
strcpy(y,"01001010110000100010001");
}
else if(strcmp(x,"110000101000")==0){
strcpy(y,"01001010101010101010010");
}
else if(strcmp(x,"110000101001")==0){
strcpy(y,"01001010100100110010100");
}
else if(strcmp(x,"110000101010")==0){
strcpy(y,"01001010011110111011000");
}
else if(strcmp(x,"110000101011")==0){
strcpy(y,"01001010011001000011101");
}
else if(strcmp(x,"110000101100")==0){
strcpy(y,"01001010010011001100010");
}
else if(strcmp(x,"110000101101")==0){
strcpy(y,"01001010001101010101010");
}
else if(strcmp(x,"110000101110")==0){
strcpy(y,"01001010000111011110010");
}
else if(strcmp(x,"110000101111")==0){
strcpy(y,"01001010000001100111100");
}
else if(strcmp(x,"110000110000")==0){
strcpy(y,"01001001111011110000111");
}
else if(strcmp(x,"110000110001")==0){
strcpy(y,"01001001110101111010011");
}
else if(strcmp(x,"110000110010")==0){
strcpy(y,"01001001110000000100000");
}
else if(strcmp(x,"110000110011")==0){
strcpy(y,"01001001101010001101111");
}
else if(strcmp(x,"110000110100")==0){
strcpy(y,"01001001100100010111111");
}
else if(strcmp(x,"110000110101")==0){
strcpy(y,"01001001011110100010000");
}
else if(strcmp(x,"110000110110")==0){
strcpy(y,"01001001011000101100010");
}
else if(strcmp(x,"110000110111")==0){
strcpy(y,"01001001010010110110110");
}
else if(strcmp(x,"110000111000")==0){
strcpy(y,"01001001001101000001011");
}
else if(strcmp(x,"110000111001")==0){
strcpy(y,"01001001000111001100001");
}
else if(strcmp(x,"110000111010")==0){
strcpy(y,"01001001000001010111000");
}
else if(strcmp(x,"110000111011")==0){
strcpy(y,"01001000111011100010001");
}
else if(strcmp(x,"110000111100")==0){
strcpy(y,"01001000110101101101010");
}
else if(strcmp(x,"110000111101")==0){
strcpy(y,"01001000101111111000110");
}
else if(strcmp(x,"110000111110")==0){
strcpy(y,"01001000101010000100010");
}
else if(strcmp(x,"110000111111")==0){
strcpy(y,"01001000100100001111111");
}
else if(strcmp(x,"110001000000")==0){
strcpy(y,"01001000011110011011110");
}
else if(strcmp(x,"110001000001")==0){
strcpy(y,"01001000011000100111110");
}
else if(strcmp(x,"110001000010")==0){
strcpy(y,"01001000010010110011111");
}
else if(strcmp(x,"110001000011")==0){
strcpy(y,"01001000001101000000010");
}
else if(strcmp(x,"110001000100")==0){
strcpy(y,"01001000000111001100101");
}
else if(strcmp(x,"110001000101")==0){
strcpy(y,"01001000000001011001010");
}
else if(strcmp(x,"110001000110")==0){
strcpy(y,"01000111111011100110000");
}
else if(strcmp(x,"110001000111")==0){
strcpy(y,"01000111110101110011000");
}
else if(strcmp(x,"110001001000")==0){
strcpy(y,"01000111110000000000000");
}
else if(strcmp(x,"110001001001")==0){
strcpy(y,"01000111101010001101010");
}
else if(strcmp(x,"110001001010")==0){
strcpy(y,"01000111100100011010101");
}
else if(strcmp(x,"110001001011")==0){
strcpy(y,"01000111011110101000010");
}
else if(strcmp(x,"110001001100")==0){
strcpy(y,"01000111011000110101111");
}
else if(strcmp(x,"110001001101")==0){
strcpy(y,"01000111010011000011110");
}
else if(strcmp(x,"110001001110")==0){
strcpy(y,"01000111001101010001110");
}
else if(strcmp(x,"110001001111")==0){
strcpy(y,"01000111000111011111111");
}
else if(strcmp(x,"110001010000")==0){
strcpy(y,"01000111000001101110010");
}
else if(strcmp(x,"110001010001")==0){
strcpy(y,"01000110111011111100101");
}
else if(strcmp(x,"110001010010")==0){
strcpy(y,"01000110110110001011010");
}
else if(strcmp(x,"110001010011")==0){
strcpy(y,"01000110110000011010000");
}
else if(strcmp(x,"110001010100")==0){
strcpy(y,"01000110101010101001000");
}
else if(strcmp(x,"110001010101")==0){
strcpy(y,"01000110100100111000000");
}
else if(strcmp(x,"110001010110")==0){
strcpy(y,"01000110011111000111010");
}
else if(strcmp(x,"110001010111")==0){
strcpy(y,"01000110011001010110101");
}
else if(strcmp(x,"110001011000")==0){
strcpy(y,"01000110010011100110001");
}
else if(strcmp(x,"110001011001")==0){
strcpy(y,"01000110001101110101110");
}
else if(strcmp(x,"110001011010")==0){
strcpy(y,"01000110001000000101101");
}
else if(strcmp(x,"110001011011")==0){
strcpy(y,"01000110000010010101101");
}
else if(strcmp(x,"110001011100")==0){
strcpy(y,"01000101111100100101110");
}
else if(strcmp(x,"110001011101")==0){
strcpy(y,"01000101110110110110000");
}
else if(strcmp(x,"110001011110")==0){
strcpy(y,"01000101110001000110100");
}
else if(strcmp(x,"110001011111")==0){
strcpy(y,"01000101101011010111001");
}
else if(strcmp(x,"110001100000")==0){
strcpy(y,"01000101100101100111110");
}
else if(strcmp(x,"110001100001")==0){
strcpy(y,"01000101011111111000110");
}
else if(strcmp(x,"110001100010")==0){
strcpy(y,"01000101011010001001110");
}
else if(strcmp(x,"110001100011")==0){
strcpy(y,"01000101010100011011000");
}
else if(strcmp(x,"110001100100")==0){
strcpy(y,"01000101001110101100010");
}
else if(strcmp(x,"110001100101")==0){
strcpy(y,"01000101001000111101110");
}
else if(strcmp(x,"110001100110")==0){
strcpy(y,"01000101000011001111100");
}
else if(strcmp(x,"110001100111")==0){
strcpy(y,"01000100111101100001010");
}
else if(strcmp(x,"110001101000")==0){
strcpy(y,"01000100110111110011010");
}
else if(strcmp(x,"110001101001")==0){
strcpy(y,"01000100110010000101010");
}
else if(strcmp(x,"110001101010")==0){
strcpy(y,"01000100101100010111100");
}
else if(strcmp(x,"110001101011")==0){
strcpy(y,"01000100100110101010000");
}
else if(strcmp(x,"110001101100")==0){
strcpy(y,"01000100100000111100100");
}
else if(strcmp(x,"110001101101")==0){
strcpy(y,"01000100011011001111010");
}
else if(strcmp(x,"110001101110")==0){
strcpy(y,"01000100010101100010001");
}
else if(strcmp(x,"110001101111")==0){
strcpy(y,"01000100001111110101001");
}
else if(strcmp(x,"110001110000")==0){
strcpy(y,"01000100001010001000010");
}
else if(strcmp(x,"110001110001")==0){
strcpy(y,"01000100000100011011100");
}
else if(strcmp(x,"110001110010")==0){
strcpy(y,"01000011111110101111000");
}
else if(strcmp(x,"110001110011")==0){
strcpy(y,"01000011111001000010101");
}
else if(strcmp(x,"110001110100")==0){
strcpy(y,"01000011110011010110011");
}
else if(strcmp(x,"110001110101")==0){
strcpy(y,"01000011101101101010010");
}
else if(strcmp(x,"110001110110")==0){
strcpy(y,"01000011100111111110011");
}
else if(strcmp(x,"110001110111")==0){
strcpy(y,"01000011100010010010100");
}
else if(strcmp(x,"110001111000")==0){
strcpy(y,"01000011011100100110111");
}
else if(strcmp(x,"110001111001")==0){
strcpy(y,"01000011010110111011011");
}
else if(strcmp(x,"110001111010")==0){
strcpy(y,"01000011010001010000001");
}
else if(strcmp(x,"110001111011")==0){
strcpy(y,"01000011001011100100111");
}
else if(strcmp(x,"110001111100")==0){
strcpy(y,"01000011000101111001111");
}
else if(strcmp(x,"110001111101")==0){
strcpy(y,"01000011000000001110111");
}
else if(strcmp(x,"110001111110")==0){
strcpy(y,"01000010111010100100010");
}
else if(strcmp(x,"110001111111")==0){
strcpy(y,"01000010110100111001101");
}
else if(strcmp(x,"110010000000")==0){
strcpy(y,"01000010101111001111001");
}
else if(strcmp(x,"110010000001")==0){
strcpy(y,"01000010101001100100111");
}
else if(strcmp(x,"110010000010")==0){
strcpy(y,"01000010100011111010110");
}
else if(strcmp(x,"110010000011")==0){
strcpy(y,"01000010011110010000110");
}
else if(strcmp(x,"110010000100")==0){
strcpy(y,"01000010011000100110111");
}
else if(strcmp(x,"110010000101")==0){
strcpy(y,"01000010010010111101001");
}
else if(strcmp(x,"110010000110")==0){
strcpy(y,"01000010001101010011101");
}
else if(strcmp(x,"110010000111")==0){
strcpy(y,"01000010000111101010001");
}
else if(strcmp(x,"110010001000")==0){
strcpy(y,"01000010000010000000111");
}
else if(strcmp(x,"110010001001")==0){
strcpy(y,"01000001111100010111111");
}
else if(strcmp(x,"110010001010")==0){
strcpy(y,"01000001110110101110111");
}
else if(strcmp(x,"110010001011")==0){
strcpy(y,"01000001110001000110000");
}
else if(strcmp(x,"110010001100")==0){
strcpy(y,"01000001101011011101011");
}
else if(strcmp(x,"110010001101")==0){
strcpy(y,"01000001100101110100111");
}
else if(strcmp(x,"110010001110")==0){
strcpy(y,"01000001100000001100100");
}
else if(strcmp(x,"110010001111")==0){
strcpy(y,"01000001011010100100010");
}
else if(strcmp(x,"110010010000")==0){
strcpy(y,"01000001010100111100010");
}
else if(strcmp(x,"110010010001")==0){
strcpy(y,"01000001001111010100010");
}
else if(strcmp(x,"110010010010")==0){
strcpy(y,"01000001001001101100100");
}
else if(strcmp(x,"110010010011")==0){
strcpy(y,"01000001000100000100111");
}
else if(strcmp(x,"110010010100")==0){
strcpy(y,"01000000111110011101011");
}
else if(strcmp(x,"110010010101")==0){
strcpy(y,"01000000111000110110000");
}
else if(strcmp(x,"110010010110")==0){
strcpy(y,"01000000110011001110111");
}
else if(strcmp(x,"110010010111")==0){
strcpy(y,"01000000101101100111111");
}
else if(strcmp(x,"110010011000")==0){
strcpy(y,"01000000101000000000111");
}
else if(strcmp(x,"110010011001")==0){
strcpy(y,"01000000100010011010001");
}
else if(strcmp(x,"110010011010")==0){
strcpy(y,"01000000011100110011101");
}
else if(strcmp(x,"110010011011")==0){
strcpy(y,"01000000010111001101001");
}
else if(strcmp(x,"110010011100")==0){
strcpy(y,"01000000010001100110111");
}
else if(strcmp(x,"110010011101")==0){
strcpy(y,"01000000001100000000101");
}
else if(strcmp(x,"110010011110")==0){
strcpy(y,"01000000000110011010101");
}
else if(strcmp(x,"110010011111")==0){
strcpy(y,"01000000000000110100110");
}
else if(strcmp(x,"110010100000")==0){
strcpy(y,"00111111111011001111001");
}
else if(strcmp(x,"110010100001")==0){
strcpy(y,"00111111110101101001100");
}
else if(strcmp(x,"110010100010")==0){
strcpy(y,"00111111110000000100001");
}
else if(strcmp(x,"110010100011")==0){
strcpy(y,"00111111101010011110110");
}
else if(strcmp(x,"110010100100")==0){
strcpy(y,"00111111100100111001101");
}
else if(strcmp(x,"110010100101")==0){
strcpy(y,"00111111011111010100101");
}
else if(strcmp(x,"110010100110")==0){
strcpy(y,"00111111011001101111111");
}
else if(strcmp(x,"110010100111")==0){
strcpy(y,"00111111010100001011001");
}
else if(strcmp(x,"110010101000")==0){
strcpy(y,"00111111001110100110101");
}
else if(strcmp(x,"110010101001")==0){
strcpy(y,"00111111001001000010001");
}
else if(strcmp(x,"110010101010")==0){
strcpy(y,"00111111000011011101111");
}
else if(strcmp(x,"110010101011")==0){
strcpy(y,"00111110111101111001110");
}
else if(strcmp(x,"110010101100")==0){
strcpy(y,"00111110111000010101111");
}
else if(strcmp(x,"110010101101")==0){
strcpy(y,"00111110110010110010000");
}
else if(strcmp(x,"110010101110")==0){
strcpy(y,"00111110101101001110011");
}
else if(strcmp(x,"110010101111")==0){
strcpy(y,"00111110100111101010110");
}
else if(strcmp(x,"110010110000")==0){
strcpy(y,"00111110100010000111011");
}
else if(strcmp(x,"110010110001")==0){
strcpy(y,"00111110011100100100001");
}
else if(strcmp(x,"110010110010")==0){
strcpy(y,"00111110010111000001001");
}
else if(strcmp(x,"110010110011")==0){
strcpy(y,"00111110010001011110001");
}
else if(strcmp(x,"110010110100")==0){
strcpy(y,"00111110001011111011011");
}
else if(strcmp(x,"110010110101")==0){
strcpy(y,"00111110000110011000101");
}
else if(strcmp(x,"110010110110")==0){
strcpy(y,"00111110000000110110001");
}
else if(strcmp(x,"110010110111")==0){
strcpy(y,"00111101111011010011110");
}
else if(strcmp(x,"110010111000")==0){
strcpy(y,"00111101110101110001100");
}
else if(strcmp(x,"110010111001")==0){
strcpy(y,"00111101110000001111100");
}
else if(strcmp(x,"110010111010")==0){
strcpy(y,"00111101101010101101100");
}
else if(strcmp(x,"110010111011")==0){
strcpy(y,"00111101100101001011110");
}
else if(strcmp(x,"110010111100")==0){
strcpy(y,"00111101011111101010001");
}
else if(strcmp(x,"110010111101")==0){
strcpy(y,"00111101011010001000101");
}
else if(strcmp(x,"110010111110")==0){
strcpy(y,"00111101010100100111010");
}
else if(strcmp(x,"110010111111")==0){
strcpy(y,"00111101001111000110000");
}
else if(strcmp(x,"110011000000")==0){
strcpy(y,"00111101001001100100111");
}
else if(strcmp(x,"110011000001")==0){
strcpy(y,"00111101000100000100000");
}
else if(strcmp(x,"110011000010")==0){
strcpy(y,"00111100111110100011010");
}
else if(strcmp(x,"110011000011")==0){
strcpy(y,"00111100111001000010101");
}
else if(strcmp(x,"110011000100")==0){
strcpy(y,"00111100110011100010001");
}
else if(strcmp(x,"110011000101")==0){
strcpy(y,"00111100101110000001110");
}
else if(strcmp(x,"110011000110")==0){
strcpy(y,"00111100101000100001100");
}
else if(strcmp(x,"110011000111")==0){
strcpy(y,"00111100100011000001100");
}
else if(strcmp(x,"110011001000")==0){
strcpy(y,"00111100011101100001100");
}
else if(strcmp(x,"110011001001")==0){
strcpy(y,"00111100011000000001110");
}
else if(strcmp(x,"110011001010")==0){
strcpy(y,"00111100010010100010001");
}
else if(strcmp(x,"110011001011")==0){
strcpy(y,"00111100001101000010101");
}
else if(strcmp(x,"110011001100")==0){
strcpy(y,"00111100000111100011010");
}
else if(strcmp(x,"110011001101")==0){
strcpy(y,"00111100000010000100000");
}
else if(strcmp(x,"110011001110")==0){
strcpy(y,"00111011111100100101000");
}
else if(strcmp(x,"110011001111")==0){
strcpy(y,"00111011110111000110000");
}
else if(strcmp(x,"110011010000")==0){
strcpy(y,"00111011110001100111010");
}
else if(strcmp(x,"110011010001")==0){
strcpy(y,"00111011101100001000101");
}
else if(strcmp(x,"110011010010")==0){
strcpy(y,"00111011100110101010001");
}
else if(strcmp(x,"110011010011")==0){
strcpy(y,"00111011100001001011110");
}
else if(strcmp(x,"110011010100")==0){
strcpy(y,"00111011011011101101101");
}
else if(strcmp(x,"110011010101")==0){
strcpy(y,"00111011010110001111100");
}
else if(strcmp(x,"110011010110")==0){
strcpy(y,"00111011010000110001101");
}
else if(strcmp(x,"110011010111")==0){
strcpy(y,"00111011001011010011110");
}
else if(strcmp(x,"110011011000")==0){
strcpy(y,"00111011000101110110001");
}
else if(strcmp(x,"110011011001")==0){
strcpy(y,"00111011000000011000101");
}
else if(strcmp(x,"110011011010")==0){
strcpy(y,"00111010111010111011010");
}
else if(strcmp(x,"110011011011")==0){
strcpy(y,"00111010110101011110001");
}
else if(strcmp(x,"110011011100")==0){
strcpy(y,"00111010110000000001000");
}
else if(strcmp(x,"110011011101")==0){
strcpy(y,"00111010101010100100001");
}
else if(strcmp(x,"110011011110")==0){
strcpy(y,"00111010100101000111010");
}
else if(strcmp(x,"110011011111")==0){
strcpy(y,"00111010011111101010101");
}
else if(strcmp(x,"110011100000")==0){
strcpy(y,"00111010011010001110001");
}
else if(strcmp(x,"110011100001")==0){
strcpy(y,"00111010010100110001110");
}
else if(strcmp(x,"110011100010")==0){
strcpy(y,"00111010001111010101100");
}
else if(strcmp(x,"110011100011")==0){
strcpy(y,"00111010001001111001100");
}
else if(strcmp(x,"110011100100")==0){
strcpy(y,"00111010000100011101100");
}
else if(strcmp(x,"110011100101")==0){
strcpy(y,"00111001111111000001110");
}
else if(strcmp(x,"110011100110")==0){
strcpy(y,"00111001111001100110000");
}
else if(strcmp(x,"110011100111")==0){
strcpy(y,"00111001110100001010100");
}
else if(strcmp(x,"110011101000")==0){
strcpy(y,"00111001101110101111001");
}
else if(strcmp(x,"110011101001")==0){
strcpy(y,"00111001101001010011111");
}
else if(strcmp(x,"110011101010")==0){
strcpy(y,"00111001100011111000111");
}
else if(strcmp(x,"110011101011")==0){
strcpy(y,"00111001011110011101111");
}
else if(strcmp(x,"110011101100")==0){
strcpy(y,"00111001011001000011000");
}
else if(strcmp(x,"110011101101")==0){
strcpy(y,"00111001010011101000011");
}
else if(strcmp(x,"110011101110")==0){
strcpy(y,"00111001001110001101111");
}
else if(strcmp(x,"110011101111")==0){
strcpy(y,"00111001001000110011100");
}
else if(strcmp(x,"110011110000")==0){
strcpy(y,"00111001000011011001010");
}
else if(strcmp(x,"110011110001")==0){
strcpy(y,"00111000111101111111001");
}
else if(strcmp(x,"110011110010")==0){
strcpy(y,"00111000111000100101001");
}
else if(strcmp(x,"110011110011")==0){
strcpy(y,"00111000110011001011010");
}
else if(strcmp(x,"110011110100")==0){
strcpy(y,"00111000101101110001101");
}
else if(strcmp(x,"110011110101")==0){
strcpy(y,"00111000101000011000000");
}
else if(strcmp(x,"110011110110")==0){
strcpy(y,"00111000100010111110101");
}
else if(strcmp(x,"110011110111")==0){
strcpy(y,"00111000011101100101011");
}
else if(strcmp(x,"110011111000")==0){
strcpy(y,"00111000011000001100010");
}
else if(strcmp(x,"110011111001")==0){
strcpy(y,"00111000010010110011010");
}
else if(strcmp(x,"110011111010")==0){
strcpy(y,"00111000001101011010011");
}
else if(strcmp(x,"110011111011")==0){
strcpy(y,"00111000001000000001101");
}
else if(strcmp(x,"110011111100")==0){
strcpy(y,"00111000000010101001000");
}
else if(strcmp(x,"110011111101")==0){
strcpy(y,"00110111111101010000101");
}
else if(strcmp(x,"110011111110")==0){
strcpy(y,"00110111110111111000011");
}
else if(strcmp(x,"110011111111")==0){
strcpy(y,"00110111110010100000001");
}
else if(strcmp(x,"110100000000")==0){
strcpy(y,"00110111101101001000001");
}
else if(strcmp(x,"110100000001")==0){
strcpy(y,"00110111100111110000010");
}
else if(strcmp(x,"110100000010")==0){
strcpy(y,"00110111100010011000100");
}
else if(strcmp(x,"110100000011")==0){
strcpy(y,"00110111011101000000111");
}
else if(strcmp(x,"110100000100")==0){
strcpy(y,"00110111010111101001100");
}
else if(strcmp(x,"110100000101")==0){
strcpy(y,"00110111010010010010001");
}
else if(strcmp(x,"110100000110")==0){
strcpy(y,"00110111001100111011000");
}
else if(strcmp(x,"110100000111")==0){
strcpy(y,"00110111000111100011111");
}
else if(strcmp(x,"110100001000")==0){
strcpy(y,"00110111000010001101000");
}
else if(strcmp(x,"110100001001")==0){
strcpy(y,"00110110111100110110010");
}
else if(strcmp(x,"110100001010")==0){
strcpy(y,"00110110110111011111101");
}
else if(strcmp(x,"110100001011")==0){
strcpy(y,"00110110110010001001001");
}
else if(strcmp(x,"110100001100")==0){
strcpy(y,"00110110101100110010110");
}
else if(strcmp(x,"110100001101")==0){
strcpy(y,"00110110100111011100100");
}
else if(strcmp(x,"110100001110")==0){
strcpy(y,"00110110100010000110011");
}
else if(strcmp(x,"110100001111")==0){
strcpy(y,"00110110011100110000100");
}
else if(strcmp(x,"110100010000")==0){
strcpy(y,"00110110010111011010101");
}
else if(strcmp(x,"110100010001")==0){
strcpy(y,"00110110010010000101000");
}
else if(strcmp(x,"110100010010")==0){
strcpy(y,"00110110001100101111100");
}
else if(strcmp(x,"110100010011")==0){
strcpy(y,"00110110000111011010001");
}
else if(strcmp(x,"110100010100")==0){
strcpy(y,"00110110000010000100111");
}
else if(strcmp(x,"110100010101")==0){
strcpy(y,"00110101111100101111110");
}
else if(strcmp(x,"110100010110")==0){
strcpy(y,"00110101110111011010110");
}
else if(strcmp(x,"110100010111")==0){
strcpy(y,"00110101110010000101111");
}
else if(strcmp(x,"110100011000")==0){
strcpy(y,"00110101101100110001010");
}
else if(strcmp(x,"110100011001")==0){
strcpy(y,"00110101100111011100101");
}
else if(strcmp(x,"110100011010")==0){
strcpy(y,"00110101100010001000010");
}
else if(strcmp(x,"110100011011")==0){
strcpy(y,"00110101011100110011111");
}
else if(strcmp(x,"110100011100")==0){
strcpy(y,"00110101010111011111110");
}
else if(strcmp(x,"110100011101")==0){
strcpy(y,"00110101010010001011110");
}
else if(strcmp(x,"110100011110")==0){
strcpy(y,"00110101001100110111111");
}
else if(strcmp(x,"110100011111")==0){
strcpy(y,"00110101000111100100001");
}
else if(strcmp(x,"110100100000")==0){
strcpy(y,"00110101000010010000100");
}
else if(strcmp(x,"110100100001")==0){
strcpy(y,"00110100111100111101000");
}
else if(strcmp(x,"110100100010")==0){
strcpy(y,"00110100110111101001101");
}
else if(strcmp(x,"110100100011")==0){
strcpy(y,"00110100110010010110100");
}
else if(strcmp(x,"110100100100")==0){
strcpy(y,"00110100101101000011011");
}
else if(strcmp(x,"110100100101")==0){
strcpy(y,"00110100100111110000100");
}
else if(strcmp(x,"110100100110")==0){
strcpy(y,"00110100100010011101110");
}
else if(strcmp(x,"110100100111")==0){
strcpy(y,"00110100011101001011000");
}
else if(strcmp(x,"110100101000")==0){
strcpy(y,"00110100010111111000100");
}
else if(strcmp(x,"110100101001")==0){
strcpy(y,"00110100010010100110001");
}
else if(strcmp(x,"110100101010")==0){
strcpy(y,"00110100001101010011111");
}
else if(strcmp(x,"110100101011")==0){
strcpy(y,"00110100001000000001110");
}
else if(strcmp(x,"110100101100")==0){
strcpy(y,"00110100000010101111110");
}
else if(strcmp(x,"110100101101")==0){
strcpy(y,"00110011111101011110000");
}
else if(strcmp(x,"110100101110")==0){
strcpy(y,"00110011111000001100010");
}
else if(strcmp(x,"110100101111")==0){
strcpy(y,"00110011110010111010110");
}
else if(strcmp(x,"110100110000")==0){
strcpy(y,"00110011101101101001010");
}
else if(strcmp(x,"110100110001")==0){
strcpy(y,"00110011101000011000000");
}
else if(strcmp(x,"110100110010")==0){
strcpy(y,"00110011100011000110110");
}
else if(strcmp(x,"110100110011")==0){
strcpy(y,"00110011011101110101110");
}
else if(strcmp(x,"110100110100")==0){
strcpy(y,"00110011011000100100111");
}
else if(strcmp(x,"110100110101")==0){
strcpy(y,"00110011010011010100001");
}
else if(strcmp(x,"110100110110")==0){
strcpy(y,"00110011001110000011100");
}
else if(strcmp(x,"110100110111")==0){
strcpy(y,"00110011001000110011000");
}
else if(strcmp(x,"110100111000")==0){
strcpy(y,"00110011000011100010101");
}
else if(strcmp(x,"110100111001")==0){
strcpy(y,"00110010111110010010100");
}
else if(strcmp(x,"110100111010")==0){
strcpy(y,"00110010111001000010011");
}
else if(strcmp(x,"110100111011")==0){
strcpy(y,"00110010110011110010011");
}
else if(strcmp(x,"110100111100")==0){
strcpy(y,"00110010101110100010101");
}
else if(strcmp(x,"110100111101")==0){
strcpy(y,"00110010101001010011000");
}
else if(strcmp(x,"110100111110")==0){
strcpy(y,"00110010100100000011011");
}
else if(strcmp(x,"110100111111")==0){
strcpy(y,"00110010011110110100000");
}
else if(strcmp(x,"110101000000")==0){
strcpy(y,"00110010011001100100110");
}
else if(strcmp(x,"110101000001")==0){
strcpy(y,"00110010010100010101101");
}
else if(strcmp(x,"110101000010")==0){
strcpy(y,"00110010001111000110101");
}
else if(strcmp(x,"110101000011")==0){
strcpy(y,"00110010001001110111110");
}
else if(strcmp(x,"110101000100")==0){
strcpy(y,"00110010000100101001000");
}
else if(strcmp(x,"110101000101")==0){
strcpy(y,"00110001111111011010011");
}
else if(strcmp(x,"110101000110")==0){
strcpy(y,"00110001111010001011111");
}
else if(strcmp(x,"110101000111")==0){
strcpy(y,"00110001110100111101101");
}
else if(strcmp(x,"110101001000")==0){
strcpy(y,"00110001101111101111011");
}
else if(strcmp(x,"110101001001")==0){
strcpy(y,"00110001101010100001010");
}
else if(strcmp(x,"110101001010")==0){
strcpy(y,"00110001100101010011011");
}
else if(strcmp(x,"110101001011")==0){
strcpy(y,"00110001100000000101101");
}
else if(strcmp(x,"110101001100")==0){
strcpy(y,"00110001011010110111111");
}
else if(strcmp(x,"110101001101")==0){
strcpy(y,"00110001010101101010011");
}
else if(strcmp(x,"110101001110")==0){
strcpy(y,"00110001010000011101000");
}
else if(strcmp(x,"110101001111")==0){
strcpy(y,"00110001001011001111110");
}
else if(strcmp(x,"110101010000")==0){
strcpy(y,"00110001000110000010101");
}
else if(strcmp(x,"110101010001")==0){
strcpy(y,"00110001000000110101101");
}
else if(strcmp(x,"110101010010")==0){
strcpy(y,"00110000111011101000110");
}
else if(strcmp(x,"110101010011")==0){
strcpy(y,"00110000110110011100000");
}
else if(strcmp(x,"110101010100")==0){
strcpy(y,"00110000110001001111011");
}
else if(strcmp(x,"110101010101")==0){
strcpy(y,"00110000101100000010111");
}
else if(strcmp(x,"110101010110")==0){
strcpy(y,"00110000100110110110100");
}
else if(strcmp(x,"110101010111")==0){
strcpy(y,"00110000100001101010011");
}
else if(strcmp(x,"110101011000")==0){
strcpy(y,"00110000011100011110010");
}
else if(strcmp(x,"110101011001")==0){
strcpy(y,"00110000010111010010011");
}
else if(strcmp(x,"110101011010")==0){
strcpy(y,"00110000010010000110100");
}
else if(strcmp(x,"110101011011")==0){
strcpy(y,"00110000001100111010111");
}
else if(strcmp(x,"110101011100")==0){
strcpy(y,"00110000000111101111011");
}
else if(strcmp(x,"110101011101")==0){
strcpy(y,"00110000000010100011111");
}
else if(strcmp(x,"110101011110")==0){
strcpy(y,"00101111111101011000101");
}
else if(strcmp(x,"110101011111")==0){
strcpy(y,"00101111111000001101100");
}
else if(strcmp(x,"110101100000")==0){
strcpy(y,"00101111110011000010100");
}
else if(strcmp(x,"110101100001")==0){
strcpy(y,"00101111101101110111101");
}
else if(strcmp(x,"110101100010")==0){
strcpy(y,"00101111101000101100111");
}
else if(strcmp(x,"110101100011")==0){
strcpy(y,"00101111100011100010010");
}
else if(strcmp(x,"110101100100")==0){
strcpy(y,"00101111011110010111110");
}
else if(strcmp(x,"110101100101")==0){
strcpy(y,"00101111011001001101011");
}
else if(strcmp(x,"110101100110")==0){
strcpy(y,"00101111010100000011010");
}
else if(strcmp(x,"110101100111")==0){
strcpy(y,"00101111001110111001001");
}
else if(strcmp(x,"110101101000")==0){
strcpy(y,"00101111001001101111001");
}
else if(strcmp(x,"110101101001")==0){
strcpy(y,"00101111000100100101011");
}
else if(strcmp(x,"110101101010")==0){
strcpy(y,"00101110111111011011101");
}
else if(strcmp(x,"110101101011")==0){
strcpy(y,"00101110111010010010001");
}
else if(strcmp(x,"110101101100")==0){
strcpy(y,"00101110110101001000101");
}
else if(strcmp(x,"110101101101")==0){
strcpy(y,"00101110101111111111011");
}
else if(strcmp(x,"110101101110")==0){
strcpy(y,"00101110101010110110001");
}
else if(strcmp(x,"110101101111")==0){
strcpy(y,"00101110100101101101001");
}
else if(strcmp(x,"110101110000")==0){
strcpy(y,"00101110100000100100010");
}
else if(strcmp(x,"110101110001")==0){
strcpy(y,"00101110011011011011100");
}
else if(strcmp(x,"110101110010")==0){
strcpy(y,"00101110010110010010110");
}
else if(strcmp(x,"110101110011")==0){
strcpy(y,"00101110010001001010010");
}
else if(strcmp(x,"110101110100")==0){
strcpy(y,"00101110001100000001111");
}
else if(strcmp(x,"110101110101")==0){
strcpy(y,"00101110000110111001101");
}
else if(strcmp(x,"110101110110")==0){
strcpy(y,"00101110000001110001100");
}
else if(strcmp(x,"110101110111")==0){
strcpy(y,"00101101111100101001100");
}
else if(strcmp(x,"110101111000")==0){
strcpy(y,"00101101110111100001101");
}
else if(strcmp(x,"110101111001")==0){
strcpy(y,"00101101110010011001111");
}
else if(strcmp(x,"110101111010")==0){
strcpy(y,"00101101101101010010011");
}
else if(strcmp(x,"110101111011")==0){
strcpy(y,"00101101101000001010111");
}
else if(strcmp(x,"110101111100")==0){
strcpy(y,"00101101100011000011100");
}
else if(strcmp(x,"110101111101")==0){
strcpy(y,"00101101011101111100010");
}
else if(strcmp(x,"110101111110")==0){
strcpy(y,"00101101011000110101010");
}
else if(strcmp(x,"110101111111")==0){
strcpy(y,"00101101010011101110010");
}
else if(strcmp(x,"110110000000")==0){
strcpy(y,"00101101001110100111100");
}
else if(strcmp(x,"110110000001")==0){
strcpy(y,"00101101001001100000110");
}
else if(strcmp(x,"110110000010")==0){
strcpy(y,"00101101000100011010010");
}
else if(strcmp(x,"110110000011")==0){
strcpy(y,"00101100111111010011110");
}
else if(strcmp(x,"110110000100")==0){
strcpy(y,"00101100111010001101100");
}
else if(strcmp(x,"110110000101")==0){
strcpy(y,"00101100110101000111010");
}
else if(strcmp(x,"110110000110")==0){
strcpy(y,"00101100110000000001010");
}
else if(strcmp(x,"110110000111")==0){
strcpy(y,"00101100101010111011011");
}
else if(strcmp(x,"110110001000")==0){
strcpy(y,"00101100100101110101100");
}
else if(strcmp(x,"110110001001")==0){
strcpy(y,"00101100100000101111111");
}
else if(strcmp(x,"110110001010")==0){
strcpy(y,"00101100011011101010011");
}
else if(strcmp(x,"110110001011")==0){
strcpy(y,"00101100010110100101000");
}
else if(strcmp(x,"110110001100")==0){
strcpy(y,"00101100010001011111110");
}
else if(strcmp(x,"110110001101")==0){
strcpy(y,"00101100001100011010101");
}
else if(strcmp(x,"110110001110")==0){
strcpy(y,"00101100000111010101100");
}
else if(strcmp(x,"110110001111")==0){
strcpy(y,"00101100000010010000101");
}
else if(strcmp(x,"110110010000")==0){
strcpy(y,"00101011111101001011111");
}
else if(strcmp(x,"110110010001")==0){
strcpy(y,"00101011111000000111010");
}
else if(strcmp(x,"110110010010")==0){
strcpy(y,"00101011110011000010110");
}
else if(strcmp(x,"110110010011")==0){
strcpy(y,"00101011101101111110100");
}
else if(strcmp(x,"110110010100")==0){
strcpy(y,"00101011101000111010010");
}
else if(strcmp(x,"110110010101")==0){
strcpy(y,"00101011100011110110001");
}
else if(strcmp(x,"110110010110")==0){
strcpy(y,"00101011011110110010001");
}
else if(strcmp(x,"110110010111")==0){
strcpy(y,"00101011011001101110010");
}
else if(strcmp(x,"110110011000")==0){
strcpy(y,"00101011010100101010100");
}
else if(strcmp(x,"110110011001")==0){
strcpy(y,"00101011001111100110111");
}
else if(strcmp(x,"110110011010")==0){
strcpy(y,"00101011001010100011100");
}
else if(strcmp(x,"110110011011")==0){
strcpy(y,"00101011000101100000001");
}
else if(strcmp(x,"110110011100")==0){
strcpy(y,"00101011000000011100111");
}
else if(strcmp(x,"110110011101")==0){
strcpy(y,"00101010111011011001111");
}
else if(strcmp(x,"110110011110")==0){
strcpy(y,"00101010110110010110111");
}
else if(strcmp(x,"110110011111")==0){
strcpy(y,"00101010110001010100000");
}
else if(strcmp(x,"110110100000")==0){
strcpy(y,"00101010101100010001011");
}
else if(strcmp(x,"110110100001")==0){
strcpy(y,"00101010100111001110110");
}
else if(strcmp(x,"110110100010")==0){
strcpy(y,"00101010100010001100011");
}
else if(strcmp(x,"110110100011")==0){
strcpy(y,"00101010011101001010000");
}
else if(strcmp(x,"110110100100")==0){
strcpy(y,"00101010011000000111110");
}
else if(strcmp(x,"110110100101")==0){
strcpy(y,"00101010010011000101110");
}
else if(strcmp(x,"110110100110")==0){
strcpy(y,"00101010001110000011110");
}
else if(strcmp(x,"110110100111")==0){
strcpy(y,"00101010001001000010000");
}
else if(strcmp(x,"110110101000")==0){
strcpy(y,"00101010000100000000011");
}
else if(strcmp(x,"110110101001")==0){
strcpy(y,"00101001111110111110110");
}
else if(strcmp(x,"110110101010")==0){
strcpy(y,"00101001111001111101011");
}
else if(strcmp(x,"110110101011")==0){
strcpy(y,"00101001110100111100000");
}
else if(strcmp(x,"110110101100")==0){
strcpy(y,"00101001101111111010111");
}
else if(strcmp(x,"110110101101")==0){
strcpy(y,"00101001101010111001111");
}
else if(strcmp(x,"110110101110")==0){
strcpy(y,"00101001100101111000111");
}
else if(strcmp(x,"110110101111")==0){
strcpy(y,"00101001100000111000001");
}
else if(strcmp(x,"110110110000")==0){
strcpy(y,"00101001011011110111011");
}
else if(strcmp(x,"110110110001")==0){
strcpy(y,"00101001010110110110111");
}
else if(strcmp(x,"110110110010")==0){
strcpy(y,"00101001010001110110100");
}
else if(strcmp(x,"110110110011")==0){
strcpy(y,"00101001001100110110010");
}
else if(strcmp(x,"110110110100")==0){
strcpy(y,"00101001000111110110000");
}
else if(strcmp(x,"110110110101")==0){
strcpy(y,"00101001000010110110000");
}
else if(strcmp(x,"110110110110")==0){
strcpy(y,"00101000111101110110001");
}
else if(strcmp(x,"110110110111")==0){
strcpy(y,"00101000111000110110010");
}
else if(strcmp(x,"110110111000")==0){
strcpy(y,"00101000110011110110101");
}
else if(strcmp(x,"110110111001")==0){
strcpy(y,"00101000101110110111001");
}
else if(strcmp(x,"110110111010")==0){
strcpy(y,"00101000101001110111110");
}
else if(strcmp(x,"110110111011")==0){
strcpy(y,"00101000100100111000011");
}
else if(strcmp(x,"110110111100")==0){
strcpy(y,"00101000011111111001010");
}
else if(strcmp(x,"110110111101")==0){
strcpy(y,"00101000011010111010010");
}
else if(strcmp(x,"110110111110")==0){
strcpy(y,"00101000010101111011011");
}
else if(strcmp(x,"110110111111")==0){
strcpy(y,"00101000010000111100101");
}
else if(strcmp(x,"110111000000")==0){
strcpy(y,"00101000001011111101111");
}
else if(strcmp(x,"110111000001")==0){
strcpy(y,"00101000000110111111011");
}
else if(strcmp(x,"110111000010")==0){
strcpy(y,"00101000000010000001000");
}
else if(strcmp(x,"110111000011")==0){
strcpy(y,"00100111111101000010110");
}
else if(strcmp(x,"110111000100")==0){
strcpy(y,"00100111111000000100101");
}
else if(strcmp(x,"110111000101")==0){
strcpy(y,"00100111110011000110100");
}
else if(strcmp(x,"110111000110")==0){
strcpy(y,"00100111101110001000101");
}
else if(strcmp(x,"110111000111")==0){
strcpy(y,"00100111101001001010111");
}
else if(strcmp(x,"110111001000")==0){
strcpy(y,"00100111100100001101010");
}
else if(strcmp(x,"110111001001")==0){
strcpy(y,"00100111011111001111110");
}
else if(strcmp(x,"110111001010")==0){
strcpy(y,"00100111011010010010010");
}
else if(strcmp(x,"110111001011")==0){
strcpy(y,"00100111010101010101000");
}
else if(strcmp(x,"110111001100")==0){
strcpy(y,"00100111010000010111111");
}
else if(strcmp(x,"110111001101")==0){
strcpy(y,"00100111001011011010111");
}
else if(strcmp(x,"110111001110")==0){
strcpy(y,"00100111000110011110000");
}
else if(strcmp(x,"110111001111")==0){
strcpy(y,"00100111000001100001001");
}
else if(strcmp(x,"110111010000")==0){
strcpy(y,"00100110111100100100100");
}
else if(strcmp(x,"110111010001")==0){
strcpy(y,"00100110110111101000000");
}
else if(strcmp(x,"110111010010")==0){
strcpy(y,"00100110110010101011101");
}
else if(strcmp(x,"110111010011")==0){
strcpy(y,"00100110101101101111011");
}
else if(strcmp(x,"110111010100")==0){
strcpy(y,"00100110101000110011001");
}
else if(strcmp(x,"110111010101")==0){
strcpy(y,"00100110100011110111001");
}
else if(strcmp(x,"110111010110")==0){
strcpy(y,"00100110011110111011010");
}
else if(strcmp(x,"110111010111")==0){
strcpy(y,"00100110011001111111100");
}
else if(strcmp(x,"110111011000")==0){
strcpy(y,"00100110010101000011110");
}
else if(strcmp(x,"110111011001")==0){
strcpy(y,"00100110010000001000010");
}
else if(strcmp(x,"110111011010")==0){
strcpy(y,"00100110001011001100111");
}
else if(strcmp(x,"110111011011")==0){
strcpy(y,"00100110000110010001101");
}
else if(strcmp(x,"110111011100")==0){
strcpy(y,"00100110000001010110011");
}
else if(strcmp(x,"110111011101")==0){
strcpy(y,"00100101111100011011011");
}
else if(strcmp(x,"110111011110")==0){
strcpy(y,"00100101110111100000100");
}
else if(strcmp(x,"110111011111")==0){
strcpy(y,"00100101110010100101101");
}
else if(strcmp(x,"110111100000")==0){
strcpy(y,"00100101101101101011000");
}
else if(strcmp(x,"110111100001")==0){
strcpy(y,"00100101101000110000100");
}
else if(strcmp(x,"110111100010")==0){
strcpy(y,"00100101100011110110000");
}
else if(strcmp(x,"110111100011")==0){
strcpy(y,"00100101011110111011110");
}
else if(strcmp(x,"110111100100")==0){
strcpy(y,"00100101011010000001101");
}
else if(strcmp(x,"110111100101")==0){
strcpy(y,"00100101010101000111100");
}
else if(strcmp(x,"110111100110")==0){
strcpy(y,"00100101010000001101101");
}
else if(strcmp(x,"110111100111")==0){
strcpy(y,"00100101001011010011110");
}
else if(strcmp(x,"110111101000")==0){
strcpy(y,"00100101000110011010001");
}
else if(strcmp(x,"110111101001")==0){
strcpy(y,"00100101000001100000100");
}
else if(strcmp(x,"110111101010")==0){
strcpy(y,"00100100111100100111001");
}
else if(strcmp(x,"110111101011")==0){
strcpy(y,"00100100110111101101110");
}
else if(strcmp(x,"110111101100")==0){
strcpy(y,"00100100110010110100101");
}
else if(strcmp(x,"110111101101")==0){
strcpy(y,"00100100101101111011100");
}
else if(strcmp(x,"110111101110")==0){
strcpy(y,"00100100101001000010101");
}
else if(strcmp(x,"110111101111")==0){
strcpy(y,"00100100100100001001110");
}
else if(strcmp(x,"110111110000")==0){
strcpy(y,"00100100011111010001001");
}
else if(strcmp(x,"110111110001")==0){
strcpy(y,"00100100011010011000100");
}
else if(strcmp(x,"110111110010")==0){
strcpy(y,"00100100010101100000000");
}
else if(strcmp(x,"110111110011")==0){
strcpy(y,"00100100010000100111110");
}
else if(strcmp(x,"110111110100")==0){
strcpy(y,"00100100001011101111100");
}
else if(strcmp(x,"110111110101")==0){
strcpy(y,"00100100000110110111011");
}
else if(strcmp(x,"110111110110")==0){
strcpy(y,"00100100000001111111100");
}
else if(strcmp(x,"110111110111")==0){
strcpy(y,"00100011111101000111101");
}
else if(strcmp(x,"110111111000")==0){
strcpy(y,"00100011111000001111111");
}
else if(strcmp(x,"110111111001")==0){
strcpy(y,"00100011110011011000010");
}
else if(strcmp(x,"110111111010")==0){
strcpy(y,"00100011101110100000110");
}
else if(strcmp(x,"110111111011")==0){
strcpy(y,"00100011101001101001011");
}
else if(strcmp(x,"110111111100")==0){
strcpy(y,"00100011100100110010010");
}
else if(strcmp(x,"110111111101")==0){
strcpy(y,"00100011011111111011001");
}
else if(strcmp(x,"110111111110")==0){
strcpy(y,"00100011011011000100001");
}
else if(strcmp(x,"110111111111")==0){
strcpy(y,"00100011010110001101010");
}
else if(strcmp(x,"111000000000")==0){
strcpy(y,"00100011010001010110100");
}
else if(strcmp(x,"111000000001")==0){
strcpy(y,"00100011001100011111111");
}
else if(strcmp(x,"111000000010")==0){
strcpy(y,"00100011000111101001011");
}
else if(strcmp(x,"111000000011")==0){
strcpy(y,"00100011000010110011000");
}
else if(strcmp(x,"111000000100")==0){
strcpy(y,"00100010111101111100101");
}
else if(strcmp(x,"111000000101")==0){
strcpy(y,"00100010111001000110100");
}
else if(strcmp(x,"111000000110")==0){
strcpy(y,"00100010110100010000100");
}
else if(strcmp(x,"111000000111")==0){
strcpy(y,"00100010101111011010101");
}
else if(strcmp(x,"111000001000")==0){
strcpy(y,"00100010101010100100111");
}
else if(strcmp(x,"111000001001")==0){
strcpy(y,"00100010100101101111001");
}
else if(strcmp(x,"111000001010")==0){
strcpy(y,"00100010100000111001101");
}
else if(strcmp(x,"111000001011")==0){
strcpy(y,"00100010011100000100010");
}
else if(strcmp(x,"111000001100")==0){
strcpy(y,"00100010010111001110111");
}
else if(strcmp(x,"111000001101")==0){
strcpy(y,"00100010010010011001110");
}
else if(strcmp(x,"111000001110")==0){
strcpy(y,"00100010001101100100101");
}
else if(strcmp(x,"111000001111")==0){
strcpy(y,"00100010001000101111110");
}
else if(strcmp(x,"111000010000")==0){
strcpy(y,"00100010000011111010111");
}
else if(strcmp(x,"111000010001")==0){
strcpy(y,"00100001111111000110010");
}
else if(strcmp(x,"111000010010")==0){
strcpy(y,"00100001111010010001101");
}
else if(strcmp(x,"111000010011")==0){
strcpy(y,"00100001110101011101010");
}
else if(strcmp(x,"111000010100")==0){
strcpy(y,"00100001110000101000111");
}
else if(strcmp(x,"111000010101")==0){
strcpy(y,"00100001101011110100101");
}
else if(strcmp(x,"111000010110")==0){
strcpy(y,"00100001100111000000101");
}
else if(strcmp(x,"111000010111")==0){
strcpy(y,"00100001100010001100101");
}
else if(strcmp(x,"111000011000")==0){
strcpy(y,"00100001011101011000110");
}
else if(strcmp(x,"111000011001")==0){
strcpy(y,"00100001011000100101000");
}
else if(strcmp(x,"111000011010")==0){
strcpy(y,"00100001010011110001011");
}
else if(strcmp(x,"111000011011")==0){
strcpy(y,"00100001001110111101111");
}
else if(strcmp(x,"111000011100")==0){
strcpy(y,"00100001001010001010100");
}
else if(strcmp(x,"111000011101")==0){
strcpy(y,"00100001000101010111010");
}
else if(strcmp(x,"111000011110")==0){
strcpy(y,"00100001000000100100001");
}
else if(strcmp(x,"111000011111")==0){
strcpy(y,"00100000111011110001001");
}
else if(strcmp(x,"111000100000")==0){
strcpy(y,"00100000110110111110010");
}
else if(strcmp(x,"111000100001")==0){
strcpy(y,"00100000110010001011011");
}
else if(strcmp(x,"111000100010")==0){
strcpy(y,"00100000101101011000110");
}
else if(strcmp(x,"111000100011")==0){
strcpy(y,"00100000101000100110010");
}
else if(strcmp(x,"111000100100")==0){
strcpy(y,"00100000100011110011111");
}
else if(strcmp(x,"111000100101")==0){
strcpy(y,"00100000011111000001100");
}
else if(strcmp(x,"111000100110")==0){
strcpy(y,"00100000011010001111011");
}
else if(strcmp(x,"111000100111")==0){
strcpy(y,"00100000010101011101010");
}
else if(strcmp(x,"111000101000")==0){
strcpy(y,"00100000010000101011011");
}
else if(strcmp(x,"111000101001")==0){
strcpy(y,"00100000001011111001100");
}
else if(strcmp(x,"111000101010")==0){
strcpy(y,"00100000000111000111110");
}
else if(strcmp(x,"111000101011")==0){
strcpy(y,"00100000000010010110010");
}
else if(strcmp(x,"111000101100")==0){
strcpy(y,"00011111111101100100110");
}
else if(strcmp(x,"111000101101")==0){
strcpy(y,"00011111111000110011011");
}
else if(strcmp(x,"111000101110")==0){
strcpy(y,"00011111110100000010001");
}
else if(strcmp(x,"111000101111")==0){
strcpy(y,"00011111101111010001000");
}
else if(strcmp(x,"111000110000")==0){
strcpy(y,"00011111101010100000000");
}
else if(strcmp(x,"111000110001")==0){
strcpy(y,"00011111100101101111001");
}
else if(strcmp(x,"111000110010")==0){
strcpy(y,"00011111100000111110011");
}
else if(strcmp(x,"111000110011")==0){
strcpy(y,"00011111011100001101110");
}
else if(strcmp(x,"111000110100")==0){
strcpy(y,"00011111010111011101010");
}
else if(strcmp(x,"111000110101")==0){
strcpy(y,"00011111010010101100111");
}
else if(strcmp(x,"111000110110")==0){
strcpy(y,"00011111001101111100100");
}
else if(strcmp(x,"111000110111")==0){
strcpy(y,"00011111001001001100011");
}
else if(strcmp(x,"111000111000")==0){
strcpy(y,"00011111000100011100011");
}
else if(strcmp(x,"111000111001")==0){
strcpy(y,"00011110111111101100011");
}
else if(strcmp(x,"111000111010")==0){
strcpy(y,"00011110111010111100101");
}
else if(strcmp(x,"111000111011")==0){
strcpy(y,"00011110110110001100111");
}
else if(strcmp(x,"111000111100")==0){
strcpy(y,"00011110110001011101011");
}
else if(strcmp(x,"111000111101")==0){
strcpy(y,"00011110101100101101111");
}
else if(strcmp(x,"111000111110")==0){
strcpy(y,"00011110100111111110100");
}
else if(strcmp(x,"111000111111")==0){
strcpy(y,"00011110100011001111010");
}
else if(strcmp(x,"111001000000")==0){
strcpy(y,"00011110011110100000001");
}
else if(strcmp(x,"111001000001")==0){
strcpy(y,"00011110011001110001010");
}
else if(strcmp(x,"111001000010")==0){
strcpy(y,"00011110010101000010011");
}
else if(strcmp(x,"111001000011")==0){
strcpy(y,"00011110010000010011100");
}
else if(strcmp(x,"111001000100")==0){
strcpy(y,"00011110001011100100111");
}
else if(strcmp(x,"111001000101")==0){
strcpy(y,"00011110000110110110011");
}
else if(strcmp(x,"111001000110")==0){
strcpy(y,"00011110000010001000000");
}
else if(strcmp(x,"111001000111")==0){
strcpy(y,"00011101111101011001110");
}
else if(strcmp(x,"111001001000")==0){
strcpy(y,"00011101111000101011100");
}
else if(strcmp(x,"111001001001")==0){
strcpy(y,"00011101110011111101100");
}
else if(strcmp(x,"111001001010")==0){
strcpy(y,"00011101101111001111100");
}
else if(strcmp(x,"111001001011")==0){
strcpy(y,"00011101101010100001110");
}
else if(strcmp(x,"111001001100")==0){
strcpy(y,"00011101100101110100000");
}
else if(strcmp(x,"111001001101")==0){
strcpy(y,"00011101100001000110011");
}
else if(strcmp(x,"111001001110")==0){
strcpy(y,"00011101011100011001000");
}
else if(strcmp(x,"111001001111")==0){
strcpy(y,"00011101010111101011101");
}
else if(strcmp(x,"111001010000")==0){
strcpy(y,"00011101010010111110011");
}
else if(strcmp(x,"111001010001")==0){
strcpy(y,"00011101001110010001010");
}
else if(strcmp(x,"111001010010")==0){
strcpy(y,"00011101001001100100010");
}
else if(strcmp(x,"111001010011")==0){
strcpy(y,"00011101000100110111011");
}
else if(strcmp(x,"111001010100")==0){
strcpy(y,"00011101000000001010101");
}
else if(strcmp(x,"111001010101")==0){
strcpy(y,"00011100111011011101111");
}
else if(strcmp(x,"111001010110")==0){
strcpy(y,"00011100110110110001011");
}
else if(strcmp(x,"111001010111")==0){
strcpy(y,"00011100110010000101000");
}
else if(strcmp(x,"111001011000")==0){
strcpy(y,"00011100101101011000101");
}
else if(strcmp(x,"111001011001")==0){
strcpy(y,"00011100101000101100100");
}
else if(strcmp(x,"111001011010")==0){
strcpy(y,"00011100100100000000011");
}
else if(strcmp(x,"111001011011")==0){
strcpy(y,"00011100011111010100011");
}
else if(strcmp(x,"111001011100")==0){
strcpy(y,"00011100011010101000101");
}
else if(strcmp(x,"111001011101")==0){
strcpy(y,"00011100010101111100111");
}
else if(strcmp(x,"111001011110")==0){
strcpy(y,"00011100010001010001010");
}
else if(strcmp(x,"111001011111")==0){
strcpy(y,"00011100001100100101110");
}
else if(strcmp(x,"111001100000")==0){
strcpy(y,"00011100000111111010011");
}
else if(strcmp(x,"111001100001")==0){
strcpy(y,"00011100000011001111001");
}
else if(strcmp(x,"111001100010")==0){
strcpy(y,"00011011111110100100000");
}
else if(strcmp(x,"111001100011")==0){
strcpy(y,"00011011111001111000111");
}
else if(strcmp(x,"111001100100")==0){
strcpy(y,"00011011110101001110000");
}
else if(strcmp(x,"111001100101")==0){
strcpy(y,"00011011110000100011010");
}
else if(strcmp(x,"111001100110")==0){
strcpy(y,"00011011101011111000100");
}
else if(strcmp(x,"111001100111")==0){
strcpy(y,"00011011100111001101111");
}
else if(strcmp(x,"111001101000")==0){
strcpy(y,"00011011100010100011100");
}
else if(strcmp(x,"111001101001")==0){
strcpy(y,"00011011011101111001001");
}
else if(strcmp(x,"111001101010")==0){
strcpy(y,"00011011011001001110111");
}
else if(strcmp(x,"111001101011")==0){
strcpy(y,"00011011010100100100110");
}
else if(strcmp(x,"111001101100")==0){
strcpy(y,"00011011001111111010110");
}
else if(strcmp(x,"111001101101")==0){
strcpy(y,"00011011001011010000111");
}
else if(strcmp(x,"111001101110")==0){
strcpy(y,"00011011000110100111001");
}
else if(strcmp(x,"111001101111")==0){
strcpy(y,"00011011000001111101100");
}
else if(strcmp(x,"111001110000")==0){
strcpy(y,"00011010111101010011111");
}
else if(strcmp(x,"111001110001")==0){
strcpy(y,"00011010111000101010100");
}
else if(strcmp(x,"111001110010")==0){
strcpy(y,"00011010110100000001010");
}
else if(strcmp(x,"111001110011")==0){
strcpy(y,"00011010101111011000000");
}
else if(strcmp(x,"111001110100")==0){
strcpy(y,"00011010101010101110111");
}
else if(strcmp(x,"111001110101")==0){
strcpy(y,"00011010100110000110000");
}
else if(strcmp(x,"111001110110")==0){
strcpy(y,"00011010100001011101001");
}
else if(strcmp(x,"111001110111")==0){
strcpy(y,"00011010011100110100011");
}
else if(strcmp(x,"111001111000")==0){
strcpy(y,"00011010011000001011110");
}
else if(strcmp(x,"111001111001")==0){
strcpy(y,"00011010010011100011010");
}
else if(strcmp(x,"111001111010")==0){
strcpy(y,"00011010001110111010111");
}
else if(strcmp(x,"111001111011")==0){
strcpy(y,"00011010001010010010100");
}
else if(strcmp(x,"111001111100")==0){
strcpy(y,"00011010000101101010011");
}
else if(strcmp(x,"111001111101")==0){
strcpy(y,"00011010000001000010010");
}
else if(strcmp(x,"111001111110")==0){
strcpy(y,"00011001111100011010011");
}
else if(strcmp(x,"111001111111")==0){
strcpy(y,"00011001110111110010100");
}
else if(strcmp(x,"111010000000")==0){
strcpy(y,"00011001110011001010111");
}
else if(strcmp(x,"111010000001")==0){
strcpy(y,"00011001101110100011010");
}
else if(strcmp(x,"111010000010")==0){
strcpy(y,"00011001101001111011110");
}
else if(strcmp(x,"111010000011")==0){
strcpy(y,"00011001100101010100011");
}
else if(strcmp(x,"111010000100")==0){
strcpy(y,"00011001100000101101001");
}
else if(strcmp(x,"111010000101")==0){
strcpy(y,"00011001011100000110000");
}
else if(strcmp(x,"111010000110")==0){
strcpy(y,"00011001010111011110111");
}
else if(strcmp(x,"111010000111")==0){
strcpy(y,"00011001010010111000000");
}
else if(strcmp(x,"111010001000")==0){
strcpy(y,"00011001001110010001001");
}
else if(strcmp(x,"111010001001")==0){
strcpy(y,"00011001001001101010100");
}
else if(strcmp(x,"111010001010")==0){
strcpy(y,"00011001000101000011111");
}
else if(strcmp(x,"111010001011")==0){
strcpy(y,"00011001000000011101011");
}
else if(strcmp(x,"111010001100")==0){
strcpy(y,"00011000111011110111001");
}
else if(strcmp(x,"111010001101")==0){
strcpy(y,"00011000110111010000111");
}
else if(strcmp(x,"111010001110")==0){
strcpy(y,"00011000110010101010110");
}
else if(strcmp(x,"111010001111")==0){
strcpy(y,"00011000101110000100110");
}
else if(strcmp(x,"111010010000")==0){
strcpy(y,"00011000101001011110110");
}
else if(strcmp(x,"111010010001")==0){
strcpy(y,"00011000100100111001000");
}
else if(strcmp(x,"111010010010")==0){
strcpy(y,"00011000100000010011010");
}
else if(strcmp(x,"111010010011")==0){
strcpy(y,"00011000011011101101110");
}
else if(strcmp(x,"111010010100")==0){
strcpy(y,"00011000010111001000010");
}
else if(strcmp(x,"111010010101")==0){
strcpy(y,"00011000010010100011000");
}
else if(strcmp(x,"111010010110")==0){
strcpy(y,"00011000001101111101110");
}
else if(strcmp(x,"111010010111")==0){
strcpy(y,"00011000001001011000101");
}
else if(strcmp(x,"111010011000")==0){
strcpy(y,"00011000000100110011101");
}
else if(strcmp(x,"111010011001")==0){
strcpy(y,"00011000000000001110110");
}
else if(strcmp(x,"111010011010")==0){
strcpy(y,"00010111111011101001111");
}
else if(strcmp(x,"111010011011")==0){
strcpy(y,"00010111110111000101010");
}
else if(strcmp(x,"111010011100")==0){
strcpy(y,"00010111110010100000110");
}
else if(strcmp(x,"111010011101")==0){
strcpy(y,"00010111101101111100010");
}
else if(strcmp(x,"111010011110")==0){
strcpy(y,"00010111101001010111111");
}
else if(strcmp(x,"111010011111")==0){
strcpy(y,"00010111100100110011110");
}
else if(strcmp(x,"111010100000")==0){
strcpy(y,"00010111100000001111101");
}
else if(strcmp(x,"111010100001")==0){
strcpy(y,"00010111011011101011101");
}
else if(strcmp(x,"111010100010")==0){
strcpy(y,"00010111010111000111110");
}
else if(strcmp(x,"111010100011")==0){
strcpy(y,"00010111010010100011111");
}
else if(strcmp(x,"111010100100")==0){
strcpy(y,"00010111001110000000010");
}
else if(strcmp(x,"111010100101")==0){
strcpy(y,"00010111001001011100110");
}
else if(strcmp(x,"111010100110")==0){
strcpy(y,"00010111000100111001010");
}
else if(strcmp(x,"111010100111")==0){
strcpy(y,"00010111000000010110000");
}
else if(strcmp(x,"111010101000")==0){
strcpy(y,"00010110111011110010110");
}
else if(strcmp(x,"111010101001")==0){
strcpy(y,"00010110110111001111101");
}
else if(strcmp(x,"111010101010")==0){
strcpy(y,"00010110110010101100101");
}
else if(strcmp(x,"111010101011")==0){
strcpy(y,"00010110101110001001110");
}
else if(strcmp(x,"111010101100")==0){
strcpy(y,"00010110101001100111000");
}
else if(strcmp(x,"111010101101")==0){
strcpy(y,"00010110100101000100011");
}
else if(strcmp(x,"111010101110")==0){
strcpy(y,"00010110100000100001110");
}
else if(strcmp(x,"111010101111")==0){
strcpy(y,"00010110011011111111011");
}
else if(strcmp(x,"111010110000")==0){
strcpy(y,"00010110010111011101000");
}
else if(strcmp(x,"111010110001")==0){
strcpy(y,"00010110010010111010110");
}
else if(strcmp(x,"111010110010")==0){
strcpy(y,"00010110001110011000110");
}
else if(strcmp(x,"111010110011")==0){
strcpy(y,"00010110001001110110110");
}
else if(strcmp(x,"111010110100")==0){
strcpy(y,"00010110000101010100110");
}
else if(strcmp(x,"111010110101")==0){
strcpy(y,"00010110000000110011000");
}
else if(strcmp(x,"111010110110")==0){
strcpy(y,"00010101111100010001011");
}
else if(strcmp(x,"111010110111")==0){
strcpy(y,"00010101110111101111111");
}
else if(strcmp(x,"111010111000")==0){
strcpy(y,"00010101110011001110011");
}
else if(strcmp(x,"111010111001")==0){
strcpy(y,"00010101101110101101000");
}
else if(strcmp(x,"111010111010")==0){
strcpy(y,"00010101101010001011111");
}
else if(strcmp(x,"111010111011")==0){
strcpy(y,"00010101100101101010110");
}
else if(strcmp(x,"111010111100")==0){
strcpy(y,"00010101100001001001110");
}
else if(strcmp(x,"111010111101")==0){
strcpy(y,"00010101011100101000111");
}
else if(strcmp(x,"111010111110")==0){
strcpy(y,"00010101011000001000000");
}
else if(strcmp(x,"111010111111")==0){
strcpy(y,"00010101010011100111011");
}
else if(strcmp(x,"111011000000")==0){
strcpy(y,"00010101001111000110110");
}
else if(strcmp(x,"111011000001")==0){
strcpy(y,"00010101001010100110011");
}
else if(strcmp(x,"111011000010")==0){
strcpy(y,"00010101000110000110000");
}
else if(strcmp(x,"111011000011")==0){
strcpy(y,"00010101000001100101110");
}
else if(strcmp(x,"111011000100")==0){
strcpy(y,"00010100111101000101101");
}
else if(strcmp(x,"111011000101")==0){
strcpy(y,"00010100111000100101101");
}
else if(strcmp(x,"111011000110")==0){
strcpy(y,"00010100110100000101110");
}
else if(strcmp(x,"111011000111")==0){
strcpy(y,"00010100101111100110000");
}
else if(strcmp(x,"111011001000")==0){
strcpy(y,"00010100101011000110010");
}
else if(strcmp(x,"111011001001")==0){
strcpy(y,"00010100100110100110110");
}
else if(strcmp(x,"111011001010")==0){
strcpy(y,"00010100100010000111010");
}
else if(strcmp(x,"111011001011")==0){
strcpy(y,"00010100011101100111111");
}
else if(strcmp(x,"111011001100")==0){
strcpy(y,"00010100011001001000101");
}
else if(strcmp(x,"111011001101")==0){
strcpy(y,"00010100010100101001100");
}
else if(strcmp(x,"111011001110")==0){
strcpy(y,"00010100010000001010100");
}
else if(strcmp(x,"111011001111")==0){
strcpy(y,"00010100001011101011100");
}
else if(strcmp(x,"111011010000")==0){
strcpy(y,"00010100000111001100110");
}
else if(strcmp(x,"111011010001")==0){
strcpy(y,"00010100000010101110000");
}
else if(strcmp(x,"111011010010")==0){
strcpy(y,"00010011111110001111100");
}
else if(strcmp(x,"111011010011")==0){
strcpy(y,"00010011111001110001000");
}
else if(strcmp(x,"111011010100")==0){
strcpy(y,"00010011110101010010101");
}
else if(strcmp(x,"111011010101")==0){
strcpy(y,"00010011110000110100011");
}
else if(strcmp(x,"111011010110")==0){
strcpy(y,"00010011101100010110010");
}
else if(strcmp(x,"111011010111")==0){
strcpy(y,"00010011100111111000001");
}
else if(strcmp(x,"111011011000")==0){
strcpy(y,"00010011100011011010010");
}
else if(strcmp(x,"111011011001")==0){
strcpy(y,"00010011011110111100011");
}
else if(strcmp(x,"111011011010")==0){
strcpy(y,"00010011011010011110101");
}
else if(strcmp(x,"111011011011")==0){
strcpy(y,"00010011010110000001000");
}
else if(strcmp(x,"111011011100")==0){
strcpy(y,"00010011010001100011100");
}
else if(strcmp(x,"111011011101")==0){
strcpy(y,"00010011001101000110001");
}
else if(strcmp(x,"111011011110")==0){
strcpy(y,"00010011001000101000111");
}
else if(strcmp(x,"111011011111")==0){
strcpy(y,"00010011000100001011101");
}
else if(strcmp(x,"111011100000")==0){
strcpy(y,"00010010111111101110101");
}
else if(strcmp(x,"111011100001")==0){
strcpy(y,"00010010111011010001101");
}
else if(strcmp(x,"111011100010")==0){
strcpy(y,"00010010110110110100110");
}
else if(strcmp(x,"111011100011")==0){
strcpy(y,"00010010110010011000000");
}
else if(strcmp(x,"111011100100")==0){
strcpy(y,"00010010101101111011011");
}
else if(strcmp(x,"111011100101")==0){
strcpy(y,"00010010101001011110111");
}
else if(strcmp(x,"111011100110")==0){
strcpy(y,"00010010100101000010100");
}
else if(strcmp(x,"111011100111")==0){
strcpy(y,"00010010100000100110001");
}
else if(strcmp(x,"111011101000")==0){
strcpy(y,"00010010011100001010000");
}
else if(strcmp(x,"111011101001")==0){
strcpy(y,"00010010010111101101111");
}
else if(strcmp(x,"111011101010")==0){
strcpy(y,"00010010010011010001111");
}
else if(strcmp(x,"111011101011")==0){
strcpy(y,"00010010001110110110000");
}
else if(strcmp(x,"111011101100")==0){
strcpy(y,"00010010001010011010010");
}
else if(strcmp(x,"111011101101")==0){
strcpy(y,"00010010000101111110100");
}
else if(strcmp(x,"111011101110")==0){
strcpy(y,"00010010000001100011000");
}
else if(strcmp(x,"111011101111")==0){
strcpy(y,"00010001111101000111100");
}
else if(strcmp(x,"111011110000")==0){
strcpy(y,"00010001111000101100001");
}
else if(strcmp(x,"111011110001")==0){
strcpy(y,"00010001110100010000111");
}
else if(strcmp(x,"111011110010")==0){
strcpy(y,"00010001101111110101110");
}
else if(strcmp(x,"111011110011")==0){
strcpy(y,"00010001101011011010110");
}
else if(strcmp(x,"111011110100")==0){
strcpy(y,"00010001100110111111111");
}
else if(strcmp(x,"111011110101")==0){
strcpy(y,"00010001100010100101000");
}
else if(strcmp(x,"111011110110")==0){
strcpy(y,"00010001011110001010011");
}
else if(strcmp(x,"111011110111")==0){
strcpy(y,"00010001011001101111110");
}
else if(strcmp(x,"111011111000")==0){
strcpy(y,"00010001010101010101010");
}
else if(strcmp(x,"111011111001")==0){
strcpy(y,"00010001010000111010111");
}
else if(strcmp(x,"111011111010")==0){
strcpy(y,"00010001001100100000101");
}
else if(strcmp(x,"111011111011")==0){
strcpy(y,"00010001001000000110011");
}
else if(strcmp(x,"111011111100")==0){
strcpy(y,"00010001000011101100011");
}
else if(strcmp(x,"111011111101")==0){
strcpy(y,"00010000111111010010011");
}
else if(strcmp(x,"111011111110")==0){
strcpy(y,"00010000111010111000101");
}
else if(strcmp(x,"111011111111")==0){
strcpy(y,"00010000110110011110111");
}
else if(strcmp(x,"111100000000")==0){
strcpy(y,"00010000110010000101010");
}
else if(strcmp(x,"111100000001")==0){
strcpy(y,"00010000101101101011101");
}
else if(strcmp(x,"111100000010")==0){
strcpy(y,"00010000101001010010010");
}
else if(strcmp(x,"111100000011")==0){
strcpy(y,"00010000100100111000111");
}
else if(strcmp(x,"111100000100")==0){
strcpy(y,"00010000100000011111110");
}
else if(strcmp(x,"111100000101")==0){
strcpy(y,"00010000011100000110101");
}
else if(strcmp(x,"111100000110")==0){
strcpy(y,"00010000010111101101101");
}
else if(strcmp(x,"111100000111")==0){
strcpy(y,"00010000010011010100110");
}
else if(strcmp(x,"111100001000")==0){
strcpy(y,"00010000001110111100000");
}
else if(strcmp(x,"111100001001")==0){
strcpy(y,"00010000001010100011010");
}
else if(strcmp(x,"111100001010")==0){
strcpy(y,"00010000000110001010110");
}
else if(strcmp(x,"111100001011")==0){
strcpy(y,"00010000000001110010010");
}
else if(strcmp(x,"111100001100")==0){
strcpy(y,"00001111111101011001111");
}
else if(strcmp(x,"111100001101")==0){
strcpy(y,"00001111111001000001101");
}
else if(strcmp(x,"111100001110")==0){
strcpy(y,"00001111110100101001100");
}
else if(strcmp(x,"111100001111")==0){
strcpy(y,"00001111110000010001011");
}
else if(strcmp(x,"111100010000")==0){
strcpy(y,"00001111101011111001100");
}
else if(strcmp(x,"111100010001")==0){
strcpy(y,"00001111100111100001101");
}
else if(strcmp(x,"111100010010")==0){
strcpy(y,"00001111100011001001111");
}
else if(strcmp(x,"111100010011")==0){
strcpy(y,"00001111011110110010010");
}
else if(strcmp(x,"111100010100")==0){
strcpy(y,"00001111011010011010110");
}
else if(strcmp(x,"111100010101")==0){
strcpy(y,"00001111010110000011011");
}
else if(strcmp(x,"111100010110")==0){
strcpy(y,"00001111010001101100000");
}
else if(strcmp(x,"111100010111")==0){
strcpy(y,"00001111001101010100111");
}
else if(strcmp(x,"111100011000")==0){
strcpy(y,"00001111001000111101110");
}
else if(strcmp(x,"111100011001")==0){
strcpy(y,"00001111000100100110110");
}
else if(strcmp(x,"111100011010")==0){
strcpy(y,"00001111000000001111111");
}
else if(strcmp(x,"111100011011")==0){
strcpy(y,"00001110111011111001001");
}
else if(strcmp(x,"111100011100")==0){
strcpy(y,"00001110110111100010011");
}
else if(strcmp(x,"111100011101")==0){
strcpy(y,"00001110110011001011111");
}
else if(strcmp(x,"111100011110")==0){
strcpy(y,"00001110101110110101011");
}
else if(strcmp(x,"111100011111")==0){
strcpy(y,"00001110101010011111000");
}
else if(strcmp(x,"111100100000")==0){
strcpy(y,"00001110100110001000110");
}
else if(strcmp(x,"111100100001")==0){
strcpy(y,"00001110100001110010101");
}
else if(strcmp(x,"111100100010")==0){
strcpy(y,"00001110011101011100101");
}
else if(strcmp(x,"111100100011")==0){
strcpy(y,"00001110011001000110101");
}
else if(strcmp(x,"111100100100")==0){
strcpy(y,"00001110010100110000110");
}
else if(strcmp(x,"111100100101")==0){
strcpy(y,"00001110010000011011001");
}
else if(strcmp(x,"111100100110")==0){
strcpy(y,"00001110001100000101100");
}
else if(strcmp(x,"111100100111")==0){
strcpy(y,"00001110000111101111111");
}
else if(strcmp(x,"111100101000")==0){
strcpy(y,"00001110000011011010100");
}
else if(strcmp(x,"111100101001")==0){
strcpy(y,"00001101111111000101010");
}
else if(strcmp(x,"111100101010")==0){
strcpy(y,"00001101111010110000000");
}
else if(strcmp(x,"111100101011")==0){
strcpy(y,"00001101110110011010111");
}
else if(strcmp(x,"111100101100")==0){
strcpy(y,"00001101110010000101111");
}
else if(strcmp(x,"111100101101")==0){
strcpy(y,"00001101101101110001000");
}
else if(strcmp(x,"111100101110")==0){
strcpy(y,"00001101101001011100001");
}
else if(strcmp(x,"111100101111")==0){
strcpy(y,"00001101100101000111100");
}
else if(strcmp(x,"111100110000")==0){
strcpy(y,"00001101100000110010111");
}
else if(strcmp(x,"111100110001")==0){
strcpy(y,"00001101011100011110011");
}
else if(strcmp(x,"111100110010")==0){
strcpy(y,"00001101011000001010000");
}
else if(strcmp(x,"111100110011")==0){
strcpy(y,"00001101010011110101110");
}
else if(strcmp(x,"111100110100")==0){
strcpy(y,"00001101001111100001101");
}
else if(strcmp(x,"111100110101")==0){
strcpy(y,"00001101001011001101100");
}
else if(strcmp(x,"111100110110")==0){
strcpy(y,"00001101000110111001101");
}
else if(strcmp(x,"111100110111")==0){
strcpy(y,"00001101000010100101110");
}
else if(strcmp(x,"111100111000")==0){
strcpy(y,"00001100111110010010000");
}
else if(strcmp(x,"111100111001")==0){
strcpy(y,"00001100111001111110010");
}
else if(strcmp(x,"111100111010")==0){
strcpy(y,"00001100110101101010110");
}
else if(strcmp(x,"111100111011")==0){
strcpy(y,"00001100110001010111010");
}
else if(strcmp(x,"111100111100")==0){
strcpy(y,"00001100101101000100000");
}
else if(strcmp(x,"111100111101")==0){
strcpy(y,"00001100101000110000110");
}
else if(strcmp(x,"111100111110")==0){
strcpy(y,"00001100100100011101101");
}
else if(strcmp(x,"111100111111")==0){
strcpy(y,"00001100100000001010100");
}
else if(strcmp(x,"111101000000")==0){
strcpy(y,"00001100011011110111101");
}
else if(strcmp(x,"111101000001")==0){
strcpy(y,"00001100010111100100110");
}
else if(strcmp(x,"111101000010")==0){
strcpy(y,"00001100010011010010001");
}
else if(strcmp(x,"111101000011")==0){
strcpy(y,"00001100001110111111100");
}
else if(strcmp(x,"111101000100")==0){
strcpy(y,"00001100001010101101000");
}
else if(strcmp(x,"111101000101")==0){
strcpy(y,"00001100000110011010100");
}
else if(strcmp(x,"111101000110")==0){
strcpy(y,"00001100000010001000010");
}
else if(strcmp(x,"111101000111")==0){
strcpy(y,"00001011111101110110000");
}
else if(strcmp(x,"111101001000")==0){
strcpy(y,"00001011111001100011111");
}
else if(strcmp(x,"111101001001")==0){
strcpy(y,"00001011110101010001111");
}
else if(strcmp(x,"111101001010")==0){
strcpy(y,"00001011110001000000000");
}
else if(strcmp(x,"111101001011")==0){
strcpy(y,"00001011101100101110010");
}
else if(strcmp(x,"111101001100")==0){
strcpy(y,"00001011101000011100100");
}
else if(strcmp(x,"111101001101")==0){
strcpy(y,"00001011100100001010111");
}
else if(strcmp(x,"111101001110")==0){
strcpy(y,"00001011011111111001011");
}
else if(strcmp(x,"111101001111")==0){
strcpy(y,"00001011011011101000000");
}
else if(strcmp(x,"111101010000")==0){
strcpy(y,"00001011010111010110110");
}
else if(strcmp(x,"111101010001")==0){
strcpy(y,"00001011010011000101100");
}
else if(strcmp(x,"111101010010")==0){
strcpy(y,"00001011001110110100100");
}
else if(strcmp(x,"111101010011")==0){
strcpy(y,"00001011001010100011100");
}
else if(strcmp(x,"111101010100")==0){
strcpy(y,"00001011000110010010101");
}
else if(strcmp(x,"111101010101")==0){
strcpy(y,"00001011000010000001111");
}
else if(strcmp(x,"111101010110")==0){
strcpy(y,"00001010111101110001001");
}
else if(strcmp(x,"111101010111")==0){
strcpy(y,"00001010111001100000101");
}
else if(strcmp(x,"111101011000")==0){
strcpy(y,"00001010110101010000001");
}
else if(strcmp(x,"111101011001")==0){
strcpy(y,"00001010110000111111110");
}
else if(strcmp(x,"111101011010")==0){
strcpy(y,"00001010101100101111100");
}
else if(strcmp(x,"111101011011")==0){
strcpy(y,"00001010101000011111011");
}
else if(strcmp(x,"111101011100")==0){
strcpy(y,"00001010100100001111010");
}
else if(strcmp(x,"111101011101")==0){
strcpy(y,"00001010011111111111010");
}
else if(strcmp(x,"111101011110")==0){
strcpy(y,"00001010011011101111100");
}
else if(strcmp(x,"111101011111")==0){
strcpy(y,"00001010010111011111110");
}
else if(strcmp(x,"111101100000")==0){
strcpy(y,"00001010010011010000000");
}
else if(strcmp(x,"111101100001")==0){
strcpy(y,"00001010001111000000100");
}
else if(strcmp(x,"111101100010")==0){
strcpy(y,"00001010001010110001000");
}
else if(strcmp(x,"111101100011")==0){
strcpy(y,"00001010000110100001101");
}
else if(strcmp(x,"111101100100")==0){
strcpy(y,"00001010000010010010011");
}
else if(strcmp(x,"111101100101")==0){
strcpy(y,"00001001111110000011010");
}
else if(strcmp(x,"111101100110")==0){
strcpy(y,"00001001111001110100010");
}
else if(strcmp(x,"111101100111")==0){
strcpy(y,"00001001110101100101010");
}
else if(strcmp(x,"111101101000")==0){
strcpy(y,"00001001110001010110011");
}
else if(strcmp(x,"111101101001")==0){
strcpy(y,"00001001101101000111101");
}
else if(strcmp(x,"111101101010")==0){
strcpy(y,"00001001101000111001000");
}
else if(strcmp(x,"111101101011")==0){
strcpy(y,"00001001100100101010100");
}
else if(strcmp(x,"111101101100")==0){
strcpy(y,"00001001100000011100000");
}
else if(strcmp(x,"111101101101")==0){
strcpy(y,"00001001011100001101110");
}
else if(strcmp(x,"111101101110")==0){
strcpy(y,"00001001010111111111100");
}
else if(strcmp(x,"111101101111")==0){
strcpy(y,"00001001010011110001011");
}
else if(strcmp(x,"111101110000")==0){
strcpy(y,"00001001001111100011010");
}
else if(strcmp(x,"111101110001")==0){
strcpy(y,"00001001001011010101011");
}
else if(strcmp(x,"111101110010")==0){
strcpy(y,"00001001000111000111100");
}
else if(strcmp(x,"111101110011")==0){
strcpy(y,"00001001000010111001110");
}
else if(strcmp(x,"111101110100")==0){
strcpy(y,"00001000111110101100001");
}
else if(strcmp(x,"111101110101")==0){
strcpy(y,"00001000111010011110101");
}
else if(strcmp(x,"111101110110")==0){
strcpy(y,"00001000110110010001001");
}
else if(strcmp(x,"111101110111")==0){
strcpy(y,"00001000110010000011111");
}
else if(strcmp(x,"111101111000")==0){
strcpy(y,"00001000101101110110101");
}
else if(strcmp(x,"111101111001")==0){
strcpy(y,"00001000101001101001100");
}
else if(strcmp(x,"111101111010")==0){
strcpy(y,"00001000100101011100011");
}
else if(strcmp(x,"111101111011")==0){
strcpy(y,"00001000100001001111100");
}
else if(strcmp(x,"111101111100")==0){
strcpy(y,"00001000011101000010101");
}
else if(strcmp(x,"111101111101")==0){
strcpy(y,"00001000011000110101111");
}
else if(strcmp(x,"111101111110")==0){
strcpy(y,"00001000010100101001010");
}
else if(strcmp(x,"111101111111")==0){
strcpy(y,"00001000010000011100110");
}
else if(strcmp(x,"111110000000")==0){
strcpy(y,"00001000001100010000011");
}
else if(strcmp(x,"111110000001")==0){
strcpy(y,"00001000001000000100000");
}
else if(strcmp(x,"111110000010")==0){
strcpy(y,"00001000000011110111110");
}
else if(strcmp(x,"111110000011")==0){
strcpy(y,"00000111111111101011101");
}
else if(strcmp(x,"111110000100")==0){
strcpy(y,"00000111111011011111101");
}
else if(strcmp(x,"111110000101")==0){
strcpy(y,"00000111110111010011101");
}
else if(strcmp(x,"111110000110")==0){
strcpy(y,"00000111110011000111110");
}
else if(strcmp(x,"111110000111")==0){
strcpy(y,"00000111101110111100001");
}
else if(strcmp(x,"111110001000")==0){
strcpy(y,"00000111101010110000011");
}
else if(strcmp(x,"111110001001")==0){
strcpy(y,"00000111100110100100111");
}
else if(strcmp(x,"111110001010")==0){
strcpy(y,"00000111100010011001100");
}
else if(strcmp(x,"111110001011")==0){
strcpy(y,"00000111011110001110001");
}
else if(strcmp(x,"111110001100")==0){
strcpy(y,"00000111011010000010111");
}
else if(strcmp(x,"111110001101")==0){
strcpy(y,"00000111010101110111110");
}
else if(strcmp(x,"111110001110")==0){
strcpy(y,"00000111010001101100110");
}
else if(strcmp(x,"111110001111")==0){
strcpy(y,"00000111001101100001110");
}
else if(strcmp(x,"111110010000")==0){
strcpy(y,"00000111001001010110111");
}
else if(strcmp(x,"111110010001")==0){
strcpy(y,"00000111000101001100001");
}
else if(strcmp(x,"111110010010")==0){
strcpy(y,"00000111000001000001100");
}
else if(strcmp(x,"111110010011")==0){
strcpy(y,"00000110111100110111000");
}
else if(strcmp(x,"111110010100")==0){
strcpy(y,"00000110111000101100100");
}
else if(strcmp(x,"111110010101")==0){
strcpy(y,"00000110110100100010001");
}
else if(strcmp(x,"111110010110")==0){
strcpy(y,"00000110110000010111111");
}
else if(strcmp(x,"111110010111")==0){
strcpy(y,"00000110101100001101110");
}
else if(strcmp(x,"111110011000")==0){
strcpy(y,"00000110101000000011110");
}
else if(strcmp(x,"111110011001")==0){
strcpy(y,"00000110100011111001110");
}
else if(strcmp(x,"111110011010")==0){
strcpy(y,"00000110011111101111111");
}
else if(strcmp(x,"111110011011")==0){
strcpy(y,"00000110011011100110001");
}
else if(strcmp(x,"111110011100")==0){
strcpy(y,"00000110010111011100100");
}
else if(strcmp(x,"111110011101")==0){
strcpy(y,"00000110010011010011000");
}
else if(strcmp(x,"111110011110")==0){
strcpy(y,"00000110001111001001100");
}
else if(strcmp(x,"111110011111")==0){
strcpy(y,"00000110001011000000001");
}
else if(strcmp(x,"111110100000")==0){
strcpy(y,"00000110000110110110111");
}
else if(strcmp(x,"111110100001")==0){
strcpy(y,"00000110000010101101101");
}
else if(strcmp(x,"111110100010")==0){
strcpy(y,"00000101111110100100101");
}
else if(strcmp(x,"111110100011")==0){
strcpy(y,"00000101111010011011101");
}
else if(strcmp(x,"111110100100")==0){
strcpy(y,"00000101110110010010110");
}
else if(strcmp(x,"111110100101")==0){
strcpy(y,"00000101110010001010000");
}
else if(strcmp(x,"111110100110")==0){
strcpy(y,"00000101101110000001011");
}
else if(strcmp(x,"111110100111")==0){
strcpy(y,"00000101101001111000110");
}
else if(strcmp(x,"111110101000")==0){
strcpy(y,"00000101100101110000010");
}
else if(strcmp(x,"111110101001")==0){
strcpy(y,"00000101100001100111111");
}
else if(strcmp(x,"111110101010")==0){
strcpy(y,"00000101011101011111101");
}
else if(strcmp(x,"111110101011")==0){
strcpy(y,"00000101011001010111011");
}
else if(strcmp(x,"111110101100")==0){
strcpy(y,"00000101010101001111011");
}
else if(strcmp(x,"111110101101")==0){
strcpy(y,"00000101010001000111011");
}
else if(strcmp(x,"111110101110")==0){
strcpy(y,"00000101001100111111100");
}
else if(strcmp(x,"111110101111")==0){
strcpy(y,"00000101001000110111101");
}
else if(strcmp(x,"111110110000")==0){
strcpy(y,"00000101000100110000000");
}
else if(strcmp(x,"111110110001")==0){
strcpy(y,"00000101000000101000011");
}
else if(strcmp(x,"111110110010")==0){
strcpy(y,"00000100111100100000111");
}
else if(strcmp(x,"111110110011")==0){
strcpy(y,"00000100111000011001100");
}
else if(strcmp(x,"111110110100")==0){
strcpy(y,"00000100110100010010001");
}
else if(strcmp(x,"111110110101")==0){
strcpy(y,"00000100110000001010111");
}
else if(strcmp(x,"111110110110")==0){
strcpy(y,"00000100101100000011111");
}
else if(strcmp(x,"111110110111")==0){
strcpy(y,"00000100100111111100110");
}
else if(strcmp(x,"111110111000")==0){
strcpy(y,"00000100100011110101111");
}
else if(strcmp(x,"111110111001")==0){
strcpy(y,"00000100011111101111000");
}
else if(strcmp(x,"111110111010")==0){
strcpy(y,"00000100011011101000011");
}
else if(strcmp(x,"111110111011")==0){
strcpy(y,"00000100010111100001110");
}
else if(strcmp(x,"111110111100")==0){
strcpy(y,"00000100010011011011001");
}
else if(strcmp(x,"111110111101")==0){
strcpy(y,"00000100001111010100110");
}
else if(strcmp(x,"111110111110")==0){
strcpy(y,"00000100001011001110011");
}
else if(strcmp(x,"111110111111")==0){
strcpy(y,"00000100000111001000001");
}
else if(strcmp(x,"111111000000")==0){
strcpy(y,"00000100000011000010000");
}
else if(strcmp(x,"111111000001")==0){
strcpy(y,"00000011111110111100000");
}
else if(strcmp(x,"111111000010")==0){
strcpy(y,"00000011111010110110000");
}
else if(strcmp(x,"111111000011")==0){
strcpy(y,"00000011110110110000001");
}
else if(strcmp(x,"111111000100")==0){
strcpy(y,"00000011110010101010011");
}
else if(strcmp(x,"111111000101")==0){
strcpy(y,"00000011101110100100110");
}
else if(strcmp(x,"111111000110")==0){
strcpy(y,"00000011101010011111010");
}
else if(strcmp(x,"111111000111")==0){
strcpy(y,"00000011100110011001110");
}
else if(strcmp(x,"111111001000")==0){
strcpy(y,"00000011100010010100011");
}
else if(strcmp(x,"111111001001")==0){
strcpy(y,"00000011011110001111001");
}
else if(strcmp(x,"111111001010")==0){
strcpy(y,"00000011011010001001111");
}
else if(strcmp(x,"111111001011")==0){
strcpy(y,"00000011010110000100111");
}
else if(strcmp(x,"111111001100")==0){
strcpy(y,"00000011010001111111111");
}
else if(strcmp(x,"111111001101")==0){
strcpy(y,"00000011001101111011000");
}
else if(strcmp(x,"111111001110")==0){
strcpy(y,"00000011001001110110001");
}
else if(strcmp(x,"111111001111")==0){
strcpy(y,"00000011000101110001100");
}
else if(strcmp(x,"111111010000")==0){
strcpy(y,"00000011000001101100111");
}
else if(strcmp(x,"111111010001")==0){
strcpy(y,"00000010111101101000011");
}
else if(strcmp(x,"111111010010")==0){
strcpy(y,"00000010111001100011111");
}
else if(strcmp(x,"111111010011")==0){
strcpy(y,"00000010110101011111101");
}
else if(strcmp(x,"111111010100")==0){
strcpy(y,"00000010110001011011011");
}
else if(strcmp(x,"111111010101")==0){
strcpy(y,"00000010101101010111010");
}
else if(strcmp(x,"111111010110")==0){
strcpy(y,"00000010101001010011010");
}
else if(strcmp(x,"111111010111")==0){
strcpy(y,"00000010100101001111011");
}
else if(strcmp(x,"111111011000")==0){
strcpy(y,"00000010100001001011100");
}
else if(strcmp(x,"111111011001")==0){
strcpy(y,"00000010011101000111110");
}
else if(strcmp(x,"111111011010")==0){
strcpy(y,"00000010011001000100001");
}
else if(strcmp(x,"111111011011")==0){
strcpy(y,"00000010010101000000100");
}
else if(strcmp(x,"111111011100")==0){
strcpy(y,"00000010010000111101001");
}
else if(strcmp(x,"111111011101")==0){
strcpy(y,"00000010001100111001110");
}
else if(strcmp(x,"111111011110")==0){
strcpy(y,"00000010001000110110100");
}
else if(strcmp(x,"111111011111")==0){
strcpy(y,"00000010000100110011011");
}
else if(strcmp(x,"111111100000")==0){
strcpy(y,"00000010000000110000010");
}
else if(strcmp(x,"111111100001")==0){
strcpy(y,"00000001111100101101010");
}
else if(strcmp(x,"111111100010")==0){
strcpy(y,"00000001111000101010011");
}
else if(strcmp(x,"111111100011")==0){
strcpy(y,"00000001110100100111101");
}
else if(strcmp(x,"111111100100")==0){
strcpy(y,"00000001110000100100111");
}
else if(strcmp(x,"111111100101")==0){
strcpy(y,"00000001101100100010011");
}
else if(strcmp(x,"111111100110")==0){
strcpy(y,"00000001101000011111111");
}
else if(strcmp(x,"111111100111")==0){
strcpy(y,"00000001100100011101011");
}
else if(strcmp(x,"111111101000")==0){
strcpy(y,"00000001100000011011001");
}
else if(strcmp(x,"111111101001")==0){
strcpy(y,"00000001011100011000111");
}
else if(strcmp(x,"111111101010")==0){
strcpy(y,"00000001011000010110110");
}
else if(strcmp(x,"111111101011")==0){
strcpy(y,"00000001010100010100110");
}
else if(strcmp(x,"111111101100")==0){
strcpy(y,"00000001010000010010110");
}
else if(strcmp(x,"111111101101")==0){
strcpy(y,"00000001001100010001000");
}
else if(strcmp(x,"111111101110")==0){
strcpy(y,"00000001001000001111010");
}
else if(strcmp(x,"111111101111")==0){
strcpy(y,"00000001000100001101101");
}
else if(strcmp(x,"111111110000")==0){
strcpy(y,"00000001000000001100000");
}
else if(strcmp(x,"111111110001")==0){
strcpy(y,"00000000111100001010101");
}
else if(strcmp(x,"111111110010")==0){
strcpy(y,"00000000111000001001010");
}
else if(strcmp(x,"111111110011")==0){
strcpy(y,"00000000110100001000000");
}
else if(strcmp(x,"111111110100")==0){
strcpy(y,"00000000110000000110110");
}
else if(strcmp(x,"111111110101")==0){
strcpy(y,"00000000101100000101101");
}
else if(strcmp(x,"111111110110")==0){
strcpy(y,"00000000101000000100110");
}
else if(strcmp(x,"111111110111")==0){
strcpy(y,"00000000100100000011110");
}
else if(strcmp(x,"111111111000")==0){
strcpy(y,"00000000100000000011000");
}
else if(strcmp(x,"111111111001")==0){
strcpy(y,"00000000011100000010010");
}
else if(strcmp(x,"111111111010")==0){
strcpy(y,"00000000011000000001110");
}
else if(strcmp(x,"111111111011")==0){
strcpy(y,"00000000010100000001001");
}
else if(strcmp(x,"111111111100")==0){
strcpy(y,"00000000010000000000110");
}
else if(strcmp(x,"111111111101")==0){
strcpy(y,"00000000001100000000011");
}
else if(strcmp(x,"111111111110")==0){
strcpy(y,"00000000001000000000010");
}
 else if(strcmp(x,"111111111111")==0){
   strcpy(y,"00000000000100000000000");
 }
}



void finv1(char z[24],char x[13]){
  if(strcmp(x,"000000000000")==0){
    strcpy(z,"00000000000000000000000");
  }
else if(strcmp(x,"000000000001")==0){
strcpy(z,"11111111111000000000001");
}
else if(strcmp(x,"000000000010")==0){
strcpy(z,"11111111110000000000100");
}
else if(strcmp(x,"000000000011")==0){
strcpy(z,"11111111101000000001001");
}
else if(strcmp(x,"000000000100")==0){
strcpy(z,"11111111100000000010000");
}
else if(strcmp(x,"000000000101")==0){
strcpy(z,"11111111011000000011001");
}
else if(strcmp(x,"000000000110")==0){
strcpy(z,"11111111010000000100100");
}
else if(strcmp(x,"000000000111")==0){
strcpy(z,"11111111001000000110001");
}
else if(strcmp(x,"000000001000")==0){
strcpy(z,"11111111000000001000000");
}
else if(strcmp(x,"000000001001")==0){
strcpy(z,"11111110111000001010001");
}
else if(strcmp(x,"000000001010")==0){
strcpy(z,"11111110110000001100100");
}
else if(strcmp(x,"000000001011")==0){
strcpy(z,"11111110101000001111001");
}
else if(strcmp(x,"000000001100")==0){
strcpy(z,"11111110100000010010000");
}
else if(strcmp(x,"000000001101")==0){
strcpy(z,"11111110011000010101000");
}
else if(strcmp(x,"000000001110")==0){
strcpy(z,"11111110010000011000011");
}
else if(strcmp(x,"000000001111")==0){
strcpy(z,"11111110001000011100000");
}
else if(strcmp(x,"000000010000")==0){
strcpy(z,"11111110000000011111111");
}
else if(strcmp(x,"000000010001")==0){
strcpy(z,"11111101111000100100000");
}
else if(strcmp(x,"000000010010")==0){
strcpy(z,"11111101110000101000011");
}
else if(strcmp(x,"000000010011")==0){
strcpy(z,"11111101101000101100111");
}
else if(strcmp(x,"000000010100")==0){
strcpy(z,"11111101100000110001110");
}
else if(strcmp(x,"000000010101")==0){
strcpy(z,"11111101011000110110111");
}
else if(strcmp(x,"000000010110")==0){
strcpy(z,"11111101010000111100001");
}
else if(strcmp(x,"000000010111")==0){
strcpy(z,"11111101001001000001110");
}
else if(strcmp(x,"000000011000")==0){
strcpy(z,"11111101000001000111101");
}
else if(strcmp(x,"000000011001")==0){
strcpy(z,"11111100111001001101101");
}
else if(strcmp(x,"000000011010")==0){
strcpy(z,"11111100110001010100000");
}
else if(strcmp(x,"000000011011")==0){
strcpy(z,"11111100101001011010100");
}
else if(strcmp(x,"000000011100")==0){
strcpy(z,"11111100100001100001011");
}
else if(strcmp(x,"000000011101")==0){
strcpy(z,"11111100011001101000011");
}
else if(strcmp(x,"000000011110")==0){
strcpy(z,"11111100010001101111101");
}
else if(strcmp(x,"000000011111")==0){
strcpy(z,"11111100001001110111010");
}
else if(strcmp(x,"000000100000")==0){
strcpy(z,"11111100000001111111000");
}
else if(strcmp(x,"000000100001")==0){
strcpy(z,"11111011111010000111000");
}
else if(strcmp(x,"000000100010")==0){
strcpy(z,"11111011110010001111010");
}
else if(strcmp(x,"000000100011")==0){
strcpy(z,"11111011101010010111111");
}
else if(strcmp(x,"000000100100")==0){
strcpy(z,"11111011100010100000101");
}
else if(strcmp(x,"000000100101")==0){
strcpy(z,"11111011011010101001101");
}
else if(strcmp(x,"000000100110")==0){
strcpy(z,"11111011010010110010111");
}
else if(strcmp(x,"000000100111")==0){
strcpy(z,"11111011001010111100011");
}
else if(strcmp(x,"000000101000")==0){
strcpy(z,"11111011000011000110001");
}
else if(strcmp(x,"000000101001")==0){
strcpy(z,"11111010111011010000000");
}
else if(strcmp(x,"000000101010")==0){
strcpy(z,"11111010110011011010010");
}
else if(strcmp(x,"000000101011")==0){
strcpy(z,"11111010101011100100110");
}
else if(strcmp(x,"000000101100")==0){
strcpy(z,"11111010100011101111011");
}
else if(strcmp(x,"000000101101")==0){
strcpy(z,"11111010011011111010011");
}
else if(strcmp(x,"000000101110")==0){
strcpy(z,"11111010010100000101101");
}
else if(strcmp(x,"000000101111")==0){
strcpy(z,"11111010001100010001000");
}
else if(strcmp(x,"000000110000")==0){
strcpy(z,"11111010000100011100101");
}
else if(strcmp(x,"000000110001")==0){
strcpy(z,"11111001111100101000101");
}
else if(strcmp(x,"000000110010")==0){
strcpy(z,"11111001110100110100110");
}
else if(strcmp(x,"000000110011")==0){
strcpy(z,"11111001101101000001001");
}
else if(strcmp(x,"000000110100")==0){
strcpy(z,"11111001100101001101110");
}
else if(strcmp(x,"000000110101")==0){
strcpy(z,"11111001011101011010101");
}
else if(strcmp(x,"000000110110")==0){
strcpy(z,"11111001010101100111110");
}
else if(strcmp(x,"000000110111")==0){
strcpy(z,"11111001001101110101001");
}
else if(strcmp(x,"000000111000")==0){
strcpy(z,"11111001000110000010110");
}
else if(strcmp(x,"000000111001")==0){
strcpy(z,"11111000111110010000100");
}
else if(strcmp(x,"000000111010")==0){
strcpy(z,"11111000110110011110101");
}
else if(strcmp(x,"000000111011")==0){
strcpy(z,"11111000101110101101000");
}
else if(strcmp(x,"000000111100")==0){
strcpy(z,"11111000100110111011100");
}
else if(strcmp(x,"000000111101")==0){
strcpy(z,"11111000011111001010010");
}
else if(strcmp(x,"000000111110")==0){
strcpy(z,"11111000010111011001011");
}
else if(strcmp(x,"000000111111")==0){
strcpy(z,"11111000001111101000101");
}
else if(strcmp(x,"000001000000")==0){
strcpy(z,"11111000000111111000001");
}
else if(strcmp(x,"000001000001")==0){
strcpy(z,"11111000000000000111111");
}
else if(strcmp(x,"000001000010")==0){
strcpy(z,"11110111111000010111111");
}
else if(strcmp(x,"000001000011")==0){
strcpy(z,"11110111110000101000001");
}
else if(strcmp(x,"000001000100")==0){
strcpy(z,"11110111101000111000100");
}
else if(strcmp(x,"000001000101")==0){
strcpy(z,"11110111100001001001010");
}
else if(strcmp(x,"000001000110")==0){
strcpy(z,"11110111011001011010010");
}
else if(strcmp(x,"000001000111")==0){
strcpy(z,"11110111010001101011011");
}
else if(strcmp(x,"000001001000")==0){
strcpy(z,"11110111001001111100110");
}
else if(strcmp(x,"000001001001")==0){
strcpy(z,"11110111000010001110100");
}
else if(strcmp(x,"000001001010")==0){
strcpy(z,"11110110111010100000011");
}
else if(strcmp(x,"000001001011")==0){
strcpy(z,"11110110110010110010100");
}
else if(strcmp(x,"000001001100")==0){
strcpy(z,"11110110101011000100111");
}
else if(strcmp(x,"000001001101")==0){
strcpy(z,"11110110100011010111100");
}
else if(strcmp(x,"000001001110")==0){
strcpy(z,"11110110011011101010010");
}
else if(strcmp(x,"000001001111")==0){
strcpy(z,"11110110010011111101011");
}
else if(strcmp(x,"000001010000")==0){
strcpy(z,"11110110001100010000101");
}
else if(strcmp(x,"000001010001")==0){
strcpy(z,"11110110000100100100010");
}
else if(strcmp(x,"000001010010")==0){
strcpy(z,"11110101111100111000000");
}
else if(strcmp(x,"000001010011")==0){
strcpy(z,"11110101110101001100000");
}
else if(strcmp(x,"000001010100")==0){
strcpy(z,"11110101101101100000010");
}
else if(strcmp(x,"000001010101")==0){
strcpy(z,"11110101100101110100110");
}
else if(strcmp(x,"000001010110")==0){
strcpy(z,"11110101011110001001100");
}
else if(strcmp(x,"000001010111")==0){
strcpy(z,"11110101010110011110100");
}
else if(strcmp(x,"000001011000")==0){
strcpy(z,"11110101001110110011101");
}
else if(strcmp(x,"000001011001")==0){
strcpy(z,"11110101000111001001001");
}
else if(strcmp(x,"000001011010")==0){
strcpy(z,"11110100111111011110110");
}
else if(strcmp(x,"000001011011")==0){
strcpy(z,"11110100110111110100101");
}
else if(strcmp(x,"000001011100")==0){
strcpy(z,"11110100110000001010110");
}
else if(strcmp(x,"000001011101")==0){
strcpy(z,"11110100101000100001001");
}
else if(strcmp(x,"000001011110")==0){
strcpy(z,"11110100100000110111110");
}
else if(strcmp(x,"000001011111")==0){
strcpy(z,"11110100011001001110100");
}
else if(strcmp(x,"000001100000")==0){
strcpy(z,"11110100010001100101101");
}
else if(strcmp(x,"000001100001")==0){
strcpy(z,"11110100001001111100111");
}
else if(strcmp(x,"000001100010")==0){
strcpy(z,"11110100000010010100100");
}
else if(strcmp(x,"000001100011")==0){
strcpy(z,"11110011111010101100010");
}
else if(strcmp(x,"000001100100")==0){
strcpy(z,"11110011110011000100010");
}
else if(strcmp(x,"000001100101")==0){
strcpy(z,"11110011101011011100100");
}
else if(strcmp(x,"000001100110")==0){
strcpy(z,"11110011100011110100111");
}
else if(strcmp(x,"000001100111")==0){
strcpy(z,"11110011011100001101101");
}
else if(strcmp(x,"000001101000")==0){
strcpy(z,"11110011010100100110100");
}
else if(strcmp(x,"000001101001")==0){
strcpy(z,"11110011001100111111101");
}
else if(strcmp(x,"000001101010")==0){
strcpy(z,"11110011000101011001001");
}
else if(strcmp(x,"000001101011")==0){
strcpy(z,"11110010111101110010110");
}
else if(strcmp(x,"000001101100")==0){
strcpy(z,"11110010110110001100100");
}
else if(strcmp(x,"000001101101")==0){
strcpy(z,"11110010101110100110101");
}
else if(strcmp(x,"000001101110")==0){
strcpy(z,"11110010100111000001000");
}
else if(strcmp(x,"000001101111")==0){
strcpy(z,"11110010011111011011100");
}
else if(strcmp(x,"000001110000")==0){
strcpy(z,"11110010010111110110010");
}
else if(strcmp(x,"000001110001")==0){
strcpy(z,"11110010010000010001010");
}
else if(strcmp(x,"000001110010")==0){
strcpy(z,"11110010001000101100100");
}
else if(strcmp(x,"000001110011")==0){
strcpy(z,"11110010000001001000000");
}
else if(strcmp(x,"000001110100")==0){
strcpy(z,"11110001111001100011101");
}
else if(strcmp(x,"000001110101")==0){
strcpy(z,"11110001110001111111101");
}
else if(strcmp(x,"000001110110")==0){
strcpy(z,"11110001101010011011110");
}
else if(strcmp(x,"000001110111")==0){
strcpy(z,"11110001100010111000001");
}
else if(strcmp(x,"000001111000")==0){
strcpy(z,"11110001011011010100110");
}
else if(strcmp(x,"000001111001")==0){
strcpy(z,"11110001010011110001101");
}
else if(strcmp(x,"000001111010")==0){
strcpy(z,"11110001001100001110110");
}
else if(strcmp(x,"000001111011")==0){
strcpy(z,"11110001000100101100000");
}
else if(strcmp(x,"000001111100")==0){
strcpy(z,"11110000111101001001100");
}
else if(strcmp(x,"000001111101")==0){
strcpy(z,"11110000110101100111010");
}
else if(strcmp(x,"000001111110")==0){
strcpy(z,"11110000101110000101010");
}
else if(strcmp(x,"000001111111")==0){
strcpy(z,"11110000100110100011100");
}
else if(strcmp(x,"000010000000")==0){
strcpy(z,"11110000011111000010000");
}
else if(strcmp(x,"000010000001")==0){
strcpy(z,"11110000010111100000101");
}
else if(strcmp(x,"000010000010")==0){
strcpy(z,"11110000001111111111100");
}
else if(strcmp(x,"000010000011")==0){
strcpy(z,"11110000001000011110101");
}
else if(strcmp(x,"000010000100")==0){
strcpy(z,"11110000000000111110000");
}
else if(strcmp(x,"000010000101")==0){
strcpy(z,"11101111111001011101101");
}
else if(strcmp(x,"000010000110")==0){
strcpy(z,"11101111110001111101011");
}
else if(strcmp(x,"000010000111")==0){
strcpy(z,"11101111101010011101011");
}
else if(strcmp(x,"000010001000")==0){
strcpy(z,"11101111100010111101110");
}
else if(strcmp(x,"000010001001")==0){
strcpy(z,"11101111011011011110010");
}
else if(strcmp(x,"000010001010")==0){
strcpy(z,"11101111010011111110111");
}
else if(strcmp(x,"000010001011")==0){
strcpy(z,"11101111001100011111111");
}
else if(strcmp(x,"000010001100")==0){
strcpy(z,"11101111000101000001000");
}
else if(strcmp(x,"000010001101")==0){
strcpy(z,"11101110111101100010011");
}
else if(strcmp(x,"000010001110")==0){
strcpy(z,"11101110110110000100000");
}
else if(strcmp(x,"000010001111")==0){
strcpy(z,"11101110101110100101111");
}
else if(strcmp(x,"000010010000")==0){
strcpy(z,"11101110100111001000000");
}
else if(strcmp(x,"000010010001")==0){
strcpy(z,"11101110011111101010010");
}
else if(strcmp(x,"000010010010")==0){
strcpy(z,"11101110011000001100110");
}
else if(strcmp(x,"000010010011")==0){
strcpy(z,"11101110010000101111100");
}
else if(strcmp(x,"000010010100")==0){
strcpy(z,"11101110001001010010100");
}
else if(strcmp(x,"000010010101")==0){
strcpy(z,"11101110000001110101110");
}
else if(strcmp(x,"000010010110")==0){
strcpy(z,"11101101111010011001001");
}
else if(strcmp(x,"000010010111")==0){
strcpy(z,"11101101110010111100110");
}
else if(strcmp(x,"000010011000")==0){
strcpy(z,"11101101101011100000101");
}
else if(strcmp(x,"000010011001")==0){
strcpy(z,"11101101100100000100110");
}
else if(strcmp(x,"000010011010")==0){
strcpy(z,"11101101011100101001001");
}
else if(strcmp(x,"000010011011")==0){
strcpy(z,"11101101010101001101101");
}
else if(strcmp(x,"000010011100")==0){
strcpy(z,"11101101001101110010011");
}
else if(strcmp(x,"000010011101")==0){
strcpy(z,"11101101000110010111011");
}
else if(strcmp(x,"000010011110")==0){
strcpy(z,"11101100111110111100101");
}
else if(strcmp(x,"000010011111")==0){
strcpy(z,"11101100110111100010000");
}
else if(strcmp(x,"000010100000")==0){
strcpy(z,"11101100110000000111110");
}
else if(strcmp(x,"000010100001")==0){
strcpy(z,"11101100101000101101101");
}
else if(strcmp(x,"000010100010")==0){
strcpy(z,"11101100100001010011110");
}
else if(strcmp(x,"000010100011")==0){
strcpy(z,"11101100011001111010000");
}
else if(strcmp(x,"000010100100")==0){
strcpy(z,"11101100010010100000101");
}
else if(strcmp(x,"000010100101")==0){
strcpy(z,"11101100001011000111011");
}
else if(strcmp(x,"000010100110")==0){
strcpy(z,"11101100000011101110011");
}
else if(strcmp(x,"000010100111")==0){
strcpy(z,"11101011111100010101100");
}
else if(strcmp(x,"000010101000")==0){
strcpy(z,"11101011110100111101000");
}
else if(strcmp(x,"000010101001")==0){
strcpy(z,"11101011101101100100101");
}
else if(strcmp(x,"000010101010")==0){
strcpy(z,"11101011100110001100100");
}
else if(strcmp(x,"000010101011")==0){
strcpy(z,"11101011011110110100101");
}
else if(strcmp(x,"000010101100")==0){
strcpy(z,"11101011010111011101000");
}
else if(strcmp(x,"000010101101")==0){
strcpy(z,"11101011010000000101100");
}
else if(strcmp(x,"000010101110")==0){
strcpy(z,"11101011001000101110010");
}
else if(strcmp(x,"000010101111")==0){
strcpy(z,"11101011000001010111010");
}
else if(strcmp(x,"000010110000")==0){
strcpy(z,"11101010111010000000100");
}
else if(strcmp(x,"000010110001")==0){
strcpy(z,"11101010110010101001111");
}
else if(strcmp(x,"000010110010")==0){
strcpy(z,"11101010101011010011100");
}
else if(strcmp(x,"000010110011")==0){
strcpy(z,"11101010100011111101011");
}
else if(strcmp(x,"000010110100")==0){
strcpy(z,"11101010011100100111100");
}
else if(strcmp(x,"000010110101")==0){
strcpy(z,"11101010010101010001111");
}
else if(strcmp(x,"000010110110")==0){
strcpy(z,"11101010001101111100011");
}
else if(strcmp(x,"000010110111")==0){
strcpy(z,"11101010000110100111001");
}
else if(strcmp(x,"000010111000")==0){
strcpy(z,"11101001111111010010001");
}
else if(strcmp(x,"000010111001")==0){
strcpy(z,"11101001110111111101010");
}
else if(strcmp(x,"000010111010")==0){
strcpy(z,"11101001110000101000101");
}
else if(strcmp(x,"000010111011")==0){
strcpy(z,"11101001101001010100010");
}
else if(strcmp(x,"000010111100")==0){
strcpy(z,"11101001100010000000001");
}
else if(strcmp(x,"000010111101")==0){
strcpy(z,"11101001011010101100001");
}
else if(strcmp(x,"000010111110")==0){
strcpy(z,"11101001010011011000100");
}
else if(strcmp(x,"000010111111")==0){
strcpy(z,"11101001001100000101000");
}
else if(strcmp(x,"000011000000")==0){
strcpy(z,"11101001000100110001101");
}
else if(strcmp(x,"000011000001")==0){
strcpy(z,"11101000111101011110101");
}
else if(strcmp(x,"000011000010")==0){
strcpy(z,"11101000110110001011110");
}
else if(strcmp(x,"000011000011")==0){
strcpy(z,"11101000101110111001001");
}
else if(strcmp(x,"000011000100")==0){
strcpy(z,"11101000100111100110110");
}
else if(strcmp(x,"000011000101")==0){
strcpy(z,"11101000100000010100100");
}
else if(strcmp(x,"000011000110")==0){
strcpy(z,"11101000011001000010100");
}
else if(strcmp(x,"000011000111")==0){
strcpy(z,"11101000010001110000110");
}
else if(strcmp(x,"000011001000")==0){
strcpy(z,"11101000001010011111010");
}
else if(strcmp(x,"000011001001")==0){
strcpy(z,"11101000000011001101111");
}
else if(strcmp(x,"000011001010")==0){
strcpy(z,"11100111111011111100110");
}
else if(strcmp(x,"000011001011")==0){
strcpy(z,"11100111110100101011111");
}
else if(strcmp(x,"000011001100")==0){
strcpy(z,"11100111101101011011010");
}
else if(strcmp(x,"000011001101")==0){
strcpy(z,"11100111100110001010110");
}
else if(strcmp(x,"000011001110")==0){
strcpy(z,"11100111011110111010100");
}
else if(strcmp(x,"000011001111")==0){
strcpy(z,"11100111010111101010100");
}
else if(strcmp(x,"000011010000")==0){
strcpy(z,"11100111010000011010101");
}
else if(strcmp(x,"000011010001")==0){
strcpy(z,"11100111001001001011000");
}
else if(strcmp(x,"000011010010")==0){
strcpy(z,"11100111000001111011101");
}
else if(strcmp(x,"000011010011")==0){
strcpy(z,"11100110111010101100100");
}
else if(strcmp(x,"000011010100")==0){
strcpy(z,"11100110110011011101100");
}
else if(strcmp(x,"000011010101")==0){
strcpy(z,"11100110101100001110110");
}
else if(strcmp(x,"000011010110")==0){
strcpy(z,"11100110100101000000010");
}
else if(strcmp(x,"000011010111")==0){
strcpy(z,"11100110011101110010000");
}
else if(strcmp(x,"000011011000")==0){
strcpy(z,"11100110010110100011111");
}
else if(strcmp(x,"000011011001")==0){
strcpy(z,"11100110001111010110000");
}
else if(strcmp(x,"000011011010")==0){
strcpy(z,"11100110001000001000010");
}
else if(strcmp(x,"000011011011")==0){
strcpy(z,"11100110000000111010111");
}
else if(strcmp(x,"000011011100")==0){
strcpy(z,"11100101111001101101101");
}
else if(strcmp(x,"000011011101")==0){
strcpy(z,"11100101110010100000101");
}
else if(strcmp(x,"000011011110")==0){
strcpy(z,"11100101101011010011110");
}
else if(strcmp(x,"000011011111")==0){
strcpy(z,"11100101100100000111001");
}
else if(strcmp(x,"000011100000")==0){
strcpy(z,"11100101011100111010110");
}
else if(strcmp(x,"000011100001")==0){
strcpy(z,"11100101010101101110101");
}
else if(strcmp(x,"000011100010")==0){
strcpy(z,"11100101001110100010101");
}
else if(strcmp(x,"000011100011")==0){
strcpy(z,"11100101000111010110111");
}
else if(strcmp(x,"000011100100")==0){
strcpy(z,"11100101000000001011011");
}
else if(strcmp(x,"000011100101")==0){
strcpy(z,"11100100111001000000000");
}
else if(strcmp(x,"000011100110")==0){
strcpy(z,"11100100110001110100111");
}
else if(strcmp(x,"000011100111")==0){
strcpy(z,"11100100101010101010000");
}
else if(strcmp(x,"000011101000")==0){
strcpy(z,"11100100100011011111011");
}
else if(strcmp(x,"000011101001")==0){
strcpy(z,"11100100011100010100111");
}
else if(strcmp(x,"000011101010")==0){
strcpy(z,"11100100010101001010101");
}
else if(strcmp(x,"000011101011")==0){
strcpy(z,"11100100001110000000100");
}
else if(strcmp(x,"000011101100")==0){
strcpy(z,"11100100000110110110110");
}
else if(strcmp(x,"000011101101")==0){
strcpy(z,"11100011111111101101001");
}
else if(strcmp(x,"000011101110")==0){
strcpy(z,"11100011111000100011101");
}
else if(strcmp(x,"000011101111")==0){
strcpy(z,"11100011110001011010100");
}
else if(strcmp(x,"000011110000")==0){
strcpy(z,"11100011101010010001100");
}
else if(strcmp(x,"000011110001")==0){
strcpy(z,"11100011100011001000110");
}
else if(strcmp(x,"000011110010")==0){
strcpy(z,"11100011011100000000001");
}
else if(strcmp(x,"000011110011")==0){
strcpy(z,"11100011010100110111110");
}
else if(strcmp(x,"000011110100")==0){
strcpy(z,"11100011001101101111101");
}
else if(strcmp(x,"000011110101")==0){
strcpy(z,"11100011000110100111101");
}
else if(strcmp(x,"000011110110")==0){
strcpy(z,"11100010111111011111111");
}
else if(strcmp(x,"000011110111")==0){
strcpy(z,"11100010111000011000011");
}
else if(strcmp(x,"000011111000")==0){
strcpy(z,"11100010110001010001001");
}
else if(strcmp(x,"000011111001")==0){
strcpy(z,"11100010101010001010000");
}
else if(strcmp(x,"000011111010")==0){
strcpy(z,"11100010100011000011001");
}
else if(strcmp(x,"000011111011")==0){
strcpy(z,"11100010011011111100011");
}
else if(strcmp(x,"000011111100")==0){
strcpy(z,"11100010010100110101111");
}
else if(strcmp(x,"000011111101")==0){
strcpy(z,"11100010001101101111101");
}
else if(strcmp(x,"000011111110")==0){
strcpy(z,"11100010000110101001101");
}
else if(strcmp(x,"000011111111")==0){
strcpy(z,"11100001111111100011110");
}
else if(strcmp(x,"000100000000")==0){
strcpy(z,"11100001111000011110001");
}
else if(strcmp(x,"000100000001")==0){
strcpy(z,"11100001110001011000101");
}
else if(strcmp(x,"000100000010")==0){
strcpy(z,"11100001101010010011100");
}
else if(strcmp(x,"000100000011")==0){
strcpy(z,"11100001100011001110100");
}
else if(strcmp(x,"000100000100")==0){
strcpy(z,"11100001011100001001101");
}
else if(strcmp(x,"000100000101")==0){
strcpy(z,"11100001010101000101000");
}
else if(strcmp(x,"000100000110")==0){
strcpy(z,"11100001001110000000101");
}
else if(strcmp(x,"000100000111")==0){
strcpy(z,"11100001000110111100100");
}
else if(strcmp(x,"000100001000")==0){
strcpy(z,"11100000111111111000100");
}
else if(strcmp(x,"000100001001")==0){
strcpy(z,"11100000111000110100110");
}
else if(strcmp(x,"000100001010")==0){
strcpy(z,"11100000110001110001001");
}
else if(strcmp(x,"000100001011")==0){
strcpy(z,"11100000101010101101110");
}
else if(strcmp(x,"000100001100")==0){
strcpy(z,"11100000100011101010101");
}
else if(strcmp(x,"000100001101")==0){
strcpy(z,"11100000011100100111110");
}
else if(strcmp(x,"000100001110")==0){
strcpy(z,"11100000010101100101000");
}
else if(strcmp(x,"000100001111")==0){
strcpy(z,"11100000001110100010100");
}
else if(strcmp(x,"000100010000")==0){
strcpy(z,"11100000000111100000001");
}
else if(strcmp(x,"000100010001")==0){
strcpy(z,"11100000000000011110000");
}
else if(strcmp(x,"000100010010")==0){
strcpy(z,"11011111111001011100001");
}
else if(strcmp(x,"000100010011")==0){
strcpy(z,"11011111110010011010011");
}
else if(strcmp(x,"000100010100")==0){
strcpy(z,"11011111101011011000111");
}
else if(strcmp(x,"000100010101")==0){
strcpy(z,"11011111100100010111101");
}
else if(strcmp(x,"000100010110")==0){
strcpy(z,"11011111011101010110100");
}
else if(strcmp(x,"000100010111")==0){
strcpy(z,"11011111010110010101101");
}
else if(strcmp(x,"000100011000")==0){
strcpy(z,"11011111001111010101000");
}
else if(strcmp(x,"000100011001")==0){
strcpy(z,"11011111001000010100100");
}
else if(strcmp(x,"000100011010")==0){
strcpy(z,"11011111000001010100010");
}
else if(strcmp(x,"000100011011")==0){
strcpy(z,"11011110111010010100001");
}
else if(strcmp(x,"000100011100")==0){
strcpy(z,"11011110110011010100010");
}
else if(strcmp(x,"000100011101")==0){
strcpy(z,"11011110101100010100101");
}
else if(strcmp(x,"000100011110")==0){
strcpy(z,"11011110100101010101001");
}
else if(strcmp(x,"000100011111")==0){
strcpy(z,"11011110011110010101111");
}
else if(strcmp(x,"000100100000")==0){
strcpy(z,"11011110010111010110111");
}
else if(strcmp(x,"000100100001")==0){
strcpy(z,"11011110010000011000000");
}
else if(strcmp(x,"000100100010")==0){
strcpy(z,"11011110001001011001011");
}
else if(strcmp(x,"000100100011")==0){
strcpy(z,"11011110000010011011000");
}
else if(strcmp(x,"000100100100")==0){
strcpy(z,"11011101111011011100110");
}
else if(strcmp(x,"000100100101")==0){
strcpy(z,"11011101110100011110110");
}
else if(strcmp(x,"000100100110")==0){
strcpy(z,"11011101101101100000111");
}
else if(strcmp(x,"000100100111")==0){
strcpy(z,"11011101100110100011010");
}
else if(strcmp(x,"000100101000")==0){
strcpy(z,"11011101011111100101111");
}
else if(strcmp(x,"000100101001")==0){
strcpy(z,"11011101011000101000101");
}
else if(strcmp(x,"000100101010")==0){
strcpy(z,"11011101010001101011101");
}
else if(strcmp(x,"000100101011")==0){
strcpy(z,"11011101001010101110111");
}
else if(strcmp(x,"000100101100")==0){
strcpy(z,"11011101000011110010010");
}
else if(strcmp(x,"000100101101")==0){
strcpy(z,"11011100111100110101111");
}
else if(strcmp(x,"000100101110")==0){
strcpy(z,"11011100110101111001101");
}
else if(strcmp(x,"000100101111")==0){
strcpy(z,"11011100101110111101101");
}
else if(strcmp(x,"000100110000")==0){
strcpy(z,"11011100101000000001111");
}
else if(strcmp(x,"000100110001")==0){
strcpy(z,"11011100100001000110010");
}
else if(strcmp(x,"000100110010")==0){
strcpy(z,"11011100011010001010111");
}
else if(strcmp(x,"000100110011")==0){
strcpy(z,"11011100010011001111101");
}
else if(strcmp(x,"000100110100")==0){
strcpy(z,"11011100001100010100110");
}
else if(strcmp(x,"000100110101")==0){
strcpy(z,"11011100000101011001111");
}
else if(strcmp(x,"000100110110")==0){
strcpy(z,"11011011111110011111011");
}
else if(strcmp(x,"000100110111")==0){
strcpy(z,"11011011110111100100111");
}
else if(strcmp(x,"000100111000")==0){
strcpy(z,"11011011110000101010110");
}
else if(strcmp(x,"000100111001")==0){
strcpy(z,"11011011101001110000110");
}
else if(strcmp(x,"000100111010")==0){
strcpy(z,"11011011100010110111000");
}
else if(strcmp(x,"000100111011")==0){
strcpy(z,"11011011011011111101011");
}
else if(strcmp(x,"000100111100")==0){
strcpy(z,"11011011010101000100000");
}
else if(strcmp(x,"000100111101")==0){
strcpy(z,"11011011001110001010111");
}
else if(strcmp(x,"000100111110")==0){
strcpy(z,"11011011000111010001111");
}
else if(strcmp(x,"000100111111")==0){
strcpy(z,"11011011000000011001000");
}
else if(strcmp(x,"000101000000")==0){
strcpy(z,"11011010111001100000100");
}
else if(strcmp(x,"000101000001")==0){
strcpy(z,"11011010110010101000001");
}
else if(strcmp(x,"000101000010")==0){
strcpy(z,"11011010101011101111111");
}
else if(strcmp(x,"000101000011")==0){
strcpy(z,"11011010100100110111111");
}
else if(strcmp(x,"000101000100")==0){
strcpy(z,"11011010011110000000001");
}
else if(strcmp(x,"000101000101")==0){
strcpy(z,"11011010010111001000100");
}
else if(strcmp(x,"000101000110")==0){
strcpy(z,"11011010010000010001001");
}
else if(strcmp(x,"000101000111")==0){
strcpy(z,"11011010001001011010000");
}
else if(strcmp(x,"000101001000")==0){
strcpy(z,"11011010000010100011000");
}
else if(strcmp(x,"000101001001")==0){
strcpy(z,"11011001111011101100001");
}
else if(strcmp(x,"000101001010")==0){
strcpy(z,"11011001110100110101100");
}
else if(strcmp(x,"000101001011")==0){
strcpy(z,"11011001101101111111001");
}
else if(strcmp(x,"000101001100")==0){
strcpy(z,"11011001100111001001000");
}
else if(strcmp(x,"000101001101")==0){
strcpy(z,"11011001100000010011000");
}
else if(strcmp(x,"000101001110")==0){
strcpy(z,"11011001011001011101001");
}
else if(strcmp(x,"000101001111")==0){
strcpy(z,"11011001010010100111100");
}
else if(strcmp(x,"000101010000")==0){
strcpy(z,"11011001001011110010001");
}
else if(strcmp(x,"000101010001")==0){
strcpy(z,"11011001000100111100111");
}
else if(strcmp(x,"000101010010")==0){
strcpy(z,"11011000111110000111111");
}
else if(strcmp(x,"000101010011")==0){
strcpy(z,"11011000110111010011001");
}
else if(strcmp(x,"000101010100")==0){
strcpy(z,"11011000110000011110100");
}
else if(strcmp(x,"000101010101")==0){
strcpy(z,"11011000101001101010000");
}
else if(strcmp(x,"000101010110")==0){
strcpy(z,"11011000100010110101111");
}
else if(strcmp(x,"000101010111")==0){
strcpy(z,"11011000011100000001110");
}
else if(strcmp(x,"000101011000")==0){
strcpy(z,"11011000010101001110000");
}
else if(strcmp(x,"000101011001")==0){
strcpy(z,"11011000001110011010011");
}
else if(strcmp(x,"000101011010")==0){
strcpy(z,"11011000000111100110111");
}
else if(strcmp(x,"000101011011")==0){
strcpy(z,"11011000000000110011101");
}
else if(strcmp(x,"000101011100")==0){
strcpy(z,"11010111111010000000101");
}
else if(strcmp(x,"000101011101")==0){
strcpy(z,"11010111110011001101110");
}
else if(strcmp(x,"000101011110")==0){
strcpy(z,"11010111101100011011001");
}
else if(strcmp(x,"000101011111")==0){
strcpy(z,"11010111100101101000101");
}
else if(strcmp(x,"000101100000")==0){
strcpy(z,"11010111011110110110011");
}
else if(strcmp(x,"000101100001")==0){
strcpy(z,"11010111011000000100010");
}
else if(strcmp(x,"000101100010")==0){
strcpy(z,"11010111010001010010011");
}
else if(strcmp(x,"000101100011")==0){
strcpy(z,"11010111001010100000110");
}
else if(strcmp(x,"000101100100")==0){
strcpy(z,"11010111000011101111010");
}
else if(strcmp(x,"000101100101")==0){
strcpy(z,"11010110111100111101111");
}
else if(strcmp(x,"000101100110")==0){
strcpy(z,"11010110110110001100111");
}
else if(strcmp(x,"000101100111")==0){
strcpy(z,"11010110101111011011111");
}
else if(strcmp(x,"000101101000")==0){
strcpy(z,"11010110101000101011010");
}
else if(strcmp(x,"000101101001")==0){
strcpy(z,"11010110100001111010101");
}
else if(strcmp(x,"000101101010")==0){
strcpy(z,"11010110011011001010011");
}
else if(strcmp(x,"000101101011")==0){
strcpy(z,"11010110010100011010010");
}
else if(strcmp(x,"000101101100")==0){
strcpy(z,"11010110001101101010010");
}
else if(strcmp(x,"000101101101")==0){
strcpy(z,"11010110000110111010101");
}
else if(strcmp(x,"000101101110")==0){
strcpy(z,"11010110000000001011000");
}
else if(strcmp(x,"000101101111")==0){
strcpy(z,"11010101111001011011101");
}
else if(strcmp(x,"000101110000")==0){
strcpy(z,"11010101110010101100100");
}
else if(strcmp(x,"000101110001")==0){
strcpy(z,"11010101101011111101100");
}
else if(strcmp(x,"000101110010")==0){
strcpy(z,"11010101100101001110110");
}
else if(strcmp(x,"000101110011")==0){
strcpy(z,"11010101011110100000001");
}
else if(strcmp(x,"000101110100")==0){
strcpy(z,"11010101010111110001110");
}
else if(strcmp(x,"000101110101")==0){
strcpy(z,"11010101010001000011101");
}
else if(strcmp(x,"000101110110")==0){
strcpy(z,"11010101001010010101101");
}
else if(strcmp(x,"000101110111")==0){
strcpy(z,"11010101000011100111110");
}
else if(strcmp(x,"000101111000")==0){
strcpy(z,"11010100111100111010001");
}
else if(strcmp(x,"000101111001")==0){
strcpy(z,"11010100110110001100110");
}
else if(strcmp(x,"000101111010")==0){
strcpy(z,"11010100101111011111100");
}
else if(strcmp(x,"000101111011")==0){
strcpy(z,"11010100101000110010100");
}
else if(strcmp(x,"000101111100")==0){
strcpy(z,"11010100100010000101101");
}
else if(strcmp(x,"000101111101")==0){
strcpy(z,"11010100011011011001000");
}
else if(strcmp(x,"000101111110")==0){
strcpy(z,"11010100010100101100100");
}
else if(strcmp(x,"000101111111")==0){
strcpy(z,"11010100001110000000010");
}
else if(strcmp(x,"000110000000")==0){
strcpy(z,"11010100000111010100001");
}
else if(strcmp(x,"000110000001")==0){
strcpy(z,"11010100000000101000010");
}
else if(strcmp(x,"000110000010")==0){
strcpy(z,"11010011111001111100100");
}
else if(strcmp(x,"000110000011")==0){
strcpy(z,"11010011110011010001000");
}
else if(strcmp(x,"000110000100")==0){
strcpy(z,"11010011101100100101101");
}
else if(strcmp(x,"000110000101")==0){
strcpy(z,"11010011100101111010100");
}
else if(strcmp(x,"000110000110")==0){
strcpy(z,"11010011011111001111101");
}
else if(strcmp(x,"000110000111")==0){
strcpy(z,"11010011011000100100111");
}
else if(strcmp(x,"000110001000")==0){
strcpy(z,"11010011010001111010010");
}
else if(strcmp(x,"000110001001")==0){
strcpy(z,"11010011001011001111111");
}
else if(strcmp(x,"000110001010")==0){
strcpy(z,"11010011000100100101110");
}
else if(strcmp(x,"000110001011")==0){
strcpy(z,"11010010111101111011110");
}
else if(strcmp(x,"000110001100")==0){
strcpy(z,"11010010110111010010000");
}
else if(strcmp(x,"000110001101")==0){
strcpy(z,"11010010110000101000011");
}
else if(strcmp(x,"000110001110")==0){
strcpy(z,"11010010101001111110111");
}
else if(strcmp(x,"000110001111")==0){
strcpy(z,"11010010100011010101101");
}
else if(strcmp(x,"000110010000")==0){
strcpy(z,"11010010011100101100101");
}
else if(strcmp(x,"000110010001")==0){
strcpy(z,"11010010010110000011110");
}
else if(strcmp(x,"000110010010")==0){
strcpy(z,"11010010001111011011001");
}
else if(strcmp(x,"000110010011")==0){
strcpy(z,"11010010001000110010101");
}
else if(strcmp(x,"000110010100")==0){
strcpy(z,"11010010000010001010011");
}
else if(strcmp(x,"000110010101")==0){
strcpy(z,"11010001111011100010010");
}
else if(strcmp(x,"000110010110")==0){
strcpy(z,"11010001110100111010011");
}
else if(strcmp(x,"000110010111")==0){
strcpy(z,"11010001101110010010101");
}
else if(strcmp(x,"000110011000")==0){
strcpy(z,"11010001100111101011001");
}
else if(strcmp(x,"000110011001")==0){
strcpy(z,"11010001100001000011110");
}
else if(strcmp(x,"000110011010")==0){
strcpy(z,"11010001011010011100101");
}
else if(strcmp(x,"000110011011")==0){
strcpy(z,"11010001010011110101101");
}
else if(strcmp(x,"000110011100")==0){
strcpy(z,"11010001001101001110111");
}
else if(strcmp(x,"000110011101")==0){
strcpy(z,"11010001000110101000010");
}
else if(strcmp(x,"000110011110")==0){
strcpy(z,"11010001000000000001111");
}
else if(strcmp(x,"000110011111")==0){
strcpy(z,"11010000111001011011101");
}
else if(strcmp(x,"000110100000")==0){
strcpy(z,"11010000110010110101100");
}
else if(strcmp(x,"000110100001")==0){
strcpy(z,"11010000101100001111110");
}
else if(strcmp(x,"000110100010")==0){
strcpy(z,"11010000100101101010000");
}
else if(strcmp(x,"000110100011")==0){
strcpy(z,"11010000011111000100101");
}
else if(strcmp(x,"000110100100")==0){
strcpy(z,"11010000011000011111010");
}
else if(strcmp(x,"000110100101")==0){
strcpy(z,"11010000010001111010010");
}
else if(strcmp(x,"000110100110")==0){
strcpy(z,"11010000001011010101010");
}
else if(strcmp(x,"000110100111")==0){
strcpy(z,"11010000000100110000100");
}
else if(strcmp(x,"000110101000")==0){
strcpy(z,"11001111111110001100000");
}
else if(strcmp(x,"000110101001")==0){
strcpy(z,"11001111110111100111101");
}
else if(strcmp(x,"000110101010")==0){
strcpy(z,"11001111110001000011100");
}
else if(strcmp(x,"000110101011")==0){
strcpy(z,"11001111101010011111100");
}
else if(strcmp(x,"000110101100")==0){
strcpy(z,"11001111100011111011110");
}
else if(strcmp(x,"000110101101")==0){
strcpy(z,"11001111011101011000001");
}
else if(strcmp(x,"000110101110")==0){
strcpy(z,"11001111010110110100101");
}
else if(strcmp(x,"000110101111")==0){
strcpy(z,"11001111010000010001011");
}
else if(strcmp(x,"000110110000")==0){
strcpy(z,"11001111001001101110011");
}
else if(strcmp(x,"000110110001")==0){
strcpy(z,"11001111000011001011100");
}
else if(strcmp(x,"000110110010")==0){
strcpy(z,"11001110111100101000110");
}
else if(strcmp(x,"000110110011")==0){
strcpy(z,"11001110110110000110010");
}
else if(strcmp(x,"000110110100")==0){
strcpy(z,"11001110101111100100000");
}
else if(strcmp(x,"000110110101")==0){
strcpy(z,"11001110101001000001111");
}
else if(strcmp(x,"000110110110")==0){
strcpy(z,"11001110100010011111111");
}
else if(strcmp(x,"000110110111")==0){
strcpy(z,"11001110011011111110001");
}
else if(strcmp(x,"000110111000")==0){
strcpy(z,"11001110010101011100100");
}
else if(strcmp(x,"000110111001")==0){
strcpy(z,"11001110001110111011001");
}
else if(strcmp(x,"000110111010")==0){
strcpy(z,"11001110001000011010000");
}
else if(strcmp(x,"000110111011")==0){
strcpy(z,"11001110000001111000111");
}
else if(strcmp(x,"000110111100")==0){
strcpy(z,"11001101111011011000001");
}
else if(strcmp(x,"000110111101")==0){
strcpy(z,"11001101110100110111011");
}
else if(strcmp(x,"000110111110")==0){
strcpy(z,"11001101101110010111000");
}
else if(strcmp(x,"000110111111")==0){
strcpy(z,"11001101100111110110101");
}
else if(strcmp(x,"000111000000")==0){
strcpy(z,"11001101100001010110100");
}
else if(strcmp(x,"000111000001")==0){
strcpy(z,"11001101011010110110101");
}
else if(strcmp(x,"000111000010")==0){
strcpy(z,"11001101010100010110111");
}
else if(strcmp(x,"000111000011")==0){
strcpy(z,"11001101001101110111010");
}
else if(strcmp(x,"000111000100")==0){
strcpy(z,"11001101000111010111111");
}
else if(strcmp(x,"000111000101")==0){
strcpy(z,"11001101000000111000110");
}
else if(strcmp(x,"000111000110")==0){
strcpy(z,"11001100111010011001110");
}
else if(strcmp(x,"000111000111")==0){
strcpy(z,"11001100110011111010111");
}
else if(strcmp(x,"000111001000")==0){
strcpy(z,"11001100101101011100010");
}
else if(strcmp(x,"000111001001")==0){
strcpy(z,"11001100100110111101110");
}
else if(strcmp(x,"000111001010")==0){
strcpy(z,"11001100100000011111100");
}
else if(strcmp(x,"000111001011")==0){
strcpy(z,"11001100011010000001011");
}
else if(strcmp(x,"000111001100")==0){
strcpy(z,"11001100010011100011100");
}
else if(strcmp(x,"000111001101")==0){
strcpy(z,"11001100001101000101110");
}
else if(strcmp(x,"000111001110")==0){
strcpy(z,"11001100000110101000001");
}
else if(strcmp(x,"000111001111")==0){
strcpy(z,"11001100000000001010110");
}
else if(strcmp(x,"000111010000")==0){
strcpy(z,"11001011111001101101101");
}
else if(strcmp(x,"000111010001")==0){
strcpy(z,"11001011110011010000101");
}
else if(strcmp(x,"000111010010")==0){
strcpy(z,"11001011101100110011110");
}
else if(strcmp(x,"000111010011")==0){
strcpy(z,"11001011100110010111001");
}
else if(strcmp(x,"000111010100")==0){
strcpy(z,"11001011011111111010101");
}
else if(strcmp(x,"000111010101")==0){
strcpy(z,"11001011011001011110011");
}
else if(strcmp(x,"000111010110")==0){
strcpy(z,"11001011010011000010010");
}
else if(strcmp(x,"000111010111")==0){
strcpy(z,"11001011001100100110010");
}
else if(strcmp(x,"000111011000")==0){
strcpy(z,"11001011000110001010100");
}
else if(strcmp(x,"000111011001")==0){
strcpy(z,"11001010111111101111000");
}
else if(strcmp(x,"000111011010")==0){
strcpy(z,"11001010111001010011101");
}
else if(strcmp(x,"000111011011")==0){
strcpy(z,"11001010110010111000011");
}
else if(strcmp(x,"000111011100")==0){
strcpy(z,"11001010101100011101011");
}
else if(strcmp(x,"000111011101")==0){
strcpy(z,"11001010100110000010100");
}
else if(strcmp(x,"000111011110")==0){
strcpy(z,"11001010011111100111111");
}
else if(strcmp(x,"000111011111")==0){
strcpy(z,"11001010011001001101011");
}
else if(strcmp(x,"000111100000")==0){
strcpy(z,"11001010010010110011000");
}
else if(strcmp(x,"000111100001")==0){
strcpy(z,"11001010001100011000111");
}
else if(strcmp(x,"000111100010")==0){
strcpy(z,"11001010000101111111000");
}
else if(strcmp(x,"000111100011")==0){
strcpy(z,"11001001111111100101001");
}
else if(strcmp(x,"000111100100")==0){
strcpy(z,"11001001111001001011101");
}
else if(strcmp(x,"000111100101")==0){
strcpy(z,"11001001110010110010001");
}
else if(strcmp(x,"000111100110")==0){
strcpy(z,"11001001101100011000111");
}
else if(strcmp(x,"000111100111")==0){
strcpy(z,"11001001100101111111111");
}
else if(strcmp(x,"000111101000")==0){
strcpy(z,"11001001011111100111000");
}
else if(strcmp(x,"000111101001")==0){
strcpy(z,"11001001011001001110010");
}
else if(strcmp(x,"000111101010")==0){
strcpy(z,"11001001010010110101110");
}
else if(strcmp(x,"000111101011")==0){
strcpy(z,"11001001001100011101011");
}
else if(strcmp(x,"000111101100")==0){
strcpy(z,"11001001000110000101010");
}
else if(strcmp(x,"000111101101")==0){
strcpy(z,"11001000111111101101010");
}
else if(strcmp(x,"000111101110")==0){
strcpy(z,"11001000111001010101100");
}
else if(strcmp(x,"000111101111")==0){
strcpy(z,"11001000110010111101110");
}
else if(strcmp(x,"000111110000")==0){
strcpy(z,"11001000101100100110011");
}
else if(strcmp(x,"000111110001")==0){
strcpy(z,"11001000100110001111001");
}
else if(strcmp(x,"000111110010")==0){
strcpy(z,"11001000011111111000000");
}
else if(strcmp(x,"000111110011")==0){
strcpy(z,"11001000011001100001000");
}
else if(strcmp(x,"000111110100")==0){
strcpy(z,"11001000010011001010010");
}
else if(strcmp(x,"000111110101")==0){
strcpy(z,"11001000001100110011110");
}
else if(strcmp(x,"000111110110")==0){
strcpy(z,"11001000000110011101011");
}
else if(strcmp(x,"000111110111")==0){
strcpy(z,"11001000000000000111001");
}
else if(strcmp(x,"000111111000")==0){
strcpy(z,"11000111111001110001001");
}
else if(strcmp(x,"000111111001")==0){
strcpy(z,"11000111110011011011010");
}
else if(strcmp(x,"000111111010")==0){
strcpy(z,"11000111101101000101100");
}
else if(strcmp(x,"000111111011")==0){
strcpy(z,"11000111100110110000000");
}
else if(strcmp(x,"000111111100")==0){
strcpy(z,"11000111100000011010110");
}
else if(strcmp(x,"000111111101")==0){
strcpy(z,"11000111011010000101100");
}
else if(strcmp(x,"000111111110")==0){
strcpy(z,"11000111010011110000100");
}
else if(strcmp(x,"000111111111")==0){
strcpy(z,"11000111001101011011110");
}
else if(strcmp(x,"001000000000")==0){
strcpy(z,"11000111000111000111001");
}
else if(strcmp(x,"001000000001")==0){
strcpy(z,"11000111000000110010101");
}
else if(strcmp(x,"001000000010")==0){
strcpy(z,"11000110111010011110011");
}
else if(strcmp(x,"001000000011")==0){
strcpy(z,"11000110110100001010010");
}
else if(strcmp(x,"001000000100")==0){
strcpy(z,"11000110101101110110011");
}
else if(strcmp(x,"001000000101")==0){
strcpy(z,"11000110100111100010101");
}
else if(strcmp(x,"001000000110")==0){
strcpy(z,"11000110100001001111000");
}
else if(strcmp(x,"001000000111")==0){
strcpy(z,"11000110011010111011101");
}
else if(strcmp(x,"001000001000")==0){
strcpy(z,"11000110010100101000011");
}
else if(strcmp(x,"001000001001")==0){
strcpy(z,"11000110001110010101011");
}
else if(strcmp(x,"001000001010")==0){
strcpy(z,"11000110001000000010100");
}
else if(strcmp(x,"001000001011")==0){
strcpy(z,"11000110000001101111110");
}
else if(strcmp(x,"001000001100")==0){
strcpy(z,"11000101111011011101010");
}
else if(strcmp(x,"001000001101")==0){
strcpy(z,"11000101110101001010111");
}
else if(strcmp(x,"001000001110")==0){
strcpy(z,"11000101101110111000101");
}
else if(strcmp(x,"001000001111")==0){
strcpy(z,"11000101101000100110101");
}
else if(strcmp(x,"001000010000")==0){
strcpy(z,"11000101100010010100111");
}
else if(strcmp(x,"001000010001")==0){
strcpy(z,"11000101011100000011001");
}
else if(strcmp(x,"001000010010")==0){
strcpy(z,"11000101010101110001101");
}
else if(strcmp(x,"001000010011")==0){
strcpy(z,"11000101001111100000011");
}
else if(strcmp(x,"001000010100")==0){
strcpy(z,"11000101001001001111010");
}
else if(strcmp(x,"001000010101")==0){
strcpy(z,"11000101000010111110010");
}
else if(strcmp(x,"001000010110")==0){
strcpy(z,"11000100111100101101100");
}
else if(strcmp(x,"001000010111")==0){
strcpy(z,"11000100110110011100111");
}
else if(strcmp(x,"001000011000")==0){
strcpy(z,"11000100110000001100011");
}
else if(strcmp(x,"001000011001")==0){
strcpy(z,"11000100101001111100001");
}
else if(strcmp(x,"001000011010")==0){
strcpy(z,"11000100100011101100000");
}
else if(strcmp(x,"001000011011")==0){
strcpy(z,"11000100011101011100001");
}
else if(strcmp(x,"001000011100")==0){
strcpy(z,"11000100010111001100011");
}
else if(strcmp(x,"001000011101")==0){
strcpy(z,"11000100010000111100110");
}
else if(strcmp(x,"001000011110")==0){
strcpy(z,"11000100001010101101011");
}
else if(strcmp(x,"001000011111")==0){
strcpy(z,"11000100000100011110001");
}
else if(strcmp(x,"001000100000")==0){
strcpy(z,"11000011111110001111000");
}
else if(strcmp(x,"001000100001")==0){
strcpy(z,"11000011111000000000001");
}
else if(strcmp(x,"001000100010")==0){
strcpy(z,"11000011110001110001011");
}
else if(strcmp(x,"001000100011")==0){
strcpy(z,"11000011101011100010111");
}
else if(strcmp(x,"001000100100")==0){
strcpy(z,"11000011100101010100100");
}
else if(strcmp(x,"001000100101")==0){
strcpy(z,"11000011011111000110010");
}
else if(strcmp(x,"001000100110")==0){
strcpy(z,"11000011011000111000010");
}
else if(strcmp(x,"001000100111")==0){
strcpy(z,"11000011010010101010011");
}
else if(strcmp(x,"001000101000")==0){
strcpy(z,"11000011001100011100101");
}
else if(strcmp(x,"001000101001")==0){
strcpy(z,"11000011000110001111001");
}
else if(strcmp(x,"001000101010")==0){
strcpy(z,"11000011000000000001110");
}
else if(strcmp(x,"001000101011")==0){
strcpy(z,"11000010111001110100101");
}
else if(strcmp(x,"001000101100")==0){
strcpy(z,"11000010110011100111101");
}
else if(strcmp(x,"001000101101")==0){
strcpy(z,"11000010101101011010110");
}
else if(strcmp(x,"001000101110")==0){
strcpy(z,"11000010100111001110000");
}
else if(strcmp(x,"001000101111")==0){
strcpy(z,"11000010100001000001100");
}
else if(strcmp(x,"001000110000")==0){
strcpy(z,"11000010011010110101010");
}
else if(strcmp(x,"001000110001")==0){
strcpy(z,"11000010010100101001001");
}
else if(strcmp(x,"001000110010")==0){
strcpy(z,"11000010001110011101001");
}
else if(strcmp(x,"001000110011")==0){
strcpy(z,"11000010001000010001010");
}
else if(strcmp(x,"001000110100")==0){
strcpy(z,"11000010000010000101101");
}
else if(strcmp(x,"001000110101")==0){
strcpy(z,"11000001111011111010001");
}
else if(strcmp(x,"001000110110")==0){
strcpy(z,"11000001110101101110111");
}
else if(strcmp(x,"001000110111")==0){
strcpy(z,"11000001101111100011101");
}
else if(strcmp(x,"001000111000")==0){
strcpy(z,"11000001101001011000110");
}
else if(strcmp(x,"001000111001")==0){
strcpy(z,"11000001100011001101111");
}
else if(strcmp(x,"001000111010")==0){
strcpy(z,"11000001011101000011010");
}
else if(strcmp(x,"001000111011")==0){
strcpy(z,"11000001010110111000110");
}
else if(strcmp(x,"001000111100")==0){
strcpy(z,"11000001010000101110100");
}
else if(strcmp(x,"001000111101")==0){
strcpy(z,"11000001001010100100011");
}
else if(strcmp(x,"001000111110")==0){
strcpy(z,"11000001000100011010011");
}
else if(strcmp(x,"001000111111")==0){
strcpy(z,"11000000111110010000101");
}
else if(strcmp(x,"001001000000")==0){
strcpy(z,"11000000111000000111000");
}
else if(strcmp(x,"001001000001")==0){
strcpy(z,"11000000110001111101100");
}
else if(strcmp(x,"001001000010")==0){
strcpy(z,"11000000101011110100010");
}
else if(strcmp(x,"001001000011")==0){
strcpy(z,"11000000100101101011001");
}
else if(strcmp(x,"001001000100")==0){
strcpy(z,"11000000011111100010010");
}
else if(strcmp(x,"001001000101")==0){
strcpy(z,"11000000011001011001100");
}
else if(strcmp(x,"001001000110")==0){
strcpy(z,"11000000010011010000111");
}
else if(strcmp(x,"001001000111")==0){
strcpy(z,"11000000001101001000011");
}
else if(strcmp(x,"001001001000")==0){
strcpy(z,"11000000000111000000001");
}
else if(strcmp(x,"001001001001")==0){
strcpy(z,"11000000000000111000000");
}
else if(strcmp(x,"001001001010")==0){
strcpy(z,"10111111111010110000000");
}
else if(strcmp(x,"001001001011")==0){
strcpy(z,"10111111110100101000010");
}
else if(strcmp(x,"001001001100")==0){
strcpy(z,"10111111101110100000101");
}
else if(strcmp(x,"001001001101")==0){
strcpy(z,"10111111101000011001010");
}
else if(strcmp(x,"001001001110")==0){
strcpy(z,"10111111100010010010000");
}
else if(strcmp(x,"001001001111")==0){
strcpy(z,"10111111011100001010111");
}
else if(strcmp(x,"001001010000")==0){
strcpy(z,"10111111010110000011111");
}
else if(strcmp(x,"001001010001")==0){
strcpy(z,"10111111001111111101001");
}
else if(strcmp(x,"001001010010")==0){
strcpy(z,"10111111001001110110100");
}
else if(strcmp(x,"001001010011")==0){
strcpy(z,"10111111000011110000001");
}
else if(strcmp(x,"001001010100")==0){
strcpy(z,"10111110111101101001111");
}
else if(strcmp(x,"001001010101")==0){
strcpy(z,"10111110110111100011110");
}
else if(strcmp(x,"001001010110")==0){
strcpy(z,"10111110110001011101110");
}
else if(strcmp(x,"001001010111")==0){
strcpy(z,"10111110101011011000000");
}
else if(strcmp(x,"001001011000")==0){
strcpy(z,"10111110100101010010011");
}
else if(strcmp(x,"001001011001")==0){
strcpy(z,"10111110011111001101000");
}
else if(strcmp(x,"001001011010")==0){
strcpy(z,"10111110011001000111110");
}
else if(strcmp(x,"001001011011")==0){
strcpy(z,"10111110010011000010101");
}
else if(strcmp(x,"001001011100")==0){
strcpy(z,"10111110001100111101101");
}
else if(strcmp(x,"001001011101")==0){
strcpy(z,"10111110000110111000111");
}
else if(strcmp(x,"001001011110")==0){
strcpy(z,"10111110000000110100010");
}
else if(strcmp(x,"001001011111")==0){
strcpy(z,"10111101111010101111111");
}
else if(strcmp(x,"001001100000")==0){
strcpy(z,"10111101110100101011100");
}
else if(strcmp(x,"001001100001")==0){
strcpy(z,"10111101101110100111011");
}
else if(strcmp(x,"001001100010")==0){
strcpy(z,"10111101101000100011100");
}
else if(strcmp(x,"001001100011")==0){
strcpy(z,"10111101100010011111101");
}
else if(strcmp(x,"001001100100")==0){
strcpy(z,"10111101011100011100000");
}
else if(strcmp(x,"001001100101")==0){
strcpy(z,"10111101010110011000101");
}
else if(strcmp(x,"001001100110")==0){
strcpy(z,"10111101010000010101010");
}
else if(strcmp(x,"001001100111")==0){
strcpy(z,"10111101001010010010001");
}
else if(strcmp(x,"001001101000")==0){
strcpy(z,"10111101000100001111010");
}
else if(strcmp(x,"001001101001")==0){
strcpy(z,"10111100111110001100011");
}
else if(strcmp(x,"001001101010")==0){
strcpy(z,"10111100111000001001110");
}
else if(strcmp(x,"001001101011")==0){
strcpy(z,"10111100110010000111010");
}
else if(strcmp(x,"001001101100")==0){
strcpy(z,"10111100101100000101000");
}
else if(strcmp(x,"001001101101")==0){
strcpy(z,"10111100100110000010111");
}
else if(strcmp(x,"001001101110")==0){
strcpy(z,"10111100100000000000111");
}
else if(strcmp(x,"001001101111")==0){
strcpy(z,"10111100011001111111000");
}
else if(strcmp(x,"001001110000")==0){
strcpy(z,"10111100010011111101011");
}
else if(strcmp(x,"001001110001")==0){
strcpy(z,"10111100001101111011111");
}
else if(strcmp(x,"001001110010")==0){
strcpy(z,"10111100000111111010101");
}
else if(strcmp(x,"001001110011")==0){
strcpy(z,"10111100000001111001011");
}
else if(strcmp(x,"001001110100")==0){
strcpy(z,"10111011111011111000011");
}
else if(strcmp(x,"001001110101")==0){
strcpy(z,"10111011110101110111101");
}
else if(strcmp(x,"001001110110")==0){
strcpy(z,"10111011101111110110111");
}
else if(strcmp(x,"001001110111")==0){
strcpy(z,"10111011101001110110011");
}
else if(strcmp(x,"001001111000")==0){
strcpy(z,"10111011100011110110000");
}
else if(strcmp(x,"001001111001")==0){
strcpy(z,"10111011011101110101111");
}
else if(strcmp(x,"001001111010")==0){
strcpy(z,"10111011010111110101111");
}
else if(strcmp(x,"001001111011")==0){
strcpy(z,"10111011010001110110000");
}
else if(strcmp(x,"001001111100")==0){
strcpy(z,"10111011001011110110010");
}
else if(strcmp(x,"001001111101")==0){
strcpy(z,"10111011000101110110110");
}
else if(strcmp(x,"001001111110")==0){
strcpy(z,"10111010111111110111011");
}
else if(strcmp(x,"001001111111")==0){
strcpy(z,"10111010111001111000001");
}
else if(strcmp(x,"001010000000")==0){
strcpy(z,"10111010110011111001001");
}
else if(strcmp(x,"001010000001")==0){
strcpy(z,"10111010101101111010010");
}
else if(strcmp(x,"001010000010")==0){
strcpy(z,"10111010100111111011100");
}
else if(strcmp(x,"001010000011")==0){
strcpy(z,"10111010100001111100111");
}
else if(strcmp(x,"001010000100")==0){
strcpy(z,"10111010011011111110100");
}
else if(strcmp(x,"001010000101")==0){
strcpy(z,"10111010010110000000010");
}
else if(strcmp(x,"001010000110")==0){
strcpy(z,"10111010010000000010001");
}
else if(strcmp(x,"001010000111")==0){
strcpy(z,"10111010001010000100010");
}
else if(strcmp(x,"001010001000")==0){
strcpy(z,"10111010000100000110100");
}
else if(strcmp(x,"001010001001")==0){
strcpy(z,"10111001111110001000111");
}
else if(strcmp(x,"001010001010")==0){
strcpy(z,"10111001111000001011011");
}
else if(strcmp(x,"001010001011")==0){
strcpy(z,"10111001110010001110001");
}
else if(strcmp(x,"001010001100")==0){
strcpy(z,"10111001101100010001000");
}
else if(strcmp(x,"001010001101")==0){
strcpy(z,"10111001100110010100001");
}
else if(strcmp(x,"001010001110")==0){
strcpy(z,"10111001100000010111010");
}
else if(strcmp(x,"001010001111")==0){
strcpy(z,"10111001011010011010101");
}
else if(strcmp(x,"001010010000")==0){
strcpy(z,"10111001010100011110001");
}
else if(strcmp(x,"001010010001")==0){
strcpy(z,"10111001001110100001111");
}
else if(strcmp(x,"001010010010")==0){
strcpy(z,"10111001001000100101110");
}
else if(strcmp(x,"001010010011")==0){
strcpy(z,"10111001000010101001110");
}
else if(strcmp(x,"001010010100")==0){
strcpy(z,"10111000111100101101111");
}
else if(strcmp(x,"001010010101")==0){
strcpy(z,"10111000110110110010001");
}
else if(strcmp(x,"001010010110")==0){
strcpy(z,"10111000110000110110101");
}
else if(strcmp(x,"001010010111")==0){
strcpy(z,"10111000101010111011010");
}
else if(strcmp(x,"001010011000")==0){
strcpy(z,"10111000100101000000001");
}
else if(strcmp(x,"001010011001")==0){
strcpy(z,"10111000011111000101001");
}
else if(strcmp(x,"001010011010")==0){
strcpy(z,"10111000011001001010001");
}
else if(strcmp(x,"001010011011")==0){
strcpy(z,"10111000010011001111100");
}
else if(strcmp(x,"001010011100")==0){
strcpy(z,"10111000001101010100111");
}
else if(strcmp(x,"001010011101")==0){
strcpy(z,"10111000000111011010100");
}
else if(strcmp(x,"001010011110")==0){
strcpy(z,"10111000000001100000010");
}
else if(strcmp(x,"001010011111")==0){
strcpy(z,"10110111111011100110001");
}
else if(strcmp(x,"001010100000")==0){
strcpy(z,"10110111110101101100010");
}
else if(strcmp(x,"001010100001")==0){
strcpy(z,"10110111101111110010100");
}
else if(strcmp(x,"001010100010")==0){
strcpy(z,"10110111101001111000111");
}
else if(strcmp(x,"001010100011")==0){
strcpy(z,"10110111100011111111011");
}
else if(strcmp(x,"001010100100")==0){
strcpy(z,"10110111011110000110001");
}
else if(strcmp(x,"001010100101")==0){
strcpy(z,"10110111011000001101000");
}
else if(strcmp(x,"001010100110")==0){
strcpy(z,"10110111010010010100000");
}
else if(strcmp(x,"001010100111")==0){
strcpy(z,"10110111001100011011001");
}
else if(strcmp(x,"001010101000")==0){
strcpy(z,"10110111000110100010100");
}
else if(strcmp(x,"001010101001")==0){
strcpy(z,"10110111000000101010000");
}
else if(strcmp(x,"001010101010")==0){
strcpy(z,"10110110111010110001101");
}
else if(strcmp(x,"001010101011")==0){
strcpy(z,"10110110110100111001100");
}
else if(strcmp(x,"001010101100")==0){
strcpy(z,"10110110101111000001100");
}
else if(strcmp(x,"001010101101")==0){
strcpy(z,"10110110101001001001101");
}
else if(strcmp(x,"001010101110")==0){
strcpy(z,"10110110100011010001111");
}
else if(strcmp(x,"001010101111")==0){
strcpy(z,"10110110011101011010010");
}
else if(strcmp(x,"001010110000")==0){
strcpy(z,"10110110010111100010111");
}
else if(strcmp(x,"001010110001")==0){
strcpy(z,"10110110010001101011101");
}
else if(strcmp(x,"001010110010")==0){
strcpy(z,"10110110001011110100100");
}
else if(strcmp(x,"001010110011")==0){
strcpy(z,"10110110000101111101101");
}
else if(strcmp(x,"001010110100")==0){
strcpy(z,"10110110000000000110111");
}
else if(strcmp(x,"001010110101")==0){
strcpy(z,"10110101111010010000010");
}
else if(strcmp(x,"001010110110")==0){
strcpy(z,"10110101110100011001110");
}
else if(strcmp(x,"001010110111")==0){
strcpy(z,"10110101101110100011100");
}
else if(strcmp(x,"001010111000")==0){
strcpy(z,"10110101101000101101010");
}
else if(strcmp(x,"001010111001")==0){
strcpy(z,"10110101100010110111010");
}
else if(strcmp(x,"001010111010")==0){
strcpy(z,"10110101011101000001100");
}
else if(strcmp(x,"001010111011")==0){
strcpy(z,"10110101010111001011110");
}
else if(strcmp(x,"001010111100")==0){
strcpy(z,"10110101010001010110010");
}
else if(strcmp(x,"001010111101")==0){
strcpy(z,"10110101001011100000111");
}
else if(strcmp(x,"001010111110")==0){
strcpy(z,"10110101000101101011101");
}
else if(strcmp(x,"001010111111")==0){
strcpy(z,"10110100111111110110101");
}
else if(strcmp(x,"001011000000")==0){
strcpy(z,"10110100111010000001110");
}
else if(strcmp(x,"001011000001")==0){
strcpy(z,"10110100110100001101000");
}
else if(strcmp(x,"001011000010")==0){
strcpy(z,"10110100101110011000011");
}
else if(strcmp(x,"001011000011")==0){
strcpy(z,"10110100101000100011111");
}
else if(strcmp(x,"001011000100")==0){
strcpy(z,"10110100100010101111101");
}
else if(strcmp(x,"001011000101")==0){
strcpy(z,"10110100011100111011100");
}
else if(strcmp(x,"001011000110")==0){
strcpy(z,"10110100010111000111100");
}
else if(strcmp(x,"001011000111")==0){
strcpy(z,"10110100010001010011110");
}
else if(strcmp(x,"001011001000")==0){
strcpy(z,"10110100001011100000000");
}
else if(strcmp(x,"001011001001")==0){
strcpy(z,"10110100000101101100100");
}
else if(strcmp(x,"001011001010")==0){
strcpy(z,"10110011111111111001010");
}
else if(strcmp(x,"001011001011")==0){
strcpy(z,"10110011111010000110000");
}
else if(strcmp(x,"001011001100")==0){
strcpy(z,"10110011110100010011000");
}
else if(strcmp(x,"001011001101")==0){
strcpy(z,"10110011101110100000000");
}
else if(strcmp(x,"001011001110")==0){
strcpy(z,"10110011101000101101010");
}
else if(strcmp(x,"001011001111")==0){
strcpy(z,"10110011100010111010110");
}
else if(strcmp(x,"001011010000")==0){
strcpy(z,"10110011011101001000010");
}
else if(strcmp(x,"001011010001")==0){
strcpy(z,"10110011010111010110000");
}
else if(strcmp(x,"001011010010")==0){
strcpy(z,"10110011010001100011111");
}
else if(strcmp(x,"001011010011")==0){
strcpy(z,"10110011001011110001111");
}
else if(strcmp(x,"001011010100")==0){
strcpy(z,"10110011000110000000001");
}
else if(strcmp(x,"001011010101")==0){
strcpy(z,"10110011000000001110100");
}
else if(strcmp(x,"001011010110")==0){
strcpy(z,"10110010111010011100111");
}
else if(strcmp(x,"001011010111")==0){
strcpy(z,"10110010110100101011101");
}
else if(strcmp(x,"001011011000")==0){
strcpy(z,"10110010101110111010011");
}
else if(strcmp(x,"001011011001")==0){
strcpy(z,"10110010101001001001011");
}
else if(strcmp(x,"001011011010")==0){
strcpy(z,"10110010100011011000011");
}
else if(strcmp(x,"001011011011")==0){
strcpy(z,"10110010011101100111101");
}
else if(strcmp(x,"001011011100")==0){
strcpy(z,"10110010010111110111001");
}
else if(strcmp(x,"001011011101")==0){
strcpy(z,"10110010010010000110101");
}
else if(strcmp(x,"001011011110")==0){
strcpy(z,"10110010001100010110011");
}
else if(strcmp(x,"001011011111")==0){
strcpy(z,"10110010000110100110010");
}
else if(strcmp(x,"001011100000")==0){
strcpy(z,"10110010000000110110010");
}
else if(strcmp(x,"001011100001")==0){
strcpy(z,"10110001111011000110011");
}
else if(strcmp(x,"001011100010")==0){
strcpy(z,"10110001110101010110110");
}
else if(strcmp(x,"001011100011")==0){
strcpy(z,"10110001101111100111010");
}
else if(strcmp(x,"001011100100")==0){
strcpy(z,"10110001101001110111111");
}
else if(strcmp(x,"001011100101")==0){
strcpy(z,"10110001100100001000101");
}
else if(strcmp(x,"001011100110")==0){
strcpy(z,"10110001011110011001100");
}
else if(strcmp(x,"001011100111")==0){
strcpy(z,"10110001011000101010101");
}
else if(strcmp(x,"001011101000")==0){
strcpy(z,"10110001010010111011111");
}
else if(strcmp(x,"001011101001")==0){
strcpy(z,"10110001001101001101010");
}
else if(strcmp(x,"001011101010")==0){
strcpy(z,"10110001000111011110110");
}
else if(strcmp(x,"001011101011")==0){
strcpy(z,"10110001000001110000100");
}
else if(strcmp(x,"001011101100")==0){
strcpy(z,"10110000111100000010011");
}
else if(strcmp(x,"001011101101")==0){
strcpy(z,"10110000110110010100011");
}
else if(strcmp(x,"001011101110")==0){
strcpy(z,"10110000110000100110100");
}
else if(strcmp(x,"001011101111")==0){
strcpy(z,"10110000101010111000110");
}
else if(strcmp(x,"001011110000")==0){
strcpy(z,"10110000100101001011010");
}
else if(strcmp(x,"001011110001")==0){
strcpy(z,"10110000011111011101110");
}
else if(strcmp(x,"001011110010")==0){
strcpy(z,"10110000011001110000100");
}
else if(strcmp(x,"001011110011")==0){
strcpy(z,"10110000010100000011011");
}
else if(strcmp(x,"001011110100")==0){
strcpy(z,"10110000001110010110100");
}
else if(strcmp(x,"001011110101")==0){
strcpy(z,"10110000001000101001101");
}
else if(strcmp(x,"001011110110")==0){
strcpy(z,"10110000000010111101000");
}
else if(strcmp(x,"001011110111")==0){
strcpy(z,"10101111111101010000100");
}
else if(strcmp(x,"001011111000")==0){
strcpy(z,"10101111110111100100001");
}
else if(strcmp(x,"001011111001")==0){
strcpy(z,"10101111110001111000000");
}
else if(strcmp(x,"001011111010")==0){
strcpy(z,"10101111101100001011111");
}
else if(strcmp(x,"001011111011")==0){
strcpy(z,"10101111100110100000000");
}
else if(strcmp(x,"001011111100")==0){
strcpy(z,"10101111100000110100010");
}
else if(strcmp(x,"001011111101")==0){
strcpy(z,"10101111011011001000101");
}
else if(strcmp(x,"001011111110")==0){
strcpy(z,"10101111010101011101010");
}
else if(strcmp(x,"001011111111")==0){
strcpy(z,"10101111001111110001111");
}
else if(strcmp(x,"001100000000")==0){
strcpy(z,"10101111001010000110110");
}
else if(strcmp(x,"001100000001")==0){
strcpy(z,"10101111000100011011110");
}
else if(strcmp(x,"001100000010")==0){
strcpy(z,"10101110111110110000111");
}
else if(strcmp(x,"001100000011")==0){
strcpy(z,"10101110111001000110001");
}
else if(strcmp(x,"001100000100")==0){
strcpy(z,"10101110110011011011101");
}
else if(strcmp(x,"001100000101")==0){
strcpy(z,"10101110101101110001010");
}
else if(strcmp(x,"001100000110")==0){
strcpy(z,"10101110101000000111000");
}
else if(strcmp(x,"001100000111")==0){
strcpy(z,"10101110100010011100111");
}
else if(strcmp(x,"001100001000")==0){
strcpy(z,"10101110011100110010111");
}
else if(strcmp(x,"001100001001")==0){
strcpy(z,"10101110010111001001000");
}
else if(strcmp(x,"001100001010")==0){
strcpy(z,"10101110010001011111011");
}
else if(strcmp(x,"001100001011")==0){
strcpy(z,"10101110001011110101111");
}
else if(strcmp(x,"001100001100")==0){
strcpy(z,"10101110000110001100100");
}
else if(strcmp(x,"001100001101")==0){
strcpy(z,"10101110000000100011010");
}
else if(strcmp(x,"001100001110")==0){
strcpy(z,"10101101111010111010010");
}
else if(strcmp(x,"001100001111")==0){
strcpy(z,"10101101110101010001010");
}
else if(strcmp(x,"001100010000")==0){
strcpy(z,"10101101101111101000100");
}
else if(strcmp(x,"001100010001")==0){
strcpy(z,"10101101101001111111111");
}
else if(strcmp(x,"001100010010")==0){
strcpy(z,"10101101100100010111011");
}
else if(strcmp(x,"001100010011")==0){
strcpy(z,"10101101011110101111000");
}
else if(strcmp(x,"001100010100")==0){
strcpy(z,"10101101011001000110111");
}
else if(strcmp(x,"001100010101")==0){
strcpy(z,"10101101010011011110111");
}
else if(strcmp(x,"001100010110")==0){
strcpy(z,"10101101001101110110111");
}
else if(strcmp(x,"001100010111")==0){
strcpy(z,"10101101001000001111010");
}
else if(strcmp(x,"001100011000")==0){
strcpy(z,"10101101000010100111101");
}
else if(strcmp(x,"001100011001")==0){
strcpy(z,"10101100111101000000001");
}
else if(strcmp(x,"001100011010")==0){
strcpy(z,"10101100110111011000111");
}
else if(strcmp(x,"001100011011")==0){
strcpy(z,"10101100110001110001101");
}
else if(strcmp(x,"001100011100")==0){
strcpy(z,"10101100101100001010101");
}
else if(strcmp(x,"001100011101")==0){
strcpy(z,"10101100100110100011111");
}
else if(strcmp(x,"001100011110")==0){
strcpy(z,"10101100100000111101001");
}
else if(strcmp(x,"001100011111")==0){
strcpy(z,"10101100011011010110100");
}
else if(strcmp(x,"001100100000")==0){
strcpy(z,"10101100010101110000001");
}
else if(strcmp(x,"001100100001")==0){
strcpy(z,"10101100010000001001111");
}
else if(strcmp(x,"001100100010")==0){
strcpy(z,"10101100001010100011110");
}
else if(strcmp(x,"001100100011")==0){
strcpy(z,"10101100000100111101110");
}
else if(strcmp(x,"001100100100")==0){
strcpy(z,"10101011111111010111111");
}
else if(strcmp(x,"001100100101")==0){
strcpy(z,"10101011111001110010001");
}
else if(strcmp(x,"001100100110")==0){
strcpy(z,"10101011110100001100101");
}
else if(strcmp(x,"001100100111")==0){
strcpy(z,"10101011101110100111010");
}
else if(strcmp(x,"001100101000")==0){
strcpy(z,"10101011101001000010000");
}
else if(strcmp(x,"001100101001")==0){
strcpy(z,"10101011100011011100111");
}
else if(strcmp(x,"001100101010")==0){
strcpy(z,"10101011011101110111111");
}
else if(strcmp(x,"001100101011")==0){
strcpy(z,"10101011011000010011001");
}
else if(strcmp(x,"001100101100")==0){
strcpy(z,"10101011010010101110011");
}
else if(strcmp(x,"001100101101")==0){
strcpy(z,"10101011001101001001111");
}
else if(strcmp(x,"001100101110")==0){
strcpy(z,"10101011000111100101100");
}
else if(strcmp(x,"001100101111")==0){
strcpy(z,"10101011000010000001010");
}
else if(strcmp(x,"001100110000")==0){
strcpy(z,"10101010111100011101001");
}
else if(strcmp(x,"001100110001")==0){
strcpy(z,"10101010110110111001010");
}
else if(strcmp(x,"001100110010")==0){
strcpy(z,"10101010110001010101100");
}
else if(strcmp(x,"001100110011")==0){
strcpy(z,"10101010101011110001110");
}
else if(strcmp(x,"001100110100")==0){
strcpy(z,"10101010100110001110010");
}
else if(strcmp(x,"001100110101")==0){
strcpy(z,"10101010100000101010111");
}
else if(strcmp(x,"001100110110")==0){
strcpy(z,"10101010011011000111101");
}
else if(strcmp(x,"001100110111")==0){
strcpy(z,"10101010010101100100101");
}
else if(strcmp(x,"001100111000")==0){
strcpy(z,"10101010010000000001101");
}
else if(strcmp(x,"001100111001")==0){
strcpy(z,"10101010001010011110111");
}
else if(strcmp(x,"001100111010")==0){
strcpy(z,"10101010000100111100010");
}
else if(strcmp(x,"001100111011")==0){
strcpy(z,"10101001111111011001110");
}
else if(strcmp(x,"001100111100")==0){
strcpy(z,"10101001111001110111011");
}
else if(strcmp(x,"001100111101")==0){
strcpy(z,"10101001110100010101001");
}
else if(strcmp(x,"001100111110")==0){
strcpy(z,"10101001101110110011001");
}
else if(strcmp(x,"001100111111")==0){
strcpy(z,"10101001101001010001001");
}
else if(strcmp(x,"001101000000")==0){
strcpy(z,"10101001100011101111011");
}
else if(strcmp(x,"001101000001")==0){
strcpy(z,"10101001011110001101110");
}
else if(strcmp(x,"001101000010")==0){
strcpy(z,"10101001011000101100010");
}
else if(strcmp(x,"001101000011")==0){
strcpy(z,"10101001010011001010111");
}
else if(strcmp(x,"001101000100")==0){
strcpy(z,"10101001001101101001101");
}
else if(strcmp(x,"001101000101")==0){
strcpy(z,"10101001001000001000101");
}
else if(strcmp(x,"001101000110")==0){
strcpy(z,"10101001000010100111110");
}
else if(strcmp(x,"001101000111")==0){
strcpy(z,"10101000111101000110111");
}
else if(strcmp(x,"001101001000")==0){
strcpy(z,"10101000110111100110010");
}
else if(strcmp(x,"001101001001")==0){
strcpy(z,"10101000110010000101110");
}
else if(strcmp(x,"001101001010")==0){
strcpy(z,"10101000101100100101011");
}
else if(strcmp(x,"001101001011")==0){
strcpy(z,"10101000100111000101010");
}
else if(strcmp(x,"001101001100")==0){
strcpy(z,"10101000100001100101001");
}
else if(strcmp(x,"001101001101")==0){
strcpy(z,"10101000011100000101010");
}
else if(strcmp(x,"001101001110")==0){
strcpy(z,"10101000010110100101100");
}
else if(strcmp(x,"001101001111")==0){
strcpy(z,"10101000010001000101111");
}
else if(strcmp(x,"001101010000")==0){
strcpy(z,"10101000001011100110011");
}
else if(strcmp(x,"001101010001")==0){
strcpy(z,"10101000000110000111000");
}
else if(strcmp(x,"001101010010")==0){
strcpy(z,"10101000000000100111110");
}
else if(strcmp(x,"001101010011")==0){
strcpy(z,"10100111111011001000101");
}
else if(strcmp(x,"001101010100")==0){
strcpy(z,"10100111110101101001110");
}
else if(strcmp(x,"001101010101")==0){
strcpy(z,"10100111110000001011000");
}
else if(strcmp(x,"001101010110")==0){
strcpy(z,"10100111101010101100011");
}
else if(strcmp(x,"001101010111")==0){
strcpy(z,"10100111100101001101111");
}
else if(strcmp(x,"001101011000")==0){
strcpy(z,"10100111011111101111100");
}
else if(strcmp(x,"001101011001")==0){
strcpy(z,"10100111011010010001010");
}
else if(strcmp(x,"001101011010")==0){
strcpy(z,"10100111010100110011001");
}
else if(strcmp(x,"001101011011")==0){
strcpy(z,"10100111001111010101010");
}
else if(strcmp(x,"001101011100")==0){
strcpy(z,"10100111001001110111011");
}
else if(strcmp(x,"001101011101")==0){
strcpy(z,"10100111000100011001110");
}
else if(strcmp(x,"001101011110")==0){
strcpy(z,"10100110111110111100010");
}
else if(strcmp(x,"001101011111")==0){
strcpy(z,"10100110111001011110111");
}
else if(strcmp(x,"001101100000")==0){
strcpy(z,"10100110110100000001101");
}
else if(strcmp(x,"001101100001")==0){
strcpy(z,"10100110101110100100100");
}
else if(strcmp(x,"001101100010")==0){
strcpy(z,"10100110101001000111101");
}
else if(strcmp(x,"001101100011")==0){
strcpy(z,"10100110100011101010110");
}
else if(strcmp(x,"001101100100")==0){
strcpy(z,"10100110011110001110001");
}
else if(strcmp(x,"001101100101")==0){
strcpy(z,"10100110011000110001101");
}
else if(strcmp(x,"001101100110")==0){
strcpy(z,"10100110010011010101010");
}
else if(strcmp(x,"001101100111")==0){
strcpy(z,"10100110001101111001000");
}
else if(strcmp(x,"001101101000")==0){
strcpy(z,"10100110001000011100111");
}
else if(strcmp(x,"001101101001")==0){
strcpy(z,"10100110000011000000111");
}
else if(strcmp(x,"001101101010")==0){
strcpy(z,"10100101111101100101000");
}
else if(strcmp(x,"001101101011")==0){
strcpy(z,"10100101111000001001011");
}
else if(strcmp(x,"001101101100")==0){
strcpy(z,"10100101110010101101111");
}
else if(strcmp(x,"001101101101")==0){
strcpy(z,"10100101101101010010011");
}
else if(strcmp(x,"001101101110")==0){
strcpy(z,"10100101100111110111001");
}
else if(strcmp(x,"001101101111")==0){
strcpy(z,"10100101100010011100000");
}
else if(strcmp(x,"001101110000")==0){
strcpy(z,"10100101011101000001000");
}
else if(strcmp(x,"001101110001")==0){
strcpy(z,"10100101010111100110001");
}
else if(strcmp(x,"001101110010")==0){
strcpy(z,"10100101010010001011100");
}
else if(strcmp(x,"001101110011")==0){
strcpy(z,"10100101001100110000111");
}
else if(strcmp(x,"001101110100")==0){
strcpy(z,"10100101000111010110100");
}
else if(strcmp(x,"001101110101")==0){
strcpy(z,"10100101000001111100001");
}
else if(strcmp(x,"001101110110")==0){
strcpy(z,"10100100111100100010000");
}
else if(strcmp(x,"001101110111")==0){
strcpy(z,"10100100110111001000000");
}
else if(strcmp(x,"001101111000")==0){
strcpy(z,"10100100110001101110001");
}
else if(strcmp(x,"001101111001")==0){
strcpy(z,"10100100101100010100011");
}
else if(strcmp(x,"001101111010")==0){
strcpy(z,"10100100100110111010110");
}
else if(strcmp(x,"001101111011")==0){
strcpy(z,"10100100100001100001011");
}
else if(strcmp(x,"001101111100")==0){
strcpy(z,"10100100011100001000000");
}
else if(strcmp(x,"001101111101")==0){
strcpy(z,"10100100010110101110111");
}
else if(strcmp(x,"001101111110")==0){
strcpy(z,"10100100010001010101110");
}
else if(strcmp(x,"001101111111")==0){
strcpy(z,"10100100001011111100111");
}
else if(strcmp(x,"001110000000")==0){
strcpy(z,"10100100000110100100001");
}
else if(strcmp(x,"001110000001")==0){
strcpy(z,"10100100000001001011100");
}
else if(strcmp(x,"001110000010")==0){
strcpy(z,"10100011111011110011000");
}
else if(strcmp(x,"001110000011")==0){
strcpy(z,"10100011110110011010101");
}
else if(strcmp(x,"001110000100")==0){
strcpy(z,"10100011110001000010011");
}
else if(strcmp(x,"001110000101")==0){
strcpy(z,"10100011101011101010011");
}
else if(strcmp(x,"001110000110")==0){
strcpy(z,"10100011100110010010011");
}
else if(strcmp(x,"001110000111")==0){
strcpy(z,"10100011100000111010101");
}
else if(strcmp(x,"001110001000")==0){
strcpy(z,"10100011011011100010111");
}
else if(strcmp(x,"001110001001")==0){
strcpy(z,"10100011010110001011011");
}
else if(strcmp(x,"001110001010")==0){
strcpy(z,"10100011010000110100000");
}
else if(strcmp(x,"001110001011")==0){
strcpy(z,"10100011001011011100110");
}
else if(strcmp(x,"001110001100")==0){
strcpy(z,"10100011000110000101101");
}
else if(strcmp(x,"001110001101")==0){
strcpy(z,"10100011000000101110101");
}
else if(strcmp(x,"001110001110")==0){
strcpy(z,"10100010111011010111110");
}
else if(strcmp(x,"001110001111")==0){
strcpy(z,"10100010110110000001001");
}
else if(strcmp(x,"001110010000")==0){
strcpy(z,"10100010110000101010100");
}
else if(strcmp(x,"001110010001")==0){
strcpy(z,"10100010101011010100001");
}
else if(strcmp(x,"001110010010")==0){
strcpy(z,"10100010100101111101110");
}
else if(strcmp(x,"001110010011")==0){
strcpy(z,"10100010100000100111101");
}
else if(strcmp(x,"001110010100")==0){
strcpy(z,"10100010011011010001101");
}
else if(strcmp(x,"001110010101")==0){
strcpy(z,"10100010010101111011110");
}
else if(strcmp(x,"001110010110")==0){
strcpy(z,"10100010010000100110000");
}
else if(strcmp(x,"001110010111")==0){
strcpy(z,"10100010001011010000011");
}
else if(strcmp(x,"001110011000")==0){
strcpy(z,"10100010000101111010111");
}
else if(strcmp(x,"001110011001")==0){
strcpy(z,"10100010000000100101100");
}
else if(strcmp(x,"001110011010")==0){
strcpy(z,"10100001111011010000011");
}
else if(strcmp(x,"001110011011")==0){
strcpy(z,"10100001110101111011010");
}
else if(strcmp(x,"001110011100")==0){
strcpy(z,"10100001110000100110011");
}
else if(strcmp(x,"001110011101")==0){
strcpy(z,"10100001101011010001100");
}
else if(strcmp(x,"001110011110")==0){
strcpy(z,"10100001100101111100111");
}
else if(strcmp(x,"001110011111")==0){
strcpy(z,"10100001100000101000011");
}
else if(strcmp(x,"001110100000")==0){
strcpy(z,"10100001011011010100000");
}
else if(strcmp(x,"001110100001")==0){
strcpy(z,"10100001010101111111110");
}
else if(strcmp(x,"001110100010")==0){
strcpy(z,"10100001010000101011101");
}
else if(strcmp(x,"001110100011")==0){
strcpy(z,"10100001001011010111101");
}
else if(strcmp(x,"001110100100")==0){
strcpy(z,"10100001000110000011110");
}
else if(strcmp(x,"001110100101")==0){
strcpy(z,"10100001000000110000000");
}
else if(strcmp(x,"001110100110")==0){
strcpy(z,"10100000111011011100100");
}
else if(strcmp(x,"001110100111")==0){
strcpy(z,"10100000110110001001000");
}
else if(strcmp(x,"001110101000")==0){
strcpy(z,"10100000110000110101110");
}
else if(strcmp(x,"001110101001")==0){
strcpy(z,"10100000101011100010100");
}
else if(strcmp(x,"001110101010")==0){
strcpy(z,"10100000100110001111100");
}
else if(strcmp(x,"001110101011")==0){
strcpy(z,"10100000100000111100101");
}
else if(strcmp(x,"001110101100")==0){
strcpy(z,"10100000011011101001111");
}
else if(strcmp(x,"001110101101")==0){
strcpy(z,"10100000010110010111010");
}
else if(strcmp(x,"001110101110")==0){
strcpy(z,"10100000010001000100110");
}
else if(strcmp(x,"001110101111")==0){
strcpy(z,"10100000001011110010011");
}
else if(strcmp(x,"001110110000")==0){
strcpy(z,"10100000000110100000001");
}
else if(strcmp(x,"001110110001")==0){
strcpy(z,"10100000000001001110000");
}
else if(strcmp(x,"001110110010")==0){
strcpy(z,"10011111111011111100000");
}
else if(strcmp(x,"001110110011")==0){
strcpy(z,"10011111110110101010010");
}
else if(strcmp(x,"001110110100")==0){
strcpy(z,"10011111110001011000100");
}
else if(strcmp(x,"001110110101")==0){
strcpy(z,"10011111101100000111000");
}
else if(strcmp(x,"001110110110")==0){
strcpy(z,"10011111100110110101100");
}
else if(strcmp(x,"001110110111")==0){
strcpy(z,"10011111100001100100010");
}
else if(strcmp(x,"001110111000")==0){
strcpy(z,"10011111011100010011001");
}
else if(strcmp(x,"001110111001")==0){
strcpy(z,"10011111010111000010000");
}
else if(strcmp(x,"001110111010")==0){
strcpy(z,"10011111010001110001001");
}
else if(strcmp(x,"001110111011")==0){
strcpy(z,"10011111001100100000011");
}
else if(strcmp(x,"001110111100")==0){
strcpy(z,"10011111000111001111110");
}
else if(strcmp(x,"001110111101")==0){
strcpy(z,"10011111000001111111010");
}
else if(strcmp(x,"001110111110")==0){
strcpy(z,"10011110111100101110111");
}
else if(strcmp(x,"001110111111")==0){
strcpy(z,"10011110110111011110101");
}
else if(strcmp(x,"001111000000")==0){
strcpy(z,"10011110110010001110101");
}
else if(strcmp(x,"001111000001")==0){
strcpy(z,"10011110101100111110101");
}
else if(strcmp(x,"001111000010")==0){
strcpy(z,"10011110100111101110110");
}
else if(strcmp(x,"001111000011")==0){
strcpy(z,"10011110100010011111001");
}
else if(strcmp(x,"001111000100")==0){
strcpy(z,"10011110011101001111100");
}
else if(strcmp(x,"001111000101")==0){
strcpy(z,"10011110011000000000001");
}
else if(strcmp(x,"001111000110")==0){
strcpy(z,"10011110010010110000110");
}
else if(strcmp(x,"001111000111")==0){
strcpy(z,"10011110001101100001101");
}
else if(strcmp(x,"001111001000")==0){
strcpy(z,"10011110001000010010101");
}
else if(strcmp(x,"001111001001")==0){
strcpy(z,"10011110000011000011110");
}
else if(strcmp(x,"001111001010")==0){
strcpy(z,"10011101111101110100111");
}
else if(strcmp(x,"001111001011")==0){
strcpy(z,"10011101111000100110010");
}
else if(strcmp(x,"001111001100")==0){
strcpy(z,"10011101110011010111110");
}
else if(strcmp(x,"001111001101")==0){
strcpy(z,"10011101101110001001011");
}
else if(strcmp(x,"001111001110")==0){
strcpy(z,"10011101101000111011001");
}
else if(strcmp(x,"001111001111")==0){
strcpy(z,"10011101100011101101001");
}
else if(strcmp(x,"001111010000")==0){
strcpy(z,"10011101011110011111001");
}
else if(strcmp(x,"001111010001")==0){
strcpy(z,"10011101011001010001010");
}
else if(strcmp(x,"001111010010")==0){
strcpy(z,"10011101010100000011100");
}
else if(strcmp(x,"001111010011")==0){
strcpy(z,"10011101001110110110000");
}
else if(strcmp(x,"001111010100")==0){
strcpy(z,"10011101001001101000100");
}
else if(strcmp(x,"001111010101")==0){
strcpy(z,"10011101000100011011001");
}
else if(strcmp(x,"001111010110")==0){
strcpy(z,"10011100111111001110000");
}
else if(strcmp(x,"001111010111")==0){
strcpy(z,"10011100111010000000111");
}
else if(strcmp(x,"001111011000")==0){
strcpy(z,"10011100110100110100000");
}
else if(strcmp(x,"001111011001")==0){
strcpy(z,"10011100101111100111010");
}
else if(strcmp(x,"001111011010")==0){
strcpy(z,"10011100101010011010100");
}
else if(strcmp(x,"001111011011")==0){
strcpy(z,"10011100100101001110000");
}
else if(strcmp(x,"001111011100")==0){
strcpy(z,"10011100100000000001101");
}
else if(strcmp(x,"001111011101")==0){
strcpy(z,"10011100011010110101011");
}
else if(strcmp(x,"001111011110")==0){
strcpy(z,"10011100010101101001010");
}
else if(strcmp(x,"001111011111")==0){
strcpy(z,"10011100010000011101010");
}
else if(strcmp(x,"001111100000")==0){
strcpy(z,"10011100001011010001010");
}
else if(strcmp(x,"001111100001")==0){
strcpy(z,"10011100000110000101100");
}
else if(strcmp(x,"001111100010")==0){
strcpy(z,"10011100000000111010000");
}
else if(strcmp(x,"001111100011")==0){
strcpy(z,"10011011111011101110100");
}
else if(strcmp(x,"001111100100")==0){
strcpy(z,"10011011110110100011001");
}
else if(strcmp(x,"001111100101")==0){
strcpy(z,"10011011110001010111111");
}
else if(strcmp(x,"001111100110")==0){
strcpy(z,"10011011101100001100110");
}
else if(strcmp(x,"001111100111")==0){
strcpy(z,"10011011100111000001110");
}
else if(strcmp(x,"001111101000")==0){
strcpy(z,"10011011100001110111000");
}
else if(strcmp(x,"001111101001")==0){
strcpy(z,"10011011011100101100010");
}
else if(strcmp(x,"001111101010")==0){
strcpy(z,"10011011010111100001101");
}
else if(strcmp(x,"001111101011")==0){
strcpy(z,"10011011010010010111010");
}
else if(strcmp(x,"001111101100")==0){
strcpy(z,"10011011001101001100111");
}
else if(strcmp(x,"001111101101")==0){
strcpy(z,"10011011001000000010110");
}
else if(strcmp(x,"001111101110")==0){
strcpy(z,"10011011000010111000101");
}
else if(strcmp(x,"001111101111")==0){
strcpy(z,"10011010111101101110110");
}
else if(strcmp(x,"001111110000")==0){
strcpy(z,"10011010111000100100111");
}
else if(strcmp(x,"001111110001")==0){
strcpy(z,"10011010110011011011010");
}
else if(strcmp(x,"001111110010")==0){
strcpy(z,"10011010101110010001110");
}
else if(strcmp(x,"001111110011")==0){
strcpy(z,"10011010101001001000010");
}
else if(strcmp(x,"001111110100")==0){
strcpy(z,"10011010100011111111000");
}
else if(strcmp(x,"001111110101")==0){
strcpy(z,"10011010011110110101111");
}
else if(strcmp(x,"001111110110")==0){
strcpy(z,"10011010011001101100111");
}
else if(strcmp(x,"001111110111")==0){
strcpy(z,"10011010010100100011111");
}
else if(strcmp(x,"001111111000")==0){
strcpy(z,"10011010001111011011001");
}
else if(strcmp(x,"001111111001")==0){
strcpy(z,"10011010001010010010100");
}
else if(strcmp(x,"001111111010")==0){
strcpy(z,"10011010000101001010000");
}
else if(strcmp(x,"001111111011")==0){
strcpy(z,"10011010000000000001101");
}
else if(strcmp(x,"001111111100")==0){
strcpy(z,"10011001111010111001011");
}
else if(strcmp(x,"001111111101")==0){
strcpy(z,"10011001110101110001010");
}
else if(strcmp(x,"001111111110")==0){
strcpy(z,"10011001110000101001010");
}
else if(strcmp(x,"001111111111")==0){
strcpy(z,"10011001101011100001011");
}
else if(strcmp(x,"010000000000")==0){
strcpy(z,"10011001100110011001101");
}
else if(strcmp(x,"010000000001")==0){
strcpy(z,"10011001100001010010000");
}
else if(strcmp(x,"010000000010")==0){
strcpy(z,"10011001011100001010100");
}
else if(strcmp(x,"010000000011")==0){
strcpy(z,"10011001010111000011001");
}
else if(strcmp(x,"010000000100")==0){
strcpy(z,"10011001010001111011111");
}
else if(strcmp(x,"010000000101")==0){
strcpy(z,"10011001001100110100110");
}
else if(strcmp(x,"010000000110")==0){
strcpy(z,"10011001000111101101111");
}
else if(strcmp(x,"010000000111")==0){
strcpy(z,"10011001000010100111000");
}
else if(strcmp(x,"010000001000")==0){
strcpy(z,"10011000111101100000010");
}
else if(strcmp(x,"010000001001")==0){
strcpy(z,"10011000111000011001101");
}
else if(strcmp(x,"010000001010")==0){
strcpy(z,"10011000110011010011010");
}
else if(strcmp(x,"010000001011")==0){
strcpy(z,"10011000101110001100111");
}
else if(strcmp(x,"010000001100")==0){
strcpy(z,"10011000101001000110101");
}
else if(strcmp(x,"010000001101")==0){
strcpy(z,"10011000100100000000100");
}
else if(strcmp(x,"010000001110")==0){
strcpy(z,"10011000011110111010101");
}
else if(strcmp(x,"010000001111")==0){
strcpy(z,"10011000011001110100110");
}
else if(strcmp(x,"010000010000")==0){
strcpy(z,"10011000010100101111000");
}
else if(strcmp(x,"010000010001")==0){
strcpy(z,"10011000001111101001100");
}
else if(strcmp(x,"010000010010")==0){
strcpy(z,"10011000001010100100000");
}
else if(strcmp(x,"010000010011")==0){
strcpy(z,"10011000000101011110110");
}
else if(strcmp(x,"010000010100")==0){
strcpy(z,"10011000000000011001100");
}
else if(strcmp(x,"010000010101")==0){
strcpy(z,"10010111111011010100011");
}
else if(strcmp(x,"010000010110")==0){
strcpy(z,"10010111110110001111100");
}
else if(strcmp(x,"010000010111")==0){
strcpy(z,"10010111110001001010101");
}
else if(strcmp(x,"010000011000")==0){
strcpy(z,"10010111101100000110000");
}
else if(strcmp(x,"010000011001")==0){
strcpy(z,"10010111100111000001011");
}
else if(strcmp(x,"010000011010")==0){
strcpy(z,"10010111100001111101000");
}
else if(strcmp(x,"010000011011")==0){
strcpy(z,"10010111011100111000101");
}
else if(strcmp(x,"010000011100")==0){
strcpy(z,"10010111010111110100100");
}
else if(strcmp(x,"010000011101")==0){
strcpy(z,"10010111010010110000011");
}
else if(strcmp(x,"010000011110")==0){
strcpy(z,"10010111001101101100100");
}
else if(strcmp(x,"010000011111")==0){
strcpy(z,"10010111001000101000101");
}
else if(strcmp(x,"010000100000")==0){
strcpy(z,"10010111000011100101000");
}
else if(strcmp(x,"010000100001")==0){
strcpy(z,"10010110111110100001011");
}
else if(strcmp(x,"010000100010")==0){
strcpy(z,"10010110111001011110000");
}
else if(strcmp(x,"010000100011")==0){
strcpy(z,"10010110110100011010101");
}
else if(strcmp(x,"010000100100")==0){
strcpy(z,"10010110101111010111100");
}
else if(strcmp(x,"010000100101")==0){
strcpy(z,"10010110101010010100011");
}
else if(strcmp(x,"010000100110")==0){
strcpy(z,"10010110100101010001100");
}
else if(strcmp(x,"010000100111")==0){
strcpy(z,"10010110100000001110110");
}
else if(strcmp(x,"010000101000")==0){
strcpy(z,"10010110011011001100000");
}
else if(strcmp(x,"010000101001")==0){
strcpy(z,"10010110010110001001100");
}
else if(strcmp(x,"010000101010")==0){
strcpy(z,"10010110010001000111000");
}
else if(strcmp(x,"010000101011")==0){
strcpy(z,"10010110001100000100110");
}
else if(strcmp(x,"010000101100")==0){
strcpy(z,"10010110000111000010100");
}
else if(strcmp(x,"010000101101")==0){
strcpy(z,"10010110000010000000100");
}
else if(strcmp(x,"010000101110")==0){
strcpy(z,"10010101111100111110100");
}
else if(strcmp(x,"010000101111")==0){
strcpy(z,"10010101110111111100110");
}
else if(strcmp(x,"010000110000")==0){
strcpy(z,"10010101110010111011000");
}
else if(strcmp(x,"010000110001")==0){
strcpy(z,"10010101101101111001100");
}
else if(strcmp(x,"010000110010")==0){
strcpy(z,"10010101101000111000000");
}
else if(strcmp(x,"010000110011")==0){
strcpy(z,"10010101100011110110110");
}
else if(strcmp(x,"010000110100")==0){
strcpy(z,"10010101011110110101100");
}
else if(strcmp(x,"010000110101")==0){
strcpy(z,"10010101011001110100100");
}
else if(strcmp(x,"010000110110")==0){
strcpy(z,"10010101010100110011100");
}
else if(strcmp(x,"010000110111")==0){
strcpy(z,"10010101001111110010110");
}
else if(strcmp(x,"010000111000")==0){
strcpy(z,"10010101001010110010000");
}
else if(strcmp(x,"010000111001")==0){
strcpy(z,"10010101000101110001100");
}
else if(strcmp(x,"010000111010")==0){
strcpy(z,"10010101000000110001000");
}
else if(strcmp(x,"010000111011")==0){
strcpy(z,"10010100111011110000110");
}
else if(strcmp(x,"010000111100")==0){
strcpy(z,"10010100110110110000100");
}
else if(strcmp(x,"010000111101")==0){
strcpy(z,"10010100110001110000100");
}
else if(strcmp(x,"010000111110")==0){
strcpy(z,"10010100101100110000100");
}
else if(strcmp(x,"010000111111")==0){
strcpy(z,"10010100100111110000110");
}
else if(strcmp(x,"010001000000")==0){
strcpy(z,"10010100100010110001000");
}
else if(strcmp(x,"010001000001")==0){
strcpy(z,"10010100011101110001011");
}
else if(strcmp(x,"010001000010")==0){
strcpy(z,"10010100011000110010000");
}
else if(strcmp(x,"010001000011")==0){
strcpy(z,"10010100010011110010101");
}
else if(strcmp(x,"010001000100")==0){
strcpy(z,"10010100001110110011011");
}
else if(strcmp(x,"010001000101")==0){
strcpy(z,"10010100001001110100011");
}
else if(strcmp(x,"010001000110")==0){
strcpy(z,"10010100000100110101011");
}
else if(strcmp(x,"010001000111")==0){
strcpy(z,"10010011111111110110100");
}
else if(strcmp(x,"010001001000")==0){
strcpy(z,"10010011111010110111111");
}
else if(strcmp(x,"010001001001")==0){
strcpy(z,"10010011110101111001010");
}
else if(strcmp(x,"010001001010")==0){
strcpy(z,"10010011110000111010110");
}
else if(strcmp(x,"010001001011")==0){
strcpy(z,"10010011101011111100011");
}
else if(strcmp(x,"010001001100")==0){
strcpy(z,"10010011100110111110001");
}
else if(strcmp(x,"010001001101")==0){
strcpy(z,"10010011100010000000001");
}
else if(strcmp(x,"010001001110")==0){
strcpy(z,"10010011011101000010001");
}
else if(strcmp(x,"010001001111")==0){
strcpy(z,"10010011011000000100010");
}
else if(strcmp(x,"010001010000")==0){
strcpy(z,"10010011010011000110100");
}
else if(strcmp(x,"010001010001")==0){
strcpy(z,"10010011001110001000111");
}
else if(strcmp(x,"010001010010")==0){
strcpy(z,"10010011001001001011011");
}
else if(strcmp(x,"010001010011")==0){
strcpy(z,"10010011000100001110000");
}
else if(strcmp(x,"010001010100")==0){
strcpy(z,"10010010111111010000110");
}
else if(strcmp(x,"010001010101")==0){
strcpy(z,"10010010111010010011101");
}
else if(strcmp(x,"010001010110")==0){
strcpy(z,"10010010110101010110101");
}
else if(strcmp(x,"010001010111")==0){
strcpy(z,"10010010110000011001110");
}
else if(strcmp(x,"010001011000")==0){
strcpy(z,"10010010101011011101000");
}
else if(strcmp(x,"010001011001")==0){
strcpy(z,"10010010100110100000011");
}
else if(strcmp(x,"010001011010")==0){
strcpy(z,"10010010100001100011111");
}
else if(strcmp(x,"010001011011")==0){
strcpy(z,"10010010011100100111100");
}
else if(strcmp(x,"010001011100")==0){
strcpy(z,"10010010010111101011001");
}
else if(strcmp(x,"010001011101")==0){
strcpy(z,"10010010010010101111000");
}
else if(strcmp(x,"010001011110")==0){
strcpy(z,"10010010001101110011000");
}
else if(strcmp(x,"010001011111")==0){
strcpy(z,"10010010001000110111001");
}
else if(strcmp(x,"010001100000")==0){
strcpy(z,"10010010000011111011010");
}
else if(strcmp(x,"010001100001")==0){
strcpy(z,"10010001111110111111101");
}
else if(strcmp(x,"010001100010")==0){
strcpy(z,"10010001111010000100001");
}
else if(strcmp(x,"010001100011")==0){
strcpy(z,"10010001110101001000101");
}
else if(strcmp(x,"010001100100")==0){
strcpy(z,"10010001110000001101011");
}
else if(strcmp(x,"010001100101")==0){
strcpy(z,"10010001101011010010001");
}
else if(strcmp(x,"010001100110")==0){
strcpy(z,"10010001100110010111001");
}
else if(strcmp(x,"010001100111")==0){
strcpy(z,"10010001100001011100001");
}
else if(strcmp(x,"010001101000")==0){
strcpy(z,"10010001011100100001011");
}
else if(strcmp(x,"010001101001")==0){
strcpy(z,"10010001010111100110101");
}
else if(strcmp(x,"010001101010")==0){
strcpy(z,"10010001010010101100000");
}
else if(strcmp(x,"010001101011")==0){
strcpy(z,"10010001001101110001101");
}
else if(strcmp(x,"010001101100")==0){
strcpy(z,"10010001001000110111010");
}
else if(strcmp(x,"010001101101")==0){
strcpy(z,"10010001000011111101000");
}
else if(strcmp(x,"010001101110")==0){
strcpy(z,"10010000111111000010111");
}
else if(strcmp(x,"010001101111")==0){
strcpy(z,"10010000111010001000111");
}
else if(strcmp(x,"010001110000")==0){
strcpy(z,"10010000110101001111001");
}
else if(strcmp(x,"010001110001")==0){
strcpy(z,"10010000110000010101011");
}
else if(strcmp(x,"010001110010")==0){
strcpy(z,"10010000101011011011110");
}
else if(strcmp(x,"010001110011")==0){
strcpy(z,"10010000100110100010010");
}
else if(strcmp(x,"010001110100")==0){
strcpy(z,"10010000100001101000111");
}
else if(strcmp(x,"010001110101")==0){
strcpy(z,"10010000011100101111101");
}
else if(strcmp(x,"010001110110")==0){
strcpy(z,"10010000010111110110011");
}
else if(strcmp(x,"010001110111")==0){
strcpy(z,"10010000010010111101011");
}
else if(strcmp(x,"010001111000")==0){
strcpy(z,"10010000001110000100100");
}
else if(strcmp(x,"010001111001")==0){
strcpy(z,"10010000001001001011110");
}
else if(strcmp(x,"010001111010")==0){
strcpy(z,"10010000000100010011000");
}
else if(strcmp(x,"010001111011")==0){
strcpy(z,"10001111111111011010100");
}
else if(strcmp(x,"010001111100")==0){
strcpy(z,"10001111111010100010001");
}
else if(strcmp(x,"010001111101")==0){
strcpy(z,"10001111110101101001110");
}
else if(strcmp(x,"010001111110")==0){
strcpy(z,"10001111110000110001101");
}
else if(strcmp(x,"010001111111")==0){
strcpy(z,"10001111101011111001100");
}
else if(strcmp(x,"010010000000")==0){
strcpy(z,"10001111100111000001100");
}
else if(strcmp(x,"010010000001")==0){
strcpy(z,"10001111100010001001110");
}
else if(strcmp(x,"010010000010")==0){
strcpy(z,"10001111011101010010000");
}
else if(strcmp(x,"010010000011")==0){
strcpy(z,"10001111011000011010011");
}
else if(strcmp(x,"010010000100")==0){
strcpy(z,"10001111010011100011000");
}
else if(strcmp(x,"010010000101")==0){
strcpy(z,"10001111001110101011101");
}
else if(strcmp(x,"010010000110")==0){
strcpy(z,"10001111001001110100011");
}
else if(strcmp(x,"010010000111")==0){
strcpy(z,"10001111000100111101010");
}
else if(strcmp(x,"010010001000")==0){
strcpy(z,"10001111000000000110010");
}
else if(strcmp(x,"010010001001")==0){
strcpy(z,"10001110111011001111011");
}
else if(strcmp(x,"010010001010")==0){
strcpy(z,"10001110110110011000101");
}
else if(strcmp(x,"010010001011")==0){
strcpy(z,"10001110110001100010000");
}
else if(strcmp(x,"010010001100")==0){
strcpy(z,"10001110101100101011011");
}
else if(strcmp(x,"010010001101")==0){
strcpy(z,"10001110100111110101000");
}
else if(strcmp(x,"010010001110")==0){
strcpy(z,"10001110100010111110110");
}
else if(strcmp(x,"010010001111")==0){
strcpy(z,"10001110011110001000100");
}
else if(strcmp(x,"010010010000")==0){
strcpy(z,"10001110011001010010100");
}
else if(strcmp(x,"010010010001")==0){
strcpy(z,"10001110010100011100100");
}
else if(strcmp(x,"010010010010")==0){
strcpy(z,"10001110001111100110110");
}
else if(strcmp(x,"010010010011")==0){
strcpy(z,"10001110001010110001000");
}
else if(strcmp(x,"010010010100")==0){
strcpy(z,"10001110000101111011011");
}
else if(strcmp(x,"010010010101")==0){
strcpy(z,"10001110000001000110000");
}
else if(strcmp(x,"010010010110")==0){
strcpy(z,"10001101111100010000101");
}
else if(strcmp(x,"010010010111")==0){
strcpy(z,"10001101110111011011011");
}
else if(strcmp(x,"010010011000")==0){
strcpy(z,"10001101110010100110010");
}
else if(strcmp(x,"010010011001")==0){
strcpy(z,"10001101101101110001010");
}
else if(strcmp(x,"010010011010")==0){
strcpy(z,"10001101101000111100011");
}
else if(strcmp(x,"010010011011")==0){
strcpy(z,"10001101100100000111101");
}
else if(strcmp(x,"010010011100")==0){
strcpy(z,"10001101011111010011000");
}
else if(strcmp(x,"010010011101")==0){
strcpy(z,"10001101011010011110100");
}
else if(strcmp(x,"010010011110")==0){
strcpy(z,"10001101010101101010000");
}
else if(strcmp(x,"010010011111")==0){
strcpy(z,"10001101010000110101110");
}
else if(strcmp(x,"010010100000")==0){
strcpy(z,"10001101001100000001100");
}
else if(strcmp(x,"010010100001")==0){
strcpy(z,"10001101000111001101100");
}
else if(strcmp(x,"010010100010")==0){
strcpy(z,"10001101000010011001100");
}
else if(strcmp(x,"010010100011")==0){
strcpy(z,"10001100111101100101110");
}
else if(strcmp(x,"010010100100")==0){
strcpy(z,"10001100111000110010000");
}
else if(strcmp(x,"010010100101")==0){
strcpy(z,"10001100110011111110011");
}
else if(strcmp(x,"010010100110")==0){
strcpy(z,"10001100101111001010111");
}
else if(strcmp(x,"010010100111")==0){
strcpy(z,"10001100101010010111100");
}
else if(strcmp(x,"010010101000")==0){
strcpy(z,"10001100100101100100010");
}
else if(strcmp(x,"010010101001")==0){
strcpy(z,"10001100100000110001001");
}
else if(strcmp(x,"010010101010")==0){
strcpy(z,"10001100011011111110001");
}
else if(strcmp(x,"010010101011")==0){
strcpy(z,"10001100010111001011010");
}
else if(strcmp(x,"010010101100")==0){
strcpy(z,"10001100010010011000100");
}
else if(strcmp(x,"010010101101")==0){
strcpy(z,"10001100001101100101110");
}
else if(strcmp(x,"010010101110")==0){
strcpy(z,"10001100001000110011010");
}
else if(strcmp(x,"010010101111")==0){
strcpy(z,"10001100000100000000111");
}
else if(strcmp(x,"010010110000")==0){
strcpy(z,"10001011111111001110100");
}
else if(strcmp(x,"010010110001")==0){
strcpy(z,"10001011111010011100010");
}
else if(strcmp(x,"010010110010")==0){
strcpy(z,"10001011110101101010010");
}
else if(strcmp(x,"010010110011")==0){
strcpy(z,"10001011110000111000010");
}
else if(strcmp(x,"010010110100")==0){
strcpy(z,"10001011101100000110011");
}
else if(strcmp(x,"010010110101")==0){
strcpy(z,"10001011100111010100101");
}
else if(strcmp(x,"010010110110")==0){
strcpy(z,"10001011100010100011000");
}
else if(strcmp(x,"010010110111")==0){
strcpy(z,"10001011011101110001100");
}
else if(strcmp(x,"010010111000")==0){
strcpy(z,"10001011011001000000001");
}
else if(strcmp(x,"010010111001")==0){
strcpy(z,"10001011010100001110111");
}
else if(strcmp(x,"010010111010")==0){
strcpy(z,"10001011001111011101101");
}
else if(strcmp(x,"010010111011")==0){
strcpy(z,"10001011001010101100101");
}
else if(strcmp(x,"010010111100")==0){
strcpy(z,"10001011000101111011101");
}
else if(strcmp(x,"010010111101")==0){
strcpy(z,"10001011000001001010111");
}
else if(strcmp(x,"010010111110")==0){
strcpy(z,"10001010111100011010001");
}
else if(strcmp(x,"010010111111")==0){
strcpy(z,"10001010110111101001100");
}
else if(strcmp(x,"010011000000")==0){
strcpy(z,"10001010110010111001000");
}
else if(strcmp(x,"010011000001")==0){
strcpy(z,"10001010101110001000110");
}
else if(strcmp(x,"010011000010")==0){
strcpy(z,"10001010101001011000100");
}
else if(strcmp(x,"010011000011")==0){
strcpy(z,"10001010100100101000011");
}
else if(strcmp(x,"010011000100")==0){
strcpy(z,"10001010011111111000010");
}
else if(strcmp(x,"010011000101")==0){
strcpy(z,"10001010011011001000011");
}
else if(strcmp(x,"010011000110")==0){
strcpy(z,"10001010010110011000101");
}
else if(strcmp(x,"010011000111")==0){
strcpy(z,"10001010010001101000111");
}
else if(strcmp(x,"010011001000")==0){
strcpy(z,"10001010001100111001011");
}
else if(strcmp(x,"010011001001")==0){
strcpy(z,"10001010001000001001111");
}
else if(strcmp(x,"010011001010")==0){
strcpy(z,"10001010000011011010101");
}
else if(strcmp(x,"010011001011")==0){
strcpy(z,"10001001111110101011011");
}
else if(strcmp(x,"010011001100")==0){
strcpy(z,"10001001111001111100010");
}
else if(strcmp(x,"010011001101")==0){
strcpy(z,"10001001110101001101010");
}
else if(strcmp(x,"010011001110")==0){
strcpy(z,"10001001110000011110011");
}
else if(strcmp(x,"010011001111")==0){
strcpy(z,"10001001101011101111101");
}
else if(strcmp(x,"010011010000")==0){
strcpy(z,"10001001100111000001000");
}
else if(strcmp(x,"010011010001")==0){
strcpy(z,"10001001100010010010011");
}
else if(strcmp(x,"010011010010")==0){
strcpy(z,"10001001011101100100000");
}
else if(strcmp(x,"010011010011")==0){
strcpy(z,"10001001011000110101101");
}
else if(strcmp(x,"010011010100")==0){
strcpy(z,"10001001010100000111100");
}
else if(strcmp(x,"010011010101")==0){
strcpy(z,"10001001001111011001011");
}
else if(strcmp(x,"010011010110")==0){
strcpy(z,"10001001001010101011011");
}
else if(strcmp(x,"010011010111")==0){
strcpy(z,"10001001000101111101101");
}
else if(strcmp(x,"010011011000")==0){
strcpy(z,"10001001000001001111111");
}
else if(strcmp(x,"010011011001")==0){
strcpy(z,"10001000111100100010010");
}
else if(strcmp(x,"010011011010")==0){
strcpy(z,"10001000110111110100101");
}
else if(strcmp(x,"010011011011")==0){
strcpy(z,"10001000110011000111010");
}
else if(strcmp(x,"010011011100")==0){
strcpy(z,"10001000101110011010000");
}
else if(strcmp(x,"010011011101")==0){
strcpy(z,"10001000101001101100110");
}
else if(strcmp(x,"010011011110")==0){
strcpy(z,"10001000100100111111110");
}
else if(strcmp(x,"010011011111")==0){
strcpy(z,"10001000100000010010110");
}
else if(strcmp(x,"010011100000")==0){
strcpy(z,"10001000011011100110000");
}
else if(strcmp(x,"010011100001")==0){
strcpy(z,"10001000010110111001010");
}
else if(strcmp(x,"010011100010")==0){
strcpy(z,"10001000010010001100101");
}
else if(strcmp(x,"010011100011")==0){
strcpy(z,"10001000001101100000001");
}
else if(strcmp(x,"010011100100")==0){
strcpy(z,"10001000001000110011110");
}
else if(strcmp(x,"010011100101")==0){
strcpy(z,"10001000000100000111011");
}
else if(strcmp(x,"010011100110")==0){
strcpy(z,"10000111111111011011010");
}
else if(strcmp(x,"010011100111")==0){
strcpy(z,"10000111111010101111010");
}
else if(strcmp(x,"010011101000")==0){
strcpy(z,"10000111110110000011010");
}
else if(strcmp(x,"010011101001")==0){
strcpy(z,"10000111110001010111011");
}
else if(strcmp(x,"010011101010")==0){
strcpy(z,"10000111101100101011110");
}
else if(strcmp(x,"010011101011")==0){
strcpy(z,"10000111101000000000001");
}
else if(strcmp(x,"010011101100")==0){
strcpy(z,"10000111100011010100101");
}
else if(strcmp(x,"010011101101")==0){
strcpy(z,"10000111011110101001010");
}
else if(strcmp(x,"010011101110")==0){
strcpy(z,"10000111011001111110000");
}
else if(strcmp(x,"010011101111")==0){
strcpy(z,"10000111010101010010110");
}
else if(strcmp(x,"010011110000")==0){
strcpy(z,"10000111010000100111110");
}
else if(strcmp(x,"010011110001")==0){
strcpy(z,"10000111001011111100110");
}
else if(strcmp(x,"010011110010")==0){
strcpy(z,"10000111000111010010000");
}
else if(strcmp(x,"010011110011")==0){
strcpy(z,"10000111000010100111010");
}
else if(strcmp(x,"010011110100")==0){
strcpy(z,"10000110111101111100101");
}
else if(strcmp(x,"010011110101")==0){
strcpy(z,"10000110111001010010001");
}
else if(strcmp(x,"010011110110")==0){
strcpy(z,"10000110110100100111110");
}
else if(strcmp(x,"010011110111")==0){
strcpy(z,"10000110101111111101100");
}
else if(strcmp(x,"010011111000")==0){
strcpy(z,"10000110101011010011011");
}
else if(strcmp(x,"010011111001")==0){
strcpy(z,"10000110100110101001011");
}
else if(strcmp(x,"010011111010")==0){
strcpy(z,"10000110100001111111011");
}
else if(strcmp(x,"010011111011")==0){
strcpy(z,"10000110011101010101100");
}
else if(strcmp(x,"010011111100")==0){
strcpy(z,"10000110011000101011111");
}
else if(strcmp(x,"010011111101")==0){
strcpy(z,"10000110010100000010010");
}
else if(strcmp(x,"010011111110")==0){
strcpy(z,"10000110001111011000110");
}
else if(strcmp(x,"010011111111")==0){
strcpy(z,"10000110001010101111011");
}
else if(strcmp(x,"010100000000")==0){
strcpy(z,"10000110000110000110001");
}
else if(strcmp(x,"010100000001")==0){
strcpy(z,"10000110000001011100111");
}
else if(strcmp(x,"010100000010")==0){
strcpy(z,"10000101111100110011111");
}
else if(strcmp(x,"010100000011")==0){
strcpy(z,"10000101111000001011000");
}
else if(strcmp(x,"010100000100")==0){
strcpy(z,"10000101110011100010001");
}
else if(strcmp(x,"010100000101")==0){
strcpy(z,"10000101101110111001011");
}
else if(strcmp(x,"010100000110")==0){
strcpy(z,"10000101101010010000110");
}
else if(strcmp(x,"010100000111")==0){
strcpy(z,"10000101100101101000010");
}
else if(strcmp(x,"010100001000")==0){
strcpy(z,"10000101100000111111111");
}
else if(strcmp(x,"010100001001")==0){
strcpy(z,"10000101011100010111101");
}
else if(strcmp(x,"010100001010")==0){
strcpy(z,"10000101010111101111100");
}
else if(strcmp(x,"010100001011")==0){
strcpy(z,"10000101010011000111011");
}
else if(strcmp(x,"010100001100")==0){
strcpy(z,"10000101001110011111100");
}
else if(strcmp(x,"010100001101")==0){
strcpy(z,"10000101001001110111101");
}
else if(strcmp(x,"010100001110")==0){
strcpy(z,"10000101000101001111111");
}
else if(strcmp(x,"010100001111")==0){
strcpy(z,"10000101000000101000010");
}
else if(strcmp(x,"010100010000")==0){
strcpy(z,"10000100111100000000110");
}
else if(strcmp(x,"010100010001")==0){
strcpy(z,"10000100110111011001011");
}
else if(strcmp(x,"010100010010")==0){
strcpy(z,"10000100110010110010001");
}
else if(strcmp(x,"010100010011")==0){
strcpy(z,"10000100101110001010111");
}
else if(strcmp(x,"010100010100")==0){
strcpy(z,"10000100101001100011111");
}
else if(strcmp(x,"010100010101")==0){
strcpy(z,"10000100100100111100111");
}
else if(strcmp(x,"010100010110")==0){
strcpy(z,"10000100100000010110000");
}
else if(strcmp(x,"010100010111")==0){
strcpy(z,"10000100011011101111010");
}
else if(strcmp(x,"010100011000")==0){
strcpy(z,"10000100010111001000101");
}
else if(strcmp(x,"010100011001")==0){
strcpy(z,"10000100010010100010001");
}
else if(strcmp(x,"010100011010")==0){
strcpy(z,"10000100001101111011110");
}
else if(strcmp(x,"010100011011")==0){
strcpy(z,"10000100001001010101011");
}
else if(strcmp(x,"010100011100")==0){
strcpy(z,"10000100000100101111001");
}
else if(strcmp(x,"010100011101")==0){
strcpy(z,"10000100000000001001001");
}
else if(strcmp(x,"010100011110")==0){
strcpy(z,"10000011111011100011001");
}
else if(strcmp(x,"010100011111")==0){
strcpy(z,"10000011110110111101010");
}
else if(strcmp(x,"010100100000")==0){
strcpy(z,"10000011110010010111100");
}
else if(strcmp(x,"010100100001")==0){
strcpy(z,"10000011101101110001111");
}
else if(strcmp(x,"010100100010")==0){
strcpy(z,"10000011101001001100010");
}
else if(strcmp(x,"010100100011")==0){
strcpy(z,"10000011100100100110111");
}
else if(strcmp(x,"010100100100")==0){
strcpy(z,"10000011100000000001100");
}
else if(strcmp(x,"010100100101")==0){
strcpy(z,"10000011011011011100010");
}
else if(strcmp(x,"010100100110")==0){
strcpy(z,"10000011010110110111001");
}
else if(strcmp(x,"010100100111")==0){
strcpy(z,"10000011010010010010001");
}
else if(strcmp(x,"010100101000")==0){
strcpy(z,"10000011001101101101010");
}
else if(strcmp(x,"010100101001")==0){
strcpy(z,"10000011001001001000100");
}
else if(strcmp(x,"010100101010")==0){
strcpy(z,"10000011000100100011111");
}
else if(strcmp(x,"010100101011")==0){
strcpy(z,"10000010111111111111010");
}
else if(strcmp(x,"010100101100")==0){
strcpy(z,"10000010111011011010110");
}
else if(strcmp(x,"010100101101")==0){
strcpy(z,"10000010110110110110011");
}
else if(strcmp(x,"010100101110")==0){
strcpy(z,"10000010110010010010001");
}
else if(strcmp(x,"010100101111")==0){
strcpy(z,"10000010101101101110000");
}
else if(strcmp(x,"010100110000")==0){
strcpy(z,"10000010101001001010000");
}
else if(strcmp(x,"010100110001")==0){
strcpy(z,"10000010100100100110001");
}
else if(strcmp(x,"010100110010")==0){
strcpy(z,"10000010100000000010010");
}
else if(strcmp(x,"010100110011")==0){
strcpy(z,"10000010011011011110100");
}
else if(strcmp(x,"010100110100")==0){
strcpy(z,"10000010010110111011000");
}
else if(strcmp(x,"010100110101")==0){
strcpy(z,"10000010010010010111100");
}
else if(strcmp(x,"010100110110")==0){
strcpy(z,"10000010001101110100001");
}
else if(strcmp(x,"010100110111")==0){
strcpy(z,"10000010001001010000110");
}
else if(strcmp(x,"010100111000")==0){
strcpy(z,"10000010000100101101101");
}
else if(strcmp(x,"010100111001")==0){
strcpy(z,"10000010000000001010100");
}
else if(strcmp(x,"010100111010")==0){
strcpy(z,"10000001111011100111101");
}
else if(strcmp(x,"010100111011")==0){
strcpy(z,"10000001110111000100110");
}
else if(strcmp(x,"010100111100")==0){
strcpy(z,"10000001110010100010000");
}
else if(strcmp(x,"010100111101")==0){
strcpy(z,"10000001101101111111011");
}
else if(strcmp(x,"010100111110")==0){
strcpy(z,"10000001101001011100111");
}
else if(strcmp(x,"010100111111")==0){
strcpy(z,"10000001100100111010011");
}
else if(strcmp(x,"010101000000")==0){
strcpy(z,"10000001100000011000001");
}
else if(strcmp(x,"010101000001")==0){
strcpy(z,"10000001011011110101111");
}
else if(strcmp(x,"010101000010")==0){
strcpy(z,"10000001010111010011110");
}
else if(strcmp(x,"010101000011")==0){
strcpy(z,"10000001010010110001110");
}
else if(strcmp(x,"010101000100")==0){
strcpy(z,"10000001001110001111111");
}
else if(strcmp(x,"010101000101")==0){
strcpy(z,"10000001001001101110001");
}
else if(strcmp(x,"010101000110")==0){
strcpy(z,"10000001000101001100011");
}
else if(strcmp(x,"010101000111")==0){
strcpy(z,"10000001000000101010111");
}
else if(strcmp(x,"010101001000")==0){
strcpy(z,"10000000111100001001011");
}
else if(strcmp(x,"010101001001")==0){
strcpy(z,"10000000110111101000000");
}
else if(strcmp(x,"010101001010")==0){
strcpy(z,"10000000110011000110110");
}
else if(strcmp(x,"010101001011")==0){
strcpy(z,"10000000101110100101101");
}
else if(strcmp(x,"010101001100")==0){
strcpy(z,"10000000101010000100101");
}
else if(strcmp(x,"010101001101")==0){
strcpy(z,"10000000100101100011101");
}
else if(strcmp(x,"010101001110")==0){
strcpy(z,"10000000100001000010111");
}
else if(strcmp(x,"010101001111")==0){
strcpy(z,"10000000011100100010001");
}
else if(strcmp(x,"010101010000")==0){
strcpy(z,"10000000011000000001100");
}
else if(strcmp(x,"010101010001")==0){
strcpy(z,"10000000010011100001000");
}
else if(strcmp(x,"010101010010")==0){
strcpy(z,"10000000001111000000101");
}
else if(strcmp(x,"010101010011")==0){
strcpy(z,"10000000001010100000010");
}
else if(strcmp(x,"010101010100")==0){
strcpy(z,"10000000000110000000001");
}
else if(strcmp(x,"010101010101")==0){
strcpy(z,"10000000000001100000000");
}
else if(strcmp(x,"010101010110")==0){
strcpy(z,"01111111111101000000000");
}
else if(strcmp(x,"010101010111")==0){
strcpy(z,"01111111111000100000001");
}
else if(strcmp(x,"010101011000")==0){
strcpy(z,"01111111110100000000011");
}
else if(strcmp(x,"010101011001")==0){
strcpy(z,"01111111101111100000110");
}
else if(strcmp(x,"010101011010")==0){
strcpy(z,"01111111101011000001001");
}
else if(strcmp(x,"010101011011")==0){
strcpy(z,"01111111100110100001110");
}
else if(strcmp(x,"010101011100")==0){
strcpy(z,"01111111100010000010011");
}
else if(strcmp(x,"010101011101")==0){
strcpy(z,"01111111011101100011001");
}
else if(strcmp(x,"010101011110")==0){
strcpy(z,"01111111011001000100000");
}
else if(strcmp(x,"010101011111")==0){
strcpy(z,"01111111010100100100111");
}
else if(strcmp(x,"010101100000")==0){
strcpy(z,"01111111010000000110000");
}
else if(strcmp(x,"010101100001")==0){
strcpy(z,"01111111001011100111001");
}
else if(strcmp(x,"010101100010")==0){
strcpy(z,"01111111000111001000100");
}
else if(strcmp(x,"010101100011")==0){
strcpy(z,"01111111000010101001111");
}
else if(strcmp(x,"010101100100")==0){
strcpy(z,"01111110111110001011011");
}
else if(strcmp(x,"010101100101")==0){
strcpy(z,"01111110111001101100111");
}
else if(strcmp(x,"010101100110")==0){
strcpy(z,"01111110110101001110101");
}
else if(strcmp(x,"010101100111")==0){
strcpy(z,"01111110110000110000011");
}
else if(strcmp(x,"010101101000")==0){
strcpy(z,"01111110101100010010010");
}
else if(strcmp(x,"010101101001")==0){
strcpy(z,"01111110100111110100011");
}
else if(strcmp(x,"010101101010")==0){
strcpy(z,"01111110100011010110100");
}
else if(strcmp(x,"010101101011")==0){
strcpy(z,"01111110011110111000101");
}
else if(strcmp(x,"010101101100")==0){
strcpy(z,"01111110011010011011000");
}
else if(strcmp(x,"010101101101")==0){
strcpy(z,"01111110010101111101011");
}
else if(strcmp(x,"010101101110")==0){
strcpy(z,"01111110010001100000000");
}
else if(strcmp(x,"010101101111")==0){
strcpy(z,"01111110001101000010101");
}
else if(strcmp(x,"010101110000")==0){
strcpy(z,"01111110001000100101011");
}
else if(strcmp(x,"010101110001")==0){
strcpy(z,"01111110000100001000001");
}
else if(strcmp(x,"010101110010")==0){
strcpy(z,"01111101111111101011001");
}
else if(strcmp(x,"010101110011")==0){
strcpy(z,"01111101111011001110001");
}
else if(strcmp(x,"010101110100")==0){
strcpy(z,"01111101110110110001011");
}
else if(strcmp(x,"010101110101")==0){
strcpy(z,"01111101110010010100101");
}
else if(strcmp(x,"010101110110")==0){
strcpy(z,"01111101101101111000000");
}
else if(strcmp(x,"010101110111")==0){
strcpy(z,"01111101101001011011011");
}
else if(strcmp(x,"010101111000")==0){
strcpy(z,"01111101100100111111000");
}
else if(strcmp(x,"010101111001")==0){
strcpy(z,"01111101100000100010101");
}
else if(strcmp(x,"010101111010")==0){
strcpy(z,"01111101011100000110011");
}
else if(strcmp(x,"010101111011")==0){
strcpy(z,"01111101010111101010010");
}
else if(strcmp(x,"010101111100")==0){
strcpy(z,"01111101010011001110010");
}
else if(strcmp(x,"010101111101")==0){
strcpy(z,"01111101001110110010011");
}
else if(strcmp(x,"010101111110")==0){
strcpy(z,"01111101001010010110101");
}
else if(strcmp(x,"010101111111")==0){
strcpy(z,"01111101000101111010111");
}
else if(strcmp(x,"010110000000")==0){
strcpy(z,"01111101000001011111010");
}
else if(strcmp(x,"010110000001")==0){
strcpy(z,"01111100111101000011110");
}
else if(strcmp(x,"010110000010")==0){
strcpy(z,"01111100111000101000011");
}
else if(strcmp(x,"010110000011")==0){
strcpy(z,"01111100110100001101001");
}
else if(strcmp(x,"010110000100")==0){
strcpy(z,"01111100101111110001111");
}
else if(strcmp(x,"010110000101")==0){
strcpy(z,"01111100101011010110110");
}
else if(strcmp(x,"010110000110")==0){
strcpy(z,"01111100100110111011110");
}
else if(strcmp(x,"010110000111")==0){
strcpy(z,"01111100100010100000111");
}
else if(strcmp(x,"010110001000")==0){
strcpy(z,"01111100011110000110001");
}
else if(strcmp(x,"010110001001")==0){
strcpy(z,"01111100011001101011100");
}
else if(strcmp(x,"010110001010")==0){
strcpy(z,"01111100010101010000111");
}
else if(strcmp(x,"010110001011")==0){
strcpy(z,"01111100010000110110011");
}
else if(strcmp(x,"010110001100")==0){
strcpy(z,"01111100001100011100000");
}
else if(strcmp(x,"010110001101")==0){
strcpy(z,"01111100001000000001110");
}
else if(strcmp(x,"010110001110")==0){
strcpy(z,"01111100000011100111101");
}
else if(strcmp(x,"010110001111")==0){
strcpy(z,"01111011111111001101100");
}
else if(strcmp(x,"010110010000")==0){
strcpy(z,"01111011111010110011101");
}
else if(strcmp(x,"010110010001")==0){
strcpy(z,"01111011110110011001110");
}
else if(strcmp(x,"010110010010")==0){
strcpy(z,"01111011110010000000000");
}
else if(strcmp(x,"010110010011")==0){
strcpy(z,"01111011101101100110010");
}
else if(strcmp(x,"010110010100")==0){
strcpy(z,"01111011101001001100110");
}
else if(strcmp(x,"010110010101")==0){
strcpy(z,"01111011100100110011010");
}
else if(strcmp(x,"010110010110")==0){
strcpy(z,"01111011100000011010000");
}
else if(strcmp(x,"010110010111")==0){
strcpy(z,"01111011011100000000110");
}
else if(strcmp(x,"010110011000")==0){
strcpy(z,"01111011010111100111100");
}
else if(strcmp(x,"010110011001")==0){
strcpy(z,"01111011010011001110100");
}
else if(strcmp(x,"010110011010")==0){
strcpy(z,"01111011001110110101100");
}
else if(strcmp(x,"010110011011")==0){
strcpy(z,"01111011001010011100110");
}
else if(strcmp(x,"010110011100")==0){
strcpy(z,"01111011000110000100000");
}
else if(strcmp(x,"010110011101")==0){
strcpy(z,"01111011000001101011011");
}
else if(strcmp(x,"010110011110")==0){
strcpy(z,"01111010111101010010110");
}
else if(strcmp(x,"010110011111")==0){
strcpy(z,"01111010111000111010011");
}
else if(strcmp(x,"010110100000")==0){
strcpy(z,"01111010110100100010000");
}
else if(strcmp(x,"010110100001")==0){
strcpy(z,"01111010110000001001110");
}
else if(strcmp(x,"010110100010")==0){
strcpy(z,"01111010101011110001101");
}
else if(strcmp(x,"010110100011")==0){
strcpy(z,"01111010100111011001101");
}
else if(strcmp(x,"010110100100")==0){
strcpy(z,"01111010100011000001110");
}
else if(strcmp(x,"010110100101")==0){
strcpy(z,"01111010011110101001111");
}
else if(strcmp(x,"010110100110")==0){
strcpy(z,"01111010011010010010001");
}
else if(strcmp(x,"010110100111")==0){
strcpy(z,"01111010010101111010100");
}
else if(strcmp(x,"010110101000")==0){
strcpy(z,"01111010010001100011000");
}
else if(strcmp(x,"010110101001")==0){
strcpy(z,"01111010001101001011101");
}
else if(strcmp(x,"010110101010")==0){
strcpy(z,"01111010001000110100010");
}
else if(strcmp(x,"010110101011")==0){
strcpy(z,"01111010000100011101000");
}
else if(strcmp(x,"010110101100")==0){
strcpy(z,"01111010000000000101111");
}
else if(strcmp(x,"010110101101")==0){
strcpy(z,"01111001111011101110111");
}
else if(strcmp(x,"010110101110")==0){
strcpy(z,"01111001110111011000000");
}
else if(strcmp(x,"010110101111")==0){
strcpy(z,"01111001110011000001001");
}
else if(strcmp(x,"010110110000")==0){
strcpy(z,"01111001101110101010011");
}
else if(strcmp(x,"010110110001")==0){
strcpy(z,"01111001101010010011110");
}
else if(strcmp(x,"010110110010")==0){
strcpy(z,"01111001100101111101010");
}
else if(strcmp(x,"010110110011")==0){
strcpy(z,"01111001100001100110111");
}
else if(strcmp(x,"010110110100")==0){
strcpy(z,"01111001011101010000100");
}
else if(strcmp(x,"010110110101")==0){
strcpy(z,"01111001011000111010011");
}
else if(strcmp(x,"010110110110")==0){
strcpy(z,"01111001010100100100010");
}
else if(strcmp(x,"010110110111")==0){
strcpy(z,"01111001010000001110001");
}
else if(strcmp(x,"010110111000")==0){
strcpy(z,"01111001001011111000010");
}
else if(strcmp(x,"010110111001")==0){
strcpy(z,"01111001000111100010100");
}
else if(strcmp(x,"010110111010")==0){
strcpy(z,"01111001000011001100110");
}
else if(strcmp(x,"010110111011")==0){
strcpy(z,"01111000111110110111001");
}
else if(strcmp(x,"010110111100")==0){
strcpy(z,"01111000111010100001101");
}
else if(strcmp(x,"010110111101")==0){
strcpy(z,"01111000110110001100001");
}
else if(strcmp(x,"010110111110")==0){
strcpy(z,"01111000110001110110111");
}
else if(strcmp(x,"010110111111")==0){
strcpy(z,"01111000101101100001101");
}
else if(strcmp(x,"010111000000")==0){
strcpy(z,"01111000101001001100100");
}
else if(strcmp(x,"010111000001")==0){
strcpy(z,"01111000100100110111100");
}
else if(strcmp(x,"010111000010")==0){
strcpy(z,"01111000100000100010100");
}
else if(strcmp(x,"010111000011")==0){
strcpy(z,"01111000011100001101110");
}
else if(strcmp(x,"010111000100")==0){
strcpy(z,"01111000010111111001000");
}
else if(strcmp(x,"010111000101")==0){
strcpy(z,"01111000010011100100011");
}
else if(strcmp(x,"010111000110")==0){
strcpy(z,"01111000001111001111111");
}
else if(strcmp(x,"010111000111")==0){
strcpy(z,"01111000001010111011100");
}
else if(strcmp(x,"010111001000")==0){
strcpy(z,"01111000000110100111001");
}
else if(strcmp(x,"010111001001")==0){
strcpy(z,"01111000000010010010111");
}
else if(strcmp(x,"010111001010")==0){
strcpy(z,"01110111111101111110110");
}
else if(strcmp(x,"010111001011")==0){
strcpy(z,"01110111111001101010110");
}
else if(strcmp(x,"010111001100")==0){
strcpy(z,"01110111110101010110110");
}
else if(strcmp(x,"010111001101")==0){
strcpy(z,"01110111110001000011000");
}
else if(strcmp(x,"010111001110")==0){
strcpy(z,"01110111101100101111010");
}
else if(strcmp(x,"010111001111")==0){
strcpy(z,"01110111101000011011101");
}
else if(strcmp(x,"010111010000")==0){
strcpy(z,"01110111100100001000001");
}
else if(strcmp(x,"010111010001")==0){
strcpy(z,"01110111011111110100101");
}
else if(strcmp(x,"010111010010")==0){
strcpy(z,"01110111011011100001010");
}
else if(strcmp(x,"010111010011")==0){
strcpy(z,"01110111010111001110000");
}
else if(strcmp(x,"010111010100")==0){
strcpy(z,"01110111010010111010111");
}
else if(strcmp(x,"010111010101")==0){
strcpy(z,"01110111001110100111111");
}
else if(strcmp(x,"010111010110")==0){
strcpy(z,"01110111001010010100111");
}
else if(strcmp(x,"010111010111")==0){
strcpy(z,"01110111000110000010001");
}
else if(strcmp(x,"010111011000")==0){
strcpy(z,"01110111000001101111011");
}
else if(strcmp(x,"010111011001")==0){
strcpy(z,"01110110111101011100101");
}
else if(strcmp(x,"010111011010")==0){
strcpy(z,"01110110111001001010001");
}
else if(strcmp(x,"010111011011")==0){
strcpy(z,"01110110110100110111101");
}
else if(strcmp(x,"010111011100")==0){
strcpy(z,"01110110110000100101011");
}
else if(strcmp(x,"010111011101")==0){
strcpy(z,"01110110101100010011001");
}
else if(strcmp(x,"010111011110")==0){
strcpy(z,"01110110101000000000111");
}
else if(strcmp(x,"010111011111")==0){
strcpy(z,"01110110100011101110111");
}
else if(strcmp(x,"010111100000")==0){
strcpy(z,"01110110011111011100111");
}
else if(strcmp(x,"010111100001")==0){
strcpy(z,"01110110011011001011000");
}
else if(strcmp(x,"010111100010")==0){
strcpy(z,"01110110010110111001010");
}
else if(strcmp(x,"010111100011")==0){
strcpy(z,"01110110010010100111101");
}
else if(strcmp(x,"010111100100")==0){
strcpy(z,"01110110001110010110000");
}
else if(strcmp(x,"010111100101")==0){
strcpy(z,"01110110001010000100100");
}
else if(strcmp(x,"010111100110")==0){
strcpy(z,"01110110000101110011001");
}
else if(strcmp(x,"010111100111")==0){
strcpy(z,"01110110000001100001111");
}
else if(strcmp(x,"010111101000")==0){
strcpy(z,"01110101111101010000110");
}
else if(strcmp(x,"010111101001")==0){
strcpy(z,"01110101111000111111101");
}
else if(strcmp(x,"010111101010")==0){
strcpy(z,"01110101110100101110101");
}
else if(strcmp(x,"010111101011")==0){
strcpy(z,"01110101110000011101110");
}
else if(strcmp(x,"010111101100")==0){
strcpy(z,"01110101101100001101000");
}
else if(strcmp(x,"010111101101")==0){
strcpy(z,"01110101100111111100010");
}
else if(strcmp(x,"010111101110")==0){
strcpy(z,"01110101100011101011101");
}
else if(strcmp(x,"010111101111")==0){
strcpy(z,"01110101011111011011001");
}
else if(strcmp(x,"010111110000")==0){
strcpy(z,"01110101011011001010110");
}
else if(strcmp(x,"010111110001")==0){
strcpy(z,"01110101010110111010100");
}
else if(strcmp(x,"010111110010")==0){
strcpy(z,"01110101010010101010010");
}
else if(strcmp(x,"010111110011")==0){
strcpy(z,"01110101001110011010001");
}
else if(strcmp(x,"010111110100")==0){
strcpy(z,"01110101001010001010001");
}
else if(strcmp(x,"010111110101")==0){
strcpy(z,"01110101000101111010010");
}
else if(strcmp(x,"010111110110")==0){
strcpy(z,"01110101000001101010011");
}
else if(strcmp(x,"010111110111")==0){
strcpy(z,"01110100111101011010101");
}
else if(strcmp(x,"010111111000")==0){
strcpy(z,"01110100111001001011000");
}
else if(strcmp(x,"010111111001")==0){
strcpy(z,"01110100110100111011100");
}
else if(strcmp(x,"010111111010")==0){
strcpy(z,"01110100110000101100000");
}
else if(strcmp(x,"010111111011")==0){
strcpy(z,"01110100101100011100110");
}
else if(strcmp(x,"010111111100")==0){
strcpy(z,"01110100101000001101100");
}
else if(strcmp(x,"010111111101")==0){
strcpy(z,"01110100100011111110011");
}
else if(strcmp(x,"010111111110")==0){
strcpy(z,"01110100011111101111010");
}
else if(strcmp(x,"010111111111")==0){
strcpy(z,"01110100011011100000011");
}
else if(strcmp(x,"011000000000")==0){
strcpy(z,"01110100010111010001100");
}
else if(strcmp(x,"011000000001")==0){
strcpy(z,"01110100010011000010110");
}
else if(strcmp(x,"011000000010")==0){
strcpy(z,"01110100001110110100000");
}
else if(strcmp(x,"011000000011")==0){
strcpy(z,"01110100001010100101100");
}
else if(strcmp(x,"011000000100")==0){
strcpy(z,"01110100000110010111000");
}
else if(strcmp(x,"011000000101")==0){
strcpy(z,"01110100000010001000101");
}
else if(strcmp(x,"011000000110")==0){
strcpy(z,"01110011111101111010011");
}
else if(strcmp(x,"011000000111")==0){
strcpy(z,"01110011111001101100001");
}
else if(strcmp(x,"011000001000")==0){
strcpy(z,"01110011110101011110000");
}
else if(strcmp(x,"011000001001")==0){
strcpy(z,"01110011110001010000000");
}
else if(strcmp(x,"011000001010")==0){
strcpy(z,"01110011101101000010001");
}
else if(strcmp(x,"011000001011")==0){
strcpy(z,"01110011101000110100011");
}
else if(strcmp(x,"011000001100")==0){
strcpy(z,"01110011100100100110101");
}
else if(strcmp(x,"011000001101")==0){
strcpy(z,"01110011100000011001000");
}
else if(strcmp(x,"011000001110")==0){
strcpy(z,"01110011011100001011100");
}
else if(strcmp(x,"011000001111")==0){
strcpy(z,"01110011010111111110001");
}
else if(strcmp(x,"011000010000")==0){
strcpy(z,"01110011010011110000110");
}
else if(strcmp(x,"011000010001")==0){
strcpy(z,"01110011001111100011100");
}
else if(strcmp(x,"011000010010")==0){
strcpy(z,"01110011001011010110011");
}
else if(strcmp(x,"011000010011")==0){
strcpy(z,"01110011000111001001011");
}
else if(strcmp(x,"011000010100")==0){
strcpy(z,"01110011000010111100011");
}
else if(strcmp(x,"011000010101")==0){
strcpy(z,"01110010111110101111101");
}
else if(strcmp(x,"011000010110")==0){
strcpy(z,"01110010111010100010111");
}
else if(strcmp(x,"011000010111")==0){
strcpy(z,"01110010110110010110001");
}
else if(strcmp(x,"011000011000")==0){
strcpy(z,"01110010110010001001101");
}
else if(strcmp(x,"011000011001")==0){
strcpy(z,"01110010101101111101001");
}
else if(strcmp(x,"011000011010")==0){
strcpy(z,"01110010101001110000110");
}
else if(strcmp(x,"011000011011")==0){
strcpy(z,"01110010100101100100100");
}
else if(strcmp(x,"011000011100")==0){
strcpy(z,"01110010100001011000010");
}
else if(strcmp(x,"011000011101")==0){
strcpy(z,"01110010011101001100010");
}
else if(strcmp(x,"011000011110")==0){
strcpy(z,"01110010011001000000010");
}
else if(strcmp(x,"011000011111")==0){
strcpy(z,"01110010010100110100010");
}
else if(strcmp(x,"011000100000")==0){
strcpy(z,"01110010010000101000100");
}
else if(strcmp(x,"011000100001")==0){
strcpy(z,"01110010001100011100110");
}
else if(strcmp(x,"011000100010")==0){
strcpy(z,"01110010001000010001001");
}
else if(strcmp(x,"011000100011")==0){
strcpy(z,"01110010000100000101101");
}
else if(strcmp(x,"011000100100")==0){
strcpy(z,"01110001111111111010010");
}
else if(strcmp(x,"011000100101")==0){
strcpy(z,"01110001111011101110111");
}
else if(strcmp(x,"011000100110")==0){
strcpy(z,"01110001110111100011101");
}
else if(strcmp(x,"011000100111")==0){
strcpy(z,"01110001110011011000100");
}
else if(strcmp(x,"011000101000")==0){
strcpy(z,"01110001101111001101100");
}
else if(strcmp(x,"011000101001")==0){
strcpy(z,"01110001101011000010100");
}
else if(strcmp(x,"011000101010")==0){
strcpy(z,"01110001100110110111101");
}
else if(strcmp(x,"011000101011")==0){
strcpy(z,"01110001100010101100111");
}
else if(strcmp(x,"011000101100")==0){
strcpy(z,"01110001011110100010001");
}
else if(strcmp(x,"011000101101")==0){
strcpy(z,"01110001011010010111101");
}
else if(strcmp(x,"011000101110")==0){
strcpy(z,"01110001010110001101001");
}
else if(strcmp(x,"011000101111")==0){
strcpy(z,"01110001010010000010110");
}
else if(strcmp(x,"011000110000")==0){
strcpy(z,"01110001001101111000011");
}
else if(strcmp(x,"011000110001")==0){
strcpy(z,"01110001001001101110010");
}
else if(strcmp(x,"011000110010")==0){
strcpy(z,"01110001000101100100001");
}
else if(strcmp(x,"011000110011")==0){
strcpy(z,"01110001000001011010001");
}
else if(strcmp(x,"011000110100")==0){
strcpy(z,"01110000111101010000001");
}
else if(strcmp(x,"011000110101")==0){
strcpy(z,"01110000111001000110011");
}
else if(strcmp(x,"011000110110")==0){
strcpy(z,"01110000110100111100101");
}
else if(strcmp(x,"011000110111")==0){
strcpy(z,"01110000110000110011000");
}
else if(strcmp(x,"011000111000")==0){
strcpy(z,"01110000101100101001011");
}
else if(strcmp(x,"011000111001")==0){
strcpy(z,"01110000101000100000000");
}
else if(strcmp(x,"011000111010")==0){
strcpy(z,"01110000100100010110101");
}
else if(strcmp(x,"011000111011")==0){
strcpy(z,"01110000100000001101011");
}
else if(strcmp(x,"011000111100")==0){
strcpy(z,"01110000011100000100001");
}
else if(strcmp(x,"011000111101")==0){
strcpy(z,"01110000010111111011000");
}
else if(strcmp(x,"011000111110")==0){
strcpy(z,"01110000010011110010001");
}
else if(strcmp(x,"011000111111")==0){
strcpy(z,"01110000001111101001001");
}
else if(strcmp(x,"011001000000")==0){
strcpy(z,"01110000001011100000011");
}
else if(strcmp(x,"011001000001")==0){
strcpy(z,"01110000000111010111101");
}
else if(strcmp(x,"011001000010")==0){
strcpy(z,"01110000000011001111000");
}
else if(strcmp(x,"011001000011")==0){
strcpy(z,"01101111111111000110100");
}
else if(strcmp(x,"011001000100")==0){
strcpy(z,"01101111111010111110001");
}
else if(strcmp(x,"011001000101")==0){
strcpy(z,"01101111110110110101110");
}
else if(strcmp(x,"011001000110")==0){
strcpy(z,"01101111110010101101100");
}
else if(strcmp(x,"011001000111")==0){
strcpy(z,"01101111101110100101011");
}
else if(strcmp(x,"011001001000")==0){
strcpy(z,"01101111101010011101010");
}
else if(strcmp(x,"011001001001")==0){
strcpy(z,"01101111100110010101010");
}
else if(strcmp(x,"011001001010")==0){
strcpy(z,"01101111100010001101011");
}
else if(strcmp(x,"011001001011")==0){
strcpy(z,"01101111011110000101101");
}
else if(strcmp(x,"011001001100")==0){
strcpy(z,"01101111011001111101111");
}
else if(strcmp(x,"011001001101")==0){
strcpy(z,"01101111010101110110011");
}
else if(strcmp(x,"011001001110")==0){
strcpy(z,"01101111010001101110111");
}
else if(strcmp(x,"011001001111")==0){
strcpy(z,"01101111001101100111011");
}
else if(strcmp(x,"011001010000")==0){
strcpy(z,"01101111001001100000001");
}
else if(strcmp(x,"011001010001")==0){
strcpy(z,"01101111000101011000111");
}
else if(strcmp(x,"011001010010")==0){
strcpy(z,"01101111000001010001110");
}
else if(strcmp(x,"011001010011")==0){
strcpy(z,"01101110111101001010101");
}
else if(strcmp(x,"011001010100")==0){
strcpy(z,"01101110111001000011110");
}
else if(strcmp(x,"011001010101")==0){
strcpy(z,"01101110110100111100111");
}
else if(strcmp(x,"011001010110")==0){
strcpy(z,"01101110110000110110001");
}
else if(strcmp(x,"011001010111")==0){
strcpy(z,"01101110101100101111011");
}
else if(strcmp(x,"011001011000")==0){
strcpy(z,"01101110101000101000111");
}
else if(strcmp(x,"011001011001")==0){
strcpy(z,"01101110100100100010011");
}
else if(strcmp(x,"011001011010")==0){
strcpy(z,"01101110100000011011111");
}
else if(strcmp(x,"011001011011")==0){
strcpy(z,"01101110011100010101101");
}
else if(strcmp(x,"011001011100")==0){
strcpy(z,"01101110011000001111011");
}
else if(strcmp(x,"011001011101")==0){
strcpy(z,"01101110010100001001010");
}
else if(strcmp(x,"011001011110")==0){
strcpy(z,"01101110010000000011010");
}
else if(strcmp(x,"011001011111")==0){
strcpy(z,"01101110001011111101010");
}
else if(strcmp(x,"011001100000")==0){
strcpy(z,"01101110000111110111011");
}
else if(strcmp(x,"011001100001")==0){
strcpy(z,"01101110000011110001101");
}
else if(strcmp(x,"011001100010")==0){
strcpy(z,"01101101111111101100000");
}
else if(strcmp(x,"011001100011")==0){
strcpy(z,"01101101111011100110011");
}
else if(strcmp(x,"011001100100")==0){
strcpy(z,"01101101110111100000111");
}
else if(strcmp(x,"011001100101")==0){
strcpy(z,"01101101110011011011100");
}
else if(strcmp(x,"011001100110")==0){
strcpy(z,"01101101101111010110010");
}
else if(strcmp(x,"011001100111")==0){
strcpy(z,"01101101101011010001000");
}
else if(strcmp(x,"011001101000")==0){
strcpy(z,"01101101100111001011111");
}
else if(strcmp(x,"011001101001")==0){
strcpy(z,"01101101100011000110111");
}
else if(strcmp(x,"011001101010")==0){
strcpy(z,"01101101011111000001111");
}
else if(strcmp(x,"011001101011")==0){
strcpy(z,"01101101011010111101000");
}
else if(strcmp(x,"011001101100")==0){
strcpy(z,"01101101010110111000010");
}
else if(strcmp(x,"011001101101")==0){
strcpy(z,"01101101010010110011101");
}
else if(strcmp(x,"011001101110")==0){
strcpy(z,"01101101001110101111000");
}
else if(strcmp(x,"011001101111")==0){
strcpy(z,"01101101001010101010100");
}
else if(strcmp(x,"011001110000")==0){
strcpy(z,"01101101000110100110001");
}
else if(strcmp(x,"011001110001")==0){
strcpy(z,"01101101000010100001111");
}
else if(strcmp(x,"011001110010")==0){
strcpy(z,"01101100111110011101101");
}
else if(strcmp(x,"011001110011")==0){
strcpy(z,"01101100111010011001100");
}
else if(strcmp(x,"011001110100")==0){
strcpy(z,"01101100110110010101100");
}
else if(strcmp(x,"011001110101")==0){
strcpy(z,"01101100110010010001100");
}
else if(strcmp(x,"011001110110")==0){
strcpy(z,"01101100101110001101101");
}
else if(strcmp(x,"011001110111")==0){
strcpy(z,"01101100101010001001111");
}
else if(strcmp(x,"011001111000")==0){
strcpy(z,"01101100100110000110010");
}
else if(strcmp(x,"011001111001")==0){
strcpy(z,"01101100100010000010101");
}
else if(strcmp(x,"011001111010")==0){
strcpy(z,"01101100011101111111001");
}
else if(strcmp(x,"011001111011")==0){
strcpy(z,"01101100011001111011110");
}
else if(strcmp(x,"011001111100")==0){
strcpy(z,"01101100010101111000100");
}
else if(strcmp(x,"011001111101")==0){
strcpy(z,"01101100010001110101010");
}
else if(strcmp(x,"011001111110")==0){
strcpy(z,"01101100001101110010001");
}
else if(strcmp(x,"011001111111")==0){
strcpy(z,"01101100001001101111000");
}
else if(strcmp(x,"011010000000")==0){
strcpy(z,"01101100000101101100001");
}
else if(strcmp(x,"011010000001")==0){
strcpy(z,"01101100000001101001010");
}
else if(strcmp(x,"011010000010")==0){
strcpy(z,"01101011111101100110100");
}
else if(strcmp(x,"011010000011")==0){
strcpy(z,"01101011111001100011110");
}
else if(strcmp(x,"011010000100")==0){
strcpy(z,"01101011110101100001001");
}
else if(strcmp(x,"011010000101")==0){
strcpy(z,"01101011110001011110101");
}
else if(strcmp(x,"011010000110")==0){
strcpy(z,"01101011101101011100010");
}
else if(strcmp(x,"011010000111")==0){
strcpy(z,"01101011101001011001111");
}
else if(strcmp(x,"011010001000")==0){
strcpy(z,"01101011100101010111110");
}
else if(strcmp(x,"011010001001")==0){
strcpy(z,"01101011100001010101100");
}
else if(strcmp(x,"011010001010")==0){
strcpy(z,"01101011011101010011100");
}
else if(strcmp(x,"011010001011")==0){
strcpy(z,"01101011011001010001100");
}
else if(strcmp(x,"011010001100")==0){
strcpy(z,"01101011010101001111101");
}
else if(strcmp(x,"011010001101")==0){
strcpy(z,"01101011010001001101111");
}
else if(strcmp(x,"011010001110")==0){
strcpy(z,"01101011001101001100001");
}
else if(strcmp(x,"011010001111")==0){
strcpy(z,"01101011001001001010100");
}
else if(strcmp(x,"011010010000")==0){
strcpy(z,"01101011000101001001000");
}
else if(strcmp(x,"011010010001")==0){
strcpy(z,"01101011000001000111101");
}
else if(strcmp(x,"011010010010")==0){
strcpy(z,"01101010111101000110010");
}
else if(strcmp(x,"011010010011")==0){
strcpy(z,"01101010111001000101000");
}
else if(strcmp(x,"011010010100")==0){
strcpy(z,"01101010110101000011111");
}
else if(strcmp(x,"011010010101")==0){
strcpy(z,"01101010110001000010110");
}
else if(strcmp(x,"011010010110")==0){
strcpy(z,"01101010101101000001110");
}
else if(strcmp(x,"011010010111")==0){
strcpy(z,"01101010101001000000111");
}
else if(strcmp(x,"011010011000")==0){
strcpy(z,"01101010100101000000001");
}
else if(strcmp(x,"011010011001")==0){
strcpy(z,"01101010100000111111011");
}
else if(strcmp(x,"011010011010")==0){
strcpy(z,"01101010011100111110110");
}
else if(strcmp(x,"011010011011")==0){
strcpy(z,"01101010011000111110010");
}
else if(strcmp(x,"011010011100")==0){
strcpy(z,"01101010010100111101110");
}
else if(strcmp(x,"011010011101")==0){
strcpy(z,"01101010010000111101011");
}
else if(strcmp(x,"011010011110")==0){
strcpy(z,"01101010001100111101001");
}
else if(strcmp(x,"011010011111")==0){
strcpy(z,"01101010001000111100111");
}
else if(strcmp(x,"011010100000")==0){
strcpy(z,"01101010000100111100111");
}
else if(strcmp(x,"011010100001")==0){
strcpy(z,"01101010000000111100110");
}
else if(strcmp(x,"011010100010")==0){
strcpy(z,"01101001111100111100111");
}
else if(strcmp(x,"011010100011")==0){
strcpy(z,"01101001111000111101000");
}
else if(strcmp(x,"011010100100")==0){
strcpy(z,"01101001110100111101010");
}
else if(strcmp(x,"011010100101")==0){
strcpy(z,"01101001110000111101101");
}
else if(strcmp(x,"011010100110")==0){
strcpy(z,"01101001101100111110001");
}
else if(strcmp(x,"011010100111")==0){
strcpy(z,"01101001101000111110101");
}
else if(strcmp(x,"011010101000")==0){
strcpy(z,"01101001100100111111010");
}
else if(strcmp(x,"011010101001")==0){
strcpy(z,"01101001100000111111111");
}
else if(strcmp(x,"011010101010")==0){
strcpy(z,"01101001011101000000101");
}
else if(strcmp(x,"011010101011")==0){
strcpy(z,"01101001011001000001100");
}
else if(strcmp(x,"011010101100")==0){
strcpy(z,"01101001010101000010100");
}
else if(strcmp(x,"011010101101")==0){
strcpy(z,"01101001010001000011100");
}
else if(strcmp(x,"011010101110")==0){
strcpy(z,"01101001001101000100110");
}
else if(strcmp(x,"011010101111")==0){
strcpy(z,"01101001001001000101111");
}
else if(strcmp(x,"011010110000")==0){
strcpy(z,"01101001000101000111010");
}
else if(strcmp(x,"011010110001")==0){
strcpy(z,"01101001000001001000101");
}
else if(strcmp(x,"011010110010")==0){
strcpy(z,"01101000111101001010001");
}
else if(strcmp(x,"011010110011")==0){
strcpy(z,"01101000111001001011101");
}
else if(strcmp(x,"011010110100")==0){
strcpy(z,"01101000110101001101011");
}
else if(strcmp(x,"011010110101")==0){
strcpy(z,"01101000110001001111001");
}
else if(strcmp(x,"011010110110")==0){
strcpy(z,"01101000101101010000111");
}
else if(strcmp(x,"011010110111")==0){
strcpy(z,"01101000101001010010111");
}
else if(strcmp(x,"011010111000")==0){
strcpy(z,"01101000100101010100111");
}
else if(strcmp(x,"011010111001")==0){
strcpy(z,"01101000100001010111000");
}
else if(strcmp(x,"011010111010")==0){
strcpy(z,"01101000011101011001001");
}
else if(strcmp(x,"011010111011")==0){
strcpy(z,"01101000011001011011011");
}
else if(strcmp(x,"011010111100")==0){
strcpy(z,"01101000010101011101110");
}
else if(strcmp(x,"011010111101")==0){
strcpy(z,"01101000010001100000010");
}
else if(strcmp(x,"011010111110")==0){
strcpy(z,"01101000001101100010110");
}
else if(strcmp(x,"011010111111")==0){
strcpy(z,"01101000001001100101011");
}
else if(strcmp(x,"011011000000")==0){
strcpy(z,"01101000000101101000001");
}
else if(strcmp(x,"011011000001")==0){
strcpy(z,"01101000000001101010111");
}
else if(strcmp(x,"011011000010")==0){
strcpy(z,"01100111111101101101110");
}
else if(strcmp(x,"011011000011")==0){
strcpy(z,"01100111111001110000110");
}
else if(strcmp(x,"011011000100")==0){
strcpy(z,"01100111110101110011110");
}
else if(strcmp(x,"011011000101")==0){
strcpy(z,"01100111110001110110111");
}
else if(strcmp(x,"011011000110")==0){
strcpy(z,"01100111101101111010001");
}
else if(strcmp(x,"011011000111")==0){
strcpy(z,"01100111101001111101100");
}
else if(strcmp(x,"011011001000")==0){
strcpy(z,"01100111100110000000111");
}
else if(strcmp(x,"011011001001")==0){
strcpy(z,"01100111100010000100011");
}
else if(strcmp(x,"011011001010")==0){
strcpy(z,"01100111011110001000000");
}
else if(strcmp(x,"011011001011")==0){
strcpy(z,"01100111011010001011101");
}
else if(strcmp(x,"011011001100")==0){
strcpy(z,"01100111010110001111011");
}
else if(strcmp(x,"011011001101")==0){
strcpy(z,"01100111010010010011010");
}
else if(strcmp(x,"011011001110")==0){
strcpy(z,"01100111001110010111001");
}
else if(strcmp(x,"011011001111")==0){
strcpy(z,"01100111001010011011001");
}
else if(strcmp(x,"011011010000")==0){
strcpy(z,"01100111000110011111010");
}
else if(strcmp(x,"011011010001")==0){
strcpy(z,"01100111000010100011011");
}
else if(strcmp(x,"011011010010")==0){
strcpy(z,"01100110111110100111101");
}
else if(strcmp(x,"011011010011")==0){
strcpy(z,"01100110111010101100000");
}
else if(strcmp(x,"011011010100")==0){
strcpy(z,"01100110110110110000100");
}
else if(strcmp(x,"011011010101")==0){
strcpy(z,"01100110110010110101000");
}
else if(strcmp(x,"011011010110")==0){
strcpy(z,"01100110101110111001101");
}
else if(strcmp(x,"011011010111")==0){
strcpy(z,"01100110101010111110010");
}
else if(strcmp(x,"011011011000")==0){
strcpy(z,"01100110100111000011001");
}
else if(strcmp(x,"011011011001")==0){
strcpy(z,"01100110100011000111111");
}
else if(strcmp(x,"011011011010")==0){
strcpy(z,"01100110011111001100111");
}
else if(strcmp(x,"011011011011")==0){
strcpy(z,"01100110011011010001111");
}
else if(strcmp(x,"011011011100")==0){
strcpy(z,"01100110010111010111000");
}
else if(strcmp(x,"011011011101")==0){
strcpy(z,"01100110010011011100010");
}
else if(strcmp(x,"011011011110")==0){
strcpy(z,"01100110001111100001101");
}
else if(strcmp(x,"011011011111")==0){
strcpy(z,"01100110001011100111000");
}
else if(strcmp(x,"011011100000")==0){
strcpy(z,"01100110000111101100011");
}
else if(strcmp(x,"011011100001")==0){
strcpy(z,"01100110000011110010000");
}
else if(strcmp(x,"011011100010")==0){
strcpy(z,"01100101111111110111101");
}
else if(strcmp(x,"011011100011")==0){
strcpy(z,"01100101111011111101011");
}
else if(strcmp(x,"011011100100")==0){
strcpy(z,"01100101111000000011001");
}
else if(strcmp(x,"011011100101")==0){
strcpy(z,"01100101110100001001000");
}
else if(strcmp(x,"011011100110")==0){
strcpy(z,"01100101110000001111000");
}
else if(strcmp(x,"011011100111")==0){
strcpy(z,"01100101101100010101001");
}
else if(strcmp(x,"011011101000")==0){
strcpy(z,"01100101101000011011010");
}
else if(strcmp(x,"011011101001")==0){
strcpy(z,"01100101100100100001100");
}
else if(strcmp(x,"011011101010")==0){
strcpy(z,"01100101100000100111110");
}
else if(strcmp(x,"011011101011")==0){
strcpy(z,"01100101011100101110010");
}
else if(strcmp(x,"011011101100")==0){
strcpy(z,"01100101011000110100110");
}
else if(strcmp(x,"011011101101")==0){
strcpy(z,"01100101010100111011010");
}
else if(strcmp(x,"011011101110")==0){
strcpy(z,"01100101010001000010000");
}
else if(strcmp(x,"011011101111")==0){
strcpy(z,"01100101001101001000110");
}
else if(strcmp(x,"011011110000")==0){
strcpy(z,"01100101001001001111100");
}
else if(strcmp(x,"011011110001")==0){
strcpy(z,"01100101000101010110100");
}
else if(strcmp(x,"011011110010")==0){
strcpy(z,"01100101000001011101100");
}
else if(strcmp(x,"011011110011")==0){
strcpy(z,"01100100111101100100100");
}
else if(strcmp(x,"011011110100")==0){
strcpy(z,"01100100111001101011110");
}
else if(strcmp(x,"011011110101")==0){
strcpy(z,"01100100110101110011000");
}
else if(strcmp(x,"011011110110")==0){
strcpy(z,"01100100110001111010010");
}
else if(strcmp(x,"011011110111")==0){
strcpy(z,"01100100101110000001110");
}
else if(strcmp(x,"011011111000")==0){
strcpy(z,"01100100101010001001010");
}
else if(strcmp(x,"011011111001")==0){
strcpy(z,"01100100100110010000111");
}
else if(strcmp(x,"011011111010")==0){
strcpy(z,"01100100100010011000100");
}
else if(strcmp(x,"011011111011")==0){
strcpy(z,"01100100011110100000010");
}
else if(strcmp(x,"011011111100")==0){
strcpy(z,"01100100011010101000001");
}
else if(strcmp(x,"011011111101")==0){
strcpy(z,"01100100010110110000000");
}
else if(strcmp(x,"011011111110")==0){
strcpy(z,"01100100010010111000001");
}
else if(strcmp(x,"011011111111")==0){
strcpy(z,"01100100001111000000001");
}
else if(strcmp(x,"011100000000")==0){
strcpy(z,"01100100001011001000011");
}
else if(strcmp(x,"011100000001")==0){
strcpy(z,"01100100000111010000101");
}
else if(strcmp(x,"011100000010")==0){
strcpy(z,"01100100000011011001000");
}
else if(strcmp(x,"011100000011")==0){
strcpy(z,"01100011111111100001011");
}
else if(strcmp(x,"011100000100")==0){
strcpy(z,"01100011111011101001111");
}
else if(strcmp(x,"011100000101")==0){
strcpy(z,"01100011110111110010100");
}
else if(strcmp(x,"011100000110")==0){
strcpy(z,"01100011110011111011010");
}
else if(strcmp(x,"011100000111")==0){
strcpy(z,"01100011110000000100000");
}
else if(strcmp(x,"011100001000")==0){
strcpy(z,"01100011101100001100111");
}
else if(strcmp(x,"011100001001")==0){
strcpy(z,"01100011101000010101110");
}
else if(strcmp(x,"011100001010")==0){
strcpy(z,"01100011100100011110111");
}
else if(strcmp(x,"011100001011")==0){
strcpy(z,"01100011100000100111111");
}
else if(strcmp(x,"011100001100")==0){
strcpy(z,"01100011011100110001001");
}
else if(strcmp(x,"011100001101")==0){
strcpy(z,"01100011011000111010011");
}
else if(strcmp(x,"011100001110")==0){
strcpy(z,"01100011010101000011110");
}
else if(strcmp(x,"011100001111")==0){
strcpy(z,"01100011010001001101010");
}
else if(strcmp(x,"011100010000")==0){
strcpy(z,"01100011001101010110110");
}
else if(strcmp(x,"011100010001")==0){
strcpy(z,"01100011001001100000011");
}
else if(strcmp(x,"011100010010")==0){
strcpy(z,"01100011000101101010000");
}
else if(strcmp(x,"011100010011")==0){
strcpy(z,"01100011000001110011110");
}
else if(strcmp(x,"011100010100")==0){
strcpy(z,"01100010111101111101101");
}
else if(strcmp(x,"011100010101")==0){
strcpy(z,"01100010111010000111101");
}
else if(strcmp(x,"011100010110")==0){
strcpy(z,"01100010110110010001101");
}
else if(strcmp(x,"011100010111")==0){
strcpy(z,"01100010110010011011110");
}
else if(strcmp(x,"011100011000")==0){
strcpy(z,"01100010101110100101111");
}
else if(strcmp(x,"011100011001")==0){
strcpy(z,"01100010101010110000010");
}
else if(strcmp(x,"011100011010")==0){
strcpy(z,"01100010100110111010101");
}
else if(strcmp(x,"011100011011")==0){
strcpy(z,"01100010100011000101000");
}
else if(strcmp(x,"011100011100")==0){
strcpy(z,"01100010011111001111100");
}
else if(strcmp(x,"011100011101")==0){
strcpy(z,"01100010011011011010001");
}
else if(strcmp(x,"011100011110")==0){
strcpy(z,"01100010010111100100111");
}
else if(strcmp(x,"011100011111")==0){
strcpy(z,"01100010010011101111101");
}
else if(strcmp(x,"011100100000")==0){
strcpy(z,"01100010001111111010100");
}
else if(strcmp(x,"011100100001")==0){
strcpy(z,"01100010001100000101011");
}
else if(strcmp(x,"011100100010")==0){
strcpy(z,"01100010001000010000011");
}
else if(strcmp(x,"011100100011")==0){
strcpy(z,"01100010000100011011100");
}
else if(strcmp(x,"011100100100")==0){
strcpy(z,"01100010000000100110110");
}
else if(strcmp(x,"011100100101")==0){
strcpy(z,"01100001111100110010000");
}
else if(strcmp(x,"011100100110")==0){
strcpy(z,"01100001111000111101011");
}
else if(strcmp(x,"011100100111")==0){
strcpy(z,"01100001110101001000110");
}
else if(strcmp(x,"011100101000")==0){
strcpy(z,"01100001110001010100010");
}
else if(strcmp(x,"011100101001")==0){
strcpy(z,"01100001101101011111111");
}
else if(strcmp(x,"011100101010")==0){
strcpy(z,"01100001101001101011101");
}
else if(strcmp(x,"011100101011")==0){
strcpy(z,"01100001100101110111011");
}
else if(strcmp(x,"011100101100")==0){
strcpy(z,"01100001100010000011010");
}
else if(strcmp(x,"011100101101")==0){
strcpy(z,"01100001011110001111001");
}
else if(strcmp(x,"011100101110")==0){
strcpy(z,"01100001011010011011001");
}
else if(strcmp(x,"011100101111")==0){
strcpy(z,"01100001010110100111010");
}
else if(strcmp(x,"011100110000")==0){
strcpy(z,"01100001010010110011011");
}
else if(strcmp(x,"011100110001")==0){
strcpy(z,"01100001001110111111101");
}
else if(strcmp(x,"011100110010")==0){
strcpy(z,"01100001001011001100000");
}
else if(strcmp(x,"011100110011")==0){
strcpy(z,"01100001000111011000011");
}
else if(strcmp(x,"011100110100")==0){
strcpy(z,"01100001000011100100111");
}
else if(strcmp(x,"011100110101")==0){
strcpy(z,"01100000111111110001100");
}
else if(strcmp(x,"011100110110")==0){
strcpy(z,"01100000111011111110010");
}
else if(strcmp(x,"011100110111")==0){
strcpy(z,"01100000111000001011000");
}
else if(strcmp(x,"011100111000")==0){
strcpy(z,"01100000110100010111110");
}
else if(strcmp(x,"011100111001")==0){
strcpy(z,"01100000110000100100110");
}
else if(strcmp(x,"011100111010")==0){
strcpy(z,"01100000101100110001101");
}
else if(strcmp(x,"011100111011")==0){
strcpy(z,"01100000101000111110110");
}
else if(strcmp(x,"011100111100")==0){
strcpy(z,"01100000100101001011111");
}
else if(strcmp(x,"011100111101")==0){
strcpy(z,"01100000100001011001001");
}
else if(strcmp(x,"011100111110")==0){
strcpy(z,"01100000011101100110100");
}
else if(strcmp(x,"011100111111")==0){
strcpy(z,"01100000011001110011111");
}
else if(strcmp(x,"011101000000")==0){
strcpy(z,"01100000010110000001011");
}
else if(strcmp(x,"011101000001")==0){
strcpy(z,"01100000010010001111000");
}
else if(strcmp(x,"011101000010")==0){
strcpy(z,"01100000001110011100101");
}
else if(strcmp(x,"011101000011")==0){
strcpy(z,"01100000001010101010011");
}
else if(strcmp(x,"011101000100")==0){
strcpy(z,"01100000000110111000001");
}
else if(strcmp(x,"011101000101")==0){
strcpy(z,"01100000000011000110000");
}
else if(strcmp(x,"011101000110")==0){
strcpy(z,"01011111111111010100000");
}
else if(strcmp(x,"011101000111")==0){
strcpy(z,"01011111111011100010000");
}
else if(strcmp(x,"011101001000")==0){
strcpy(z,"01011111110111110000010");
}
else if(strcmp(x,"011101001001")==0){
strcpy(z,"01011111110011111110011");
}
else if(strcmp(x,"011101001010")==0){
strcpy(z,"01011111110000001100110");
}
else if(strcmp(x,"011101001011")==0){
strcpy(z,"01011111101100011011001");
}
else if(strcmp(x,"011101001100")==0){
strcpy(z,"01011111101000101001100");
}
else if(strcmp(x,"011101001101")==0){
strcpy(z,"01011111100100111000001");
}
else if(strcmp(x,"011101001110")==0){
strcpy(z,"01011111100001000110110");
}
else if(strcmp(x,"011101001111")==0){
strcpy(z,"01011111011101010101011");
}
else if(strcmp(x,"011101010000")==0){
strcpy(z,"01011111011001100100010");
}
else if(strcmp(x,"011101010001")==0){
strcpy(z,"01011111010101110011001");
}
else if(strcmp(x,"011101010010")==0){
strcpy(z,"01011111010010000010000");
}
else if(strcmp(x,"011101010011")==0){
strcpy(z,"01011111001110010001000");
}
else if(strcmp(x,"011101010100")==0){
strcpy(z,"01011111001010100000001");
}
else if(strcmp(x,"011101010101")==0){
strcpy(z,"01011111000110101111011");
}
else if(strcmp(x,"011101010110")==0){
strcpy(z,"01011111000010111110101");
}
else if(strcmp(x,"011101010111")==0){
strcpy(z,"01011110111111001110000");
}
else if(strcmp(x,"011101011000")==0){
strcpy(z,"01011110111011011101011");
}
else if(strcmp(x,"011101011001")==0){
strcpy(z,"01011110110111101100111");
}
else if(strcmp(x,"011101011010")==0){
strcpy(z,"01011110110011111100100");
}
else if(strcmp(x,"011101011011")==0){
strcpy(z,"01011110110000001100001");
}
else if(strcmp(x,"011101011100")==0){
strcpy(z,"01011110101100011011111");
}
else if(strcmp(x,"011101011101")==0){
strcpy(z,"01011110101000101011110");
}
else if(strcmp(x,"011101011110")==0){
strcpy(z,"01011110100100111011101");
}
else if(strcmp(x,"011101011111")==0){
strcpy(z,"01011110100001001011101");
}
else if(strcmp(x,"011101100000")==0){
strcpy(z,"01011110011101011011110");
}
else if(strcmp(x,"011101100001")==0){
strcpy(z,"01011110011001101011111");
}
else if(strcmp(x,"011101100010")==0){
strcpy(z,"01011110010101111100001");
}
else if(strcmp(x,"011101100011")==0){
strcpy(z,"01011110010010001100011");
}
else if(strcmp(x,"011101100100")==0){
strcpy(z,"01011110001110011100111");
}
else if(strcmp(x,"011101100101")==0){
strcpy(z,"01011110001010101101010");
}
else if(strcmp(x,"011101100110")==0){
strcpy(z,"01011110000110111101111");
}
else if(strcmp(x,"011101100111")==0){
strcpy(z,"01011110000011001110100");
}
else if(strcmp(x,"011101101000")==0){
strcpy(z,"01011101111111011111010");
}
else if(strcmp(x,"011101101001")==0){
strcpy(z,"01011101111011110000000");
}
else if(strcmp(x,"011101101010")==0){
strcpy(z,"01011101111000000000111");
}
else if(strcmp(x,"011101101011")==0){
strcpy(z,"01011101110100010001110");
}
else if(strcmp(x,"011101101100")==0){
strcpy(z,"01011101110000100010111");
}
else if(strcmp(x,"011101101101")==0){
strcpy(z,"01011101101100110100000");
}
else if(strcmp(x,"011101101110")==0){
strcpy(z,"01011101101001000101001");
}
else if(strcmp(x,"011101101111")==0){
strcpy(z,"01011101100101010110011");
}
else if(strcmp(x,"011101110000")==0){
strcpy(z,"01011101100001100111110");
}
else if(strcmp(x,"011101110001")==0){
strcpy(z,"01011101011101111001010");
}
else if(strcmp(x,"011101110010")==0){
strcpy(z,"01011101011010001010110");
}
else if(strcmp(x,"011101110011")==0){
strcpy(z,"01011101010110011100010");
}
else if(strcmp(x,"011101110100")==0){
strcpy(z,"01011101010010101110000");
}
else if(strcmp(x,"011101110101")==0){
strcpy(z,"01011101001110111111110");
}
else if(strcmp(x,"011101110110")==0){
strcpy(z,"01011101001011010001100");
}
else if(strcmp(x,"011101110111")==0){
strcpy(z,"01011101000111100011100");
}
else if(strcmp(x,"011101111000")==0){
strcpy(z,"01011101000011110101011");
}
else if(strcmp(x,"011101111001")==0){
strcpy(z,"01011101000000000111100");
}
else if(strcmp(x,"011101111010")==0){
strcpy(z,"01011100111100011001101");
}
else if(strcmp(x,"011101111011")==0){
strcpy(z,"01011100111000101011111");
}
else if(strcmp(x,"011101111100")==0){
strcpy(z,"01011100110100111110001");
}
else if(strcmp(x,"011101111101")==0){
strcpy(z,"01011100110001010000100");
}
else if(strcmp(x,"011101111110")==0){
strcpy(z,"01011100101101100011000");
}
else if(strcmp(x,"011101111111")==0){
strcpy(z,"01011100101001110101100");
}
else if(strcmp(x,"011110000000")==0){
strcpy(z,"01011100100110001000001");
}
else if(strcmp(x,"011110000001")==0){
strcpy(z,"01011100100010011010111");
}
else if(strcmp(x,"011110000010")==0){
strcpy(z,"01011100011110101101101");
}
else if(strcmp(x,"011110000011")==0){
strcpy(z,"01011100011011000000100");
}
else if(strcmp(x,"011110000100")==0){
strcpy(z,"01011100010111010011011");
}
else if(strcmp(x,"011110000101")==0){
strcpy(z,"01011100010011100110100");
}
else if(strcmp(x,"011110000110")==0){
strcpy(z,"01011100001111111001100");
}
else if(strcmp(x,"011110000111")==0){
strcpy(z,"01011100001100001100110");
}
else if(strcmp(x,"011110001000")==0){
strcpy(z,"01011100001000100000000");
}
else if(strcmp(x,"011110001001")==0){
strcpy(z,"01011100000100110011010");
}
else if(strcmp(x,"011110001010")==0){
strcpy(z,"01011100000001000110110");
}
else if(strcmp(x,"011110001011")==0){
strcpy(z,"01011011111101011010001");
}
else if(strcmp(x,"011110001100")==0){
strcpy(z,"01011011111001101101110");
}
else if(strcmp(x,"011110001101")==0){
strcpy(z,"01011011110110000001011");
}
else if(strcmp(x,"011110001110")==0){
strcpy(z,"01011011110010010101001");
}
else if(strcmp(x,"011110001111")==0){
strcpy(z,"01011011101110101000111");
}
else if(strcmp(x,"011110010000")==0){
strcpy(z,"01011011101010111100110");
}
else if(strcmp(x,"011110010001")==0){
strcpy(z,"01011011100111010000110");
}
else if(strcmp(x,"011110010010")==0){
strcpy(z,"01011011100011100100110");
}
else if(strcmp(x,"011110010011")==0){
strcpy(z,"01011011011111111000111");
}
else if(strcmp(x,"011110010100")==0){
strcpy(z,"01011011011100001101001");
}
else if(strcmp(x,"011110010101")==0){
strcpy(z,"01011011011000100001011");
}
else if(strcmp(x,"011110010110")==0){
strcpy(z,"01011011010100110101101");
}
else if(strcmp(x,"011110010111")==0){
strcpy(z,"01011011010001001010001");
}
else if(strcmp(x,"011110011000")==0){
strcpy(z,"01011011001101011110101");
}
else if(strcmp(x,"011110011001")==0){
strcpy(z,"01011011001001110011001");
}
else if(strcmp(x,"011110011010")==0){
strcpy(z,"01011011000110000111111");
}
else if(strcmp(x,"011110011011")==0){
strcpy(z,"01011011000010011100101");
}
else if(strcmp(x,"011110011100")==0){
strcpy(z,"01011010111110110001011");
}
else if(strcmp(x,"011110011101")==0){
strcpy(z,"01011010111011000110010");
}
else if(strcmp(x,"011110011110")==0){
strcpy(z,"01011010110111011011010");
}
else if(strcmp(x,"011110011111")==0){
strcpy(z,"01011010110011110000010");
}
else if(strcmp(x,"011110100000")==0){
strcpy(z,"01011010110000000101011");
}
else if(strcmp(x,"011110100001")==0){
strcpy(z,"01011010101100011010101");
}
else if(strcmp(x,"011110100010")==0){
strcpy(z,"01011010101000101111111");
}
else if(strcmp(x,"011110100011")==0){
strcpy(z,"01011010100101000101010");
}
else if(strcmp(x,"011110100100")==0){
strcpy(z,"01011010100001011010110");
}
else if(strcmp(x,"011110100101")==0){
strcpy(z,"01011010011101110000010");
}
else if(strcmp(x,"011110100110")==0){
strcpy(z,"01011010011010000101110");
}
else if(strcmp(x,"011110100111")==0){
strcpy(z,"01011010010110011011100");
}
else if(strcmp(x,"011110101000")==0){
strcpy(z,"01011010010010110001010");
}
else if(strcmp(x,"011110101001")==0){
strcpy(z,"01011010001111000111000");
}
else if(strcmp(x,"011110101010")==0){
strcpy(z,"01011010001011011100111");
}
else if(strcmp(x,"011110101011")==0){
strcpy(z,"01011010000111110010111");
}
else if(strcmp(x,"011110101100")==0){
strcpy(z,"01011010000100001001000");
}
else if(strcmp(x,"011110101101")==0){
strcpy(z,"01011010000000011111001");
}
else if(strcmp(x,"011110101110")==0){
strcpy(z,"01011001111100110101010");
}
else if(strcmp(x,"011110101111")==0){
strcpy(z,"01011001111001001011101");
}
else if(strcmp(x,"011110110000")==0){
strcpy(z,"01011001110101100010000");
}
else if(strcmp(x,"011110110001")==0){
strcpy(z,"01011001110001111000011");
}
else if(strcmp(x,"011110110010")==0){
strcpy(z,"01011001101110001110111");
}
else if(strcmp(x,"011110110011")==0){
strcpy(z,"01011001101010100101100");
}
else if(strcmp(x,"011110110100")==0){
strcpy(z,"01011001100110111100001");
}
else if(strcmp(x,"011110110101")==0){
strcpy(z,"01011001100011010010111");
}
else if(strcmp(x,"011110110110")==0){
strcpy(z,"01011001011111101001110");
}
else if(strcmp(x,"011110110111")==0){
strcpy(z,"01011001011100000000101");
}
else if(strcmp(x,"011110111000")==0){
strcpy(z,"01011001011000010111101");
}
else if(strcmp(x,"011110111001")==0){
strcpy(z,"01011001010100101110101");
}
else if(strcmp(x,"011110111010")==0){
strcpy(z,"01011001010001000101110");
}
else if(strcmp(x,"011110111011")==0){
strcpy(z,"01011001001101011101000");
}
else if(strcmp(x,"011110111100")==0){
strcpy(z,"01011001001001110100010");
}
else if(strcmp(x,"011110111101")==0){
strcpy(z,"01011001000110001011101");
}
else if(strcmp(x,"011110111110")==0){
strcpy(z,"01011001000010100011001");
}
else if(strcmp(x,"011110111111")==0){
strcpy(z,"01011000111110111010101");
}
else if(strcmp(x,"011111000000")==0){
strcpy(z,"01011000111011010010010");
}
else if(strcmp(x,"011111000001")==0){
strcpy(z,"01011000110111101001111");
}
else if(strcmp(x,"011111000010")==0){
strcpy(z,"01011000110100000001101");
}
else if(strcmp(x,"011111000011")==0){
strcpy(z,"01011000110000011001011");
}
else if(strcmp(x,"011111000100")==0){
strcpy(z,"01011000101100110001011");
}
else if(strcmp(x,"011111000101")==0){
strcpy(z,"01011000101001001001010");
}
else if(strcmp(x,"011111000110")==0){
strcpy(z,"01011000100101100001011");
}
else if(strcmp(x,"011111000111")==0){
strcpy(z,"01011000100001111001100");
}
else if(strcmp(x,"011111001000")==0){
strcpy(z,"01011000011110010001101");
}
else if(strcmp(x,"011111001001")==0){
strcpy(z,"01011000011010101010000");
}
else if(strcmp(x,"011111001010")==0){
strcpy(z,"01011000010111000010010");
}
else if(strcmp(x,"011111001011")==0){
strcpy(z,"01011000010011011010110");
}
else if(strcmp(x,"011111001100")==0){
strcpy(z,"01011000001111110011010");
}
else if(strcmp(x,"011111001101")==0){
strcpy(z,"01011000001100001011110");
}
else if(strcmp(x,"011111001110")==0){
strcpy(z,"01011000001000100100100");
}
else if(strcmp(x,"011111001111")==0){
strcpy(z,"01011000000100111101010");
}
else if(strcmp(x,"011111010000")==0){
strcpy(z,"01011000000001010110000");
}
else if(strcmp(x,"011111010001")==0){
strcpy(z,"01010111111101101110111");
}
else if(strcmp(x,"011111010010")==0){
strcpy(z,"01010111111010000111111");
}
else if(strcmp(x,"011111010011")==0){
strcpy(z,"01010111110110100000111");
}
else if(strcmp(x,"011111010100")==0){
strcpy(z,"01010111110010111010000");
}
else if(strcmp(x,"011111010101")==0){
strcpy(z,"01010111101111010011001");
}
else if(strcmp(x,"011111010110")==0){
strcpy(z,"01010111101011101100100");
}
else if(strcmp(x,"011111010111")==0){
strcpy(z,"01010111101000000101110");
}
else if(strcmp(x,"011111011000")==0){
strcpy(z,"01010111100100011111010");
}
else if(strcmp(x,"011111011001")==0){
strcpy(z,"01010111100000111000110");
}
else if(strcmp(x,"011111011010")==0){
strcpy(z,"01010111011101010010010");
}
else if(strcmp(x,"011111011011")==0){
strcpy(z,"01010111011001101011111");
}
else if(strcmp(x,"011111011100")==0){
strcpy(z,"01010111010110000101101");
}
else if(strcmp(x,"011111011101")==0){
strcpy(z,"01010111010010011111011");
}
else if(strcmp(x,"011111011110")==0){
strcpy(z,"01010111001110111001010");
}
else if(strcmp(x,"011111011111")==0){
strcpy(z,"01010111001011010011010");
}
else if(strcmp(x,"011111100000")==0){
strcpy(z,"01010111000111101101010");
}
else if(strcmp(x,"011111100001")==0){
strcpy(z,"01010111000100000111011");
}
else if(strcmp(x,"011111100010")==0){
strcpy(z,"01010111000000100001100");
}
else if(strcmp(x,"011111100011")==0){
strcpy(z,"01010110111100111011110");
}
else if(strcmp(x,"011111100100")==0){
strcpy(z,"01010110111001010110000");
}
else if(strcmp(x,"011111100101")==0){
strcpy(z,"01010110110101110000100");
}
else if(strcmp(x,"011111100110")==0){
strcpy(z,"01010110110010001010111");
}
else if(strcmp(x,"011111100111")==0){
strcpy(z,"01010110101110100101100");
}
else if(strcmp(x,"011111101000")==0){
strcpy(z,"01010110101011000000001");
}
else if(strcmp(x,"011111101001")==0){
strcpy(z,"01010110100111011010110");
}
else if(strcmp(x,"011111101010")==0){
strcpy(z,"01010110100011110101100");
}
else if(strcmp(x,"011111101011")==0){
strcpy(z,"01010110100000010000011");
}
else if(strcmp(x,"011111101100")==0){
strcpy(z,"01010110011100101011010");
}
else if(strcmp(x,"011111101101")==0){
strcpy(z,"01010110011001000110010");
}
else if(strcmp(x,"011111101110")==0){
strcpy(z,"01010110010101100001011");
}
else if(strcmp(x,"011111101111")==0){
strcpy(z,"01010110010001111100100");
}
else if(strcmp(x,"011111110000")==0){
strcpy(z,"01010110001110010111110");
}
else if(strcmp(x,"011111110001")==0){
strcpy(z,"01010110001010110011000");
}
else if(strcmp(x,"011111110010")==0){
strcpy(z,"01010110000111001110011");
}
else if(strcmp(x,"011111110011")==0){
strcpy(z,"01010110000011101001111");
}
else if(strcmp(x,"011111110100")==0){
strcpy(z,"01010110000000000101011");
}
else if(strcmp(x,"011111110101")==0){
strcpy(z,"01010101111100100000111");
}
else if(strcmp(x,"011111110110")==0){
strcpy(z,"01010101111000111100101");
}
else if(strcmp(x,"011111110111")==0){
strcpy(z,"01010101110101011000011");
}
else if(strcmp(x,"011111111000")==0){
strcpy(z,"01010101110001110100001");
}
else if(strcmp(x,"011111111001")==0){
strcpy(z,"01010101101110010000000");
}
else if(strcmp(x,"011111111010")==0){
strcpy(z,"01010101101010101100000");
}
else if(strcmp(x,"011111111011")==0){
strcpy(z,"01010101100111001000000");
}
else if(strcmp(x,"011111111100")==0){
strcpy(z,"01010101100011100100001");
}
else if(strcmp(x,"011111111101")==0){
strcpy(z,"01010101100000000000011");
}
else if(strcmp(x,"011111111110")==0){
strcpy(z,"01010101011100011100101");
}
else if(strcmp(x,"011111111111")==0){
strcpy(z,"01010101011000111000111");
}
else if(strcmp(x,"100000000000")==0){
strcpy(z,"01010101010101010101011");
}
else if(strcmp(x,"100000000001")==0){
strcpy(z,"01010101010001110001111");
}
else if(strcmp(x,"100000000010")==0){
strcpy(z,"01010101001110001110011");
}
else if(strcmp(x,"100000000011")==0){
strcpy(z,"01010101001010101011000");
}
else if(strcmp(x,"100000000100")==0){
strcpy(z,"01010101000111000111110");
}
else if(strcmp(x,"100000000101")==0){
strcpy(z,"01010101000011100100100");
}
else if(strcmp(x,"100000000110")==0){
strcpy(z,"01010101000000000001011");
}
else if(strcmp(x,"100000000111")==0){
strcpy(z,"01010100111100011110010");
}
else if(strcmp(x,"100000001000")==0){
strcpy(z,"01010100111000111011010");
}
else if(strcmp(x,"100000001001")==0){
strcpy(z,"01010100110101011000011");
}
else if(strcmp(x,"100000001010")==0){
strcpy(z,"01010100110001110101100");
}
else if(strcmp(x,"100000001011")==0){
strcpy(z,"01010100101110010010110");
}
else if(strcmp(x,"100000001100")==0){
strcpy(z,"01010100101010110000000");
}
else if(strcmp(x,"100000001101")==0){
strcpy(z,"01010100100111001101011");
}
else if(strcmp(x,"100000001110")==0){
strcpy(z,"01010100100011101010110");
}
else if(strcmp(x,"100000001111")==0){
strcpy(z,"01010100100000001000011");
}
else if(strcmp(x,"100000010000")==0){
strcpy(z,"01010100011100100101111");
}
else if(strcmp(x,"100000010001")==0){
strcpy(z,"01010100011001000011101");
}
else if(strcmp(x,"100000010010")==0){
strcpy(z,"01010100010101100001010");
}
else if(strcmp(x,"100000010011")==0){
strcpy(z,"01010100010001111111001");
}
else if(strcmp(x,"100000010100")==0){
strcpy(z,"01010100001110011101000");
}
else if(strcmp(x,"100000010101")==0){
strcpy(z,"01010100001010111011000");
}
else if(strcmp(x,"100000010110")==0){
strcpy(z,"01010100000111011001000");
}
else if(strcmp(x,"100000010111")==0){
strcpy(z,"01010100000011110111001");
}
else if(strcmp(x,"100000011000")==0){
strcpy(z,"01010100000000010101010");
}
else if(strcmp(x,"100000011001")==0){
strcpy(z,"01010011111100110011100");
}
else if(strcmp(x,"100000011010")==0){
strcpy(z,"01010011111001010001111");
}
else if(strcmp(x,"100000011011")==0){
strcpy(z,"01010011110101110000010");
}
else if(strcmp(x,"100000011100")==0){
strcpy(z,"01010011110010001110101");
}
else if(strcmp(x,"100000011101")==0){
strcpy(z,"01010011101110101101010");
}
else if(strcmp(x,"100000011110")==0){
strcpy(z,"01010011101011001011111");
}
else if(strcmp(x,"100000011111")==0){
strcpy(z,"01010011100111101010100");
}
else if(strcmp(x,"100000100000")==0){
strcpy(z,"01010011100100001001010");
}
else if(strcmp(x,"100000100001")==0){
strcpy(z,"01010011100000101000001");
}
else if(strcmp(x,"100000100010")==0){
strcpy(z,"01010011011101000111000");
}
else if(strcmp(x,"100000100011")==0){
strcpy(z,"01010011011001100110000");
}
else if(strcmp(x,"100000100100")==0){
strcpy(z,"01010011010110000101000");
}
else if(strcmp(x,"100000100101")==0){
strcpy(z,"01010011010010100100001");
}
else if(strcmp(x,"100000100110")==0){
strcpy(z,"01010011001111000011011");
}
else if(strcmp(x,"100000100111")==0){
strcpy(z,"01010011001011100010101");
}
else if(strcmp(x,"100000101000")==0){
strcpy(z,"01010011001000000010000");
}
else if(strcmp(x,"100000101001")==0){
strcpy(z,"01010011000100100001011");
}
else if(strcmp(x,"100000101010")==0){
strcpy(z,"01010011000001000000111");
}
else if(strcmp(x,"100000101011")==0){
strcpy(z,"01010010111101100000100");
}
else if(strcmp(x,"100000101100")==0){
strcpy(z,"01010010111010000000001");
}
else if(strcmp(x,"100000101101")==0){
strcpy(z,"01010010110110011111110");
}
else if(strcmp(x,"100000101110")==0){
strcpy(z,"01010010110010111111101");
}
else if(strcmp(x,"100000101111")==0){
strcpy(z,"01010010101111011111011");
}
else if(strcmp(x,"100000110000")==0){
strcpy(z,"01010010101011111111011");
}
else if(strcmp(x,"100000110001")==0){
strcpy(z,"01010010101000011111011");
}
else if(strcmp(x,"100000110010")==0){
strcpy(z,"01010010100100111111011");
}
else if(strcmp(x,"100000110011")==0){
strcpy(z,"01010010100001011111100");
}
else if(strcmp(x,"100000110100")==0){
strcpy(z,"01010010011101111111110");
}
else if(strcmp(x,"100000110101")==0){
strcpy(z,"01010010011010100000000");
}
else if(strcmp(x,"100000110110")==0){
strcpy(z,"01010010010111000000011");
}
else if(strcmp(x,"100000110111")==0){
strcpy(z,"01010010010011100000111");
}
else if(strcmp(x,"100000111000")==0){
strcpy(z,"01010010010000000001011");
}
else if(strcmp(x,"100000111001")==0){
strcpy(z,"01010010001100100001111");
}
else if(strcmp(x,"100000111010")==0){
strcpy(z,"01010010001001000010100");
}
else if(strcmp(x,"100000111011")==0){
strcpy(z,"01010010000101100011010");
}
else if(strcmp(x,"100000111100")==0){
strcpy(z,"01010010000010000100000");
}
else if(strcmp(x,"100000111101")==0){
strcpy(z,"01010001111110100100111");
}
else if(strcmp(x,"100000111110")==0){
strcpy(z,"01010001111011000101111");
}
else if(strcmp(x,"100000111111")==0){
strcpy(z,"01010001110111100110111");
}
else if(strcmp(x,"100001000000")==0){
strcpy(z,"01010001110100000111111");
}
else if(strcmp(x,"100001000001")==0){
strcpy(z,"01010001110000101001001");
}
else if(strcmp(x,"100001000010")==0){
strcpy(z,"01010001101101001010010");
}
else if(strcmp(x,"100001000011")==0){
strcpy(z,"01010001101001101011101");
}
else if(strcmp(x,"100001000100")==0){
strcpy(z,"01010001100110001101000");
}
else if(strcmp(x,"100001000101")==0){
strcpy(z,"01010001100010101110011");
}
else if(strcmp(x,"100001000110")==0){
strcpy(z,"01010001011111001111111");
}
else if(strcmp(x,"100001000111")==0){
strcpy(z,"01010001011011110001100");
}
else if(strcmp(x,"100001001000")==0){
strcpy(z,"01010001011000010011001");
}
else if(strcmp(x,"100001001001")==0){
strcpy(z,"01010001010100110100111");
}
else if(strcmp(x,"100001001010")==0){
strcpy(z,"01010001010001010110101");
}
else if(strcmp(x,"100001001011")==0){
strcpy(z,"01010001001101111000100");
}
else if(strcmp(x,"100001001100")==0){
strcpy(z,"01010001001010011010011");
}
else if(strcmp(x,"100001001101")==0){
strcpy(z,"01010001000110111100011");
}
else if(strcmp(x,"100001001110")==0){
strcpy(z,"01010001000011011110100");
}
else if(strcmp(x,"100001001111")==0){
strcpy(z,"01010001000000000000101");
}
else if(strcmp(x,"100001010000")==0){
strcpy(z,"01010000111100100010111");
}
else if(strcmp(x,"100001010001")==0){
strcpy(z,"01010000111001000101001");
}
else if(strcmp(x,"100001010010")==0){
strcpy(z,"01010000110101100111100");
}
else if(strcmp(x,"100001010011")==0){
strcpy(z,"01010000110010001010000");
}
else if(strcmp(x,"100001010100")==0){
strcpy(z,"01010000101110101100100");
}
else if(strcmp(x,"100001010101")==0){
strcpy(z,"01010000101011001111000");
}
else if(strcmp(x,"100001010110")==0){
strcpy(z,"01010000100111110001110");
}
else if(strcmp(x,"100001010111")==0){
strcpy(z,"01010000100100010100011");
}
else if(strcmp(x,"100001011000")==0){
strcpy(z,"01010000100000110111010");
}
else if(strcmp(x,"100001011001")==0){
strcpy(z,"01010000011101011010001");
}
else if(strcmp(x,"100001011010")==0){
strcpy(z,"01010000011001111101000");
}
else if(strcmp(x,"100001011011")==0){
strcpy(z,"01010000010110100000000");
}
else if(strcmp(x,"100001011100")==0){
strcpy(z,"01010000010011000011001");
}
else if(strcmp(x,"100001011101")==0){
strcpy(z,"01010000001111100110010");
}
else if(strcmp(x,"100001011110")==0){
strcpy(z,"01010000001100001001100");
}
else if(strcmp(x,"100001011111")==0){
strcpy(z,"01010000001000101100110");
}
else if(strcmp(x,"100001100000")==0){
strcpy(z,"01010000000101010000001");
}
else if(strcmp(x,"100001100001")==0){
strcpy(z,"01010000000001110011100");
}
else if(strcmp(x,"100001100010")==0){
strcpy(z,"01001111111110010111000");
}
else if(strcmp(x,"100001100011")==0){
strcpy(z,"01001111111010111010101");
}
else if(strcmp(x,"100001100100")==0){
strcpy(z,"01001111110111011110010");
}
else if(strcmp(x,"100001100101")==0){
strcpy(z,"01001111110100000001111");
}
else if(strcmp(x,"100001100110")==0){
strcpy(z,"01001111110000100101110");
}
else if(strcmp(x,"100001100111")==0){
strcpy(z,"01001111101101001001100");
}
else if(strcmp(x,"100001101000")==0){
strcpy(z,"01001111101001101101100");
}
else if(strcmp(x,"100001101001")==0){
strcpy(z,"01001111100110010001100");
}
else if(strcmp(x,"100001101010")==0){
strcpy(z,"01001111100010110101100");
}
else if(strcmp(x,"100001101011")==0){
strcpy(z,"01001111011111011001101");
}
else if(strcmp(x,"100001101100")==0){
strcpy(z,"01001111011011111101111");
}
else if(strcmp(x,"100001101101")==0){
strcpy(z,"01001111011000100010001");
}
else if(strcmp(x,"100001101110")==0){
strcpy(z,"01001111010101000110100");
}
else if(strcmp(x,"100001101111")==0){
strcpy(z,"01001111010001101010111");
}
else if(strcmp(x,"100001110000")==0){
strcpy(z,"01001111001110001111011");
}
else if(strcmp(x,"100001110001")==0){
strcpy(z,"01001111001010110100000");
}
else if(strcmp(x,"100001110010")==0){
strcpy(z,"01001111000111011000101");
}
else if(strcmp(x,"100001110011")==0){
strcpy(z,"01001111000011111101010");
}
else if(strcmp(x,"100001110100")==0){
strcpy(z,"01001111000000100010000");
}
else if(strcmp(x,"100001110101")==0){
strcpy(z,"01001110111101000110111");
}
else if(strcmp(x,"100001110110")==0){
strcpy(z,"01001110111001101011110");
}
else if(strcmp(x,"100001110111")==0){
strcpy(z,"01001110110110010000110");
}
else if(strcmp(x,"100001111000")==0){
strcpy(z,"01001110110010110101110");
}
else if(strcmp(x,"100001111001")==0){
strcpy(z,"01001110101111011010111");
}
else if(strcmp(x,"100001111010")==0){
strcpy(z,"01001110101100000000001");
}
else if(strcmp(x,"100001111011")==0){
strcpy(z,"01001110101000100101011");
}
else if(strcmp(x,"100001111100")==0){
strcpy(z,"01001110100101001010101");
}
else if(strcmp(x,"100001111101")==0){
strcpy(z,"01001110100001110000000");
}
else if(strcmp(x,"100001111110")==0){
strcpy(z,"01001110011110010101100");
}
else if(strcmp(x,"100001111111")==0){
strcpy(z,"01001110011010111011000");
}
else if(strcmp(x,"100010000000")==0){
strcpy(z,"01001110010111100000101");
}
else if(strcmp(x,"100010000001")==0){
strcpy(z,"01001110010100000110011");
}
else if(strcmp(x,"100010000010")==0){
strcpy(z,"01001110010000101100001");
}
else if(strcmp(x,"100010000011")==0){
strcpy(z,"01001110001101010001111");
}
else if(strcmp(x,"100010000100")==0){
strcpy(z,"01001110001001110111110");
}
else if(strcmp(x,"100010000101")==0){
strcpy(z,"01001110000110011101110");
}
else if(strcmp(x,"100010000110")==0){
strcpy(z,"01001110000011000011110");
}
else if(strcmp(x,"100010000111")==0){
strcpy(z,"01001101111111101001111");
}
else if(strcmp(x,"100010001000")==0){
strcpy(z,"01001101111100010000000");
}
else if(strcmp(x,"100010001001")==0){
strcpy(z,"01001101111000110110010");
}
else if(strcmp(x,"100010001010")==0){
strcpy(z,"01001101110101011100100");
}
else if(strcmp(x,"100010001011")==0){
strcpy(z,"01001101110010000010111");
}
else if(strcmp(x,"100010001100")==0){
strcpy(z,"01001101101110101001010");
}
else if(strcmp(x,"100010001101")==0){
strcpy(z,"01001101101011001111111");
}
else if(strcmp(x,"100010001110")==0){
strcpy(z,"01001101100111110110011");
}
else if(strcmp(x,"100010001111")==0){
strcpy(z,"01001101100100011101000");
}
else if(strcmp(x,"100010010000")==0){
strcpy(z,"01001101100001000011110");
}
else if(strcmp(x,"100010010001")==0){
strcpy(z,"01001101011101101010100");
}
else if(strcmp(x,"100010010010")==0){
strcpy(z,"01001101011010010001011");
}
else if(strcmp(x,"100010010011")==0){
strcpy(z,"01001101010110111000010");
}
else if(strcmp(x,"100010010100")==0){
strcpy(z,"01001101010011011111010");
}
else if(strcmp(x,"100010010101")==0){
strcpy(z,"01001101010000000110011");
}
else if(strcmp(x,"100010010110")==0){
strcpy(z,"01001101001100101101100");
}
else if(strcmp(x,"100010010111")==0){
strcpy(z,"01001101001001010100101");
}
else if(strcmp(x,"100010011000")==0){
strcpy(z,"01001101000101111011111");
}
else if(strcmp(x,"100010011001")==0){
strcpy(z,"01001101000010100011010");
}
else if(strcmp(x,"100010011010")==0){
strcpy(z,"01001100111111001010101");
}
else if(strcmp(x,"100010011011")==0){
strcpy(z,"01001100111011110010001");
}
else if(strcmp(x,"100010011100")==0){
strcpy(z,"01001100111000011001101");
}
else if(strcmp(x,"100010011101")==0){
strcpy(z,"01001100110101000001010");
}
else if(strcmp(x,"100010011110")==0){
strcpy(z,"01001100110001101001000");
}
else if(strcmp(x,"100010011111")==0){
strcpy(z,"01001100101110010000110");
}
else if(strcmp(x,"100010100000")==0){
strcpy(z,"01001100101010111000100");
}
else if(strcmp(x,"100010100001")==0){
strcpy(z,"01001100100111100000011");
}
else if(strcmp(x,"100010100010")==0){
strcpy(z,"01001100100100001000011");
}
else if(strcmp(x,"100010100011")==0){
strcpy(z,"01001100100000110000011");
}
else if(strcmp(x,"100010100100")==0){
strcpy(z,"01001100011101011000100");
}
else if(strcmp(x,"100010100101")==0){
strcpy(z,"01001100011010000000101");
}
else if(strcmp(x,"100010100110")==0){
strcpy(z,"01001100010110101000111");
}
else if(strcmp(x,"100010100111")==0){
strcpy(z,"01001100010011010001001");
}
else if(strcmp(x,"100010101000")==0){
strcpy(z,"01001100001111111001100");
}
else if(strcmp(x,"100010101001")==0){
strcpy(z,"01001100001100100010000");
}
else if(strcmp(x,"100010101010")==0){
strcpy(z,"01001100001001001010100");
}
else if(strcmp(x,"100010101011")==0){
strcpy(z,"01001100000101110011000");
}
else if(strcmp(x,"100010101100")==0){
strcpy(z,"01001100000010011011101");
}
else if(strcmp(x,"100010101101")==0){
strcpy(z,"01001011111111000100011");
}
else if(strcmp(x,"100010101110")==0){
strcpy(z,"01001011111011101101001");
}
else if(strcmp(x,"100010101111")==0){
strcpy(z,"01001011111000010110000");
}
else if(strcmp(x,"100010110000")==0){
strcpy(z,"01001011110100111110111");
}
else if(strcmp(x,"100010110001")==0){
strcpy(z,"01001011110001100111111");
}
else if(strcmp(x,"100010110010")==0){
strcpy(z,"01001011101110010000111");
}
else if(strcmp(x,"100010110011")==0){
strcpy(z,"01001011101010111010000");
}
else if(strcmp(x,"100010110100")==0){
strcpy(z,"01001011100111100011001");
}
else if(strcmp(x,"100010110101")==0){
strcpy(z,"01001011100100001100011");
}
else if(strcmp(x,"100010110110")==0){
strcpy(z,"01001011100000110101110");
}
else if(strcmp(x,"100010110111")==0){
strcpy(z,"01001011011101011111001");
}
else if(strcmp(x,"100010111000")==0){
strcpy(z,"01001011011010001000101");
}
else if(strcmp(x,"100010111001")==0){
strcpy(z,"01001011010110110010001");
}
else if(strcmp(x,"100010111010")==0){
strcpy(z,"01001011010011011011101");
}
else if(strcmp(x,"100010111011")==0){
strcpy(z,"01001011010000000101011");
}
else if(strcmp(x,"100010111100")==0){
strcpy(z,"01001011001100101111000");
}
else if(strcmp(x,"100010111101")==0){
strcpy(z,"01001011001001011000111");
}
else if(strcmp(x,"100010111110")==0){
strcpy(z,"01001011000110000010110");
}
else if(strcmp(x,"100010111111")==0){
strcpy(z,"01001011000010101100101");
}
else if(strcmp(x,"100011000000")==0){
strcpy(z,"01001010111111010110101");
}
else if(strcmp(x,"100011000001")==0){
strcpy(z,"01001010111100000000101");
}
else if(strcmp(x,"100011000010")==0){
strcpy(z,"01001010111000101010111");
}
else if(strcmp(x,"100011000011")==0){
strcpy(z,"01001010110101010101000");
}
else if(strcmp(x,"100011000100")==0){
strcpy(z,"01001010110001111111010");
}
else if(strcmp(x,"100011000101")==0){
strcpy(z,"01001010101110101001101");
}
else if(strcmp(x,"100011000110")==0){
strcpy(z,"01001010101011010100000");
}
else if(strcmp(x,"100011000111")==0){
strcpy(z,"01001010100111111110100");
}
else if(strcmp(x,"100011001000")==0){
strcpy(z,"01001010100100101001000");
}
else if(strcmp(x,"100011001001")==0){
strcpy(z,"01001010100001010011101");
}
else if(strcmp(x,"100011001010")==0){
strcpy(z,"01001010011101111110010");
}
else if(strcmp(x,"100011001011")==0){
strcpy(z,"01001010011010101001000");
}
else if(strcmp(x,"100011001100")==0){
strcpy(z,"01001010010111010011110");
}
else if(strcmp(x,"100011001101")==0){
strcpy(z,"01001010010011111110101");
}
else if(strcmp(x,"100011001110")==0){
strcpy(z,"01001010010000101001101");
}
else if(strcmp(x,"100011001111")==0){
strcpy(z,"01001010001101010100101");
}
else if(strcmp(x,"100011010000")==0){
strcpy(z,"01001010001001111111101");
}
else if(strcmp(x,"100011010001")==0){
strcpy(z,"01001010000110101010111");
}
else if(strcmp(x,"100011010010")==0){
strcpy(z,"01001010000011010110000");
}
else if(strcmp(x,"100011010011")==0){
strcpy(z,"01001010000000000001010");
}
else if(strcmp(x,"100011010100")==0){
strcpy(z,"01001001111100101100101");
}
else if(strcmp(x,"100011010101")==0){
strcpy(z,"01001001111001011000000");
}
else if(strcmp(x,"100011010110")==0){
strcpy(z,"01001001110110000011100");
}
else if(strcmp(x,"100011010111")==0){
strcpy(z,"01001001110010101111000");
}
else if(strcmp(x,"100011011000")==0){
strcpy(z,"01001001101111011010101");
}
else if(strcmp(x,"100011011001")==0){
strcpy(z,"01001001101100000110011");
}
else if(strcmp(x,"100011011010")==0){
strcpy(z,"01001001101000110010000");
}
else if(strcmp(x,"100011011011")==0){
strcpy(z,"01001001100101011101111");
}
else if(strcmp(x,"100011011100")==0){
strcpy(z,"01001001100010001001110");
}
else if(strcmp(x,"100011011101")==0){
strcpy(z,"01001001011110110101101");
}
else if(strcmp(x,"100011011110")==0){
strcpy(z,"01001001011011100001101");
}
else if(strcmp(x,"100011011111")==0){
strcpy(z,"01001001011000001101110");
}
else if(strcmp(x,"100011100000")==0){
strcpy(z,"01001001010100111001111");
}
else if(strcmp(x,"100011100001")==0){
strcpy(z,"01001001010001100110001");
}
else if(strcmp(x,"100011100010")==0){
strcpy(z,"01001001001110010010011");
}
else if(strcmp(x,"100011100011")==0){
strcpy(z,"01001001001010111110110");
}
else if(strcmp(x,"100011100100")==0){
strcpy(z,"01001001000111101011001");
}
else if(strcmp(x,"100011100101")==0){
strcpy(z,"01001001000100010111101");
}
else if(strcmp(x,"100011100110")==0){
strcpy(z,"01001001000001000100001");
}
else if(strcmp(x,"100011100111")==0){
strcpy(z,"01001000111101110000110");
}
else if(strcmp(x,"100011101000")==0){
strcpy(z,"01001000111010011101011");
}
else if(strcmp(x,"100011101001")==0){
strcpy(z,"01001000110111001010001");
}
else if(strcmp(x,"100011101010")==0){
strcpy(z,"01001000110011110110111");
}
else if(strcmp(x,"100011101011")==0){
strcpy(z,"01001000110000100011110");
}
else if(strcmp(x,"100011101100")==0){
strcpy(z,"01001000101101010000110");
}
else if(strcmp(x,"100011101101")==0){
strcpy(z,"01001000101001111101110");
}
else if(strcmp(x,"100011101110")==0){
strcpy(z,"01001000100110101010110");
}
else if(strcmp(x,"100011101111")==0){
strcpy(z,"01001000100011010111111");
}
else if(strcmp(x,"100011110000")==0){
strcpy(z,"01001000100000000101001");
}
else if(strcmp(x,"100011110001")==0){
strcpy(z,"01001000011100110010011");
}
else if(strcmp(x,"100011110010")==0){
strcpy(z,"01001000011001011111110");
}
else if(strcmp(x,"100011110011")==0){
strcpy(z,"01001000010110001101001");
}
else if(strcmp(x,"100011110100")==0){
strcpy(z,"01001000010010111010101");
}
else if(strcmp(x,"100011110101")==0){
strcpy(z,"01001000001111101000001");
}
else if(strcmp(x,"100011110110")==0){
strcpy(z,"01001000001100010101110");
}
else if(strcmp(x,"100011110111")==0){
strcpy(z,"01001000001001000011011");
}
else if(strcmp(x,"100011111000")==0){
strcpy(z,"01001000000101110001001");
}
else if(strcmp(x,"100011111001")==0){
strcpy(z,"01001000000010011110111");
}
else if(strcmp(x,"100011111010")==0){
strcpy(z,"01000111111111001100110");
}
else if(strcmp(x,"100011111011")==0){
strcpy(z,"01000111111011111010101");
}
else if(strcmp(x,"100011111100")==0){
strcpy(z,"01000111111000101000101");
}
else if(strcmp(x,"100011111101")==0){
strcpy(z,"01000111110101010110110");
}
else if(strcmp(x,"100011111110")==0){
strcpy(z,"01000111110010000100111");
}
else if(strcmp(x,"100011111111")==0){
strcpy(z,"01000111101110110011000");
}
else if(strcmp(x,"100100000000")==0){
strcpy(z,"01000111101011100001010");
}
else if(strcmp(x,"100100000001")==0){
strcpy(z,"01000111101000001111101");
}
else if(strcmp(x,"100100000010")==0){
strcpy(z,"01000111100100111110000");
}
else if(strcmp(x,"100100000011")==0){
strcpy(z,"01000111100001101100011");
}
else if(strcmp(x,"100100000100")==0){
strcpy(z,"01000111011110011011000");
}
else if(strcmp(x,"100100000101")==0){
strcpy(z,"01000111011011001001100");
}
else if(strcmp(x,"100100000110")==0){
strcpy(z,"01000111010111111000001");
}
else if(strcmp(x,"100100000111")==0){
strcpy(z,"01000111010100100110111");
}
else if(strcmp(x,"100100001000")==0){
strcpy(z,"01000111010001010101101");
}
else if(strcmp(x,"100100001001")==0){
strcpy(z,"01000111001110000100100");
}
else if(strcmp(x,"100100001010")==0){
strcpy(z,"01000111001010110011011");
}
else if(strcmp(x,"100100001011")==0){
strcpy(z,"01000111000111100010011");
}
else if(strcmp(x,"100100001100")==0){
strcpy(z,"01000111000100010001011");
}
else if(strcmp(x,"100100001101")==0){
strcpy(z,"01000111000001000000100");
}
else if(strcmp(x,"100100001110")==0){
strcpy(z,"01000110111101101111101");
}
else if(strcmp(x,"100100001111")==0){
strcpy(z,"01000110111010011110111");
}
else if(strcmp(x,"100100010000")==0){
strcpy(z,"01000110110111001110010");
}
else if(strcmp(x,"100100010001")==0){
strcpy(z,"01000110110011111101101");
}
else if(strcmp(x,"100100010010")==0){
strcpy(z,"01000110110000101101000");
}
else if(strcmp(x,"100100010011")==0){
strcpy(z,"01000110101101011100100");
}
else if(strcmp(x,"100100010100")==0){
strcpy(z,"01000110101010001100000");
}
else if(strcmp(x,"100100010101")==0){
strcpy(z,"01000110100110111011101");
}
else if(strcmp(x,"100100010110")==0){
strcpy(z,"01000110100011101011011");
}
else if(strcmp(x,"100100010111")==0){
strcpy(z,"01000110100000011011001");
}
else if(strcmp(x,"100100011000")==0){
strcpy(z,"01000110011101001010111");
}
else if(strcmp(x,"100100011001")==0){
strcpy(z,"01000110011001111010110");
}
else if(strcmp(x,"100100011010")==0){
strcpy(z,"01000110010110101010110");
}
else if(strcmp(x,"100100011011")==0){
strcpy(z,"01000110010011011010110");
}
else if(strcmp(x,"100100011100")==0){
strcpy(z,"01000110010000001010111");
}
else if(strcmp(x,"100100011101")==0){
strcpy(z,"01000110001100111011000");
}
else if(strcmp(x,"100100011110")==0){
strcpy(z,"01000110001001101011001");
}
else if(strcmp(x,"100100011111")==0){
strcpy(z,"01000110000110011011100");
}
else if(strcmp(x,"100100100000")==0){
strcpy(z,"01000110000011001011110");
}
else if(strcmp(x,"100100100001")==0){
strcpy(z,"01000101111111111100001");
}
else if(strcmp(x,"100100100010")==0){
strcpy(z,"01000101111100101100101");
}
else if(strcmp(x,"100100100011")==0){
strcpy(z,"01000101111001011101001");
}
else if(strcmp(x,"100100100100")==0){
strcpy(z,"01000101110110001101110");
}
else if(strcmp(x,"100100100101")==0){
strcpy(z,"01000101110010111110011");
}
else if(strcmp(x,"100100100110")==0){
strcpy(z,"01000101101111101111001");
}
else if(strcmp(x,"100100100111")==0){
strcpy(z,"01000101101100011111111");
}
else if(strcmp(x,"100100101000")==0){
strcpy(z,"01000101101001010000110");
}
else if(strcmp(x,"100100101001")==0){
strcpy(z,"01000101100110000001110");
}
else if(strcmp(x,"100100101010")==0){
strcpy(z,"01000101100010110010101");
}
else if(strcmp(x,"100100101011")==0){
strcpy(z,"01000101011111100011110");
}
else if(strcmp(x,"100100101100")==0){
strcpy(z,"01000101011100010100111");
}
else if(strcmp(x,"100100101101")==0){
strcpy(z,"01000101011001000110000");
}
else if(strcmp(x,"100100101110")==0){
strcpy(z,"01000101010101110111010");
}
else if(strcmp(x,"100100101111")==0){
strcpy(z,"01000101010010101000100");
}
else if(strcmp(x,"100100110000")==0){
strcpy(z,"01000101001111011001111");
}
else if(strcmp(x,"100100110001")==0){
strcpy(z,"01000101001100001011011");
}
else if(strcmp(x,"100100110010")==0){
strcpy(z,"01000101001000111100110");
}
else if(strcmp(x,"100100110011")==0){
strcpy(z,"01000101000101101110011");
}
else if(strcmp(x,"100100110100")==0){
strcpy(z,"01000101000010100000000");
}
else if(strcmp(x,"100100110101")==0){
strcpy(z,"01000100111111010001101");
}
else if(strcmp(x,"100100110110")==0){
strcpy(z,"01000100111100000011011");
}
else if(strcmp(x,"100100110111")==0){
strcpy(z,"01000100111000110101010");
}
else if(strcmp(x,"100100111000")==0){
strcpy(z,"01000100110101100111001");
}
else if(strcmp(x,"100100111001")==0){
strcpy(z,"01000100110010011001000");
}
else if(strcmp(x,"100100111010")==0){
strcpy(z,"01000100101111001011000");
}
else if(strcmp(x,"100100111011")==0){
strcpy(z,"01000100101011111101001");
}
else if(strcmp(x,"100100111100")==0){
strcpy(z,"01000100101000101111010");
}
else if(strcmp(x,"100100111101")==0){
strcpy(z,"01000100100101100001011");
}
else if(strcmp(x,"100100111110")==0){
strcpy(z,"01000100100010010011110");
}
else if(strcmp(x,"100100111111")==0){
strcpy(z,"01000100011111000110000");
}
else if(strcmp(x,"100101000000")==0){
strcpy(z,"01000100011011111000011");
}
else if(strcmp(x,"100101000001")==0){
strcpy(z,"01000100011000101010111");
}
else if(strcmp(x,"100101000010")==0){
strcpy(z,"01000100010101011101011");
}
else if(strcmp(x,"100101000011")==0){
strcpy(z,"01000100010010001111111");
}
else if(strcmp(x,"100101000100")==0){
strcpy(z,"01000100001111000010101");
}
else if(strcmp(x,"100101000101")==0){
strcpy(z,"01000100001011110101010");
}
else if(strcmp(x,"100101000110")==0){
strcpy(z,"01000100001000101000000");
}
else if(strcmp(x,"100101000111")==0){
strcpy(z,"01000100000101011010111");
}
else if(strcmp(x,"100101001000")==0){
strcpy(z,"01000100000010001101110");
}
else if(strcmp(x,"100101001001")==0){
strcpy(z,"01000011111111000000110");
}
else if(strcmp(x,"100101001010")==0){
strcpy(z,"01000011111011110011110");
}
else if(strcmp(x,"100101001011")==0){
strcpy(z,"01000011111000100110111");
}
else if(strcmp(x,"100101001100")==0){
strcpy(z,"01000011110101011010000");
}
else if(strcmp(x,"100101001101")==0){
strcpy(z,"01000011110010001101001");
}
else if(strcmp(x,"100101001110")==0){
strcpy(z,"01000011101111000000100");
}
else if(strcmp(x,"100101001111")==0){
strcpy(z,"01000011101011110011110");
}
else if(strcmp(x,"100101010000")==0){
strcpy(z,"01000011101000100111010");
}
else if(strcmp(x,"100101010001")==0){
strcpy(z,"01000011100101011010101");
}
else if(strcmp(x,"100101010010")==0){
strcpy(z,"01000011100010001110001");
}
else if(strcmp(x,"100101010011")==0){
strcpy(z,"01000011011111000001110");
}
else if(strcmp(x,"100101010100")==0){
strcpy(z,"01000011011011110101011");
}
else if(strcmp(x,"100101010101")==0){
strcpy(z,"01000011011000101001001");
}
else if(strcmp(x,"100101010110")==0){
strcpy(z,"01000011010101011100111");
}
else if(strcmp(x,"100101010111")==0){
strcpy(z,"01000011010010010000110");
}
else if(strcmp(x,"100101011000")==0){
strcpy(z,"01000011001111000100101");
}
else if(strcmp(x,"100101011001")==0){
strcpy(z,"01000011001011111000101");
}
else if(strcmp(x,"100101011010")==0){
strcpy(z,"01000011001000101100101");
}
else if(strcmp(x,"100101011011")==0){
strcpy(z,"01000011000101100000110");
}
else if(strcmp(x,"100101011100")==0){
strcpy(z,"01000011000010010100111");
}
else if(strcmp(x,"100101011101")==0){
strcpy(z,"01000010111111001001001");
}
else if(strcmp(x,"100101011110")==0){
strcpy(z,"01000010111011111101011");
}
else if(strcmp(x,"100101011111")==0){
strcpy(z,"01000010111000110001110");
}
else if(strcmp(x,"100101100000")==0){
strcpy(z,"01000010110101100110001");
}
else if(strcmp(x,"100101100001")==0){
strcpy(z,"01000010110010011010101");
}
else if(strcmp(x,"100101100010")==0){
strcpy(z,"01000010101111001111001");
}
else if(strcmp(x,"100101100011")==0){
strcpy(z,"01000010101100000011110");
}
else if(strcmp(x,"100101100100")==0){
strcpy(z,"01000010101000111000011");
}
else if(strcmp(x,"100101100101")==0){
strcpy(z,"01000010100101101101001");
}
else if(strcmp(x,"100101100110")==0){
strcpy(z,"01000010100010100001111");
}
else if(strcmp(x,"100101100111")==0){
strcpy(z,"01000010011111010110110");
}
else if(strcmp(x,"100101101000")==0){
strcpy(z,"01000010011100001011101");
}
else if(strcmp(x,"100101101001")==0){
strcpy(z,"01000010011001000000101");
}
else if(strcmp(x,"100101101010")==0){
strcpy(z,"01000010010101110101101");
}
else if(strcmp(x,"100101101011")==0){
strcpy(z,"01000010010010101010110");
}
else if(strcmp(x,"100101101100")==0){
strcpy(z,"01000010001111011111111");
}
else if(strcmp(x,"100101101101")==0){
strcpy(z,"01000010001100010101001");
}
else if(strcmp(x,"100101101110")==0){
strcpy(z,"01000010001001001010011");
}
else if(strcmp(x,"100101101111")==0){
strcpy(z,"01000010000101111111110");
}
else if(strcmp(x,"100101110000")==0){
strcpy(z,"01000010000010110101001");
}
else if(strcmp(x,"100101110001")==0){
strcpy(z,"01000001111111101010101");
}
else if(strcmp(x,"100101110010")==0){
strcpy(z,"01000001111100100000001");
}
else if(strcmp(x,"100101110011")==0){
strcpy(z,"01000001111001010101110");
}
else if(strcmp(x,"100101110100")==0){
strcpy(z,"01000001110110001011011");
}
else if(strcmp(x,"100101110101")==0){
strcpy(z,"01000001110011000001001");
}
else if(strcmp(x,"100101110110")==0){
strcpy(z,"01000001101111110110111");
}
else if(strcmp(x,"100101110111")==0){
strcpy(z,"01000001101100101100110");
}
else if(strcmp(x,"100101111000")==0){
strcpy(z,"01000001101001100010101");
}
else if(strcmp(x,"100101111001")==0){
strcpy(z,"01000001100110011000101");
}
else if(strcmp(x,"100101111010")==0){
strcpy(z,"01000001100011001110101");
}
else if(strcmp(x,"100101111011")==0){
strcpy(z,"01000001100000000100110");
}
else if(strcmp(x,"100101111100")==0){
strcpy(z,"01000001011100111010111");
}
else if(strcmp(x,"100101111101")==0){
strcpy(z,"01000001011001110001001");
}
else if(strcmp(x,"100101111110")==0){
strcpy(z,"01000001010110100111011");
}
else if(strcmp(x,"100101111111")==0){
strcpy(z,"01000001010011011101101");
}
else if(strcmp(x,"100110000000")==0){
strcpy(z,"01000001010000010100001");
}
else if(strcmp(x,"100110000001")==0){
strcpy(z,"01000001001101001010100");
}
else if(strcmp(x,"100110000010")==0){
strcpy(z,"01000001001010000001000");
}
else if(strcmp(x,"100110000011")==0){
strcpy(z,"01000001000110110111101");
}
else if(strcmp(x,"100110000100")==0){
strcpy(z,"01000001000011101110010");
}
else if(strcmp(x,"100110000101")==0){
strcpy(z,"01000001000000100101000");
}
else if(strcmp(x,"100110000110")==0){
strcpy(z,"01000000111101011011110");
}
else if(strcmp(x,"100110000111")==0){
strcpy(z,"01000000111010010010101");
}
else if(strcmp(x,"100110001000")==0){
strcpy(z,"01000000110111001001100");
}
else if(strcmp(x,"100110001001")==0){
strcpy(z,"01000000110100000000011");
}
else if(strcmp(x,"100110001010")==0){
strcpy(z,"01000000110000110111100");
}
else if(strcmp(x,"100110001011")==0){
strcpy(z,"01000000101101101110100");
}
else if(strcmp(x,"100110001100")==0){
strcpy(z,"01000000101010100101101");
}
else if(strcmp(x,"100110001101")==0){
strcpy(z,"01000000100111011100111");
}
else if(strcmp(x,"100110001110")==0){
strcpy(z,"01000000100100010100001");
}
else if(strcmp(x,"100110001111")==0){
strcpy(z,"01000000100001001011011");
}
else if(strcmp(x,"100110010000")==0){
strcpy(z,"01000000011110000010111");
}
else if(strcmp(x,"100110010001")==0){
strcpy(z,"01000000011010111010010");
}
else if(strcmp(x,"100110010010")==0){
strcpy(z,"01000000010111110001110");
}
else if(strcmp(x,"100110010011")==0){
strcpy(z,"01000000010100101001011");
}
else if(strcmp(x,"100110010100")==0){
strcpy(z,"01000000010001100001000");
}
else if(strcmp(x,"100110010101")==0){
strcpy(z,"01000000001110011000101");
}
else if(strcmp(x,"100110010110")==0){
strcpy(z,"01000000001011010000011");
}
else if(strcmp(x,"100110010111")==0){
strcpy(z,"01000000001000001000010");
}
else if(strcmp(x,"100110011000")==0){
strcpy(z,"01000000000101000000001");
}
else if(strcmp(x,"100110011001")==0){
strcpy(z,"01000000000001111000000");
}
else if(strcmp(x,"100110011010")==0){
strcpy(z,"00111111111110110000000");
}
else if(strcmp(x,"100110011011")==0){
strcpy(z,"00111111111011101000000");
}
else if(strcmp(x,"100110011100")==0){
strcpy(z,"00111111111000100000001");
}
else if(strcmp(x,"100110011101")==0){
strcpy(z,"00111111110101011000011");
}
else if(strcmp(x,"100110011110")==0){
strcpy(z,"00111111110010010000101");
}
else if(strcmp(x,"100110011111")==0){
strcpy(z,"00111111101111001000111");
}
else if(strcmp(x,"100110100000")==0){
strcpy(z,"00111111101100000001010");
}
else if(strcmp(x,"100110100001")==0){
strcpy(z,"00111111101000111001101");
}
else if(strcmp(x,"100110100010")==0){
strcpy(z,"00111111100101110010001");
}
else if(strcmp(x,"100110100011")==0){
strcpy(z,"00111111100010101010110");
}
else if(strcmp(x,"100110100100")==0){
strcpy(z,"00111111011111100011010");
}
else if(strcmp(x,"100110100101")==0){
strcpy(z,"00111111011100011100000");
}
else if(strcmp(x,"100110100110")==0){
strcpy(z,"00111111011001010100101");
}
else if(strcmp(x,"100110100111")==0){
strcpy(z,"00111111010110001101100");
}
else if(strcmp(x,"100110101000")==0){
strcpy(z,"00111111010011000110011");
}
else if(strcmp(x,"100110101001")==0){
strcpy(z,"00111111001111111111010");
}
else if(strcmp(x,"100110101010")==0){
strcpy(z,"00111111001100111000010");
}
else if(strcmp(x,"100110101011")==0){
strcpy(z,"00111111001001110001010");
}
else if(strcmp(x,"100110101100")==0){
strcpy(z,"00111111000110101010010");
}
else if(strcmp(x,"100110101101")==0){
strcpy(z,"00111111000011100011100");
}
else if(strcmp(x,"100110101110")==0){
strcpy(z,"00111111000000011100101");
}
else if(strcmp(x,"100110101111")==0){
strcpy(z,"00111110111101010101111");
}
else if(strcmp(x,"100110110000")==0){
strcpy(z,"00111110111010001111010");
}
else if(strcmp(x,"100110110001")==0){
strcpy(z,"00111110110111001000101");
}
else if(strcmp(x,"100110110010")==0){
strcpy(z,"00111110110100000010001");
}
else if(strcmp(x,"100110110011")==0){
strcpy(z,"00111110110000111011101");
}
else if(strcmp(x,"100110110100")==0){
strcpy(z,"00111110101101110101001");
}
else if(strcmp(x,"100110110101")==0){
strcpy(z,"00111110101010101110111");
}
else if(strcmp(x,"100110110110")==0){
strcpy(z,"00111110100111101000100");
}
else if(strcmp(x,"100110110111")==0){
strcpy(z,"00111110100100100010010");
}
else if(strcmp(x,"100110111000")==0){
strcpy(z,"00111110100001011100001");
}
else if(strcmp(x,"100110111001")==0){
strcpy(z,"00111110011110010110000");
}
else if(strcmp(x,"100110111010")==0){
strcpy(z,"00111110011011001111111");
}
else if(strcmp(x,"100110111011")==0){
strcpy(z,"00111110011000001001111");
}
else if(strcmp(x,"100110111100")==0){
strcpy(z,"00111110010101000011111");
}
else if(strcmp(x,"100110111101")==0){
strcpy(z,"00111110010001111110000");
}
else if(strcmp(x,"100110111110")==0){
strcpy(z,"00111110001110111000010");
}
else if(strcmp(x,"100110111111")==0){
strcpy(z,"00111110001011110010100");
}
else if(strcmp(x,"100111000000")==0){
strcpy(z,"00111110001000101100110");
}
else if(strcmp(x,"100111000001")==0){
strcpy(z,"00111110000101100111001");
}
else if(strcmp(x,"100111000010")==0){
strcpy(z,"00111110000010100001100");
}
else if(strcmp(x,"100111000011")==0){
strcpy(z,"00111101111111011100000");
}
else if(strcmp(x,"100111000100")==0){
strcpy(z,"00111101111100010110100");
}
else if(strcmp(x,"100111000101")==0){
strcpy(z,"00111101111001010001001");
}
else if(strcmp(x,"100111000110")==0){
strcpy(z,"00111101110110001011110");
}
else if(strcmp(x,"100111000111")==0){
strcpy(z,"00111101110011000110100");
}
else if(strcmp(x,"100111001000")==0){
strcpy(z,"00111101110000000001010");
}
else if(strcmp(x,"100111001001")==0){
strcpy(z,"00111101101100111100001");
}
else if(strcmp(x,"100111001010")==0){
strcpy(z,"00111101101001110111000");
}
else if(strcmp(x,"100111001011")==0){
strcpy(z,"00111101100110110001111");
}
else if(strcmp(x,"100111001100")==0){
strcpy(z,"00111101100011101100111");
}
else if(strcmp(x,"100111001101")==0){
strcpy(z,"00111101100000101000000");
}
else if(strcmp(x,"100111001110")==0){
strcpy(z,"00111101011101100011001");
}
else if(strcmp(x,"100111001111")==0){
strcpy(z,"00111101011010011110011");
}
else if(strcmp(x,"100111010000")==0){
strcpy(z,"00111101010111011001101");
}
else if(strcmp(x,"100111010001")==0){
strcpy(z,"00111101010100010100111");
}
else if(strcmp(x,"100111010010")==0){
strcpy(z,"00111101010001010000010");
}
else if(strcmp(x,"100111010011")==0){
strcpy(z,"00111101001110001011101");
}
else if(strcmp(x,"100111010100")==0){
strcpy(z,"00111101001011000111001");
}
else if(strcmp(x,"100111010101")==0){
strcpy(z,"00111101001000000010110");
}
else if(strcmp(x,"100111010110")==0){
strcpy(z,"00111101000100111110011");
}
else if(strcmp(x,"100111010111")==0){
strcpy(z,"00111101000001111010000");
}
else if(strcmp(x,"100111011000")==0){
strcpy(z,"00111100111110110101110");
}
else if(strcmp(x,"100111011001")==0){
strcpy(z,"00111100111011110001100");
}
else if(strcmp(x,"100111011010")==0){
strcpy(z,"00111100111000101101011");
}
else if(strcmp(x,"100111011011")==0){
strcpy(z,"00111100110101101001010");
}
else if(strcmp(x,"100111011100")==0){
strcpy(z,"00111100110010100101010");
}
else if(strcmp(x,"100111011101")==0){
strcpy(z,"00111100101111100001010");
}
else if(strcmp(x,"100111011110")==0){
strcpy(z,"00111100101100011101010");
}
else if(strcmp(x,"100111011111")==0){
strcpy(z,"00111100101001011001100");
}
else if(strcmp(x,"100111100000")==0){
strcpy(z,"00111100100110010101101");
}
else if(strcmp(x,"100111100001")==0){
strcpy(z,"00111100100011010001111");
}
else if(strcmp(x,"100111100010")==0){
strcpy(z,"00111100100000001110010");
}
else if(strcmp(x,"100111100011")==0){
strcpy(z,"00111100011101001010101");
}
else if(strcmp(x,"100111100100")==0){
strcpy(z,"00111100011010000111000");
}
else if(strcmp(x,"100111100101")==0){
strcpy(z,"00111100010111000011100");
}
else if(strcmp(x,"100111100110")==0){
strcpy(z,"00111100010100000000001");
}
else if(strcmp(x,"100111100111")==0){
strcpy(z,"00111100010000111100110");
}
else if(strcmp(x,"100111101000")==0){
strcpy(z,"00111100001101111001011");
}
else if(strcmp(x,"100111101001")==0){
strcpy(z,"00111100001010110110001");
}
else if(strcmp(x,"100111101010")==0){
strcpy(z,"00111100000111110010111");
}
else if(strcmp(x,"100111101011")==0){
strcpy(z,"00111100000100101111110");
}
else if(strcmp(x,"100111101100")==0){
strcpy(z,"00111100000001101100101");
}
else if(strcmp(x,"100111101101")==0){
strcpy(z,"00111011111110101001101");
}
else if(strcmp(x,"100111101110")==0){
strcpy(z,"00111011111011100110101");
}
else if(strcmp(x,"100111101111")==0){
strcpy(z,"00111011111000100011110");
}
else if(strcmp(x,"100111110000")==0){
strcpy(z,"00111011110101100000111");
}
else if(strcmp(x,"100111110001")==0){
strcpy(z,"00111011110010011110000");
}
else if(strcmp(x,"100111110010")==0){
strcpy(z,"00111011101111011011010");
}
else if(strcmp(x,"100111110011")==0){
strcpy(z,"00111011101100011000101");
}
else if(strcmp(x,"100111110100")==0){
strcpy(z,"00111011101001010110000");
}
else if(strcmp(x,"100111110101")==0){
strcpy(z,"00111011100110010011011");
}
else if(strcmp(x,"100111110110")==0){
strcpy(z,"00111011100011010000111");
}
else if(strcmp(x,"100111110111")==0){
strcpy(z,"00111011100000001110100");
}
else if(strcmp(x,"100111111000")==0){
strcpy(z,"00111011011101001100001");
}
else if(strcmp(x,"100111111001")==0){
strcpy(z,"00111011011010001001110");
}
else if(strcmp(x,"100111111010")==0){
strcpy(z,"00111011010111000111100");
}
else if(strcmp(x,"100111111011")==0){
strcpy(z,"00111011010100000101010");
}
else if(strcmp(x,"100111111100")==0){
strcpy(z,"00111011010001000011001");
}
else if(strcmp(x,"100111111101")==0){
strcpy(z,"00111011001110000001000");
}
else if(strcmp(x,"100111111110")==0){
strcpy(z,"00111011001010111111000");
}
else if(strcmp(x,"100111111111")==0){
strcpy(z,"00111011000111111101000");
}
else if(strcmp(x,"101000000000")==0){
strcpy(z,"00111011000100111011001");
}
else if(strcmp(x,"101000000001")==0){
strcpy(z,"00111011000001111001010");
}
else if(strcmp(x,"101000000010")==0){
strcpy(z,"00111010111110110111011");
}
else if(strcmp(x,"101000000011")==0){
strcpy(z,"00111010111011110101101");
}
else if(strcmp(x,"101000000100")==0){
strcpy(z,"00111010111000110100000");
}
else if(strcmp(x,"101000000101")==0){
strcpy(z,"00111010110101110010011");
}
else if(strcmp(x,"101000000110")==0){
strcpy(z,"00111010110010110000110");
}
else if(strcmp(x,"101000000111")==0){
strcpy(z,"00111010101111101111010");
}
else if(strcmp(x,"101000001000")==0){
strcpy(z,"00111010101100101101110");
}
else if(strcmp(x,"101000001001")==0){
strcpy(z,"00111010101001101100011");
}
else if(strcmp(x,"101000001010")==0){
strcpy(z,"00111010100110101011000");
}
else if(strcmp(x,"101000001011")==0){
strcpy(z,"00111010100011101001110");
}
else if(strcmp(x,"101000001100")==0){
strcpy(z,"00111010100000101000100");
}
else if(strcmp(x,"101000001101")==0){
strcpy(z,"00111010011101100111011");
}
else if(strcmp(x,"101000001110")==0){
strcpy(z,"00111010011010100110010");
}
else if(strcmp(x,"101000001111")==0){
strcpy(z,"00111010010111100101010");
}
else if(strcmp(x,"101000010000")==0){
strcpy(z,"00111010010100100100010");
}
else if(strcmp(x,"101000010001")==0){
strcpy(z,"00111010010001100011010");
}
else if(strcmp(x,"101000010010")==0){
strcpy(z,"00111010001110100010011");
}
else if(strcmp(x,"101000010011")==0){
strcpy(z,"00111010001011100001101");
}
else if(strcmp(x,"101000010100")==0){
strcpy(z,"00111010001000100000111");
}
else if(strcmp(x,"101000010101")==0){
strcpy(z,"00111010000101100000001");
}
else if(strcmp(x,"101000010110")==0){
strcpy(z,"00111010000010011111100");
}
else if(strcmp(x,"101000010111")==0){
strcpy(z,"00111001111111011110111");
}
else if(strcmp(x,"101000011000")==0){
strcpy(z,"00111001111100011110011");
}
else if(strcmp(x,"101000011001")==0){
strcpy(z,"00111001111001011101111");
}
else if(strcmp(x,"101000011010")==0){
strcpy(z,"00111001110110011101100");
}
else if(strcmp(x,"101000011011")==0){
strcpy(z,"00111001110011011101001");
}
else if(strcmp(x,"101000011100")==0){
strcpy(z,"00111001110000011100110");
}
else if(strcmp(x,"101000011101")==0){
strcpy(z,"00111001101101011100100");
}
else if(strcmp(x,"101000011110")==0){
strcpy(z,"00111001101010011100011");
}
else if(strcmp(x,"101000011111")==0){
strcpy(z,"00111001100111011100010");
}
else if(strcmp(x,"101000100000")==0){
strcpy(z,"00111001100100011100001");
}
else if(strcmp(x,"101000100001")==0){
strcpy(z,"00111001100001011100001");
}
else if(strcmp(x,"101000100010")==0){
strcpy(z,"00111001011110011100010");
}
else if(strcmp(x,"101000100011")==0){
strcpy(z,"00111001011011011100010");
}
else if(strcmp(x,"101000100100")==0){
strcpy(z,"00111001011000011100100");
}
else if(strcmp(x,"101000100101")==0){
strcpy(z,"00111001010101011100101");
}
else if(strcmp(x,"101000100110")==0){
strcpy(z,"00111001010010011101000");
}
else if(strcmp(x,"101000100111")==0){
strcpy(z,"00111001001111011101010");
}
else if(strcmp(x,"101000101000")==0){
strcpy(z,"00111001001100011101101");
}
else if(strcmp(x,"101000101001")==0){
strcpy(z,"00111001001001011110001");
}
else if(strcmp(x,"101000101010")==0){
strcpy(z,"00111001000110011110101");
}
else if(strcmp(x,"101000101011")==0){
strcpy(z,"00111001000011011111001");
}
else if(strcmp(x,"101000101100")==0){
strcpy(z,"00111001000000011111110");
}
else if(strcmp(x,"101000101101")==0){
strcpy(z,"00111000111101100000100");
}
else if(strcmp(x,"101000101110")==0){
strcpy(z,"00111000111010100001010");
}
else if(strcmp(x,"101000101111")==0){
strcpy(z,"00111000110111100010000");
}
else if(strcmp(x,"101000110000")==0){
strcpy(z,"00111000110100100010111");
}
else if(strcmp(x,"101000110001")==0){
strcpy(z,"00111000110001100011110");
}
else if(strcmp(x,"101000110010")==0){
strcpy(z,"00111000101110100100101");
}
else if(strcmp(x,"101000110011")==0){
strcpy(z,"00111000101011100101110");
}
else if(strcmp(x,"101000110100")==0){
strcpy(z,"00111000101000100110110");
}
else if(strcmp(x,"101000110101")==0){
strcpy(z,"00111000100101100111111");
}
else if(strcmp(x,"101000110110")==0){
strcpy(z,"00111000100010101001001");
}
else if(strcmp(x,"101000110111")==0){
strcpy(z,"00111000011111101010011");
}
else if(strcmp(x,"101000111000")==0){
strcpy(z,"00111000011100101011101");
}
else if(strcmp(x,"101000111001")==0){
strcpy(z,"00111000011001101101000");
}
else if(strcmp(x,"101000111010")==0){
strcpy(z,"00111000010110101110011");
}
else if(strcmp(x,"101000111011")==0){
strcpy(z,"00111000010011101111111");
}
else if(strcmp(x,"101000111100")==0){
strcpy(z,"00111000010000110001011");
}
else if(strcmp(x,"101000111101")==0){
strcpy(z,"00111000001101110011000");
}
else if(strcmp(x,"101000111110")==0){
strcpy(z,"00111000001010110100101");
}
else if(strcmp(x,"101000111111")==0){
strcpy(z,"00111000000111110110011");
}
else if(strcmp(x,"101001000000")==0){
strcpy(z,"00111000000100111000001");
}
else if(strcmp(x,"101001000001")==0){
strcpy(z,"00111000000001111001111");
}
else if(strcmp(x,"101001000010")==0){
strcpy(z,"00110111111110111011110");
}
else if(strcmp(x,"101001000011")==0){
strcpy(z,"00110111111011111101101");
}
else if(strcmp(x,"101001000100")==0){
strcpy(z,"00110111111000111111101");
}
else if(strcmp(x,"101001000101")==0){
strcpy(z,"00110111110110000001110");
}
else if(strcmp(x,"101001000110")==0){
strcpy(z,"00110111110011000011110");
}
else if(strcmp(x,"101001000111")==0){
strcpy(z,"00110111110000000101111");
}
else if(strcmp(x,"101001001000")==0){
strcpy(z,"00110111101101001000001");
}
else if(strcmp(x,"101001001001")==0){
strcpy(z,"00110111101010001010011");
}
else if(strcmp(x,"101001001010")==0){
strcpy(z,"00110111100111001100110");
}
else if(strcmp(x,"101001001011")==0){
strcpy(z,"00110111100100001111001");
}
else if(strcmp(x,"101001001100")==0){
strcpy(z,"00110111100001010001100");
}
else if(strcmp(x,"101001001101")==0){
strcpy(z,"00110111011110010100000");
}
else if(strcmp(x,"101001001110")==0){
strcpy(z,"00110111011011010110101");
}
else if(strcmp(x,"101001001111")==0){
strcpy(z,"00110111011000011001001");
}
else if(strcmp(x,"101001010000")==0){
strcpy(z,"00110111010101011011111");
}
else if(strcmp(x,"101001010001")==0){
strcpy(z,"00110111010010011110100");
}
else if(strcmp(x,"101001010010")==0){
strcpy(z,"00110111001111100001010");
}
else if(strcmp(x,"101001010011")==0){
strcpy(z,"00110111001100100100001");
}
else if(strcmp(x,"101001010100")==0){
strcpy(z,"00110111001001100111000");
}
else if(strcmp(x,"101001010101")==0){
strcpy(z,"00110111000110101010000");
}
else if(strcmp(x,"101001010110")==0){
strcpy(z,"00110111000011101101000");
}
else if(strcmp(x,"101001010111")==0){
strcpy(z,"00110111000000110000000");
}
else if(strcmp(x,"101001011000")==0){
strcpy(z,"00110110111101110011001");
}
else if(strcmp(x,"101001011001")==0){
strcpy(z,"00110110111010110110010");
}
else if(strcmp(x,"101001011010")==0){
strcpy(z,"00110110110111111001100");
}
else if(strcmp(x,"101001011011")==0){
strcpy(z,"00110110110100111100110");
}
else if(strcmp(x,"101001011100")==0){
strcpy(z,"00110110110010000000001");
}
else if(strcmp(x,"101001011101")==0){
strcpy(z,"00110110101111000011100");
}
else if(strcmp(x,"101001011110")==0){
strcpy(z,"00110110101100000110111");
}
else if(strcmp(x,"101001011111")==0){
strcpy(z,"00110110101001001010011");
}
else if(strcmp(x,"101001100000")==0){
strcpy(z,"00110110100110001110000");
}
else if(strcmp(x,"101001100001")==0){
strcpy(z,"00110110100011010001100");
}
else if(strcmp(x,"101001100010")==0){
strcpy(z,"00110110100000010101010");
}
else if(strcmp(x,"101001100011")==0){
strcpy(z,"00110110011101011001000");
}
else if(strcmp(x,"101001100100")==0){
strcpy(z,"00110110011010011100110");
}
else if(strcmp(x,"101001100101")==0){
strcpy(z,"00110110010111100000100");
}
else if(strcmp(x,"101001100110")==0){
strcpy(z,"00110110010100100100100");
}
else if(strcmp(x,"101001100111")==0){
strcpy(z,"00110110010001101000011");
}
else if(strcmp(x,"101001101000")==0){
strcpy(z,"00110110001110101100011");
}
else if(strcmp(x,"101001101001")==0){
strcpy(z,"00110110001011110000100");
}
else if(strcmp(x,"101001101010")==0){
strcpy(z,"00110110001000110100100");
}
else if(strcmp(x,"101001101011")==0){
strcpy(z,"00110110000101111000110");
}
else if(strcmp(x,"101001101100")==0){
strcpy(z,"00110110000010111100111");
}
else if(strcmp(x,"101001101101")==0){
strcpy(z,"00110110000000000001010");
}
else if(strcmp(x,"101001101110")==0){
strcpy(z,"00110101111101000101100");
}
else if(strcmp(x,"101001101111")==0){
strcpy(z,"00110101111010001001111");
}
else if(strcmp(x,"101001110000")==0){
strcpy(z,"00110101110111001110011");
}
else if(strcmp(x,"101001110001")==0){
strcpy(z,"00110101110100010010111");
}
else if(strcmp(x,"101001110010")==0){
strcpy(z,"00110101110001010111011");
}
else if(strcmp(x,"101001110011")==0){
strcpy(z,"00110101101110011100000");
}
else if(strcmp(x,"101001110100")==0){
strcpy(z,"00110101101011100000110");
}
else if(strcmp(x,"101001110101")==0){
strcpy(z,"00110101101000100101011");
}
else if(strcmp(x,"101001110110")==0){
strcpy(z,"00110101100101101010010");
}
else if(strcmp(x,"101001110111")==0){
strcpy(z,"00110101100010101111000");
}
else if(strcmp(x,"101001111000")==0){
strcpy(z,"00110101011111110011111");
}
else if(strcmp(x,"101001111001")==0){
strcpy(z,"00110101011100111000111");
}
else if(strcmp(x,"101001111010")==0){
strcpy(z,"00110101011001111101111");
}
else if(strcmp(x,"101001111011")==0){
strcpy(z,"00110101010111000010111");
}
else if(strcmp(x,"101001111100")==0){
strcpy(z,"00110101010100001000000");
}
else if(strcmp(x,"101001111101")==0){
strcpy(z,"00110101010001001101001");
}
else if(strcmp(x,"101001111110")==0){
strcpy(z,"00110101001110010010011");
}
else if(strcmp(x,"101001111111")==0){
strcpy(z,"00110101001011010111101");
}
else if(strcmp(x,"101010000000")==0){
strcpy(z,"00110101001000011101000");
}
else if(strcmp(x,"101010000001")==0){
strcpy(z,"00110101000101100010011");
}
else if(strcmp(x,"101010000010")==0){
strcpy(z,"00110101000010100111110");
}
else if(strcmp(x,"101010000011")==0){
strcpy(z,"00110100111111101101010");
}
else if(strcmp(x,"101010000100")==0){
strcpy(z,"00110100111100110010111");
}
else if(strcmp(x,"101010000101")==0){
strcpy(z,"00110100111001111000100");
}
else if(strcmp(x,"101010000110")==0){
strcpy(z,"00110100110110111110001");
}
else if(strcmp(x,"101010000111")==0){
strcpy(z,"00110100110100000011110");
}
else if(strcmp(x,"101010001000")==0){
strcpy(z,"00110100110001001001101");
}
else if(strcmp(x,"101010001001")==0){
strcpy(z,"00110100101110001111011");
}
else if(strcmp(x,"101010001010")==0){
strcpy(z,"00110100101011010101010");
}
else if(strcmp(x,"101010001011")==0){
strcpy(z,"00110100101000011011010");
}
else if(strcmp(x,"101010001100")==0){
strcpy(z,"00110100100101100001001");
}
else if(strcmp(x,"101010001101")==0){
strcpy(z,"00110100100010100111010");
}
else if(strcmp(x,"101010001110")==0){
strcpy(z,"00110100011111101101011");
}
else if(strcmp(x,"101010001111")==0){
strcpy(z,"00110100011100110011100");
}
else if(strcmp(x,"101010010000")==0){
strcpy(z,"00110100011001111001101");
}
else if(strcmp(x,"101010010001")==0){
strcpy(z,"00110100010110111111111");
}
else if(strcmp(x,"101010010010")==0){
strcpy(z,"00110100010100000110010");
}
else if(strcmp(x,"101010010011")==0){
strcpy(z,"00110100010001001100101");
}
else if(strcmp(x,"101010010100")==0){
strcpy(z,"00110100001110010011000");
}
else if(strcmp(x,"101010010101")==0){
strcpy(z,"00110100001011011001100");
}
else if(strcmp(x,"101010010110")==0){
strcpy(z,"00110100001000100000000");
}
else if(strcmp(x,"101010010111")==0){
strcpy(z,"00110100000101100110101");
}
else if(strcmp(x,"101010011000")==0){
strcpy(z,"00110100000010101101010");
}
else if(strcmp(x,"101010011001")==0){
strcpy(z,"00110011111111110100000");
}
else if(strcmp(x,"101010011010")==0){
strcpy(z,"00110011111100111010110");
}
else if(strcmp(x,"101010011011")==0){
strcpy(z,"00110011111010000001100");
}
else if(strcmp(x,"101010011100")==0){
strcpy(z,"00110011110111001000011");
}
else if(strcmp(x,"101010011101")==0){
strcpy(z,"00110011110100001111010");
}
else if(strcmp(x,"101010011110")==0){
strcpy(z,"00110011110001010110010");
}
else if(strcmp(x,"101010011111")==0){
strcpy(z,"00110011101110011101010");
}
else if(strcmp(x,"101010100000")==0){
strcpy(z,"00110011101011100100011");
}
else if(strcmp(x,"101010100001")==0){
strcpy(z,"00110011101000101011100");
}
else if(strcmp(x,"101010100010")==0){
strcpy(z,"00110011100101110010101");
}
else if(strcmp(x,"101010100011")==0){
strcpy(z,"00110011100010111001111");
}
else if(strcmp(x,"101010100100")==0){
strcpy(z,"00110011100000000001010");
}
else if(strcmp(x,"101010100101")==0){
strcpy(z,"00110011011101001000100");
}
else if(strcmp(x,"101010100110")==0){
strcpy(z,"00110011011010010000000");
}
else if(strcmp(x,"101010100111")==0){
strcpy(z,"00110011010111010111011");
}
else if(strcmp(x,"101010101000")==0){
strcpy(z,"00110011010100011110111");
}
else if(strcmp(x,"101010101001")==0){
strcpy(z,"00110011010001100110100");
}
else if(strcmp(x,"101010101010")==0){
strcpy(z,"00110011001110101110001");
}
else if(strcmp(x,"101010101011")==0){
strcpy(z,"00110011001011110101110");
}
else if(strcmp(x,"101010101100")==0){
strcpy(z,"00110011001000111101100");
}
else if(strcmp(x,"101010101101")==0){
strcpy(z,"00110011000110000101010");
}
else if(strcmp(x,"101010101110")==0){
strcpy(z,"00110011000011001101001");
}
else if(strcmp(x,"101010101111")==0){
strcpy(z,"00110011000000010101000");
}
else if(strcmp(x,"101010110000")==0){
strcpy(z,"00110010111101011100111");
}
else if(strcmp(x,"101010110001")==0){
strcpy(z,"00110010111010100100111");
}
else if(strcmp(x,"101010110010")==0){
strcpy(z,"00110010110111101101000");
}
else if(strcmp(x,"101010110011")==0){
strcpy(z,"00110010110100110101001");
}
else if(strcmp(x,"101010110100")==0){
strcpy(z,"00110010110001111101010");
}
else if(strcmp(x,"101010110101")==0){
strcpy(z,"00110010101111000101100");
}
else if(strcmp(x,"101010110110")==0){
strcpy(z,"00110010101100001101110");
}
else if(strcmp(x,"101010110111")==0){
strcpy(z,"00110010101001010110000");
}
else if(strcmp(x,"101010111000")==0){
strcpy(z,"00110010100110011110011");
}
else if(strcmp(x,"101010111001")==0){
strcpy(z,"00110010100011100110111");
}
else if(strcmp(x,"101010111010")==0){
strcpy(z,"00110010100000101111010");
}
else if(strcmp(x,"101010111011")==0){
strcpy(z,"00110010011101110111111");
}
else if(strcmp(x,"101010111100")==0){
strcpy(z,"00110010011011000000011");
}
else if(strcmp(x,"101010111101")==0){
strcpy(z,"00110010011000001001000");
}
else if(strcmp(x,"101010111110")==0){
strcpy(z,"00110010010101010001110");
}
else if(strcmp(x,"101010111111")==0){
strcpy(z,"00110010010010011010100");
}
else if(strcmp(x,"101011000000")==0){
strcpy(z,"00110010001111100011010");
}
else if(strcmp(x,"101011000001")==0){
strcpy(z,"00110010001100101100001");
}
else if(strcmp(x,"101011000010")==0){
strcpy(z,"00110010001001110101000");
}
else if(strcmp(x,"101011000011")==0){
strcpy(z,"00110010000110111110000");
}
else if(strcmp(x,"101011000100")==0){
strcpy(z,"00110010000100000111000");
}
else if(strcmp(x,"101011000101")==0){
strcpy(z,"00110010000001010000001");
}
else if(strcmp(x,"101011000110")==0){
strcpy(z,"00110001111110011001010");
}
else if(strcmp(x,"101011000111")==0){
strcpy(z,"00110001111011100010011");
}
else if(strcmp(x,"101011001000")==0){
strcpy(z,"00110001111000101011101");
}
else if(strcmp(x,"101011001001")==0){
strcpy(z,"00110001110101110100111");
}
else if(strcmp(x,"101011001010")==0){
strcpy(z,"00110001110010111110010");
}
else if(strcmp(x,"101011001011")==0){
strcpy(z,"00110001110000000111101");
}
else if(strcmp(x,"101011001100")==0){
strcpy(z,"00110001101101010001000");
}
else if(strcmp(x,"101011001101")==0){
strcpy(z,"00110001101010011010100");
}
else if(strcmp(x,"101011001110")==0){
strcpy(z,"00110001100111100100001");
}
else if(strcmp(x,"101011001111")==0){
strcpy(z,"00110001100100101101110");
}
else if(strcmp(x,"101011010000")==0){
strcpy(z,"00110001100001110111011");
}
else if(strcmp(x,"101011010001")==0){
strcpy(z,"00110001011111000001000");
}
else if(strcmp(x,"101011010010")==0){
strcpy(z,"00110001011100001010111");
}
else if(strcmp(x,"101011010011")==0){
strcpy(z,"00110001011001010100101");
}
else if(strcmp(x,"101011010100")==0){
strcpy(z,"00110001010110011110100");
}
else if(strcmp(x,"101011010101")==0){
strcpy(z,"00110001010011101000011");
}
else if(strcmp(x,"101011010110")==0){
strcpy(z,"00110001010000110010011");
}
else if(strcmp(x,"101011010111")==0){
strcpy(z,"00110001001101111100011");
}
else if(strcmp(x,"101011011000")==0){
strcpy(z,"00110001001011000110100");
}
else if(strcmp(x,"101011011001")==0){
strcpy(z,"00110001001000010000101");
}
else if(strcmp(x,"101011011010")==0){
strcpy(z,"00110001000101011010110");
}
else if(strcmp(x,"101011011011")==0){
strcpy(z,"00110001000010100101000");
}
else if(strcmp(x,"101011011100")==0){
strcpy(z,"00110000111111101111011");
}
else if(strcmp(x,"101011011101")==0){
strcpy(z,"00110000111100111001101");
}
else if(strcmp(x,"101011011110")==0){
strcpy(z,"00110000111010000100000");
}
else if(strcmp(x,"101011011111")==0){
strcpy(z,"00110000110111001110100");
}
else if(strcmp(x,"101011100000")==0){
strcpy(z,"00110000110100011001000");
}
else if(strcmp(x,"101011100001")==0){
strcpy(z,"00110000110001100011100");
}
else if(strcmp(x,"101011100010")==0){
strcpy(z,"00110000101110101110001");
}
else if(strcmp(x,"101011100011")==0){
strcpy(z,"00110000101011111000111");
}
else if(strcmp(x,"101011100100")==0){
strcpy(z,"00110000101001000011100");
}
else if(strcmp(x,"101011100101")==0){
strcpy(z,"00110000100110001110010");
}
else if(strcmp(x,"101011100110")==0){
strcpy(z,"00110000100011011001001");
}
else if(strcmp(x,"101011100111")==0){
strcpy(z,"00110000100000100100000");
}
else if(strcmp(x,"101011101000")==0){
strcpy(z,"00110000011101101110111");
}
else if(strcmp(x,"101011101001")==0){
strcpy(z,"00110000011010111001111");
}
else if(strcmp(x,"101011101010")==0){
strcpy(z,"00110000011000000100111");
}
else if(strcmp(x,"101011101011")==0){
strcpy(z,"00110000010101010000000");
}
else if(strcmp(x,"101011101100")==0){
strcpy(z,"00110000010010011011001");
}
else if(strcmp(x,"101011101101")==0){
strcpy(z,"00110000001111100110010");
}
else if(strcmp(x,"101011101110")==0){
strcpy(z,"00110000001100110001100");
}
else if(strcmp(x,"101011101111")==0){
strcpy(z,"00110000001001111100111");
}
else if(strcmp(x,"101011110000")==0){
strcpy(z,"00110000000111001000001");
}
else if(strcmp(x,"101011110001")==0){
strcpy(z,"00110000000100010011100");
}
else if(strcmp(x,"101011110010")==0){
strcpy(z,"00110000000001011111000");
}
else if(strcmp(x,"101011110011")==0){
strcpy(z,"00101111111110101010100");
}
else if(strcmp(x,"101011110100")==0){
strcpy(z,"00101111111011110110000");
}
else if(strcmp(x,"101011110101")==0){
strcpy(z,"00101111111001000001101");
}
else if(strcmp(x,"101011110110")==0){
strcpy(z,"00101111110110001101011");
}
else if(strcmp(x,"101011110111")==0){
strcpy(z,"00101111110011011001000");
}
else if(strcmp(x,"101011111000")==0){
strcpy(z,"00101111110000100100110");
}
else if(strcmp(x,"101011111001")==0){
strcpy(z,"00101111101101110000101");
}
else if(strcmp(x,"101011111010")==0){
strcpy(z,"00101111101010111100100");
}
else if(strcmp(x,"101011111011")==0){
strcpy(z,"00101111101000001000011");
}
else if(strcmp(x,"101011111100")==0){
strcpy(z,"00101111100101010100011");
}
else if(strcmp(x,"101011111101")==0){
strcpy(z,"00101111100010100000011");
}
else if(strcmp(x,"101011111110")==0){
strcpy(z,"00101111011111101100100");
}
else if(strcmp(x,"101011111111")==0){
strcpy(z,"00101111011100111000101");
}
else if(strcmp(x,"101100000000")==0){
strcpy(z,"00101111011010000100110");
}
else if(strcmp(x,"101100000001")==0){
strcpy(z,"00101111010111010001000");
}
else if(strcmp(x,"101100000010")==0){
strcpy(z,"00101111010100011101010");
}
else if(strcmp(x,"101100000011")==0){
strcpy(z,"00101111010001101001101");
}
else if(strcmp(x,"101100000100")==0){
strcpy(z,"00101111001110110110000");
}
else if(strcmp(x,"101100000101")==0){
strcpy(z,"00101111001100000010011");
}
else if(strcmp(x,"101100000110")==0){
strcpy(z,"00101111001001001110111");
}
else if(strcmp(x,"101100000111")==0){
strcpy(z,"00101111000110011011011");
}
else if(strcmp(x,"101100001000")==0){
strcpy(z,"00101111000011101000000");
}
else if(strcmp(x,"101100001001")==0){
strcpy(z,"00101111000000110100101");
}
else if(strcmp(x,"101100001010")==0){
strcpy(z,"00101110111110000001011");
}
else if(strcmp(x,"101100001011")==0){
strcpy(z,"00101110111011001110001");
}
else if(strcmp(x,"101100001100")==0){
strcpy(z,"00101110111000011010111");
}
else if(strcmp(x,"101100001101")==0){
strcpy(z,"00101110110101100111110");
}
else if(strcmp(x,"101100001110")==0){
strcpy(z,"00101110110010110100101");
}
else if(strcmp(x,"101100001111")==0){
strcpy(z,"00101110110000000001101");
}
else if(strcmp(x,"101100010000")==0){
strcpy(z,"00101110101101001110101");
}
else if(strcmp(x,"101100010001")==0){
strcpy(z,"00101110101010011011110");
}
else if(strcmp(x,"101100010010")==0){
strcpy(z,"00101110100111101000110");
}
else if(strcmp(x,"101100010011")==0){
strcpy(z,"00101110100100110110000");
}
else if(strcmp(x,"101100010100")==0){
strcpy(z,"00101110100010000011001");
}
else if(strcmp(x,"101100010101")==0){
strcpy(z,"00101110011111010000100");
}
else if(strcmp(x,"101100010110")==0){
strcpy(z,"00101110011100011101110");
}
else if(strcmp(x,"101100010111")==0){
strcpy(z,"00101110011001101011001");
}
else if(strcmp(x,"101100011000")==0){
strcpy(z,"00101110010110111000100");
}
else if(strcmp(x,"101100011001")==0){
strcpy(z,"00101110010100000110000");
}
else if(strcmp(x,"101100011010")==0){
strcpy(z,"00101110010001010011100");
}
else if(strcmp(x,"101100011011")==0){
strcpy(z,"00101110001110100001001");
}
else if(strcmp(x,"101100011100")==0){
strcpy(z,"00101110001011101110110");
}
else if(strcmp(x,"101100011101")==0){
strcpy(z,"00101110001000111100011");
}
else if(strcmp(x,"101100011110")==0){
strcpy(z,"00101110000110001010001");
}
else if(strcmp(x,"101100011111")==0){
strcpy(z,"00101110000011010111111");
}
else if(strcmp(x,"101100100000")==0){
strcpy(z,"00101110000000100101110");
}
else if(strcmp(x,"101100100001")==0){
strcpy(z,"00101101111101110011101");
}
else if(strcmp(x,"101100100010")==0){
strcpy(z,"00101101111011000001101");
}
else if(strcmp(x,"101100100011")==0){
strcpy(z,"00101101111000001111100");
}
else if(strcmp(x,"101100100100")==0){
strcpy(z,"00101101110101011101101");
}
else if(strcmp(x,"101100100101")==0){
strcpy(z,"00101101110010101011101");
}
else if(strcmp(x,"101100100110")==0){
strcpy(z,"00101101101111111001110");
}
else if(strcmp(x,"101100100111")==0){
strcpy(z,"00101101101101001000000");
}
else if(strcmp(x,"101100101000")==0){
strcpy(z,"00101101101010010110010");
}
else if(strcmp(x,"101100101001")==0){
strcpy(z,"00101101100111100100100");
}
else if(strcmp(x,"101100101010")==0){
strcpy(z,"00101101100100110010111");
}
else if(strcmp(x,"101100101011")==0){
strcpy(z,"00101101100010000001010");
}
else if(strcmp(x,"101100101100")==0){
strcpy(z,"00101101011111001111110");
}
else if(strcmp(x,"101100101101")==0){
strcpy(z,"00101101011100011110010");
}
else if(strcmp(x,"101100101110")==0){
strcpy(z,"00101101011001101100110");
}
else if(strcmp(x,"101100101111")==0){
strcpy(z,"00101101010110111011011");
}
else if(strcmp(x,"101100110000")==0){
strcpy(z,"00101101010100001010000");
}
else if(strcmp(x,"101100110001")==0){
strcpy(z,"00101101010001011000110");
}
else if(strcmp(x,"101100110010")==0){
strcpy(z,"00101101001110100111100");
}
else if(strcmp(x,"101100110011")==0){
strcpy(z,"00101101001011110110010");
}
else if(strcmp(x,"101100110100")==0){
strcpy(z,"00101101001001000101001");
}
else if(strcmp(x,"101100110101")==0){
strcpy(z,"00101101000110010100000");
}
else if(strcmp(x,"101100110110")==0){
strcpy(z,"00101101000011100011000");
}
else if(strcmp(x,"101100110111")==0){
strcpy(z,"00101101000000110010000");
}
else if(strcmp(x,"101100111000")==0){
strcpy(z,"00101100111110000001000");
}
else if(strcmp(x,"101100111001")==0){
strcpy(z,"00101100111011010000001");
}
else if(strcmp(x,"101100111010")==0){
strcpy(z,"00101100111000011111010");
}
else if(strcmp(x,"101100111011")==0){
strcpy(z,"00101100110101101110100");
}
else if(strcmp(x,"101100111100")==0){
strcpy(z,"00101100110010111101110");
}
else if(strcmp(x,"101100111101")==0){
strcpy(z,"00101100110000001101001");
}
else if(strcmp(x,"101100111110")==0){
strcpy(z,"00101100101101011100011");
}
else if(strcmp(x,"101100111111")==0){
strcpy(z,"00101100101010101011111");
}
else if(strcmp(x,"101101000000")==0){
strcpy(z,"00101100100111111011010");
}
else if(strcmp(x,"101101000001")==0){
strcpy(z,"00101100100101001010111");
}
else if(strcmp(x,"101101000010")==0){
strcpy(z,"00101100100010011010011");
}
else if(strcmp(x,"101101000011")==0){
strcpy(z,"00101100011111101010000");
}
else if(strcmp(x,"101101000100")==0){
strcpy(z,"00101100011100111001101");
}
else if(strcmp(x,"101101000101")==0){
strcpy(z,"00101100011010001001011");
}
else if(strcmp(x,"101101000110")==0){
strcpy(z,"00101100010111011001001");
}
else if(strcmp(x,"101101000111")==0){
strcpy(z,"00101100010100101001000");
}
else if(strcmp(x,"101101001000")==0){
strcpy(z,"00101100010001111000111");
}
else if(strcmp(x,"101101001001")==0){
strcpy(z,"00101100001111001000110");
}
else if(strcmp(x,"101101001010")==0){
strcpy(z,"00101100001100011000110");
}
else if(strcmp(x,"101101001011")==0){
strcpy(z,"00101100001001101000110");
}
else if(strcmp(x,"101101001100")==0){
strcpy(z,"00101100000110111000110");
}
else if(strcmp(x,"101101001101")==0){
strcpy(z,"00101100000100001000111");
}
else if(strcmp(x,"101101001110")==0){
strcpy(z,"00101100000001011001001");
}
else if(strcmp(x,"101101001111")==0){
strcpy(z,"00101011111110101001010");
}
else if(strcmp(x,"101101010000")==0){
strcpy(z,"00101011111011111001100");
}
else if(strcmp(x,"101101010001")==0){
strcpy(z,"00101011111001001001111");
}
else if(strcmp(x,"101101010010")==0){
strcpy(z,"00101011110110011010010");
}
else if(strcmp(x,"101101010011")==0){
strcpy(z,"00101011110011101010101");
}
else if(strcmp(x,"101101010100")==0){
strcpy(z,"00101011110000111011001");
}
else if(strcmp(x,"101101010101")==0){
strcpy(z,"00101011101110001011101");
}
else if(strcmp(x,"101101010110")==0){
strcpy(z,"00101011101011011100010");
}
else if(strcmp(x,"101101010111")==0){
strcpy(z,"00101011101000101100111");
}
else if(strcmp(x,"101101011000")==0){
strcpy(z,"00101011100101111101100");
}
else if(strcmp(x,"101101011001")==0){
strcpy(z,"00101011100011001110010");
}
else if(strcmp(x,"101101011010")==0){
strcpy(z,"00101011100000011111000");
}
else if(strcmp(x,"101101011011")==0){
strcpy(z,"00101011011101101111111");
}
else if(strcmp(x,"101101011100")==0){
strcpy(z,"00101011011011000000110");
}
else if(strcmp(x,"101101011101")==0){
strcpy(z,"00101011011000010001101");
}
else if(strcmp(x,"101101011110")==0){
strcpy(z,"00101011010101100010101");
}
else if(strcmp(x,"101101011111")==0){
strcpy(z,"00101011010010110011101");
}
else if(strcmp(x,"101101100000")==0){
strcpy(z,"00101011010000000100101");
}
else if(strcmp(x,"101101100001")==0){
strcpy(z,"00101011001101010101110");
}
else if(strcmp(x,"101101100010")==0){
strcpy(z,"00101011001010100111000");
}
else if(strcmp(x,"101101100011")==0){
strcpy(z,"00101011000111111000001");
}
else if(strcmp(x,"101101100100")==0){
strcpy(z,"00101011000101001001100");
}
else if(strcmp(x,"101101100101")==0){
strcpy(z,"00101011000010011010110");
}
else if(strcmp(x,"101101100110")==0){
strcpy(z,"00101010111111101100001");
}
else if(strcmp(x,"101101100111")==0){
strcpy(z,"00101010111100111101101");
}
else if(strcmp(x,"101101101000")==0){
strcpy(z,"00101010111010001111000");
}
else if(strcmp(x,"101101101001")==0){
strcpy(z,"00101010110111100000100");
}
else if(strcmp(x,"101101101010")==0){
strcpy(z,"00101010110100110010001");
}
else if(strcmp(x,"101101101011")==0){
strcpy(z,"00101010110010000011110");
}
else if(strcmp(x,"101101101100")==0){
strcpy(z,"00101010101111010101011");
}
else if(strcmp(x,"101101101101")==0){
strcpy(z,"00101010101100100111001");
}
else if(strcmp(x,"101101101110")==0){
strcpy(z,"00101010101001111000111");
}
else if(strcmp(x,"101101101111")==0){
strcpy(z,"00101010100111001010110");
}
else if(strcmp(x,"101101110000")==0){
strcpy(z,"00101010100100011100101");
}
else if(strcmp(x,"101101110001")==0){
strcpy(z,"00101010100001101110100");
}
else if(strcmp(x,"101101110010")==0){
strcpy(z,"00101010011111000000100");
}
else if(strcmp(x,"101101110011")==0){
strcpy(z,"00101010011100010010100");
}
else if(strcmp(x,"101101110100")==0){
strcpy(z,"00101010011001100100100");
}
else if(strcmp(x,"101101110101")==0){
strcpy(z,"00101010010110110110101");
}
else if(strcmp(x,"101101110110")==0){
strcpy(z,"00101010010100001000111");
}
else if(strcmp(x,"101101110111")==0){
strcpy(z,"00101010010001011011000");
}
else if(strcmp(x,"101101111000")==0){
strcpy(z,"00101010001110101101010");
}
else if(strcmp(x,"101101111001")==0){
strcpy(z,"00101010001011111111101");
}
else if(strcmp(x,"101101111010")==0){
strcpy(z,"00101010001001010010000");
}
else if(strcmp(x,"101101111011")==0){
strcpy(z,"00101010000110100100011");
}
else if(strcmp(x,"101101111100")==0){
strcpy(z,"00101010000011110110111");
}
else if(strcmp(x,"101101111101")==0){
strcpy(z,"00101010000001001001011");
}
else if(strcmp(x,"101101111110")==0){
strcpy(z,"00101001111110011011111");
}
else if(strcmp(x,"101101111111")==0){
strcpy(z,"00101001111011101110100");
}
else if(strcmp(x,"101110000000")==0){
strcpy(z,"00101001111001000001001");
}
else if(strcmp(x,"101110000001")==0){
strcpy(z,"00101001110110010011111");
}
else if(strcmp(x,"101110000010")==0){
strcpy(z,"00101001110011100110101");
}
else if(strcmp(x,"101110000011")==0){
strcpy(z,"00101001110000111001011");
}
else if(strcmp(x,"101110000100")==0){
strcpy(z,"00101001101110001100010");
}
else if(strcmp(x,"101110000101")==0){
strcpy(z,"00101001101011011111001");
}
else if(strcmp(x,"101110000110")==0){
strcpy(z,"00101001101000110010001");
}
else if(strcmp(x,"101110000111")==0){
strcpy(z,"00101001100110000101001");
}
else if(strcmp(x,"101110001000")==0){
strcpy(z,"00101001100011011000010");
}
else if(strcmp(x,"101110001001")==0){
strcpy(z,"00101001100000101011010");
}
else if(strcmp(x,"101110001010")==0){
strcpy(z,"00101001011101111110100");
}
else if(strcmp(x,"101110001011")==0){
strcpy(z,"00101001011011010001101");
}
else if(strcmp(x,"101110001100")==0){
strcpy(z,"00101001011000100100111");
}
else if(strcmp(x,"101110001101")==0){
strcpy(z,"00101001010101111000001");
}
else if(strcmp(x,"101110001110")==0){
strcpy(z,"00101001010011001011100");
}
else if(strcmp(x,"101110001111")==0){
strcpy(z,"00101001010000011110111");
}
else if(strcmp(x,"101110010000")==0){
strcpy(z,"00101001001101110010011");
}
else if(strcmp(x,"101110010001")==0){
strcpy(z,"00101001001011000101111");
}
else if(strcmp(x,"101110010010")==0){
strcpy(z,"00101001001000011001011");
}
else if(strcmp(x,"101110010011")==0){
strcpy(z,"00101001000101101101000");
}
else if(strcmp(x,"101110010100")==0){
strcpy(z,"00101001000011000000101");
}
else if(strcmp(x,"101110010101")==0){
strcpy(z,"00101001000000010100010");
}
else if(strcmp(x,"101110010110")==0){
strcpy(z,"00101000111101101000000");
}
else if(strcmp(x,"101110010111")==0){
strcpy(z,"00101000111010111011111");
}
else if(strcmp(x,"101110011000")==0){
strcpy(z,"00101000111000001111101");
}
else if(strcmp(x,"101110011001")==0){
strcpy(z,"00101000110101100011100");
}
else if(strcmp(x,"101110011010")==0){
strcpy(z,"00101000110010110111100");
}
else if(strcmp(x,"101110011011")==0){
strcpy(z,"00101000110000001011100");
}
else if(strcmp(x,"101110011100")==0){
strcpy(z,"00101000101101011111100");
}
else if(strcmp(x,"101110011101")==0){
strcpy(z,"00101000101010110011100");
}
else if(strcmp(x,"101110011110")==0){
strcpy(z,"00101000101000000111101");
}
else if(strcmp(x,"101110011111")==0){
strcpy(z,"00101000100101011011111");
}
else if(strcmp(x,"101110100000")==0){
strcpy(z,"00101000100010110000001");
}
else if(strcmp(x,"101110100001")==0){
strcpy(z,"00101000100000000100011");
}
else if(strcmp(x,"101110100010")==0){
strcpy(z,"00101000011101011000101");
}
else if(strcmp(x,"101110100011")==0){
strcpy(z,"00101000011010101101000");
}
else if(strcmp(x,"101110100100")==0){
strcpy(z,"00101000011000000001100");
}
else if(strcmp(x,"101110100101")==0){
strcpy(z,"00101000010101010101111");
}
else if(strcmp(x,"101110100110")==0){
strcpy(z,"00101000010010101010011");
}
else if(strcmp(x,"101110100111")==0){
strcpy(z,"00101000001111111111000");
}
else if(strcmp(x,"101110101000")==0){
strcpy(z,"00101000001101010011101");
}
else if(strcmp(x,"101110101001")==0){
strcpy(z,"00101000001010101000010");
}
else if(strcmp(x,"101110101010")==0){
strcpy(z,"00101000000111111101000");
}
else if(strcmp(x,"101110101011")==0){
strcpy(z,"00101000000101010001110");
}
else if(strcmp(x,"101110101100")==0){
strcpy(z,"00101000000010100110100");
}
else if(strcmp(x,"101110101101")==0){
strcpy(z,"00100111111111111011011");
}
else if(strcmp(x,"101110101110")==0){
strcpy(z,"00100111111101010000010");
}
else if(strcmp(x,"101110101111")==0){
strcpy(z,"00100111111010100101010");
}
else if(strcmp(x,"101110110000")==0){
strcpy(z,"00100111110111111010010");
}
else if(strcmp(x,"101110110001")==0){
strcpy(z,"00100111110101001111010");
}
else if(strcmp(x,"101110110010")==0){
strcpy(z,"00100111110010100100011");
}
else if(strcmp(x,"101110110011")==0){
strcpy(z,"00100111101111111001100");
}
else if(strcmp(x,"101110110100")==0){
strcpy(z,"00100111101101001110110");
}
else if(strcmp(x,"101110110101")==0){
strcpy(z,"00100111101010100011111");
}
else if(strcmp(x,"101110110110")==0){
strcpy(z,"00100111100111111001010");
}
else if(strcmp(x,"101110110111")==0){
strcpy(z,"00100111100101001110100");
}
else if(strcmp(x,"101110111000")==0){
strcpy(z,"00100111100010100011111");
}
else if(strcmp(x,"101110111001")==0){
strcpy(z,"00100111011111111001011");
}
else if(strcmp(x,"101110111010")==0){
strcpy(z,"00100111011101001110111");
}
else if(strcmp(x,"101110111011")==0){
strcpy(z,"00100111011010100100011");
}
else if(strcmp(x,"101110111100")==0){
strcpy(z,"00100111010111111010000");
}
else if(strcmp(x,"101110111101")==0){
strcpy(z,"00100111010101001111101");
}
else if(strcmp(x,"101110111110")==0){
strcpy(z,"00100111010010100101010");
}
else if(strcmp(x,"101110111111")==0){
strcpy(z,"00100111001111111011000");
}
else if(strcmp(x,"101111000000")==0){
strcpy(z,"00100111001101010000110");
}
else if(strcmp(x,"101111000001")==0){
strcpy(z,"00100111001010100110100");
}
else if(strcmp(x,"101111000010")==0){
strcpy(z,"00100111000111111100011");
}
else if(strcmp(x,"101111000011")==0){
strcpy(z,"00100111000101010010010");
}
else if(strcmp(x,"101111000100")==0){
strcpy(z,"00100111000010101000010");
}
else if(strcmp(x,"101111000101")==0){
strcpy(z,"00100110111111111110010");
}
else if(strcmp(x,"101111000110")==0){
strcpy(z,"00100110111101010100011");
}
else if(strcmp(x,"101111000111")==0){
strcpy(z,"00100110111010101010011");
}
else if(strcmp(x,"101111001000")==0){
strcpy(z,"00100110111000000000101");
}
else if(strcmp(x,"101111001001")==0){
strcpy(z,"00100110110101010110110");
}
else if(strcmp(x,"101111001010")==0){
strcpy(z,"00100110110010101101000");
}
else if(strcmp(x,"101111001011")==0){
strcpy(z,"00100110110000000011010");
}
else if(strcmp(x,"101111001100")==0){
strcpy(z,"00100110101101011001101");
}
else if(strcmp(x,"101111001101")==0){
strcpy(z,"00100110101010110000000");
}
else if(strcmp(x,"101111001110")==0){
strcpy(z,"00100110101000000110100");
}
else if(strcmp(x,"101111001111")==0){
strcpy(z,"00100110100101011101000");
}
else if(strcmp(x,"101111010000")==0){
strcpy(z,"00100110100010110011100");
}
else if(strcmp(x,"101111010001")==0){
strcpy(z,"00100110100000001010001");
}
else if(strcmp(x,"101111010010")==0){
strcpy(z,"00100110011101100000110");
}
else if(strcmp(x,"101111010011")==0){
strcpy(z,"00100110011010110111011");
}
else if(strcmp(x,"101111010100")==0){
strcpy(z,"00100110011000001110001");
}
else if(strcmp(x,"101111010101")==0){
strcpy(z,"00100110010101100100111");
}
else if(strcmp(x,"101111010110")==0){
strcpy(z,"00100110010010111011101");
}
else if(strcmp(x,"101111010111")==0){
strcpy(z,"00100110010000010010100");
}
else if(strcmp(x,"101111011000")==0){
strcpy(z,"00100110001101101001100");
}
else if(strcmp(x,"101111011001")==0){
strcpy(z,"00100110001011000000011");
}
else if(strcmp(x,"101111011010")==0){
strcpy(z,"00100110001000010111011");
}
else if(strcmp(x,"101111011011")==0){
strcpy(z,"00100110000101101110100");
}
else if(strcmp(x,"101111011100")==0){
strcpy(z,"00100110000011000101101");
}
else if(strcmp(x,"101111011101")==0){
strcpy(z,"00100110000000011100110");
}
else if(strcmp(x,"101111011110")==0){
strcpy(z,"00100101111101110011111");
}
else if(strcmp(x,"101111011111")==0){
strcpy(z,"00100101111011001011001");
}
else if(strcmp(x,"101111100000")==0){
strcpy(z,"00100101111000100010100");
}
else if(strcmp(x,"101111100001")==0){
strcpy(z,"00100101110101111001110");
}
else if(strcmp(x,"101111100010")==0){
strcpy(z,"00100101110011010001001");
}
else if(strcmp(x,"101111100011")==0){
strcpy(z,"00100101110000101000101");
}
else if(strcmp(x,"101111100100")==0){
strcpy(z,"00100101101110000000001");
}
else if(strcmp(x,"101111100101")==0){
strcpy(z,"00100101101011010111101");
}
else if(strcmp(x,"101111100110")==0){
strcpy(z,"00100101101000101111001");
}
else if(strcmp(x,"101111100111")==0){
strcpy(z,"00100101100110000110110");
}
else if(strcmp(x,"101111101000")==0){
strcpy(z,"00100101100011011110100");
}
else if(strcmp(x,"101111101001")==0){
strcpy(z,"00100101100000110110001");
}
else if(strcmp(x,"101111101010")==0){
strcpy(z,"00100101011110001101111");
}
else if(strcmp(x,"101111101011")==0){
strcpy(z,"00100101011011100101110");
}
else if(strcmp(x,"101111101100")==0){
strcpy(z,"00100101011000111101101");
}
else if(strcmp(x,"101111101101")==0){
strcpy(z,"00100101010110010101100");
}
else if(strcmp(x,"101111101110")==0){
strcpy(z,"00100101010011101101100");
}
else if(strcmp(x,"101111101111")==0){
strcpy(z,"00100101010001000101100");
}
else if(strcmp(x,"101111110000")==0){
strcpy(z,"00100101001110011101100");
}
else if(strcmp(x,"101111110001")==0){
strcpy(z,"00100101001011110101101");
}
else if(strcmp(x,"101111110010")==0){
strcpy(z,"00100101001001001101110");
}
else if(strcmp(x,"101111110011")==0){
strcpy(z,"00100101000110100101111");
}
else if(strcmp(x,"101111110100")==0){
strcpy(z,"00100101000011111110001");
}
else if(strcmp(x,"101111110101")==0){
strcpy(z,"00100101000001010110011");
}
else if(strcmp(x,"101111110110")==0){
strcpy(z,"00100100111110101110110");
}
else if(strcmp(x,"101111110111")==0){
strcpy(z,"00100100111100000111001");
}
else if(strcmp(x,"101111111000")==0){
strcpy(z,"00100100111001011111100");
}
else if(strcmp(x,"101111111001")==0){
strcpy(z,"00100100110110111000000");
}
else if(strcmp(x,"101111111010")==0){
strcpy(z,"00100100110100010000100");
}
else if(strcmp(x,"101111111011")==0){
strcpy(z,"00100100110001101001001");
}
else if(strcmp(x,"101111111100")==0){
strcpy(z,"00100100101111000001101");
}
else if(strcmp(x,"101111111101")==0){
strcpy(z,"00100100101100011010011");
}
else if(strcmp(x,"101111111110")==0){
strcpy(z,"00100100101001110011000");
}
else if(strcmp(x,"101111111111")==0){
strcpy(z,"00100100100111001011110");
}
else if(strcmp(x,"110000000000")==0){
strcpy(z,"00100100100100100100101");
}
else if(strcmp(x,"110000000001")==0){
strcpy(z,"00100100100001111101011");
}
else if(strcmp(x,"110000000010")==0){
strcpy(z,"00100100011111010110010");
}
else if(strcmp(x,"110000000011")==0){
strcpy(z,"00100100011100101111010");
}
else if(strcmp(x,"110000000100")==0){
strcpy(z,"00100100011010001000010");
}
else if(strcmp(x,"110000000101")==0){
strcpy(z,"00100100010111100001010");
}
else if(strcmp(x,"110000000110")==0){
strcpy(z,"00100100010100111010010");
}
else if(strcmp(x,"110000000111")==0){
strcpy(z,"00100100010010010011011");
}
else if(strcmp(x,"110000001000")==0){
strcpy(z,"00100100001111101100101");
}
else if(strcmp(x,"110000001001")==0){
strcpy(z,"00100100001101000101110");
}
else if(strcmp(x,"110000001010")==0){
strcpy(z,"00100100001010011111001");
}
else if(strcmp(x,"110000001011")==0){
strcpy(z,"00100100000111111000011");
}
else if(strcmp(x,"110000001100")==0){
strcpy(z,"00100100000101010001110");
}
else if(strcmp(x,"110000001101")==0){
strcpy(z,"00100100000010101011001");
}
else if(strcmp(x,"110000001110")==0){
strcpy(z,"00100100000000000100101");
}
else if(strcmp(x,"110000001111")==0){
strcpy(z,"00100011111101011110000");
}
else if(strcmp(x,"110000010000")==0){
strcpy(z,"00100011111010110111101");
}
else if(strcmp(x,"110000010001")==0){
strcpy(z,"00100011111000010001001");
}
else if(strcmp(x,"110000010010")==0){
strcpy(z,"00100011110101101010110");
}
else if(strcmp(x,"110000010011")==0){
strcpy(z,"00100011110011000100100");
}
else if(strcmp(x,"110000010100")==0){
strcpy(z,"00100011110000011110010");
}
else if(strcmp(x,"110000010101")==0){
strcpy(z,"00100011101101111000000");
}
else if(strcmp(x,"110000010110")==0){
strcpy(z,"00100011101011010001110");
}
else if(strcmp(x,"110000010111")==0){
strcpy(z,"00100011101000101011101");
}
else if(strcmp(x,"110000011000")==0){
strcpy(z,"00100011100110000101100");
}
else if(strcmp(x,"110000011001")==0){
strcpy(z,"00100011100011011111100");
}
else if(strcmp(x,"110000011010")==0){
strcpy(z,"00100011100000111001100");
}
else if(strcmp(x,"110000011011")==0){
strcpy(z,"00100011011110010011100");
}
else if(strcmp(x,"110000011100")==0){
strcpy(z,"00100011011011101101101");
}
else if(strcmp(x,"110000011101")==0){
strcpy(z,"00100011011001000111110");
}
else if(strcmp(x,"110000011110")==0){
strcpy(z,"00100011010110100010000");
}
else if(strcmp(x,"110000011111")==0){
strcpy(z,"00100011010011111100010");
}
else if(strcmp(x,"110000100000")==0){
strcpy(z,"00100011010001010110100");
}
else if(strcmp(x,"110000100001")==0){
strcpy(z,"00100011001110110000110");
}
else if(strcmp(x,"110000100010")==0){
strcpy(z,"00100011001100001011001");
}
else if(strcmp(x,"110000100011")==0){
strcpy(z,"00100011001001100101101");
}
else if(strcmp(x,"110000100100")==0){
strcpy(z,"00100011000111000000000");
}
else if(strcmp(x,"110000100101")==0){
strcpy(z,"00100011000100011010100");
}
else if(strcmp(x,"110000100110")==0){
strcpy(z,"00100011000001110101001");
}
else if(strcmp(x,"110000100111")==0){
strcpy(z,"00100010111111001111110");
}
else if(strcmp(x,"110000101000")==0){
strcpy(z,"00100010111100101010011");
}
else if(strcmp(x,"110000101001")==0){
strcpy(z,"00100010111010000101000");
}
else if(strcmp(x,"110000101010")==0){
strcpy(z,"00100010110111011111110");
}
else if(strcmp(x,"110000101011")==0){
strcpy(z,"00100010110100111010100");
}
else if(strcmp(x,"110000101100")==0){
strcpy(z,"00100010110010010101011");
}
else if(strcmp(x,"110000101101")==0){
strcpy(z,"00100010101111110000010");
}
else if(strcmp(x,"110000101110")==0){
strcpy(z,"00100010101101001011001");
}
else if(strcmp(x,"110000101111")==0){
strcpy(z,"00100010101010100110001");
}
else if(strcmp(x,"110000110000")==0){
strcpy(z,"00100010101000000001001");
}
else if(strcmp(x,"110000110001")==0){
strcpy(z,"00100010100101011100010");
}
else if(strcmp(x,"110000110010")==0){
strcpy(z,"00100010100010110111010");
}
else if(strcmp(x,"110000110011")==0){
strcpy(z,"00100010100000010010100");
}
else if(strcmp(x,"110000110100")==0){
strcpy(z,"00100010011101101101101");
}
else if(strcmp(x,"110000110101")==0){
strcpy(z,"00100010011011001000111");
}
else if(strcmp(x,"110000110110")==0){
strcpy(z,"00100010011000100100001");
}
else if(strcmp(x,"110000110111")==0){
strcpy(z,"00100010010101111111100");
}
else if(strcmp(x,"110000111000")==0){
strcpy(z,"00100010010011011010111");
}
else if(strcmp(x,"110000111001")==0){
strcpy(z,"00100010010000110110010");
}
else if(strcmp(x,"110000111010")==0){
strcpy(z,"00100010001110010001110");
}
else if(strcmp(x,"110000111011")==0){
strcpy(z,"00100010001011101101010");
}
else if(strcmp(x,"110000111100")==0){
strcpy(z,"00100010001001001000111");
}
else if(strcmp(x,"110000111101")==0){
strcpy(z,"00100010000110100100011");
}
else if(strcmp(x,"110000111110")==0){
strcpy(z,"00100010000100000000001");
}
else if(strcmp(x,"110000111111")==0){
strcpy(z,"00100010000001011011110");
}
else if(strcmp(x,"110001000000")==0){
strcpy(z,"00100001111110110111100");
}
else if(strcmp(x,"110001000001")==0){
strcpy(z,"00100001111100010011010");
}
else if(strcmp(x,"110001000010")==0){
strcpy(z,"00100001111001101111001");
}
else if(strcmp(x,"110001000011")==0){
strcpy(z,"00100001110111001011000");
}
else if(strcmp(x,"110001000100")==0){
strcpy(z,"00100001110100100110111");
}
else if(strcmp(x,"110001000101")==0){
strcpy(z,"00100001110010000010111");
}
else if(strcmp(x,"110001000110")==0){
strcpy(z,"00100001101111011110111");
}
else if(strcmp(x,"110001000111")==0){
strcpy(z,"00100001101100111011000");
}
else if(strcmp(x,"110001001000")==0){
strcpy(z,"00100001101010010111000");
}
else if(strcmp(x,"110001001001")==0){
strcpy(z,"00100001100111110011010");
}
else if(strcmp(x,"110001001010")==0){
strcpy(z,"00100001100101001111011");
}
else if(strcmp(x,"110001001011")==0){
strcpy(z,"00100001100010101011101");
}
else if(strcmp(x,"110001001100")==0){
strcpy(z,"00100001100000000111111");
}
else if(strcmp(x,"110001001101")==0){
strcpy(z,"00100001011101100100010");
}
else if(strcmp(x,"110001001110")==0){
strcpy(z,"00100001011011000000101");
}
else if(strcmp(x,"110001001111")==0){
strcpy(z,"00100001011000011101000");
}
else if(strcmp(x,"110001010000")==0){
strcpy(z,"00100001010101111001100");
}
else if(strcmp(x,"110001010001")==0){
strcpy(z,"00100001010011010110000");
}
else if(strcmp(x,"110001010010")==0){
strcpy(z,"00100001010000110010101");
}
else if(strcmp(x,"110001010011")==0){
strcpy(z,"00100001001110001111001");
}
else if(strcmp(x,"110001010100")==0){
strcpy(z,"00100001001011101011110");
}
else if(strcmp(x,"110001010101")==0){
strcpy(z,"00100001001001001000100");
}
else if(strcmp(x,"110001010110")==0){
strcpy(z,"00100001000110100101010");
}
else if(strcmp(x,"110001010111")==0){
strcpy(z,"00100001000100000010000");
}
else if(strcmp(x,"110001011000")==0){
strcpy(z,"00100001000001011110111");
}
else if(strcmp(x,"110001011001")==0){
strcpy(z,"00100000111110111011110");
}
else if(strcmp(x,"110001011010")==0){
strcpy(z,"00100000111100011000101");
}
else if(strcmp(x,"110001011011")==0){
strcpy(z,"00100000111001110101101");
}
else if(strcmp(x,"110001011100")==0){
strcpy(z,"00100000110111010010101");
}
else if(strcmp(x,"110001011101")==0){
strcpy(z,"00100000110100101111101");
}
else if(strcmp(x,"110001011110")==0){
strcpy(z,"00100000110010001100110");
}
else if(strcmp(x,"110001011111")==0){
strcpy(z,"00100000101111101001111");
}
else if(strcmp(x,"110001100000")==0){
strcpy(z,"00100000101101000111000");
}
else if(strcmp(x,"110001100001")==0){
strcpy(z,"00100000101010100100010");
}
else if(strcmp(x,"110001100010")==0){
strcpy(z,"00100000101000000001100");
}
else if(strcmp(x,"110001100011")==0){
strcpy(z,"00100000100101011110111");
}
else if(strcmp(x,"110001100100")==0){
strcpy(z,"00100000100010111100010");
}
else if(strcmp(x,"110001100101")==0){
strcpy(z,"00100000100000011001101");
}
else if(strcmp(x,"110001100110")==0){
strcpy(z,"00100000011101110111001");
}
else if(strcmp(x,"110001100111")==0){
strcpy(z,"00100000011011010100101");
}
else if(strcmp(x,"110001101000")==0){
strcpy(z,"00100000011000110010001");
}
else if(strcmp(x,"110001101001")==0){
strcpy(z,"00100000010110001111110");
}
else if(strcmp(x,"110001101010")==0){
strcpy(z,"00100000010011101101011");
}
else if(strcmp(x,"110001101011")==0){
strcpy(z,"00100000010001001011000");
}
else if(strcmp(x,"110001101100")==0){
strcpy(z,"00100000001110101000110");
}
else if(strcmp(x,"110001101101")==0){
strcpy(z,"00100000001100000110100");
}
else if(strcmp(x,"110001101110")==0){
strcpy(z,"00100000001001100100011");
}
else if(strcmp(x,"110001101111")==0){
strcpy(z,"00100000000111000010001");
}
else if(strcmp(x,"110001110000")==0){
strcpy(z,"00100000000100100000001");
}
else if(strcmp(x,"110001110001")==0){
strcpy(z,"00100000000001111110000");
}
else if(strcmp(x,"110001110010")==0){
strcpy(z,"00011111111111011100000");
}
else if(strcmp(x,"110001110011")==0){
strcpy(z,"00011111111100111010000");
}
else if(strcmp(x,"110001110100")==0){
strcpy(z,"00011111111010011000001");
}
else if(strcmp(x,"110001110101")==0){
strcpy(z,"00011111110111110110010");
}
else if(strcmp(x,"110001110110")==0){
strcpy(z,"00011111110101010100011");
}
else if(strcmp(x,"110001110111")==0){
strcpy(z,"00011111110010110010101");
}
else if(strcmp(x,"110001111000")==0){
strcpy(z,"00011111110000010000111");
}
else if(strcmp(x,"110001111001")==0){
strcpy(z,"00011111101101101111001");
}
else if(strcmp(x,"110001111010")==0){
strcpy(z,"00011111101011001101100");
}
else if(strcmp(x,"110001111011")==0){
strcpy(z,"00011111101000101011111");
}
else if(strcmp(x,"110001111100")==0){
strcpy(z,"00011111100110001010011");
}
else if(strcmp(x,"110001111101")==0){
strcpy(z,"00011111100011101000110");
}
else if(strcmp(x,"110001111110")==0){
strcpy(z,"00011111100001000111011");
}
else if(strcmp(x,"110001111111")==0){
strcpy(z,"00011111011110100101111");
}
else if(strcmp(x,"110010000000")==0){
strcpy(z,"00011111011100000100100");
}
else if(strcmp(x,"110010000001")==0){
strcpy(z,"00011111011001100011001");
}
else if(strcmp(x,"110010000010")==0){
strcpy(z,"00011111010111000001111");
}
else if(strcmp(x,"110010000011")==0){
strcpy(z,"00011111010100100000101");
}
else if(strcmp(x,"110010000100")==0){
strcpy(z,"00011111010001111111011");
}
else if(strcmp(x,"110010000101")==0){
strcpy(z,"00011111001111011110010");
}
else if(strcmp(x,"110010000110")==0){
strcpy(z,"00011111001100111101001");
}
else if(strcmp(x,"110010000111")==0){
strcpy(z,"00011111001010011100000");
}
else if(strcmp(x,"110010001000")==0){
strcpy(z,"00011111000111111011000");
}
else if(strcmp(x,"110010001001")==0){
strcpy(z,"00011111000101011010000");
}
else if(strcmp(x,"110010001010")==0){
strcpy(z,"00011111000010111001000");
}
else if(strcmp(x,"110010001011")==0){
strcpy(z,"00011111000000011000001");
}
else if(strcmp(x,"110010001100")==0){
strcpy(z,"00011110111101110111010");
}
else if(strcmp(x,"110010001101")==0){
strcpy(z,"00011110111011010110011");
}
else if(strcmp(x,"110010001110")==0){
strcpy(z,"00011110111000110101101");
}
else if(strcmp(x,"110010001111")==0){
strcpy(z,"00011110110110010100111");
}
else if(strcmp(x,"110010010000")==0){
strcpy(z,"00011110110011110100010");
}
else if(strcmp(x,"110010010001")==0){
strcpy(z,"00011110110001010011101");
}
else if(strcmp(x,"110010010010")==0){
strcpy(z,"00011110101110110011000");
}
else if(strcmp(x,"110010010011")==0){
strcpy(z,"00011110101100010010100");
}
else if(strcmp(x,"110010010100")==0){
strcpy(z,"00011110101001110001111");
}
else if(strcmp(x,"110010010101")==0){
strcpy(z,"00011110100111010001100");
}
else if(strcmp(x,"110010010110")==0){
strcpy(z,"00011110100100110001000");
}
else if(strcmp(x,"110010010111")==0){
strcpy(z,"00011110100010010000101");
}
else if(strcmp(x,"110010011000")==0){
strcpy(z,"00011110011111110000011");
}
else if(strcmp(x,"110010011001")==0){
strcpy(z,"00011110011101010000000");
}
else if(strcmp(x,"110010011010")==0){
strcpy(z,"00011110011010101111110");
}
else if(strcmp(x,"110010011011")==0){
strcpy(z,"00011110011000001111101");
}
else if(strcmp(x,"110010011100")==0){
strcpy(z,"00011110010101101111011");
}
else if(strcmp(x,"110010011101")==0){
strcpy(z,"00011110010011001111011");
}
else if(strcmp(x,"110010011110")==0){
strcpy(z,"00011110010000101111010");
}
else if(strcmp(x,"110010011111")==0){
strcpy(z,"00011110001110001111010");
}
else if(strcmp(x,"110010100000")==0){
strcpy(z,"00011110001011101111010");
}
else if(strcmp(x,"110010100001")==0){
strcpy(z,"00011110001001001111010");
}
else if(strcmp(x,"110010100010")==0){
strcpy(z,"00011110000110101111011");
}
else if(strcmp(x,"110010100011")==0){
strcpy(z,"00011110000100001111100");
}
else if(strcmp(x,"110010100100")==0){
strcpy(z,"00011110000001101111110");
}
else if(strcmp(x,"110010100101")==0){
strcpy(z,"00011101111111010000000");
}
else if(strcmp(x,"110010100110")==0){
strcpy(z,"00011101111100110000010");
}
else if(strcmp(x,"110010100111")==0){
strcpy(z,"00011101111010010000100");
}
else if(strcmp(x,"110010101000")==0){
strcpy(z,"00011101110111110000111");
}
else if(strcmp(x,"110010101001")==0){
strcpy(z,"00011101110101010001011");
}
else if(strcmp(x,"110010101010")==0){
strcpy(z,"00011101110010110001110");
}
else if(strcmp(x,"110010101011")==0){
strcpy(z,"00011101110000010010010");
}
else if(strcmp(x,"110010101100")==0){
strcpy(z,"00011101101101110010111");
}
else if(strcmp(x,"110010101101")==0){
strcpy(z,"00011101101011010011011");
}
else if(strcmp(x,"110010101110")==0){
strcpy(z,"00011101101000110100000");
}
else if(strcmp(x,"110010101111")==0){
strcpy(z,"00011101100110010100110");
}
else if(strcmp(x,"110010110000")==0){
strcpy(z,"00011101100011110101011");
}
else if(strcmp(x,"110010110001")==0){
strcpy(z,"00011101100001010110001");
}
else if(strcmp(x,"110010110010")==0){
strcpy(z,"00011101011110110111000");
}
else if(strcmp(x,"110010110011")==0){
strcpy(z,"00011101011100010111110");
}
else if(strcmp(x,"110010110100")==0){
strcpy(z,"00011101011001111000101");
}
else if(strcmp(x,"110010110101")==0){
strcpy(z,"00011101010111011001101");
}
else if(strcmp(x,"110010110110")==0){
strcpy(z,"00011101010100111010101");
}
else if(strcmp(x,"110010110111")==0){
strcpy(z,"00011101010010011011101");
}
else if(strcmp(x,"110010111000")==0){
strcpy(z,"00011101001111111100101");
}
else if(strcmp(x,"110010111001")==0){
strcpy(z,"00011101001101011101110");
}
else if(strcmp(x,"110010111010")==0){
strcpy(z,"00011101001010111110111");
}
else if(strcmp(x,"110010111011")==0){
strcpy(z,"00011101001000100000001");
}
else if(strcmp(x,"110010111100")==0){
strcpy(z,"00011101000110000001011");
}
else if(strcmp(x,"110010111101")==0){
strcpy(z,"00011101000011100010101");
}
else if(strcmp(x,"110010111110")==0){
strcpy(z,"00011101000001000011111");
}
else if(strcmp(x,"110010111111")==0){
strcpy(z,"00011100111110100101010");
}
else if(strcmp(x,"110011000000")==0){
strcpy(z,"00011100111100000110101");
}
else if(strcmp(x,"110011000001")==0){
strcpy(z,"00011100111001101000001");
}
else if(strcmp(x,"110011000010")==0){
strcpy(z,"00011100110111001001101");
}
else if(strcmp(x,"110011000011")==0){
strcpy(z,"00011100110100101011001");
}
else if(strcmp(x,"110011000100")==0){
strcpy(z,"00011100110010001100110");
}
else if(strcmp(x,"110011000101")==0){
strcpy(z,"00011100101111101110011");
}
else if(strcmp(x,"110011000110")==0){
strcpy(z,"00011100101101010000000");
}
else if(strcmp(x,"110011000111")==0){
strcpy(z,"00011100101010110001110");
}
else if(strcmp(x,"110011001000")==0){
strcpy(z,"00011100101000010011100");
}
else if(strcmp(x,"110011001001")==0){
strcpy(z,"00011100100101110101010");
}
else if(strcmp(x,"110011001010")==0){
strcpy(z,"00011100100011010111001");
}
else if(strcmp(x,"110011001011")==0){
strcpy(z,"00011100100000111001000");
}
else if(strcmp(x,"110011001100")==0){
strcpy(z,"00011100011110011010111");
}
else if(strcmp(x,"110011001101")==0){
strcpy(z,"00011100011011111100111");
}
else if(strcmp(x,"110011001110")==0){
strcpy(z,"00011100011001011110111");
}
else if(strcmp(x,"110011001111")==0){
strcpy(z,"00011100010111000000111");
}
else if(strcmp(x,"110011010000")==0){
strcpy(z,"00011100010100100011000");
}
else if(strcmp(x,"110011010001")==0){
strcpy(z,"00011100010010000101001");
}
else if(strcmp(x,"110011010010")==0){
strcpy(z,"00011100001111100111010");
}
else if(strcmp(x,"110011010011")==0){
strcpy(z,"00011100001101001001100");
}
else if(strcmp(x,"110011010100")==0){
strcpy(z,"00011100001010101011110");
}
else if(strcmp(x,"110011010101")==0){
strcpy(z,"00011100001000001110001");
}
else if(strcmp(x,"110011010110")==0){
strcpy(z,"00011100000101110000011");
}
else if(strcmp(x,"110011010111")==0){
strcpy(z,"00011100000011010010111");
}
else if(strcmp(x,"110011011000")==0){
strcpy(z,"00011100000000110101010");
}
else if(strcmp(x,"110011011001")==0){
strcpy(z,"00011011111110010111110");
}
else if(strcmp(x,"110011011010")==0){
strcpy(z,"00011011111011111010010");
}
else if(strcmp(x,"110011011011")==0){
strcpy(z,"00011011111001011100110");
}
else if(strcmp(x,"110011011100")==0){
strcpy(z,"00011011110110111111011");
}
else if(strcmp(x,"110011011101")==0){
strcpy(z,"00011011110100100010000");
}
else if(strcmp(x,"110011011110")==0){
strcpy(z,"00011011110010000100110");
}
else if(strcmp(x,"110011011111")==0){
strcpy(z,"00011011101111100111100");
}
else if(strcmp(x,"110011100000")==0){
strcpy(z,"00011011101101001010010");
}
else if(strcmp(x,"110011100001")==0){
strcpy(z,"00011011101010101101001");
}
else if(strcmp(x,"110011100010")==0){
strcpy(z,"00011011101000001111111");
}
else if(strcmp(x,"110011100011")==0){
strcpy(z,"00011011100101110010111");
}
else if(strcmp(x,"110011100100")==0){
strcpy(z,"00011011100011010101110");
}
else if(strcmp(x,"110011100101")==0){
strcpy(z,"00011011100000111000110");
}
else if(strcmp(x,"110011100110")==0){
strcpy(z,"00011011011110011011110");
}
else if(strcmp(x,"110011100111")==0){
strcpy(z,"00011011011011111110111");
}
else if(strcmp(x,"110011101000")==0){
strcpy(z,"00011011011001100010000");
}
else if(strcmp(x,"110011101001")==0){
strcpy(z,"00011011010111000101001");
}
else if(strcmp(x,"110011101010")==0){
strcpy(z,"00011011010100101000011");
}
else if(strcmp(x,"110011101011")==0){
strcpy(z,"00011011010010001011101");
}
else if(strcmp(x,"110011101100")==0){
strcpy(z,"00011011001111101110111");
}
else if(strcmp(x,"110011101101")==0){
strcpy(z,"00011011001101010010001");
}
else if(strcmp(x,"110011101110")==0){
strcpy(z,"00011011001010110101100");
}
else if(strcmp(x,"110011101111")==0){
strcpy(z,"00011011001000011001000");
}
else if(strcmp(x,"110011110000")==0){
strcpy(z,"00011011000101111100011");
}
else if(strcmp(x,"110011110001")==0){
strcpy(z,"00011011000011011111111");
}
else if(strcmp(x,"110011110010")==0){
strcpy(z,"00011011000001000011100");
}
else if(strcmp(x,"110011110011")==0){
strcpy(z,"00011010111110100111000");
}
else if(strcmp(x,"110011110100")==0){
strcpy(z,"00011010111100001010101");
}
else if(strcmp(x,"110011110101")==0){
strcpy(z,"00011010111001101110010");
}
else if(strcmp(x,"110011110110")==0){
strcpy(z,"00011010110111010010000");
}
else if(strcmp(x,"110011110111")==0){
strcpy(z,"00011010110100110101110");
}
else if(strcmp(x,"110011111000")==0){
strcpy(z,"00011010110010011001100");
}
else if(strcmp(x,"110011111001")==0){
strcpy(z,"00011010101111111101011");
}
else if(strcmp(x,"110011111010")==0){
strcpy(z,"00011010101101100001010");
}
else if(strcmp(x,"110011111011")==0){
strcpy(z,"00011010101011000101001");
}
else if(strcmp(x,"110011111100")==0){
strcpy(z,"00011010101000101001001");
}
else if(strcmp(x,"110011111101")==0){
strcpy(z,"00011010100110001101001");
}
else if(strcmp(x,"110011111110")==0){
strcpy(z,"00011010100011110001001");
}
else if(strcmp(x,"110011111111")==0){
strcpy(z,"00011010100001010101010");
}
else if(strcmp(x,"110100000000")==0){
strcpy(z,"00011010011110111001011");
}
else if(strcmp(x,"110100000001")==0){
strcpy(z,"00011010011100011101100");
}
else if(strcmp(x,"110100000010")==0){
strcpy(z,"00011010011010000001110");
}
else if(strcmp(x,"110100000011")==0){
strcpy(z,"00011010010111100110000");
}
else if(strcmp(x,"110100000100")==0){
strcpy(z,"00011010010101001010010");
}
else if(strcmp(x,"110100000101")==0){
strcpy(z,"00011010010010101110101");
}
else if(strcmp(x,"110100000110")==0){
strcpy(z,"00011010010000010011000");
}
else if(strcmp(x,"110100000111")==0){
strcpy(z,"00011010001101110111100");
}
else if(strcmp(x,"110100001000")==0){
strcpy(z,"00011010001011011011111");
}
else if(strcmp(x,"110100001001")==0){
strcpy(z,"00011010001001000000011");
}
else if(strcmp(x,"110100001010")==0){
strcpy(z,"00011010000110100101000");
}
else if(strcmp(x,"110100001011")==0){
strcpy(z,"00011010000100001001100");
}
else if(strcmp(x,"110100001100")==0){
strcpy(z,"00011010000001101110001");
}
else if(strcmp(x,"110100001101")==0){
strcpy(z,"00011001111111010010111");
}
else if(strcmp(x,"110100001110")==0){
strcpy(z,"00011001111100110111100");
}
else if(strcmp(x,"110100001111")==0){
strcpy(z,"00011001111010011100010");
}
else if(strcmp(x,"110100010000")==0){
strcpy(z,"00011001111000000001001");
}
else if(strcmp(x,"110100010001")==0){
strcpy(z,"00011001110101100110000");
}
else if(strcmp(x,"110100010010")==0){
strcpy(z,"00011001110011001010111");
}
else if(strcmp(x,"110100010011")==0){
strcpy(z,"00011001110000101111110");
}
else if(strcmp(x,"110100010100")==0){
strcpy(z,"00011001101110010100110");
}
else if(strcmp(x,"110100010101")==0){
strcpy(z,"00011001101011111001110");
}
else if(strcmp(x,"110100010110")==0){
strcpy(z,"00011001101001011110110");
}
else if(strcmp(x,"110100010111")==0){
strcpy(z,"00011001100111000011111");
}
else if(strcmp(x,"110100011000")==0){
strcpy(z,"00011001100100101001000");
}
else if(strcmp(x,"110100011001")==0){
strcpy(z,"00011001100010001110001");
}
else if(strcmp(x,"110100011010")==0){
strcpy(z,"00011001011111110011011");
}
else if(strcmp(x,"110100011011")==0){
strcpy(z,"00011001011101011000101");
}
else if(strcmp(x,"110100011100")==0){
strcpy(z,"00011001011010111101111");
}
else if(strcmp(x,"110100011101")==0){
strcpy(z,"00011001011000100011010");
}
else if(strcmp(x,"110100011110")==0){
strcpy(z,"00011001010110001000101");
}
else if(strcmp(x,"110100011111")==0){
strcpy(z,"00011001010011101110000");
}
else if(strcmp(x,"110100100000")==0){
strcpy(z,"00011001010001010011100");
}
else if(strcmp(x,"110100100001")==0){
strcpy(z,"00011001001110111001000");
}
else if(strcmp(x,"110100100010")==0){
strcpy(z,"00011001001100011110100");
}
else if(strcmp(x,"110100100011")==0){
strcpy(z,"00011001001010000100001");
}
else if(strcmp(x,"110100100100")==0){
strcpy(z,"00011001000111101001110");
}
else if(strcmp(x,"110100100101")==0){
strcpy(z,"00011001000101001111011");
}
else if(strcmp(x,"110100100110")==0){
strcpy(z,"00011001000010110101001");
}
else if(strcmp(x,"110100100111")==0){
strcpy(z,"00011001000000011010111");
}
else if(strcmp(x,"110100101000")==0){
strcpy(z,"00011000111110000000101");
}
else if(strcmp(x,"110100101001")==0){
strcpy(z,"00011000111011100110100");
}
else if(strcmp(x,"110100101010")==0){
strcpy(z,"00011000111001001100011");
}
else if(strcmp(x,"110100101011")==0){
strcpy(z,"00011000110110110010010");
}
else if(strcmp(x,"110100101100")==0){
strcpy(z,"00011000110100011000010");
}
else if(strcmp(x,"110100101101")==0){
strcpy(z,"00011000110001111110010");
}
else if(strcmp(x,"110100101110")==0){
strcpy(z,"00011000101111100100010");
}
else if(strcmp(x,"110100101111")==0){
strcpy(z,"00011000101101001010011");
}
else if(strcmp(x,"110100110000")==0){
strcpy(z,"00011000101010110000100");
}
else if(strcmp(x,"110100110001")==0){
strcpy(z,"00011000101000010110101");
}
else if(strcmp(x,"110100110010")==0){
strcpy(z,"00011000100101111100111");
}
else if(strcmp(x,"110100110011")==0){
strcpy(z,"00011000100011100011001");
}
else if(strcmp(x,"110100110100")==0){
strcpy(z,"00011000100001001001011");
}
else if(strcmp(x,"110100110101")==0){
strcpy(z,"00011000011110101111110");
}
else if(strcmp(x,"110100110110")==0){
strcpy(z,"00011000011100010110001");
}
else if(strcmp(x,"110100110111")==0){
strcpy(z,"00011000011001111100100");
}
else if(strcmp(x,"110100111000")==0){
strcpy(z,"00011000010111100011000");
}
else if(strcmp(x,"110100111001")==0){
strcpy(z,"00011000010101001001100");
}
else if(strcmp(x,"110100111010")==0){
strcpy(z,"00011000010010110000000");
}
else if(strcmp(x,"110100111011")==0){
strcpy(z,"00011000010000010110101");
}
else if(strcmp(x,"110100111100")==0){
strcpy(z,"00011000001101111101010");
}
else if(strcmp(x,"110100111101")==0){
strcpy(z,"00011000001011100011111");
}
else if(strcmp(x,"110100111110")==0){
strcpy(z,"00011000001001001010100");
}
else if(strcmp(x,"110100111111")==0){
strcpy(z,"00011000000110110001010");
}
else if(strcmp(x,"110101000000")==0){
strcpy(z,"00011000000100011000001");
}
else if(strcmp(x,"110101000001")==0){
strcpy(z,"00011000000001111110111");
}
else if(strcmp(x,"110101000010")==0){
strcpy(z,"00010111111111100101110");
}
else if(strcmp(x,"110101000011")==0){
strcpy(z,"00010111111101001100101");
}
else if(strcmp(x,"110101000100")==0){
strcpy(z,"00010111111010110011101");
}
else if(strcmp(x,"110101000101")==0){
strcpy(z,"00010111111000011010101");
}
else if(strcmp(x,"110101000110")==0){
strcpy(z,"00010111110110000001101");
}
else if(strcmp(x,"110101000111")==0){
strcpy(z,"00010111110011101000101");
}
else if(strcmp(x,"110101001000")==0){
strcpy(z,"00010111110001001111110");
}
else if(strcmp(x,"110101001001")==0){
strcpy(z,"00010111101110110110111");
}
else if(strcmp(x,"110101001010")==0){
strcpy(z,"00010111101100011110001");
}
else if(strcmp(x,"110101001011")==0){
strcpy(z,"00010111101010000101011");
}
else if(strcmp(x,"110101001100")==0){
strcpy(z,"00010111100111101100101");
}
else if(strcmp(x,"110101001101")==0){
strcpy(z,"00010111100101010011111");
}
else if(strcmp(x,"110101001110")==0){
strcpy(z,"00010111100010111011010");
}
else if(strcmp(x,"110101001111")==0){
strcpy(z,"00010111100000100010101");
}
else if(strcmp(x,"110101010000")==0){
strcpy(z,"00010111011110001010001");
}
else if(strcmp(x,"110101010001")==0){
strcpy(z,"00010111011011110001101");
}
else if(strcmp(x,"110101010010")==0){
strcpy(z,"00010111011001011001001");
}
else if(strcmp(x,"110101010011")==0){
strcpy(z,"00010111010111000000101");
}
else if(strcmp(x,"110101010100")==0){
strcpy(z,"00010111010100101000010");
}
else if(strcmp(x,"110101010101")==0){
strcpy(z,"00010111010010001111111");
}
else if(strcmp(x,"110101010110")==0){
strcpy(z,"00010111001111110111100");
}
else if(strcmp(x,"110101010111")==0){
strcpy(z,"00010111001101011111010");
}
else if(strcmp(x,"110101011000")==0){
strcpy(z,"00010111001011000111000");
}
else if(strcmp(x,"110101011001")==0){
strcpy(z,"00010111001000101110111");
}
else if(strcmp(x,"110101011010")==0){
strcpy(z,"00010111000110010110101");
}
else if(strcmp(x,"110101011011")==0){
strcpy(z,"00010111000011111110100");
}
else if(strcmp(x,"110101011100")==0){
strcpy(z,"00010111000001100110100");
}
else if(strcmp(x,"110101011101")==0){
strcpy(z,"00010110111111001110011");
}
else if(strcmp(x,"110101011110")==0){
strcpy(z,"00010110111100110110011");
}
else if(strcmp(x,"110101011111")==0){
strcpy(z,"00010110111010011110100");
}
else if(strcmp(x,"110101100000")==0){
strcpy(z,"00010110111000000110100");
}
else if(strcmp(x,"110101100001")==0){
strcpy(z,"00010110110101101110101");
}
else if(strcmp(x,"110101100010")==0){
strcpy(z,"00010110110011010110111");
}
else if(strcmp(x,"110101100011")==0){
strcpy(z,"00010110110000111111000");
}
else if(strcmp(x,"110101100100")==0){
strcpy(z,"00010110101110100111010");
}
else if(strcmp(x,"110101100101")==0){
strcpy(z,"00010110101100001111100");
}
else if(strcmp(x,"110101100110")==0){
strcpy(z,"00010110101001110111111");
}
else if(strcmp(x,"110101100111")==0){
strcpy(z,"00010110100111100000010");
}
else if(strcmp(x,"110101101000")==0){
strcpy(z,"00010110100101001000101");
}
else if(strcmp(x,"110101101001")==0){
strcpy(z,"00010110100010110001001");
}
else if(strcmp(x,"110101101010")==0){
strcpy(z,"00010110100000011001101");
}
else if(strcmp(x,"110101101011")==0){
strcpy(z,"00010110011110000010001");
}
else if(strcmp(x,"110101101100")==0){
strcpy(z,"00010110011011101010101");
}
else if(strcmp(x,"110101101101")==0){
strcpy(z,"00010110011001010011010");
}
else if(strcmp(x,"110101101110")==0){
strcpy(z,"00010110010110111011111");
}
else if(strcmp(x,"110101101111")==0){
strcpy(z,"00010110010100100100101");
}
else if(strcmp(x,"110101110000")==0){
strcpy(z,"00010110010010001101011");
}
else if(strcmp(x,"110101110001")==0){
strcpy(z,"00010110001111110110001");
}
else if(strcmp(x,"110101110010")==0){
strcpy(z,"00010110001101011110111");
}
else if(strcmp(x,"110101110011")==0){
strcpy(z,"00010110001011000111110");
}
else if(strcmp(x,"110101110100")==0){
strcpy(z,"00010110001000110000101");
}
else if(strcmp(x,"110101110101")==0){
strcpy(z,"00010110000110011001100");
}
else if(strcmp(x,"110101110110")==0){
strcpy(z,"00010110000100000010100");
}
else if(strcmp(x,"110101110111")==0){
strcpy(z,"00010110000001101011100");
}
else if(strcmp(x,"110101111000")==0){
strcpy(z,"00010101111111010100101");
}
else if(strcmp(x,"110101111001")==0){
strcpy(z,"00010101111100111101101");
}
else if(strcmp(x,"110101111010")==0){
strcpy(z,"00010101111010100110110");
}
else if(strcmp(x,"110101111011")==0){
strcpy(z,"00010101111000010000000");
}
else if(strcmp(x,"110101111100")==0){
strcpy(z,"00010101110101111001001");
}
else if(strcmp(x,"110101111101")==0){
strcpy(z,"00010101110011100010011");
}
else if(strcmp(x,"110101111110")==0){
strcpy(z,"00010101110001001011101");
}
else if(strcmp(x,"110101111111")==0){
strcpy(z,"00010101101110110101000");
}
else if(strcmp(x,"110110000000")==0){
strcpy(z,"00010101101100011110011");
}
else if(strcmp(x,"110110000001")==0){
strcpy(z,"00010101101010000111110");
}
else if(strcmp(x,"110110000010")==0){
strcpy(z,"00010101100111110001010");
}
else if(strcmp(x,"110110000011")==0){
strcpy(z,"00010101100101011010110");
}
else if(strcmp(x,"110110000100")==0){
strcpy(z,"00010101100011000100010");
}
else if(strcmp(x,"110110000101")==0){
strcpy(z,"00010101100000101101110");
}
else if(strcmp(x,"110110000110")==0){
strcpy(z,"00010101011110010111011");
}
else if(strcmp(x,"110110000111")==0){
strcpy(z,"00010101011100000001000");
}
else if(strcmp(x,"110110001000")==0){
strcpy(z,"00010101011001101010110");
}
else if(strcmp(x,"110110001001")==0){
strcpy(z,"00010101010111010100100");
}
else if(strcmp(x,"110110001010")==0){
strcpy(z,"00010101010100111110010");
}
else if(strcmp(x,"110110001011")==0){
strcpy(z,"00010101010010101000000");
}
else if(strcmp(x,"110110001100")==0){
strcpy(z,"00010101010000010001111");
}
else if(strcmp(x,"110110001101")==0){
strcpy(z,"00010101001101111011110");
}
else if(strcmp(x,"110110001110")==0){
strcpy(z,"00010101001011100101101");
}
else if(strcmp(x,"110110001111")==0){
strcpy(z,"00010101001001001111101");
}
else if(strcmp(x,"110110010000")==0){
strcpy(z,"00010101000110111001101");
}
else if(strcmp(x,"110110010001")==0){
strcpy(z,"00010101000100100011101");
}
else if(strcmp(x,"110110010010")==0){
strcpy(z,"00010101000010001101110");
}
else if(strcmp(x,"110110010011")==0){
strcpy(z,"00010100111111110111111");
}
else if(strcmp(x,"110110010100")==0){
strcpy(z,"00010100111101100010000");
}
else if(strcmp(x,"110110010101")==0){
strcpy(z,"00010100111011001100010");
}
else if(strcmp(x,"110110010110")==0){
strcpy(z,"00010100111000110110100");
}
else if(strcmp(x,"110110010111")==0){
strcpy(z,"00010100110110100000110");
}
else if(strcmp(x,"110110011000")==0){
strcpy(z,"00010100110100001011001");
}
else if(strcmp(x,"110110011001")==0){
strcpy(z,"00010100110001110101100");
}
else if(strcmp(x,"110110011010")==0){
strcpy(z,"00010100101111011111111");
}
else if(strcmp(x,"110110011011")==0){
strcpy(z,"00010100101101001010010");
}
else if(strcmp(x,"110110011100")==0){
strcpy(z,"00010100101010110100110");
}
else if(strcmp(x,"110110011101")==0){
strcpy(z,"00010100101000011111010");
}
else if(strcmp(x,"110110011110")==0){
strcpy(z,"00010100100110001001111");
}
else if(strcmp(x,"110110011111")==0){
strcpy(z,"00010100100011110100011");
}
else if(strcmp(x,"110110100000")==0){
strcpy(z,"00010100100001011111000");
}
else if(strcmp(x,"110110100001")==0){
strcpy(z,"00010100011111001001110");
}
else if(strcmp(x,"110110100010")==0){
strcpy(z,"00010100011100110100100");
}
else if(strcmp(x,"110110100011")==0){
strcpy(z,"00010100011010011111010");
}
else if(strcmp(x,"110110100100")==0){
strcpy(z,"00010100011000001010000");
}
else if(strcmp(x,"110110100101")==0){
strcpy(z,"00010100010101110100111");
}
else if(strcmp(x,"110110100110")==0){
strcpy(z,"00010100010011011111110");
}
else if(strcmp(x,"110110100111")==0){
strcpy(z,"00010100010001001010101");
}
else if(strcmp(x,"110110101000")==0){
strcpy(z,"00010100001110110101100");
}
else if(strcmp(x,"110110101001")==0){
strcpy(z,"00010100001100100000100");
}
else if(strcmp(x,"110110101010")==0){
strcpy(z,"00010100001010001011101");
}
else if(strcmp(x,"110110101011")==0){
strcpy(z,"00010100000111110110101");
}
else if(strcmp(x,"110110101100")==0){
strcpy(z,"00010100000101100001110");
}
else if(strcmp(x,"110110101101")==0){
strcpy(z,"00010100000011001100111");
}
else if(strcmp(x,"110110101110")==0){
strcpy(z,"00010100000000111000001");
}
else if(strcmp(x,"110110101111")==0){
strcpy(z,"00010011111110100011010");
}
else if(strcmp(x,"110110110000")==0){
strcpy(z,"00010011111100001110100");
}
else if(strcmp(x,"110110110001")==0){
strcpy(z,"00010011111001111001111");
}
else if(strcmp(x,"110110110010")==0){
strcpy(z,"00010011110111100101010");
}
else if(strcmp(x,"110110110011")==0){
strcpy(z,"00010011110101010000101");
}
else if(strcmp(x,"110110110100")==0){
strcpy(z,"00010011110010111100000");
}
else if(strcmp(x,"110110110101")==0){
strcpy(z,"00010011110000100111100");
}
else if(strcmp(x,"110110110110")==0){
strcpy(z,"00010011101110010011000");
}
else if(strcmp(x,"110110110111")==0){
strcpy(z,"00010011101011111110100");
}
else if(strcmp(x,"110110111000")==0){
strcpy(z,"00010011101001101010000");
}
else if(strcmp(x,"110110111001")==0){
strcpy(z,"00010011100111010101101");
}
else if(strcmp(x,"110110111010")==0){
strcpy(z,"00010011100101000001011");
}
else if(strcmp(x,"110110111011")==0){
strcpy(z,"00010011100010101101000");
}
else if(strcmp(x,"110110111100")==0){
strcpy(z,"00010011100000011000110");
}
else if(strcmp(x,"110110111101")==0){
strcpy(z,"00010011011110000100100");
}
else if(strcmp(x,"110110111110")==0){
strcpy(z,"00010011011011110000011");
}
else if(strcmp(x,"110110111111")==0){
strcpy(z,"00010011011001011100001");
}
else if(strcmp(x,"110111000000")==0){
strcpy(z,"00010011010111001000001");
}
else if(strcmp(x,"110111000001")==0){
strcpy(z,"00010011010100110100000");
}
else if(strcmp(x,"110111000010")==0){
strcpy(z,"00010011010010100000000");
}
else if(strcmp(x,"110111000011")==0){
strcpy(z,"00010011010000001100000");
}
else if(strcmp(x,"110111000100")==0){
strcpy(z,"00010011001101111000000");
}
else if(strcmp(x,"110111000101")==0){
strcpy(z,"00010011001011100100001");
}
else if(strcmp(x,"110111000110")==0){
strcpy(z,"00010011001001010000010");
}
else if(strcmp(x,"110111000111")==0){
strcpy(z,"00010011000110111100011");
}
else if(strcmp(x,"110111001000")==0){
strcpy(z,"00010011000100101000100");
}
else if(strcmp(x,"110111001001")==0){
strcpy(z,"00010011000010010100110");
}
else if(strcmp(x,"110111001010")==0){
strcpy(z,"00010011000000000001001");
}
else if(strcmp(x,"110111001011")==0){
strcpy(z,"00010010111101101101011");
}
else if(strcmp(x,"110111001100")==0){
strcpy(z,"00010010111011011001110");
}
else if(strcmp(x,"110111001101")==0){
strcpy(z,"00010010111001000110001");
}
else if(strcmp(x,"110111001110")==0){
strcpy(z,"00010010110110110010101");
}
else if(strcmp(x,"110111001111")==0){
strcpy(z,"00010010110100011111000");
}
else if(strcmp(x,"110111010000")==0){
strcpy(z,"00010010110010001011100");
}
else if(strcmp(x,"110111010001")==0){
strcpy(z,"00010010101111111000001");
}
else if(strcmp(x,"110111010010")==0){
strcpy(z,"00010010101101100100101");
}
else if(strcmp(x,"110111010011")==0){
strcpy(z,"00010010101011010001010");
}
else if(strcmp(x,"110111010100")==0){
strcpy(z,"00010010101000111110000");
}
else if(strcmp(x,"110111010101")==0){
strcpy(z,"00010010100110101010101");
}
else if(strcmp(x,"110111010110")==0){
strcpy(z,"00010010100100010111011");
}
else if(strcmp(x,"110111010111")==0){
strcpy(z,"00010010100010000100001");
}
else if(strcmp(x,"110111011000")==0){
strcpy(z,"00010010011111110001000");
}
else if(strcmp(x,"110111011001")==0){
strcpy(z,"00010010011101011101111");
}
else if(strcmp(x,"110111011010")==0){
strcpy(z,"00010010011011001010110");
}
else if(strcmp(x,"110111011011")==0){
strcpy(z,"00010010011000110111101");
}
else if(strcmp(x,"110111011100")==0){
strcpy(z,"00010010010110100100101");
}
else if(strcmp(x,"110111011101")==0){
strcpy(z,"00010010010100010001101");
}
else if(strcmp(x,"110111011110")==0){
strcpy(z,"00010010010001111110110");
}
else if(strcmp(x,"110111011111")==0){
strcpy(z,"00010010001111101011110");
}
else if(strcmp(x,"110111100000")==0){
strcpy(z,"00010010001101011000111");
}
else if(strcmp(x,"110111100001")==0){
strcpy(z,"00010010001011000110001");
}
else if(strcmp(x,"110111100010")==0){
strcpy(z,"00010010001000110011010");
}
else if(strcmp(x,"110111100011")==0){
strcpy(z,"00010010000110100000100");
}
else if(strcmp(x,"110111100100")==0){
strcpy(z,"00010010000100001101110");
}
else if(strcmp(x,"110111100101")==0){
strcpy(z,"00010010000001111011001");
}
else if(strcmp(x,"110111100110")==0){
strcpy(z,"00010001111111101000100");
}
else if(strcmp(x,"110111100111")==0){
strcpy(z,"00010001111101010101111");
}
else if(strcmp(x,"110111101000")==0){
strcpy(z,"00010001111011000011010");
}
else if(strcmp(x,"110111101001")==0){
strcpy(z,"00010001111000110000110");
}
else if(strcmp(x,"110111101010")==0){
strcpy(z,"00010001110110011110010");
}
else if(strcmp(x,"110111101011")==0){
strcpy(z,"00010001110100001011110");
}
else if(strcmp(x,"110111101100")==0){
strcpy(z,"00010001110001111001011");
}
else if(strcmp(x,"110111101101")==0){
strcpy(z,"00010001101111100111000");
}
else if(strcmp(x,"110111101110")==0){
strcpy(z,"00010001101101010100101");
}
else if(strcmp(x,"110111101111")==0){
strcpy(z,"00010001101011000010011");
}
else if(strcmp(x,"110111110000")==0){
strcpy(z,"00010001101000110000001");
}
else if(strcmp(x,"110111110001")==0){
strcpy(z,"00010001100110011101111");
}
else if(strcmp(x,"110111110010")==0){
strcpy(z,"00010001100100001011110");
}
else if(strcmp(x,"110111110011")==0){
strcpy(z,"00010001100001111001100");
}
else if(strcmp(x,"110111110100")==0){
strcpy(z,"00010001011111100111011");
}
else if(strcmp(x,"110111110101")==0){
strcpy(z,"00010001011101010101011");
}
else if(strcmp(x,"110111110110")==0){
strcpy(z,"00010001011011000011011");
}
else if(strcmp(x,"110111110111")==0){
strcpy(z,"00010001011000110001011");
}
else if(strcmp(x,"110111111000")==0){
strcpy(z,"00010001010110011111011");
}
else if(strcmp(x,"110111111001")==0){
strcpy(z,"00010001010100001101100");
}
else if(strcmp(x,"110111111010")==0){
strcpy(z,"00010001010001111011101");
}
else if(strcmp(x,"110111111011")==0){
strcpy(z,"00010001001111101001110");
}
else if(strcmp(x,"110111111100")==0){
strcpy(z,"00010001001101010111111");
}
else if(strcmp(x,"110111111101")==0){
strcpy(z,"00010001001011000110001");
}
else if(strcmp(x,"110111111110")==0){
strcpy(z,"00010001001000110100011");
}
else if(strcmp(x,"110111111111")==0){
strcpy(z,"00010001000110100010110");
}
else if(strcmp(x,"111000000000")==0){
strcpy(z,"00010001000100010001001");
}
else if(strcmp(x,"111000000001")==0){
strcpy(z,"00010001000001111111100");
}
else if(strcmp(x,"111000000010")==0){
strcpy(z,"00010000111111101101111");
}
else if(strcmp(x,"111000000011")==0){
strcpy(z,"00010000111101011100011");
}
else if(strcmp(x,"111000000100")==0){
strcpy(z,"00010000111011001010111");
}
else if(strcmp(x,"111000000101")==0){
strcpy(z,"00010000111000111001011");
}
else if(strcmp(x,"111000000110")==0){
strcpy(z,"00010000110110100111111");
}
else if(strcmp(x,"111000000111")==0){
strcpy(z,"00010000110100010110100");
}
else if(strcmp(x,"111000001000")==0){
strcpy(z,"00010000110010000101010");
}
else if(strcmp(x,"111000001001")==0){
strcpy(z,"00010000101111110011111");
}
else if(strcmp(x,"111000001010")==0){
strcpy(z,"00010000101101100010101");
}
else if(strcmp(x,"111000001011")==0){
strcpy(z,"00010000101011010001011");
}
else if(strcmp(x,"111000001100")==0){
strcpy(z,"00010000101001000000001");
}
else if(strcmp(x,"111000001101")==0){
strcpy(z,"00010000100110101111000");
}
else if(strcmp(x,"111000001110")==0){
strcpy(z,"00010000100100011101111");
}
else if(strcmp(x,"111000001111")==0){
strcpy(z,"00010000100010001100110");
}
else if(strcmp(x,"111000010000")==0){
strcpy(z,"00010000011111111011110");
}
else if(strcmp(x,"111000010001")==0){
strcpy(z,"00010000011101101010110");
}
else if(strcmp(x,"111000010010")==0){
strcpy(z,"00010000011011011001110");
}
else if(strcmp(x,"111000010011")==0){
strcpy(z,"00010000011001001000111");
}
else if(strcmp(x,"111000010100")==0){
strcpy(z,"00010000010110110111111");
}
else if(strcmp(x,"111000010101")==0){
strcpy(z,"00010000010100100111000");
}
else if(strcmp(x,"111000010110")==0){
strcpy(z,"00010000010010010110010");
}
else if(strcmp(x,"111000010111")==0){
strcpy(z,"00010000010000000101100");
}
else if(strcmp(x,"111000011000")==0){
strcpy(z,"00010000001101110100110");
}
else if(strcmp(x,"111000011001")==0){
strcpy(z,"00010000001011100100000");
}
else if(strcmp(x,"111000011010")==0){
strcpy(z,"00010000001001010011011");
}
else if(strcmp(x,"111000011011")==0){
strcpy(z,"00010000000111000010101");
}
else if(strcmp(x,"111000011100")==0){
strcpy(z,"00010000000100110010001");
}
else if(strcmp(x,"111000011101")==0){
strcpy(z,"00010000000010100001100");
}
else if(strcmp(x,"111000011110")==0){
strcpy(z,"00010000000000010001000");
}
else if(strcmp(x,"111000011111")==0){
strcpy(z,"00001111111110000000100");
}
else if(strcmp(x,"111000100000")==0){
strcpy(z,"00001111111011110000001");
}
else if(strcmp(x,"111000100001")==0){
strcpy(z,"00001111111001011111101");
}
else if(strcmp(x,"111000100010")==0){
strcpy(z,"00001111110111001111010");
}
else if(strcmp(x,"111000100011")==0){
strcpy(z,"00001111110100111111000");
}
else if(strcmp(x,"111000100100")==0){
strcpy(z,"00001111110010101110101");
}
else if(strcmp(x,"111000100101")==0){
strcpy(z,"00001111110000011110011");
}
else if(strcmp(x,"111000100110")==0){
strcpy(z,"00001111101110001110001");
}
else if(strcmp(x,"111000100111")==0){
strcpy(z,"00001111101011111110000");
}
else if(strcmp(x,"111000101000")==0){
strcpy(z,"00001111101001101101111");
}
else if(strcmp(x,"111000101001")==0){
strcpy(z,"00001111100111011101110");
}
else if(strcmp(x,"111000101010")==0){
strcpy(z,"00001111100101001101101");
}
else if(strcmp(x,"111000101011")==0){
strcpy(z,"00001111100010111101101");
}
else if(strcmp(x,"111000101100")==0){
strcpy(z,"00001111100000101101101");
}
else if(strcmp(x,"111000101101")==0){
strcpy(z,"00001111011110011101101");
}
else if(strcmp(x,"111000101110")==0){
strcpy(z,"00001111011100001101110");
}
else if(strcmp(x,"111000101111")==0){
strcpy(z,"00001111011001111101111");
}
else if(strcmp(x,"111000110000")==0){
strcpy(z,"00001111010111101110000");
}
else if(strcmp(x,"111000110001")==0){
strcpy(z,"00001111010101011110001");
}
else if(strcmp(x,"111000110010")==0){
strcpy(z,"00001111010011001110011");
}
else if(strcmp(x,"111000110011")==0){
strcpy(z,"00001111010000111110101");
}
else if(strcmp(x,"111000110100")==0){
strcpy(z,"00001111001110101111000");
}
else if(strcmp(x,"111000110101")==0){
strcpy(z,"00001111001100011111010");
}
else if(strcmp(x,"111000110110")==0){
strcpy(z,"00001111001010001111101");
}
else if(strcmp(x,"111000110111")==0){
strcpy(z,"00001111001000000000001");
}
else if(strcmp(x,"111000111000")==0){
strcpy(z,"00001111000101110000100");
}
else if(strcmp(x,"111000111001")==0){
strcpy(z,"00001111000011100001000");
}
else if(strcmp(x,"111000111010")==0){
strcpy(z,"00001111000001010001100");
}
else if(strcmp(x,"111000111011")==0){
strcpy(z,"00001110111111000010001");
}
else if(strcmp(x,"111000111100")==0){
strcpy(z,"00001110111100110010101");
}
else if(strcmp(x,"111000111101")==0){
strcpy(z,"00001110111010100011010");
}
else if(strcmp(x,"111000111110")==0){
strcpy(z,"00001110111000010100000");
}
else if(strcmp(x,"111000111111")==0){
strcpy(z,"00001110110110000100101");
}
else if(strcmp(x,"111001000000")==0){
strcpy(z,"00001110110011110101011");
}
else if(strcmp(x,"111001000001")==0){
strcpy(z,"00001110110001100110010");
}
else if(strcmp(x,"111001000010")==0){
strcpy(z,"00001110101111010111000");
}
else if(strcmp(x,"111001000011")==0){
strcpy(z,"00001110101101000111111");
}
else if(strcmp(x,"111001000100")==0){
strcpy(z,"00001110101010111000110");
}
else if(strcmp(x,"111001000101")==0){
strcpy(z,"00001110101000101001110");
}
else if(strcmp(x,"111001000110")==0){
strcpy(z,"00001110100110011010101");
}
else if(strcmp(x,"111001000111")==0){
strcpy(z,"00001110100100001011101");
}
else if(strcmp(x,"111001001000")==0){
strcpy(z,"00001110100001111100110");
}
else if(strcmp(x,"111001001001")==0){
strcpy(z,"00001110011111101101110");
}
else if(strcmp(x,"111001001010")==0){
strcpy(z,"00001110011101011110111");
}
else if(strcmp(x,"111001001011")==0){
strcpy(z,"00001110011011010000000");
}
else if(strcmp(x,"111001001100")==0){
strcpy(z,"00001110011001000001010");
}
else if(strcmp(x,"111001001101")==0){
strcpy(z,"00001110010110110010100");
}
else if(strcmp(x,"111001001110")==0){
strcpy(z,"00001110010100100011110");
}
else if(strcmp(x,"111001001111")==0){
strcpy(z,"00001110010010010101000");
}
else if(strcmp(x,"111001010000")==0){
strcpy(z,"00001110010000000110011");
}
else if(strcmp(x,"111001010001")==0){
strcpy(z,"00001110001101110111110");
}
else if(strcmp(x,"111001010010")==0){
strcpy(z,"00001110001011101001001");
}
else if(strcmp(x,"111001010011")==0){
strcpy(z,"00001110001001011010100");
}
else if(strcmp(x,"111001010100")==0){
strcpy(z,"00001110000111001100000");
}
else if(strcmp(x,"111001010101")==0){
strcpy(z,"00001110000100111101100");
}
else if(strcmp(x,"111001010110")==0){
strcpy(z,"00001110000010101111001");
}
else if(strcmp(x,"111001010111")==0){
strcpy(z,"00001110000000100000110");
}
else if(strcmp(x,"111001011000")==0){
strcpy(z,"00001101111110010010011");
}
else if(strcmp(x,"111001011001")==0){
strcpy(z,"00001101111100000100000");
}
else if(strcmp(x,"111001011010")==0){
strcpy(z,"00001101111001110101110");
}
else if(strcmp(x,"111001011011")==0){
strcpy(z,"00001101110111100111011");
}
else if(strcmp(x,"111001011100")==0){
strcpy(z,"00001101110101011001010");
}
else if(strcmp(x,"111001011101")==0){
strcpy(z,"00001101110011001011000");
}
else if(strcmp(x,"111001011110")==0){
strcpy(z,"00001101110000111100111");
}
else if(strcmp(x,"111001011111")==0){
strcpy(z,"00001101101110101110110");
}
else if(strcmp(x,"111001100000")==0){
strcpy(z,"00001101101100100000101");
}
else if(strcmp(x,"111001100001")==0){
strcpy(z,"00001101101010010010101");
}
else if(strcmp(x,"111001100010")==0){
strcpy(z,"00001101101000000100101");
}
else if(strcmp(x,"111001100011")==0){
strcpy(z,"00001101100101110110101");
}
else if(strcmp(x,"111001100100")==0){
strcpy(z,"00001101100011101000110");
}
else if(strcmp(x,"111001100101")==0){
strcpy(z,"00001101100001011010110");
}
else if(strcmp(x,"111001100110")==0){
strcpy(z,"00001101011111001101000");
}
else if(strcmp(x,"111001100111")==0){
strcpy(z,"00001101011100111111001");
}
else if(strcmp(x,"111001101000")==0){
strcpy(z,"00001101011010110001011");
}
else if(strcmp(x,"111001101001")==0){
strcpy(z,"00001101011000100011101");
}
else if(strcmp(x,"111001101010")==0){
strcpy(z,"00001101010110010101111");
}
else if(strcmp(x,"111001101011")==0){
strcpy(z,"00001101010100001000001");
}
else if(strcmp(x,"111001101100")==0){
strcpy(z,"00001101010001111010100");
}
else if(strcmp(x,"111001101101")==0){
strcpy(z,"00001101001111101100111");
}
else if(strcmp(x,"111001101110")==0){
strcpy(z,"00001101001101011111011");
}
else if(strcmp(x,"111001101111")==0){
strcpy(z,"00001101001011010001111");
}
else if(strcmp(x,"111001110000")==0){
strcpy(z,"00001101001001000100011");
}
else if(strcmp(x,"111001110001")==0){
strcpy(z,"00001101000110110110111");
}
else if(strcmp(x,"111001110010")==0){
strcpy(z,"00001101000100101001100");
}
else if(strcmp(x,"111001110011")==0){
strcpy(z,"00001101000010011100001");
}
else if(strcmp(x,"111001110100")==0){
strcpy(z,"00001101000000001110110");
}
else if(strcmp(x,"111001110101")==0){
strcpy(z,"00001100111110000001011");
}
else if(strcmp(x,"111001110110")==0){
strcpy(z,"00001100111011110100001");
}
else if(strcmp(x,"111001110111")==0){
strcpy(z,"00001100111001100110111");
}
else if(strcmp(x,"111001111000")==0){
strcpy(z,"00001100110111011001101");
}
else if(strcmp(x,"111001111001")==0){
strcpy(z,"00001100110101001100100");
}
else if(strcmp(x,"111001111010")==0){
strcpy(z,"00001100110010111111011");
}
else if(strcmp(x,"111001111011")==0){
strcpy(z,"00001100110000110010010");
}
else if(strcmp(x,"111001111100")==0){
strcpy(z,"00001100101110100101010");
}
else if(strcmp(x,"111001111101")==0){
strcpy(z,"00001100101100011000001");
}
else if(strcmp(x,"111001111110")==0){
strcpy(z,"00001100101010001011001");
}
else if(strcmp(x,"111001111111")==0){
strcpy(z,"00001100100111111110010");
}
else if(strcmp(x,"111010000000")==0){
strcpy(z,"00001100100101110001010");
}
else if(strcmp(x,"111010000001")==0){
strcpy(z,"00001100100011100100011");
}
else if(strcmp(x,"111010000010")==0){
strcpy(z,"00001100100001010111101");
}
else if(strcmp(x,"111010000011")==0){
strcpy(z,"00001100011111001010110");
}
else if(strcmp(x,"111010000100")==0){
strcpy(z,"00001100011100111110000");
}
else if(strcmp(x,"111010000101")==0){
strcpy(z,"00001100011010110001010");
}
else if(strcmp(x,"111010000110")==0){
strcpy(z,"00001100011000100100100");
}
else if(strcmp(x,"111010000111")==0){
strcpy(z,"00001100010110010111111");
}
else if(strcmp(x,"111010001000")==0){
strcpy(z,"00001100010100001011010");
}
else if(strcmp(x,"111010001001")==0){
strcpy(z,"00001100010001111110101");
}
else if(strcmp(x,"111010001010")==0){
strcpy(z,"00001100001111110010001");
}
else if(strcmp(x,"111010001011")==0){
strcpy(z,"00001100001101100101101");
}
else if(strcmp(x,"111010001100")==0){
strcpy(z,"00001100001011011001001");
}
else if(strcmp(x,"111010001101")==0){
strcpy(z,"00001100001001001100101");
}
else if(strcmp(x,"111010001110")==0){
strcpy(z,"00001100000111000000010");
}
else if(strcmp(x,"111010001111")==0){
strcpy(z,"00001100000100110011111");
}
else if(strcmp(x,"111010010000")==0){
strcpy(z,"00001100000010100111100");
}
else if(strcmp(x,"111010010001")==0){
strcpy(z,"00001100000000011011010");
}
else if(strcmp(x,"111010010010")==0){
strcpy(z,"00001011111110001111000");
}
else if(strcmp(x,"111010010011")==0){
strcpy(z,"00001011111100000010110");
}
else if(strcmp(x,"111010010100")==0){
strcpy(z,"00001011111001110110100");
}
else if(strcmp(x,"111010010101")==0){
strcpy(z,"00001011110111101010011");
}
else if(strcmp(x,"111010010110")==0){
strcpy(z,"00001011110101011110010");
}
else if(strcmp(x,"111010010111")==0){
strcpy(z,"00001011110011010010001");
}
else if(strcmp(x,"111010011000")==0){
strcpy(z,"00001011110001000110001");
}
else if(strcmp(x,"111010011001")==0){
strcpy(z,"00001011101110111010000");
}
else if(strcmp(x,"111010011010")==0){
strcpy(z,"00001011101100101110001");
}
else if(strcmp(x,"111010011011")==0){
strcpy(z,"00001011101010100010001");
}
else if(strcmp(x,"111010011100")==0){
strcpy(z,"00001011101000010110010");
}
else if(strcmp(x,"111010011101")==0){
strcpy(z,"00001011100110001010011");
}
else if(strcmp(x,"111010011110")==0){
strcpy(z,"00001011100011111110100");
}
else if(strcmp(x,"111010011111")==0){
strcpy(z,"00001011100001110010110");
}
else if(strcmp(x,"111010100000")==0){
strcpy(z,"00001011011111100110111");
}
else if(strcmp(x,"111010100001")==0){
strcpy(z,"00001011011101011011010");
}
else if(strcmp(x,"111010100010")==0){
strcpy(z,"00001011011011001111100");
}
else if(strcmp(x,"111010100011")==0){
strcpy(z,"00001011011001000011111");
}
else if(strcmp(x,"111010100100")==0){
strcpy(z,"00001011010110111000010");
}
else if(strcmp(x,"111010100101")==0){
strcpy(z,"00001011010100101100101");
}
else if(strcmp(x,"111010100110")==0){
strcpy(z,"00001011010010100001000");
}
else if(strcmp(x,"111010100111")==0){
strcpy(z,"00001011010000010101100");
}
else if(strcmp(x,"111010101000")==0){
strcpy(z,"00001011001110001010000");
}
else if(strcmp(x,"111010101001")==0){
strcpy(z,"00001011001011111110101");
}
else if(strcmp(x,"111010101010")==0){
strcpy(z,"00001011001001110011001");
}
else if(strcmp(x,"111010101011")==0){
strcpy(z,"00001011000111100111110");
}
else if(strcmp(x,"111010101100")==0){
strcpy(z,"00001011000101011100100");
}
else if(strcmp(x,"111010101101")==0){
strcpy(z,"00001011000011010001001");
}
else if(strcmp(x,"111010101110")==0){
strcpy(z,"00001011000001000101111");
}
else if(strcmp(x,"111010101111")==0){
strcpy(z,"00001010111110111010101");
}
else if(strcmp(x,"111010110000")==0){
strcpy(z,"00001010111100101111100");
}
else if(strcmp(x,"111010110001")==0){
strcpy(z,"00001010111010100100010");
}
else if(strcmp(x,"111010110010")==0){
strcpy(z,"00001010111000011001001");
}
else if(strcmp(x,"111010110011")==0){
strcpy(z,"00001010110110001110000");
}
else if(strcmp(x,"111010110100")==0){
strcpy(z,"00001010110100000011000");
}
else if(strcmp(x,"111010110101")==0){
strcpy(z,"00001010110001111000000");
}
else if(strcmp(x,"111010110110")==0){
strcpy(z,"00001010101111101101000");
}
else if(strcmp(x,"111010110111")==0){
strcpy(z,"00001010101101100010000");
}
else if(strcmp(x,"111010111000")==0){
strcpy(z,"00001010101011010111001");
}
else if(strcmp(x,"111010111001")==0){
strcpy(z,"00001010101001001100010");
}
else if(strcmp(x,"111010111010")==0){
strcpy(z,"00001010100111000001011");
}
else if(strcmp(x,"111010111011")==0){
strcpy(z,"00001010100100110110101");
}
else if(strcmp(x,"111010111100")==0){
strcpy(z,"00001010100010101011110");
}
else if(strcmp(x,"111010111101")==0){
strcpy(z,"00001010100000100001000");
}
else if(strcmp(x,"111010111110")==0){
strcpy(z,"00001010011110010110011");
}
else if(strcmp(x,"111010111111")==0){
strcpy(z,"00001010011100001011101");
}
else if(strcmp(x,"111011000000")==0){
strcpy(z,"00001010011010000001000");
}
else if(strcmp(x,"111011000001")==0){
strcpy(z,"00001010010111110110100");
}
else if(strcmp(x,"111011000010")==0){
strcpy(z,"00001010010101101011111");
}
else if(strcmp(x,"111011000011")==0){
strcpy(z,"00001010010011100001011");
}
else if(strcmp(x,"111011000100")==0){
strcpy(z,"00001010010001010110111");
}
else if(strcmp(x,"111011000101")==0){
strcpy(z,"00001010001111001100011");
}
else if(strcmp(x,"111011000110")==0){
strcpy(z,"00001010001101000010000");
}
else if(strcmp(x,"111011000111")==0){
strcpy(z,"00001010001010110111101");
}
else if(strcmp(x,"111011001000")==0){
strcpy(z,"00001010001000101101010");
}
else if(strcmp(x,"111011001001")==0){
strcpy(z,"00001010000110100010111");
}
else if(strcmp(x,"111011001010")==0){
strcpy(z,"00001010000100011000101");
}
else if(strcmp(x,"111011001011")==0){
strcpy(z,"00001010000010001110011");
}
else if(strcmp(x,"111011001100")==0){
strcpy(z,"00001010000000000100001");
}
else if(strcmp(x,"111011001101")==0){
strcpy(z,"00001001111101111010000");
}
else if(strcmp(x,"111011001110")==0){
strcpy(z,"00001001111011101111111");
}
else if(strcmp(x,"111011001111")==0){
strcpy(z,"00001001111001100101110");
}
else if(strcmp(x,"111011010000")==0){
strcpy(z,"00001001110111011011101");
}
else if(strcmp(x,"111011010001")==0){
strcpy(z,"00001001110101010001101");
}
else if(strcmp(x,"111011010010")==0){
strcpy(z,"00001001110011000111101");
}
else if(strcmp(x,"111011010011")==0){
strcpy(z,"00001001110000111101101");
}
else if(strcmp(x,"111011010100")==0){
strcpy(z,"00001001101110110011110");
}
else if(strcmp(x,"111011010101")==0){
strcpy(z,"00001001101100101001110");
}
else if(strcmp(x,"111011010110")==0){
strcpy(z,"00001001101010100000000");
}
else if(strcmp(x,"111011010111")==0){
strcpy(z,"00001001101000010110001");
}
else if(strcmp(x,"111011011000")==0){
strcpy(z,"00001001100110001100011");
}
else if(strcmp(x,"111011011001")==0){
strcpy(z,"00001001100100000010100");
}
else if(strcmp(x,"111011011010")==0){
strcpy(z,"00001001100001111000111");
}
else if(strcmp(x,"111011011011")==0){
strcpy(z,"00001001011111101111001");
}
else if(strcmp(x,"111011011100")==0){
strcpy(z,"00001001011101100101100");
}
else if(strcmp(x,"111011011101")==0){
strcpy(z,"00001001011011011011111");
}
else if(strcmp(x,"111011011110")==0){
strcpy(z,"00001001011001010010010");
}
else if(strcmp(x,"111011011111")==0){
strcpy(z,"00001001010111001000110");
}
else if(strcmp(x,"111011100000")==0){
strcpy(z,"00001001010100111111010");
}
else if(strcmp(x,"111011100001")==0){
strcpy(z,"00001001010010110101110");
}
else if(strcmp(x,"111011100010")==0){
strcpy(z,"00001001010000101100010");
}
else if(strcmp(x,"111011100011")==0){
strcpy(z,"00001001001110100010111");
}
else if(strcmp(x,"111011100100")==0){
strcpy(z,"00001001001100011001100");
}
else if(strcmp(x,"111011100101")==0){
strcpy(z,"00001001001010010000001");
}
else if(strcmp(x,"111011100110")==0){
strcpy(z,"00001001001000000110111");
}
else if(strcmp(x,"111011100111")==0){
strcpy(z,"00001001000101111101101");
}
else if(strcmp(x,"111011101000")==0){
strcpy(z,"00001001000011110100011");
}
else if(strcmp(x,"111011101001")==0){
strcpy(z,"00001001000001101011001");
}
else if(strcmp(x,"111011101010")==0){
strcpy(z,"00001000111111100010000");
}
else if(strcmp(x,"111011101011")==0){
strcpy(z,"00001000111101011000111");
}
else if(strcmp(x,"111011101100")==0){
strcpy(z,"00001000111011001111110");
}
else if(strcmp(x,"111011101101")==0){
strcpy(z,"00001000111001000110101");
}
else if(strcmp(x,"111011101110")==0){
strcpy(z,"00001000110110111101101");
}
else if(strcmp(x,"111011101111")==0){
strcpy(z,"00001000110100110100101");
}
else if(strcmp(x,"111011110000")==0){
strcpy(z,"00001000110010101011110");
}
else if(strcmp(x,"111011110001")==0){
strcpy(z,"00001000110000100010110");
}
else if(strcmp(x,"111011110010")==0){
strcpy(z,"00001000101110011001111");
}
else if(strcmp(x,"111011110011")==0){
strcpy(z,"00001000101100010001000");
}
else if(strcmp(x,"111011110100")==0){
strcpy(z,"00001000101010001000010");
}
else if(strcmp(x,"111011110101")==0){
strcpy(z,"00001000100111111111011");
}
else if(strcmp(x,"111011110110")==0){
strcpy(z,"00001000100101110110101");
}
else if(strcmp(x,"111011110111")==0){
strcpy(z,"00001000100011101110000");
}
else if(strcmp(x,"111011111000")==0){
strcpy(z,"00001000100001100101010");
}
else if(strcmp(x,"111011111001")==0){
strcpy(z,"00001000011111011100101");
}
else if(strcmp(x,"111011111010")==0){
strcpy(z,"00001000011101010100000");
}
else if(strcmp(x,"111011111011")==0){
strcpy(z,"00001000011011001011011");
}
else if(strcmp(x,"111011111100")==0){
strcpy(z,"00001000011001000010111");
}
else if(strcmp(x,"111011111101")==0){
strcpy(z,"00001000010110111010011");
}
else if(strcmp(x,"111011111110")==0){
strcpy(z,"00001000010100110001111");
}
else if(strcmp(x,"111011111111")==0){
strcpy(z,"00001000010010101001100");
}
else if(strcmp(x,"111100000000")==0){
strcpy(z,"00001000010000100001000");
}
else if(strcmp(x,"111100000001")==0){
strcpy(z,"00001000001110011000101");
}
else if(strcmp(x,"111100000010")==0){
strcpy(z,"00001000001100010000011");
}
else if(strcmp(x,"111100000011")==0){
strcpy(z,"00001000001010001000000");
}
else if(strcmp(x,"111100000100")==0){
strcpy(z,"00001000000111111111110");
}
else if(strcmp(x,"111100000101")==0){
strcpy(z,"00001000000101110111100");
}
else if(strcmp(x,"111100000110")==0){
strcpy(z,"00001000000011101111010");
}
else if(strcmp(x,"111100000111")==0){
strcpy(z,"00001000000001100111001");
}
else if(strcmp(x,"111100001000")==0){
strcpy(z,"00000111111111011111000");
}
else if(strcmp(x,"111100001001")==0){
strcpy(z,"00000111111101010110111");
}
else if(strcmp(x,"111100001010")==0){
strcpy(z,"00000111111011001110111");
}
else if(strcmp(x,"111100001011")==0){
strcpy(z,"00000111111001000110110");
}
else if(strcmp(x,"111100001100")==0){
strcpy(z,"00000111110110111110110");
}
else if(strcmp(x,"111100001101")==0){
strcpy(z,"00000111110100110110111");
}
else if(strcmp(x,"111100001110")==0){
strcpy(z,"00000111110010101110111");
}
else if(strcmp(x,"111100001111")==0){
strcpy(z,"00000111110000100111000");
}
else if(strcmp(x,"111100010000")==0){
strcpy(z,"00000111101110011111001");
}
else if(strcmp(x,"111100010001")==0){
strcpy(z,"00000111101100010111011");
}
else if(strcmp(x,"111100010010")==0){
strcpy(z,"00000111101010001111100");
}
else if(strcmp(x,"111100010011")==0){
strcpy(z,"00000111101000000111110");
}
else if(strcmp(x,"111100010100")==0){
strcpy(z,"00000111100110000000001");
}
else if(strcmp(x,"111100010101")==0){
strcpy(z,"00000111100011111000011");
}
else if(strcmp(x,"111100010110")==0){
strcpy(z,"00000111100001110000110");
}
else if(strcmp(x,"111100010111")==0){
strcpy(z,"00000111011111101001001");
}
else if(strcmp(x,"111100011000")==0){
strcpy(z,"00000111011101100001100");
}
else if(strcmp(x,"111100011001")==0){
strcpy(z,"00000111011011011010000");
}
else if(strcmp(x,"111100011010")==0){
strcpy(z,"00000111011001010010100");
}
else if(strcmp(x,"111100011011")==0){
strcpy(z,"00000111010111001011000");
}
else if(strcmp(x,"111100011100")==0){
strcpy(z,"00000111010101000011100");
}
else if(strcmp(x,"111100011101")==0){
strcpy(z,"00000111010010111100001");
}
else if(strcmp(x,"111100011110")==0){
strcpy(z,"00000111010000110100110");
}
else if(strcmp(x,"111100011111")==0){
strcpy(z,"00000111001110101101011");
}
else if(strcmp(x,"111100100000")==0){
strcpy(z,"00000111001100100110000");
}
else if(strcmp(x,"111100100001")==0){
strcpy(z,"00000111001010011110110");
}
else if(strcmp(x,"111100100010")==0){
strcpy(z,"00000111001000010111100");
}
else if(strcmp(x,"111100100011")==0){
strcpy(z,"00000111000110010000010");
}
else if(strcmp(x,"111100100100")==0){
strcpy(z,"00000111000100001001001");
}
else if(strcmp(x,"111100100101")==0){
strcpy(z,"00000111000010000010000");
}
else if(strcmp(x,"111100100110")==0){
strcpy(z,"00000110111111111010111");
}
else if(strcmp(x,"111100100111")==0){
strcpy(z,"00000110111101110011110");
}
else if(strcmp(x,"111100101000")==0){
strcpy(z,"00000110111011101100110");
}
else if(strcmp(x,"111100101001")==0){
strcpy(z,"00000110111001100101110");
}
else if(strcmp(x,"111100101010")==0){
strcpy(z,"00000110110111011110110");
}
else if(strcmp(x,"111100101011")==0){
strcpy(z,"00000110110101010111111");
}
else if(strcmp(x,"111100101100")==0){
strcpy(z,"00000110110011010000111");
}
else if(strcmp(x,"111100101101")==0){
strcpy(z,"00000110110001001010000");
}
else if(strcmp(x,"111100101110")==0){
strcpy(z,"00000110101111000011010");
}
else if(strcmp(x,"111100101111")==0){
strcpy(z,"00000110101100111100011");
}
else if(strcmp(x,"111100110000")==0){
strcpy(z,"00000110101010110101101");
}
else if(strcmp(x,"111100110001")==0){
strcpy(z,"00000110101000101110111");
}
else if(strcmp(x,"111100110010")==0){
strcpy(z,"00000110100110101000001");
}
else if(strcmp(x,"111100110011")==0){
strcpy(z,"00000110100100100001100");
}
else if(strcmp(x,"111100110100")==0){
strcpy(z,"00000110100010011010111");
}
else if(strcmp(x,"111100110101")==0){
strcpy(z,"00000110100000010100010");
}
else if(strcmp(x,"111100110110")==0){
strcpy(z,"00000110011110001101101");
}
else if(strcmp(x,"111100110111")==0){
strcpy(z,"00000110011100000111001");
}
else if(strcmp(x,"111100111000")==0){
strcpy(z,"00000110011010000000101");
}
else if(strcmp(x,"111100111001")==0){
strcpy(z,"00000110010111111010001");
}
else if(strcmp(x,"111100111010")==0){
strcpy(z,"00000110010101110011110");
}
else if(strcmp(x,"111100111011")==0){
strcpy(z,"00000110010011101101011");
}
else if(strcmp(x,"111100111100")==0){
strcpy(z,"00000110010001100111000");
}
else if(strcmp(x,"111100111101")==0){
strcpy(z,"00000110001111100000101");
}
else if(strcmp(x,"111100111110")==0){
strcpy(z,"00000110001101011010011");
}
else if(strcmp(x,"111100111111")==0){
strcpy(z,"00000110001011010100000");
}
else if(strcmp(x,"111101000000")==0){
strcpy(z,"00000110001001001101111");
}
else if(strcmp(x,"111101000001")==0){
strcpy(z,"00000110000111000111101");
}
else if(strcmp(x,"111101000010")==0){
strcpy(z,"00000110000101000001100");
}
else if(strcmp(x,"111101000011")==0){
strcpy(z,"00000110000010111011011");
}
else if(strcmp(x,"111101000100")==0){
strcpy(z,"00000110000000110101010");
}
else if(strcmp(x,"111101000101")==0){
strcpy(z,"00000101111110101111001");
}
else if(strcmp(x,"111101000110")==0){
strcpy(z,"00000101111100101001001");
}
else if(strcmp(x,"111101000111")==0){
strcpy(z,"00000101111010100011001");
}
else if(strcmp(x,"111101001000")==0){
strcpy(z,"00000101111000011101001");
}
else if(strcmp(x,"111101001001")==0){
strcpy(z,"00000101110110010111010");
}
else if(strcmp(x,"111101001010")==0){
strcpy(z,"00000101110100010001011");
}
else if(strcmp(x,"111101001011")==0){
strcpy(z,"00000101110010001011100");
}
else if(strcmp(x,"111101001100")==0){
strcpy(z,"00000101110000000101101");
}
else if(strcmp(x,"111101001101")==0){
strcpy(z,"00000101101101111111111");
}
else if(strcmp(x,"111101001110")==0){
strcpy(z,"00000101101011111010000");
}
else if(strcmp(x,"111101001111")==0){
strcpy(z,"00000101101001110100011");
}
else if(strcmp(x,"111101010000")==0){
strcpy(z,"00000101100111101110101");
}
else if(strcmp(x,"111101010001")==0){
strcpy(z,"00000101100101101001000");
}
else if(strcmp(x,"111101010010")==0){
strcpy(z,"00000101100011100011011");
}
else if(strcmp(x,"111101010011")==0){
strcpy(z,"00000101100001011101110");
}
else if(strcmp(x,"111101010100")==0){
strcpy(z,"00000101011111011000001");
}
else if(strcmp(x,"111101010101")==0){
strcpy(z,"00000101011101010010101");
}
else if(strcmp(x,"111101010110")==0){
strcpy(z,"00000101011011001101001");
}
else if(strcmp(x,"111101010111")==0){
strcpy(z,"00000101011001000111101");
}
else if(strcmp(x,"111101011000")==0){
strcpy(z,"00000101010111000010010");
}
else if(strcmp(x,"111101011001")==0){
strcpy(z,"00000101010100111100111");
}
else if(strcmp(x,"111101011010")==0){
strcpy(z,"00000101010010110111100");
}
else if(strcmp(x,"111101011011")==0){
strcpy(z,"00000101010000110010001");
}
else if(strcmp(x,"111101011100")==0){
strcpy(z,"00000101001110101100111");
}
else if(strcmp(x,"111101011101")==0){
strcpy(z,"00000101001100100111101");
}
else if(strcmp(x,"111101011110")==0){
strcpy(z,"00000101001010100010011");
}
else if(strcmp(x,"111101011111")==0){
strcpy(z,"00000101001000011101001");
}
else if(strcmp(x,"111101100000")==0){
strcpy(z,"00000101000110011000000");
}
else if(strcmp(x,"111101100001")==0){
strcpy(z,"00000101000100010010111");
}
else if(strcmp(x,"111101100010")==0){
strcpy(z,"00000101000010001101110");
}
else if(strcmp(x,"111101100011")==0){
strcpy(z,"00000101000000001000101");
}
else if(strcmp(x,"111101100100")==0){
strcpy(z,"00000100111110000011101");
}
else if(strcmp(x,"111101100101")==0){
strcpy(z,"00000100111011111110101");
}
else if(strcmp(x,"111101100110")==0){
strcpy(z,"00000100111001111001101");
}
else if(strcmp(x,"111101100111")==0){
strcpy(z,"00000100110111110100110");
}
else if(strcmp(x,"111101101000")==0){
strcpy(z,"00000100110101101111111");
}
else if(strcmp(x,"111101101001")==0){
strcpy(z,"00000100110011101011000");
}
else if(strcmp(x,"111101101010")==0){
strcpy(z,"00000100110001100110001");
}
else if(strcmp(x,"111101101011")==0){
strcpy(z,"00000100101111100001011");
}
else if(strcmp(x,"111101101100")==0){
strcpy(z,"00000100101101011100100");
}
else if(strcmp(x,"111101101101")==0){
strcpy(z,"00000100101011010111110");
}
else if(strcmp(x,"111101101110")==0){
strcpy(z,"00000100101001010011001");
}
else if(strcmp(x,"111101101111")==0){
strcpy(z,"00000100100111001110011");
}
else if(strcmp(x,"111101110000")==0){
strcpy(z,"00000100100101001001110");
}
else if(strcmp(x,"111101110001")==0){
strcpy(z,"00000100100011000101010");
}
else if(strcmp(x,"111101110010")==0){
strcpy(z,"00000100100001000000101");
}
else if(strcmp(x,"111101110011")==0){
strcpy(z,"00000100011110111100001");
}
else if(strcmp(x,"111101110100")==0){
strcpy(z,"00000100011100110111101");
}
else if(strcmp(x,"111101110101")==0){
strcpy(z,"00000100011010110011001");
}
else if(strcmp(x,"111101110110")==0){
strcpy(z,"00000100011000101110101");
}
else if(strcmp(x,"111101110111")==0){
strcpy(z,"00000100010110101010010");
}
else if(strcmp(x,"111101111000")==0){
strcpy(z,"00000100010100100101111");
}
else if(strcmp(x,"111101111001")==0){
strcpy(z,"00000100010010100001100");
}
else if(strcmp(x,"111101111010")==0){
strcpy(z,"00000100010000011101010");
}
else if(strcmp(x,"111101111011")==0){
strcpy(z,"00000100001110011001000");
}
else if(strcmp(x,"111101111100")==0){
strcpy(z,"00000100001100010100110");
}
else if(strcmp(x,"111101111101")==0){
strcpy(z,"00000100001010010000100");
}
else if(strcmp(x,"111101111110")==0){
strcpy(z,"00000100001000001100011");
}
else if(strcmp(x,"111101111111")==0){
strcpy(z,"00000100000110001000001");
}
else if(strcmp(x,"111110000000")==0){
strcpy(z,"00000100000100000100001");
}
else if(strcmp(x,"111110000001")==0){
strcpy(z,"00000100000010000000000");
}
else if(strcmp(x,"111110000010")==0){
strcpy(z,"00000011111111111100000");
}
else if(strcmp(x,"111110000011")==0){
strcpy(z,"00000011111101110111111");
}
else if(strcmp(x,"111110000100")==0){
strcpy(z,"00000011111011110100000");
}
else if(strcmp(x,"111110000101")==0){
strcpy(z,"00000011111001110000000");
}
else if(strcmp(x,"111110000110")==0){
strcpy(z,"00000011110111101100001");
}
else if(strcmp(x,"111110000111")==0){
strcpy(z,"00000011110101101000010");
}
else if(strcmp(x,"111110001000")==0){
strcpy(z,"00000011110011100100011");
}
else if(strcmp(x,"111110001001")==0){
strcpy(z,"00000011110001100000100");
}
else if(strcmp(x,"111110001010")==0){
strcpy(z,"00000011101111011100110");
}
else if(strcmp(x,"111110001011")==0){
strcpy(z,"00000011101101011001000");
}
else if(strcmp(x,"111110001100")==0){
strcpy(z,"00000011101011010101010");
}
else if(strcmp(x,"111110001101")==0){
strcpy(z,"00000011101001010001101");
}
else if(strcmp(x,"111110001110")==0){
strcpy(z,"00000011100111001101111");
}
else if(strcmp(x,"111110001111")==0){
strcpy(z,"00000011100101001010010");
}
else if(strcmp(x,"111110010000")==0){
strcpy(z,"00000011100011000110110");
}
else if(strcmp(x,"111110010001")==0){
strcpy(z,"00000011100001000011001");
}
else if(strcmp(x,"111110010010")==0){
strcpy(z,"00000011011110111111101");
}
else if(strcmp(x,"111110010011")==0){
strcpy(z,"00000011011100111100001");
}
else if(strcmp(x,"111110010100")==0){
strcpy(z,"00000011011010111000101");
}
else if(strcmp(x,"111110010101")==0){
strcpy(z,"00000011011000110101010");
}
else if(strcmp(x,"111110010110")==0){
strcpy(z,"00000011010110110001111");
}
else if(strcmp(x,"111110010111")==0){
strcpy(z,"00000011010100101110100");
}
else if(strcmp(x,"111110011000")==0){
strcpy(z,"00000011010010101011001");
}
else if(strcmp(x,"111110011001")==0){
strcpy(z,"00000011010000100111111");
}
else if(strcmp(x,"111110011010")==0){
strcpy(z,"00000011001110100100101");
}
else if(strcmp(x,"111110011011")==0){
strcpy(z,"00000011001100100001011");
}
else if(strcmp(x,"111110011100")==0){
strcpy(z,"00000011001010011110001");
}
else if(strcmp(x,"111110011101")==0){
strcpy(z,"00000011001000011011000");
}
else if(strcmp(x,"111110011110")==0){
strcpy(z,"00000011000110010111111");
}
else if(strcmp(x,"111110011111")==0){
strcpy(z,"00000011000100010100110");
}
else if(strcmp(x,"111110100000")==0){
strcpy(z,"00000011000010010001110");
}
else if(strcmp(x,"111110100001")==0){
strcpy(z,"00000011000000001110101");
}
else if(strcmp(x,"111110100010")==0){
strcpy(z,"00000010111110001011101");
}
else if(strcmp(x,"111110100011")==0){
strcpy(z,"00000010111100001000110");
}
else if(strcmp(x,"111110100100")==0){
strcpy(z,"00000010111010000101110");
}
else if(strcmp(x,"111110100101")==0){
strcpy(z,"00000010111000000010111");
}
else if(strcmp(x,"111110100110")==0){
strcpy(z,"00000010110110000000000");
}
else if(strcmp(x,"111110100111")==0){
strcpy(z,"00000010110011111101001");
}
else if(strcmp(x,"111110101000")==0){
strcpy(z,"00000010110001111010011");
}
else if(strcmp(x,"111110101001")==0){
strcpy(z,"00000010101111110111100");
}
else if(strcmp(x,"111110101010")==0){
strcpy(z,"00000010101101110100110");
}
else if(strcmp(x,"111110101011")==0){
strcpy(z,"00000010101011110010001");
}
else if(strcmp(x,"111110101100")==0){
strcpy(z,"00000010101001101111011");
}
else if(strcmp(x,"111110101101")==0){
strcpy(z,"00000010100111101100110");
}
else if(strcmp(x,"111110101110")==0){
strcpy(z,"00000010100101101010001");
}
else if(strcmp(x,"111110101111")==0){
strcpy(z,"00000010100011100111100");
}
else if(strcmp(x,"111110110000")==0){
strcpy(z,"00000010100001100101000");
}
else if(strcmp(x,"111110110001")==0){
strcpy(z,"00000010011111100010100");
}
else if(strcmp(x,"111110110010")==0){
strcpy(z,"00000010011101100000000");
}
else if(strcmp(x,"111110110011")==0){
strcpy(z,"00000010011011011101100");
}
else if(strcmp(x,"111110110100")==0){
strcpy(z,"00000010011001011011001");
}
else if(strcmp(x,"111110110101")==0){
strcpy(z,"00000010010111011000110");
}
else if(strcmp(x,"111110110110")==0){
strcpy(z,"00000010010101010110011");
}
else if(strcmp(x,"111110110111")==0){
strcpy(z,"00000010010011010100000");
}
else if(strcmp(x,"111110111000")==0){
strcpy(z,"00000010010001010001110");
}
else if(strcmp(x,"111110111001")==0){
strcpy(z,"00000010001111001111100");
}
else if(strcmp(x,"111110111010")==0){
strcpy(z,"00000010001101001101010");
}
else if(strcmp(x,"111110111011")==0){
strcpy(z,"00000010001011001011000");
}
else if(strcmp(x,"111110111100")==0){
strcpy(z,"00000010001001001000111");
}
else if(strcmp(x,"111110111101")==0){
strcpy(z,"00000010000111000110110");
}
else if(strcmp(x,"111110111110")==0){
strcpy(z,"00000010000101000100101");
}
else if(strcmp(x,"111110111111")==0){
strcpy(z,"00000010000011000010100");
}
else if(strcmp(x,"111111000000")==0){
strcpy(z,"00000010000001000000100");
}
else if(strcmp(x,"111111000001")==0){
strcpy(z,"00000001111110111110100");
}
else if(strcmp(x,"111111000010")==0){
strcpy(z,"00000001111100111100100");
}
else if(strcmp(x,"111111000011")==0){
strcpy(z,"00000001111010111010101");
}
else if(strcmp(x,"111111000100")==0){
strcpy(z,"00000001111000111000101");
}
else if(strcmp(x,"111111000101")==0){
strcpy(z,"00000001110110110110110");
}
else if(strcmp(x,"111111000110")==0){
strcpy(z,"00000001110100110100111");
}
else if(strcmp(x,"111111000111")==0){
strcpy(z,"00000001110010110011001");
}
else if(strcmp(x,"111111001000")==0){
strcpy(z,"00000001110000110001011");
}
else if(strcmp(x,"111111001001")==0){
strcpy(z,"00000001101110101111101");
}
else if(strcmp(x,"111111001010")==0){
strcpy(z,"00000001101100101101111");
}
else if(strcmp(x,"111111001011")==0){
strcpy(z,"00000001101010101100001");
}
else if(strcmp(x,"111111001100")==0){
strcpy(z,"00000001101000101010100");
}
else if(strcmp(x,"111111001101")==0){
strcpy(z,"00000001100110101000111");
}
else if(strcmp(x,"111111001110")==0){
strcpy(z,"00000001100100100111010");
}
else if(strcmp(x,"111111001111")==0){
strcpy(z,"00000001100010100101110");
}
else if(strcmp(x,"111111010000")==0){
strcpy(z,"00000001100000100100010");
}
else if(strcmp(x,"111111010001")==0){
strcpy(z,"00000001011110100010110");
}
else if(strcmp(x,"111111010010")==0){
strcpy(z,"00000001011100100001010");
}
else if(strcmp(x,"111111010011")==0){
strcpy(z,"00000001011010011111111");
}
else if(strcmp(x,"111111010100")==0){
strcpy(z,"00000001011000011110011");
}
else if(strcmp(x,"111111010101")==0){
strcpy(z,"00000001010110011101000");
}
else if(strcmp(x,"111111010110")==0){
strcpy(z,"00000001010100011011110");
}
else if(strcmp(x,"111111010111")==0){
strcpy(z,"00000001010010011010011");
}
else if(strcmp(x,"111111011000")==0){
strcpy(z,"00000001010000011001001");
}
else if(strcmp(x,"111111011001")==0){
strcpy(z,"00000001001110010111111");
}
else if(strcmp(x,"111111011010")==0){
strcpy(z,"00000001001100010110101");
}
else if(strcmp(x,"111111011011")==0){
strcpy(z,"00000001001010010101100");
}
else if(strcmp(x,"111111011100")==0){
strcpy(z,"00000001001000010100011");
}
else if(strcmp(x,"111111011101")==0){
strcpy(z,"00000001000110010011010");
}
else if(strcmp(x,"111111011110")==0){
strcpy(z,"00000001000100010010001");
}
else if(strcmp(x,"111111011111")==0){
strcpy(z,"00000001000010010001001");
}
else if(strcmp(x,"111111100000")==0){
strcpy(z,"00000001000000010000001");
}
else if(strcmp(x,"111111100001")==0){
strcpy(z,"00000000111110001111001");
}
else if(strcmp(x,"111111100010")==0){
strcpy(z,"00000000111100001110001");
}
else if(strcmp(x,"111111100011")==0){
strcpy(z,"00000000111010001101001");
}
else if(strcmp(x,"111111100100")==0){
strcpy(z,"00000000111000001100010");
}
else if(strcmp(x,"111111100101")==0){
strcpy(z,"00000000110110001011011");
}
else if(strcmp(x,"111111100110")==0){
strcpy(z,"00000000110100001010101");
}
else if(strcmp(x,"111111100111")==0){
strcpy(z,"00000000110010001001110");
}
else if(strcmp(x,"111111101000")==0){
strcpy(z,"00000000110000001001000");
}
else if(strcmp(x,"111111101001")==0){
strcpy(z,"00000000101110001000010");
}
else if(strcmp(x,"111111101010")==0){
strcpy(z,"00000000101100000111101");
}
else if(strcmp(x,"111111101011")==0){
strcpy(z,"00000000101010000110111");
}
else if(strcmp(x,"111111101100")==0){
strcpy(z,"00000000101000000110010");
}
else if(strcmp(x,"111111101101")==0){
strcpy(z,"00000000100110000101101");
}
else if(strcmp(x,"111111101110")==0){
strcpy(z,"00000000100100000101001");
}
else if(strcmp(x,"111111101111")==0){
strcpy(z,"00000000100010000100100");
}
else if(strcmp(x,"111111110000")==0){
strcpy(z,"00000000100000000100000");
}
else if(strcmp(x,"111111110001")==0){
strcpy(z,"00000000011110000011100");
}
else if(strcmp(x,"111111110010")==0){
strcpy(z,"00000000011100000011001");
}
else if(strcmp(x,"111111110011")==0){
strcpy(z,"00000000011010000010101");
}
else if(strcmp(x,"111111110100")==0){
strcpy(z,"00000000011000000010010");
}
else if(strcmp(x,"111111110101")==0){
strcpy(z,"00000000010110000001111");
}
else if(strcmp(x,"111111110110")==0){
strcpy(z,"00000000010100000001101");
}
else if(strcmp(x,"111111110111")==0){
strcpy(z,"00000000010010000001010");
}
else if(strcmp(x,"111111111000")==0){
strcpy(z,"00000000010000000001000");
}
else if(strcmp(x,"111111111001")==0){
strcpy(z,"00000000001110000000110");
}
else if(strcmp(x,"111111111010")==0){
strcpy(z,"00000000001100000000101");
}
else if(strcmp(x,"111111111011")==0){
strcpy(z,"00000000001010000000011");
}
else if(strcmp(x,"111111111100")==0){
strcpy(z,"00000000001000000000010");
}
else if(strcmp(x,"111111111101")==0){
strcpy(z,"00000000000110000000001");
}
else if(strcmp(x,"111111111110")==0){
strcpy(z,"00000000000100000000001");
}
else if(strcmp(x,"111111111111")==0){
strcpy(z,"00000000000010000000000");
}
}




void fsqrt_table(char z[24],char x[11]){
if(strcmp(x,"0000000000")==0){
strcpy(z,"01101010000010011110011");
}
else if(strcmp(x,"0000000001")==0){
strcpy(z,"01101010011001000101111");
}
else if(strcmp(x,"0000000010")==0){
strcpy(z,"01101010101111101011111");
}
else if(strcmp(x,"0000000011")==0){
strcpy(z,"01101011000110010000100");
}
else if(strcmp(x,"0000000100")==0){
strcpy(z,"01101011011100110011110");
}
else if(strcmp(x,"0000000101")==0){
strcpy(z,"01101011110011010101101");
}
else if(strcmp(x,"0000000110")==0){
strcpy(z,"01101100001001110110000");
}
else if(strcmp(x,"0000000111")==0){
strcpy(z,"01101100100000010101001");
}
else if(strcmp(x,"0000001000")==0){
strcpy(z,"01101100110110110010110");
}
else if(strcmp(x,"0000001001")==0){
strcpy(z,"01101101001101001111000");
}
else if(strcmp(x,"0000001010")==0){
strcpy(z,"01101101100011101001111");
}
else if(strcmp(x,"0000001011")==0){
strcpy(z,"01101101111010000011100");
}
else if(strcmp(x,"0000001100")==0){
strcpy(z,"01101110010000011011101");
}
else if(strcmp(x,"0000001101")==0){
strcpy(z,"01101110100110110010011");
}
else if(strcmp(x,"0000001110")==0){
strcpy(z,"01101110111101000111111");
}
else if(strcmp(x,"0000001111")==0){
strcpy(z,"01101111010011011011111");
}
else if(strcmp(x,"0000010000")==0){
strcpy(z,"01101111101001101110101");
}
else if(strcmp(x,"0000010001")==0){
strcpy(z,"01110000000000000000000");
}
else if(strcmp(x,"0000010010")==0){
strcpy(z,"01110000010110010000000");
}
else if(strcmp(x,"0000010011")==0){
strcpy(z,"01110000101100011110110");
}
else if(strcmp(x,"0000010100")==0){
strcpy(z,"01110001000010101100000");
}
else if(strcmp(x,"0000010101")==0){
strcpy(z,"01110001011000111000000");
}
else if(strcmp(x,"0000010110")==0){
strcpy(z,"01110001101111000010110");
}
else if(strcmp(x,"0000010111")==0){
strcpy(z,"01110010000101001100001");
}
else if(strcmp(x,"0000011000")==0){
strcpy(z,"01110010011011010100001");
}
else if(strcmp(x,"0000011001")==0){
strcpy(z,"01110010110001011010110");
}
else if(strcmp(x,"0000011010")==0){
strcpy(z,"01110011000111100000001");
}
else if(strcmp(x,"0000011011")==0){
strcpy(z,"01110011011101100100010");
}
else if(strcmp(x,"0000011100")==0){
strcpy(z,"01110011110011100111000");
}
else if(strcmp(x,"0000011101")==0){
strcpy(z,"01110100001001101000100");
}
else if(strcmp(x,"0000011110")==0){
strcpy(z,"01110100011111101000101");
}
else if(strcmp(x,"0000011111")==0){
strcpy(z,"01110100110101100111100");
}
else if(strcmp(x,"0000100000")==0){
strcpy(z,"01110101001011100101000");
}
else if(strcmp(x,"0000100001")==0){
strcpy(z,"01110101100001100001011");
}
else if(strcmp(x,"0000100010")==0){
strcpy(z,"01110101110111011100010");
}
else if(strcmp(x,"0000100011")==0){
strcpy(z,"01110110001101010110000");
}
else if(strcmp(x,"0000100100")==0){
strcpy(z,"01110110100011001110011");
}
else if(strcmp(x,"0000100101")==0){
strcpy(z,"01110110111001000101101");
}
else if(strcmp(x,"0000100110")==0){
strcpy(z,"01110111001110111011011");
}
else if(strcmp(x,"0000100111")==0){
strcpy(z,"01110111100100110000000");
}
else if(strcmp(x,"0000101000")==0){
strcpy(z,"01110111111010100011011");
}
else if(strcmp(x,"0000101001")==0){
strcpy(z,"01111000010000010101011");
}
else if(strcmp(x,"0000101010")==0){
strcpy(z,"01111000100110000110010");
}
else if(strcmp(x,"0000101011")==0){
strcpy(z,"01111000111011110101110");
}
else if(strcmp(x,"0000101100")==0){
strcpy(z,"01111001010001100100001");
}
else if(strcmp(x,"0000101101")==0){
strcpy(z,"01111001100111010001001");
}
else if(strcmp(x,"0000101110")==0){
strcpy(z,"01111001111100111101000");
}
else if(strcmp(x,"0000101111")==0){
strcpy(z,"01111010010010100111100");
}
else if(strcmp(x,"0000110000")==0){
strcpy(z,"01111010101000010000111");
}
else if(strcmp(x,"0000110001")==0){
strcpy(z,"01111010111101111000111");
}
else if(strcmp(x,"0000110010")==0){
strcpy(z,"01111011010011011111110");
}
else if(strcmp(x,"0000110011")==0){
strcpy(z,"01111011101001000101011");
}
else if(strcmp(x,"0000110100")==0){
strcpy(z,"01111011111110101001110");
}
else if(strcmp(x,"0000110101")==0){
strcpy(z,"01111100010100001100111");
}
else if(strcmp(x,"0000110110")==0){
strcpy(z,"01111100101001101110111");
}
else if(strcmp(x,"0000110111")==0){
strcpy(z,"01111100111111001111101");
}
else if(strcmp(x,"0000111000")==0){
strcpy(z,"01111101010100101111001");
}
else if(strcmp(x,"0000111001")==0){
strcpy(z,"01111101101010001101100");
}
else if(strcmp(x,"0000111010")==0){
strcpy(z,"01111101111111101010100");
}
else if(strcmp(x,"0000111011")==0){
strcpy(z,"01111110010101000110100");
}
else if(strcmp(x,"0000111100")==0){
strcpy(z,"01111110101010100001001");
}
else if(strcmp(x,"0000111101")==0){
strcpy(z,"01111110111111111010101");
}
else if(strcmp(x,"0000111110")==0){
strcpy(z,"01111111010101010011000");
}
else if(strcmp(x,"0000111111")==0){
strcpy(z,"01111111101010101010001");
}
else if(strcmp(x,"0001000000")==0){
strcpy(z,"10000000000000000000000");
}
else if(strcmp(x,"0001000001")==0){
strcpy(z,"10000000010101010100110");
}
else if(strcmp(x,"0001000010")==0){
strcpy(z,"10000000101010101000010");
}
else if(strcmp(x,"0001000011")==0){
strcpy(z,"10000000111111111010101");
}
else if(strcmp(x,"0001000100")==0){
strcpy(z,"10000001010101001011111");
}
else if(strcmp(x,"0001000101")==0){
strcpy(z,"10000001101010011011111");
}
else if(strcmp(x,"0001000110")==0){
strcpy(z,"10000001111111101010110");
}
else if(strcmp(x,"0001000111")==0){
strcpy(z,"10000010010100111000100");
}
else if(strcmp(x,"0001001000")==0){
strcpy(z,"10000010101010000101000");
}
else if(strcmp(x,"0001001001")==0){
strcpy(z,"10000010111111010000011");
}
else if(strcmp(x,"0001001010")==0){
strcpy(z,"10000011010100011010101");
}
else if(strcmp(x,"0001001011")==0){
strcpy(z,"10000011101001100011101");
}
else if(strcmp(x,"0001001100")==0){
strcpy(z,"10000011111110101011100");
}
else if(strcmp(x,"0001001101")==0){
strcpy(z,"10000100010011110010010");
}
else if(strcmp(x,"0001001110")==0){
strcpy(z,"10000100101000110111111");
}
else if(strcmp(x,"0001001111")==0){
strcpy(z,"10000100111101111100011");
}
else if(strcmp(x,"0001010000")==0){
strcpy(z,"10000101010010111111110");
}
else if(strcmp(x,"0001010001")==0){
strcpy(z,"10000101101000000001111");
}
else if(strcmp(x,"0001010010")==0){
strcpy(z,"10000101111101000011000");
}
else if(strcmp(x,"0001010011")==0){
strcpy(z,"10000110010010000010111");
}
else if(strcmp(x,"0001010100")==0){
strcpy(z,"10000110100111000001101");
}
else if(strcmp(x,"0001010101")==0){
strcpy(z,"10000110111011111111011");
}
else if(strcmp(x,"0001010110")==0){
strcpy(z,"10000111010000111011111");
}
else if(strcmp(x,"0001010111")==0){
strcpy(z,"10000111100101110111010");
}
else if(strcmp(x,"0001011000")==0){
strcpy(z,"10000111111010110001101");
}
else if(strcmp(x,"0001011001")==0){
strcpy(z,"10001000001111101010110");
}
else if(strcmp(x,"0001011010")==0){
strcpy(z,"10001000100100100010111");
}
else if(strcmp(x,"0001011011")==0){
strcpy(z,"10001000111001011001111");
}
else if(strcmp(x,"0001011100")==0){
strcpy(z,"10001001001110001111110");
}
else if(strcmp(x,"0001011101")==0){
strcpy(z,"10001001100011000100100");
}
else if(strcmp(x,"0001011110")==0){
strcpy(z,"10001001110111111000001");
}
else if(strcmp(x,"0001011111")==0){
strcpy(z,"10001010001100101010101");
}
else if(strcmp(x,"0001100000")==0){
strcpy(z,"10001010100001011100001");
}
else if(strcmp(x,"0001100001")==0){
strcpy(z,"10001010110110001100100");
}
else if(strcmp(x,"0001100010")==0){
strcpy(z,"10001011001010111011110");
}
else if(strcmp(x,"0001100011")==0){
strcpy(z,"10001011011111101010000");
}
else if(strcmp(x,"0001100100")==0){
strcpy(z,"10001011110100010111001");
}
else if(strcmp(x,"0001100101")==0){
strcpy(z,"10001100001001000011001");
}
else if(strcmp(x,"0001100110")==0){
strcpy(z,"10001100011101101110001");
}
else if(strcmp(x,"0001100111")==0){
strcpy(z,"10001100110010011000000");
}
else if(strcmp(x,"0001101000")==0){
strcpy(z,"10001101000111000000110");
}
else if(strcmp(x,"0001101001")==0){
strcpy(z,"10001101011011101000100");
}
else if(strcmp(x,"0001101010")==0){
strcpy(z,"10001101110000001111001");
}
else if(strcmp(x,"0001101011")==0){
strcpy(z,"10001110000100110100110");
}
else if(strcmp(x,"0001101100")==0){
strcpy(z,"10001110011001011001010");
}
else if(strcmp(x,"0001101101")==0){
strcpy(z,"10001110101101111100110");
}
else if(strcmp(x,"0001101110")==0){
strcpy(z,"10001111000010011111001");
}
else if(strcmp(x,"0001101111")==0){
strcpy(z,"10001111010111000000100");
}
else if(strcmp(x,"0001110000")==0){
strcpy(z,"10001111101011100000110");
}
else if(strcmp(x,"0001110001")==0){
strcpy(z,"10010000000000000000000");
}
else if(strcmp(x,"0001110010")==0){
strcpy(z,"10010000010100011110010");
}
else if(strcmp(x,"0001110011")==0){
strcpy(z,"10010000101000111011011");
}
else if(strcmp(x,"0001110100")==0){
strcpy(z,"10010000111101010111100");
}
else if(strcmp(x,"0001110101")==0){
strcpy(z,"10010001010001110010100");
}
else if(strcmp(x,"0001110110")==0){
strcpy(z,"10010001100110001100100");
}
else if(strcmp(x,"0001110111")==0){
strcpy(z,"10010001111010100101100");
}
else if(strcmp(x,"0001111000")==0){
strcpy(z,"10010010001110111101100");
}
else if(strcmp(x,"0001111001")==0){
strcpy(z,"10010010100011010100011");
}
else if(strcmp(x,"0001111010")==0){
strcpy(z,"10010010110111101010011");
}
else if(strcmp(x,"0001111011")==0){
strcpy(z,"10010011001011111111001");
}
else if(strcmp(x,"0001111100")==0){
strcpy(z,"10010011100000010011000");
}
else if(strcmp(x,"0001111101")==0){
strcpy(z,"10010011110100100101111");
}
else if(strcmp(x,"0001111110")==0){
strcpy(z,"10010100001000110111101");
}
else if(strcmp(x,"0001111111")==0){
strcpy(z,"10010100011101001000100");
}
else if(strcmp(x,"0010000000")==0){
strcpy(z,"10010100110001011000010");
}
else if(strcmp(x,"0010000001")==0){
strcpy(z,"10010101000101100111000");
}
else if(strcmp(x,"0010000010")==0){
strcpy(z,"10010101011001110100110");
}
else if(strcmp(x,"0010000011")==0){
strcpy(z,"10010101101110000001100");
}
else if(strcmp(x,"0010000100")==0){
strcpy(z,"10010110000010001101010");
}
else if(strcmp(x,"0010000101")==0){
strcpy(z,"10010110010110011000000");
}
else if(strcmp(x,"0010000110")==0){
strcpy(z,"10010110101010100001110");
}
else if(strcmp(x,"0010000111")==0){
strcpy(z,"10010110111110101010100");
}
else if(strcmp(x,"0010001000")==0){
strcpy(z,"10010111010010110010010");
}
else if(strcmp(x,"0010001001")==0){
strcpy(z,"10010111100110111001000");
}
else if(strcmp(x,"0010001010")==0){
strcpy(z,"10010111111010111110110");
}
else if(strcmp(x,"0010001011")==0){
strcpy(z,"10011000001111000011100");
}
else if(strcmp(x,"0010001100")==0){
strcpy(z,"10011000100011000111010");
}
else if(strcmp(x,"0010001101")==0){
strcpy(z,"10011000110111001010001");
}
else if(strcmp(x,"0010001110")==0){
strcpy(z,"10011001001011001011111");
}
else if(strcmp(x,"0010001111")==0){
strcpy(z,"10011001011111001100110");
}
else if(strcmp(x,"0010010000")==0){
strcpy(z,"10011001110011001100101");
}
else if(strcmp(x,"0010010001")==0){
strcpy(z,"10011010000111001011100");
}
else if(strcmp(x,"0010010010")==0){
strcpy(z,"10011010011011001001011");
}
else if(strcmp(x,"0010010011")==0){
strcpy(z,"10011010101111000110011");
}
else if(strcmp(x,"0010010100")==0){
strcpy(z,"10011011000011000010011");
}
else if(strcmp(x,"0010010101")==0){
strcpy(z,"10011011010110111101011");
}
else if(strcmp(x,"0010010110")==0){
strcpy(z,"10011011101010110111011");
}
else if(strcmp(x,"0010010111")==0){
strcpy(z,"10011011111110110000100");
}
else if(strcmp(x,"0010011000")==0){
strcpy(z,"10011100010010101000101");
}
else if(strcmp(x,"0010011001")==0){
strcpy(z,"10011100100110011111110");
}
else if(strcmp(x,"0010011010")==0){
strcpy(z,"10011100111010010110000");
}
else if(strcmp(x,"0010011011")==0){
strcpy(z,"10011101001110001011010");
}
else if(strcmp(x,"0010011100")==0){
strcpy(z,"10011101100001111111100");
}
else if(strcmp(x,"0010011101")==0){
strcpy(z,"10011101110101110010111");
}
else if(strcmp(x,"0010011110")==0){
strcpy(z,"10011110001001100101010");
}
else if(strcmp(x,"0010011111")==0){
strcpy(z,"10011110011101010110110");
}
else if(strcmp(x,"0010100000")==0){
strcpy(z,"10011110110001000111010");
}
else if(strcmp(x,"0010100001")==0){
strcpy(z,"10011111000100110110111");
}
else if(strcmp(x,"0010100010")==0){
strcpy(z,"10011111011000100101100");
}
else if(strcmp(x,"0010100011")==0){
strcpy(z,"10011111101100010011010");
}
else if(strcmp(x,"0010100100")==0){
strcpy(z,"10100000000000000000000");
}
else if(strcmp(x,"0010100101")==0){
strcpy(z,"10100000010011101011111");
}
else if(strcmp(x,"0010100110")==0){
strcpy(z,"10100000100111010110110");
}
else if(strcmp(x,"0010100111")==0){
strcpy(z,"10100000111011000000110");
}
else if(strcmp(x,"0010101000")==0){
strcpy(z,"10100001001110101001110");
}
else if(strcmp(x,"0010101001")==0){
strcpy(z,"10100001100010010001111");
}
else if(strcmp(x,"0010101010")==0){
strcpy(z,"10100001110101111001001");
}
else if(strcmp(x,"0010101011")==0){
strcpy(z,"10100010001001011111011");
}
else if(strcmp(x,"0010101100")==0){
strcpy(z,"10100010011101000100110");
}
else if(strcmp(x,"0010101101")==0){
strcpy(z,"10100010110000101001010");
}
else if(strcmp(x,"0010101110")==0){
strcpy(z,"10100011000100001100110");
}
else if(strcmp(x,"0010101111")==0){
strcpy(z,"10100011010111101111100");
}
else if(strcmp(x,"0010110000")==0){
strcpy(z,"10100011101011010001001");
}
else if(strcmp(x,"0010110001")==0){
strcpy(z,"10100011111110110010000");
}
else if(strcmp(x,"0010110010")==0){
strcpy(z,"10100100010010010001111");
}
else if(strcmp(x,"0010110011")==0){
strcpy(z,"10100100100101110000111");
}
else if(strcmp(x,"0010110100")==0){
strcpy(z,"10100100111001001111000");
}
else if(strcmp(x,"0010110101")==0){
strcpy(z,"10100101001100101100010");
}
else if(strcmp(x,"0010110110")==0){
strcpy(z,"10100101100000001000100");
}
else if(strcmp(x,"0010110111")==0){
strcpy(z,"10100101110011100011111");
}
else if(strcmp(x,"0010111000")==0){
strcpy(z,"10100110000110111110011");
}
else if(strcmp(x,"0010111001")==0){
strcpy(z,"10100110011010011000000");
}
else if(strcmp(x,"0010111010")==0){
strcpy(z,"10100110101101110000110");
}
else if(strcmp(x,"0010111011")==0){
strcpy(z,"10100111000001001000101");
}
else if(strcmp(x,"0010111100")==0){
strcpy(z,"10100111010100011111101");
}
else if(strcmp(x,"0010111101")==0){
strcpy(z,"10100111100111110101101");
}
else if(strcmp(x,"0010111110")==0){
strcpy(z,"10100111111011001010111");
}
else if(strcmp(x,"0010111111")==0){
strcpy(z,"10101000001110011111001");
}
else if(strcmp(x,"0011000000")==0){
strcpy(z,"10101000100001110010101");
}
else if(strcmp(x,"0011000001")==0){
strcpy(z,"10101000110101000101001");
}
else if(strcmp(x,"0011000010")==0){
strcpy(z,"10101001001000010110110");
}
else if(strcmp(x,"0011000011")==0){
strcpy(z,"10101001011011100111101");
}
else if(strcmp(x,"0011000100")==0){
strcpy(z,"10101001101110110111100");
}
else if(strcmp(x,"0011000101")==0){
strcpy(z,"10101010000010000110101");
}
else if(strcmp(x,"0011000110")==0){
strcpy(z,"10101010010101010100110");
}
else if(strcmp(x,"0011000111")==0){
strcpy(z,"10101010101000100010001");
}
else if(strcmp(x,"0011001000")==0){
strcpy(z,"10101010111011101110101");
}
else if(strcmp(x,"0011001001")==0){
strcpy(z,"10101011001110111010010");
}
else if(strcmp(x,"0011001010")==0){
strcpy(z,"10101011100010000100111");
}
else if(strcmp(x,"0011001011")==0){
strcpy(z,"10101011110101001110111");
}
else if(strcmp(x,"0011001100")==0){
strcpy(z,"10101100001000010111111");
}
else if(strcmp(x,"0011001101")==0){
strcpy(z,"10101100011011100000000");
}
else if(strcmp(x,"0011001110")==0){
strcpy(z,"10101100101110100111011");
}
else if(strcmp(x,"0011001111")==0){
strcpy(z,"10101101000001101101110");
}
else if(strcmp(x,"0011010000")==0){
strcpy(z,"10101101010100110011011");
}
else if(strcmp(x,"0011010001")==0){
strcpy(z,"10101101100111111000001");
}
else if(strcmp(x,"0011010010")==0){
strcpy(z,"10101101111010111100001");
}
else if(strcmp(x,"0011010011")==0){
strcpy(z,"10101110001101111111001");
}
else if(strcmp(x,"0011010100")==0){
strcpy(z,"10101110100001000001011");
}
else if(strcmp(x,"0011010101")==0){
strcpy(z,"10101110110100000010110");
}
else if(strcmp(x,"0011010110")==0){
strcpy(z,"10101111000111000011011");
}
else if(strcmp(x,"0011010111")==0){
strcpy(z,"10101111011010000011001");
}
else if(strcmp(x,"0011011000")==0){
strcpy(z,"10101111101101000010000");
}
else if(strcmp(x,"0011011001")==0){
strcpy(z,"10110000000000000000000");
}
else if(strcmp(x,"0011011010")==0){
strcpy(z,"10110000010010111101010");
}
else if(strcmp(x,"0011011011")==0){
strcpy(z,"10110000100101111001101");
}
else if(strcmp(x,"0011011100")==0){
strcpy(z,"10110000111000110101001");
}
else if(strcmp(x,"0011011101")==0){
strcpy(z,"10110001001011101111111");
}
else if(strcmp(x,"0011011110")==0){
strcpy(z,"10110001011110101001110");
}
else if(strcmp(x,"0011011111")==0){
strcpy(z,"10110001110001100010111");
}
else if(strcmp(x,"0011100000")==0){
strcpy(z,"10110010000100011011001");
}
else if(strcmp(x,"0011100001")==0){
strcpy(z,"10110010010111010010100");
}
else if(strcmp(x,"0011100010")==0){
strcpy(z,"10110010101010001001001");
}
else if(strcmp(x,"0011100011")==0){
strcpy(z,"10110010111100111111000");
}
else if(strcmp(x,"0011100100")==0){
strcpy(z,"10110011001111110100000");
}
else if(strcmp(x,"0011100101")==0){
strcpy(z,"10110011100010101000001");
}
else if(strcmp(x,"0011100110")==0){
strcpy(z,"10110011110101011011100");
}
else if(strcmp(x,"0011100111")==0){
strcpy(z,"10110100001000001110000");
}
else if(strcmp(x,"0011101000")==0){
strcpy(z,"10110100011010111111110");
}
else if(strcmp(x,"0011101001")==0){
strcpy(z,"10110100101101110000101");
}
else if(strcmp(x,"0011101010")==0){
strcpy(z,"10110101000000100000110");
}
else if(strcmp(x,"0011101011")==0){
strcpy(z,"10110101010011010000001");
}
else if(strcmp(x,"0011101100")==0){
strcpy(z,"10110101100101111110101");
}
else if(strcmp(x,"0011101101")==0){
strcpy(z,"10110101111000101100011");
}
else if(strcmp(x,"0011101110")==0){
strcpy(z,"10110110001011011001010");
}
else if(strcmp(x,"0011101111")==0){
strcpy(z,"10110110011110000101011");
}
else if(strcmp(x,"0011110000")==0){
strcpy(z,"10110110110000110000110");
}
else if(strcmp(x,"0011110001")==0){
strcpy(z,"10110111000011011011010");
}
else if(strcmp(x,"0011110010")==0){
strcpy(z,"10110111010110000101000");
}
else if(strcmp(x,"0011110011")==0){
strcpy(z,"10110111101000101101111");
}
else if(strcmp(x,"0011110100")==0){
strcpy(z,"10110111111011010110001");
}
else if(strcmp(x,"0011110101")==0){
strcpy(z,"10111000001101111101100");
}
else if(strcmp(x,"0011110110")==0){
strcpy(z,"10111000100000100100000");
}
else if(strcmp(x,"0011110111")==0){
strcpy(z,"10111000110011001001111");
}
else if(strcmp(x,"0011111000")==0){
strcpy(z,"10111001000101101110111");
}
else if(strcmp(x,"0011111001")==0){
strcpy(z,"10111001011000010011001");
}
else if(strcmp(x,"0011111010")==0){
strcpy(z,"10111001101010110110100");
}
else if(strcmp(x,"0011111011")==0){
strcpy(z,"10111001111101011001001");
}
else if(strcmp(x,"0011111100")==0){
strcpy(z,"10111010001111111011001");
}
else if(strcmp(x,"0011111101")==0){
strcpy(z,"10111010100010011100010");
}
else if(strcmp(x,"0011111110")==0){
strcpy(z,"10111010110100111100100");
}
else if(strcmp(x,"0011111111")==0){
strcpy(z,"10111011000111011100001");
}
else if(strcmp(x,"0100000000")==0){
strcpy(z,"10111011011001111010111");
}
else if(strcmp(x,"0100000001")==0){
strcpy(z,"10111011101100011000111");
}
else if(strcmp(x,"0100000010")==0){
strcpy(z,"10111011111110110110010");
}
else if(strcmp(x,"0100000011")==0){
strcpy(z,"10111100010001010010110");
}
else if(strcmp(x,"0100000100")==0){
strcpy(z,"10111100100011101110011");
}
else if(strcmp(x,"0100000101")==0){
strcpy(z,"10111100110110001001011");
}
else if(strcmp(x,"0100000110")==0){
strcpy(z,"10111101001000100011101");
}
else if(strcmp(x,"0100000111")==0){
strcpy(z,"10111101011010111101000");
}
else if(strcmp(x,"0100001000")==0){
strcpy(z,"10111101101101010101110");
}
else if(strcmp(x,"0100001001")==0){
strcpy(z,"10111101111111101101101");
}
else if(strcmp(x,"0100001010")==0){
strcpy(z,"10111110010010000100110");
}
else if(strcmp(x,"0100001011")==0){
strcpy(z,"10111110100100011011010");
}
else if(strcmp(x,"0100001100")==0){
strcpy(z,"10111110110110110000111");
}
else if(strcmp(x,"0100001101")==0){
strcpy(z,"10111111001001000101110");
}
else if(strcmp(x,"0100001110")==0){
strcpy(z,"10111111011011011001111");
}
else if(strcmp(x,"0100001111")==0){
strcpy(z,"10111111101101101101011");
}
else if(strcmp(x,"0100010000")==0){
strcpy(z,"11000000000000000000000");
}
else if(strcmp(x,"0100010001")==0){
strcpy(z,"11000000010010010001111");
}
else if(strcmp(x,"0100010010")==0){
strcpy(z,"11000000100100100011001");
}
else if(strcmp(x,"0100010011")==0){
strcpy(z,"11000000110110110011100");
}
else if(strcmp(x,"0100010100")==0){
strcpy(z,"11000001001001000011001");
}
else if(strcmp(x,"0100010101")==0){
strcpy(z,"11000001011011010010001");
}
else if(strcmp(x,"0100010110")==0){
strcpy(z,"11000001101101100000011");
}
else if(strcmp(x,"0100010111")==0){
strcpy(z,"11000001111111101101110");
}
else if(strcmp(x,"0100011000")==0){
strcpy(z,"11000010010001111010100");
}
else if(strcmp(x,"0100011001")==0){
strcpy(z,"11000010100100000110100");
}
else if(strcmp(x,"0100011010")==0){
strcpy(z,"11000010110110010001110");
}
else if(strcmp(x,"0100011011")==0){
strcpy(z,"11000011001000011100010");
}
else if(strcmp(x,"0100011100")==0){
strcpy(z,"11000011011010100110001");
}
else if(strcmp(x,"0100011101")==0){
strcpy(z,"11000011101100101111001");
}
else if(strcmp(x,"0100011110")==0){
strcpy(z,"11000011111110110111100");
}
else if(strcmp(x,"0100011111")==0){
strcpy(z,"11000100010000111111001");
}
else if(strcmp(x,"0100100000")==0){
strcpy(z,"11000100100011000110000");
}
else if(strcmp(x,"0100100001")==0){
strcpy(z,"11000100110101001100001");
}
else if(strcmp(x,"0100100010")==0){
strcpy(z,"11000101000111010001101");
}
else if(strcmp(x,"0100100011")==0){
strcpy(z,"11000101011001010110011");
}
else if(strcmp(x,"0100100100")==0){
strcpy(z,"11000101101011011010011");
}
else if(strcmp(x,"0100100101")==0){
strcpy(z,"11000101111101011101101");
}
else if(strcmp(x,"0100100110")==0){
strcpy(z,"11000110001111100000001");
}
else if(strcmp(x,"0100100111")==0){
strcpy(z,"11000110100001100010000");
}
else if(strcmp(x,"0100101000")==0){
strcpy(z,"11000110110011100011001");
}
else if(strcmp(x,"0100101001")==0){
strcpy(z,"11000111000101100011100");
}
else if(strcmp(x,"0100101010")==0){
strcpy(z,"11000111010111100011010");
}
else if(strcmp(x,"0100101011")==0){
strcpy(z,"11000111101001100010010");
}
else if(strcmp(x,"0100101100")==0){
strcpy(z,"11000111111011100000100");
}
else if(strcmp(x,"0100101101")==0){
strcpy(z,"11001000001101011110001");
}
else if(strcmp(x,"0100101110")==0){
strcpy(z,"11001000011111011011000");
}
else if(strcmp(x,"0100101111")==0){
strcpy(z,"11001000110001010111001");
}
else if(strcmp(x,"0100110000")==0){
strcpy(z,"11001001000011010010101");
}
else if(strcmp(x,"0100110001")==0){
strcpy(z,"11001001010101001101011");
}
else if(strcmp(x,"0100110010")==0){
strcpy(z,"11001001100111000111011");
}
else if(strcmp(x,"0100110011")==0){
strcpy(z,"11001001111001000000110");
}
else if(strcmp(x,"0100110100")==0){
strcpy(z,"11001010001010111001100");
}
else if(strcmp(x,"0100110101")==0){
strcpy(z,"11001010011100110001011");
}
else if(strcmp(x,"0100110110")==0){
strcpy(z,"11001010101110101000101");
}
else if(strcmp(x,"0100110111")==0){
strcpy(z,"11001011000000011111010");
}
else if(strcmp(x,"0100111000")==0){
strcpy(z,"11001011010010010101001");
}
else if(strcmp(x,"0100111001")==0){
strcpy(z,"11001011100100001010010");
}
else if(strcmp(x,"0100111010")==0){
strcpy(z,"11001011110101111110110");
}
else if(strcmp(x,"0100111011")==0){
strcpy(z,"11001100000111110010101");
}
else if(strcmp(x,"0100111100")==0){
strcpy(z,"11001100011001100101110");
}
else if(strcmp(x,"0100111101")==0){
strcpy(z,"11001100101011011000001");
}
else if(strcmp(x,"0100111110")==0){
strcpy(z,"11001100111101001001111");
}
else if(strcmp(x,"0100111111")==0){
strcpy(z,"11001101001110111010111");
}
else if(strcmp(x,"0101000000")==0){
strcpy(z,"11001101100000101011010");
}
else if(strcmp(x,"0101000001")==0){
strcpy(z,"11001101110010011011000");
}
else if(strcmp(x,"0101000010")==0){
strcpy(z,"11001110000100001010000");
}
else if(strcmp(x,"0101000011")==0){
strcpy(z,"11001110010101111000010");
}
else if(strcmp(x,"0101000100")==0){
strcpy(z,"11001110100111100101111");
}
else if(strcmp(x,"0101000101")==0){
strcpy(z,"11001110111001010010111");
}
else if(strcmp(x,"0101000110")==0){
strcpy(z,"11001111001010111111001");
}
else if(strcmp(x,"0101000111")==0){
strcpy(z,"11001111011100101010110");
}
else if(strcmp(x,"0101001000")==0){
strcpy(z,"11001111101110010101110");
}
else if(strcmp(x,"0101001001")==0){
strcpy(z,"11010000000000000000000");
}
else if(strcmp(x,"0101001010")==0){
strcpy(z,"11010000010001101001101");
}
else if(strcmp(x,"0101001011")==0){
strcpy(z,"11010000100011010010100");
}
else if(strcmp(x,"0101001100")==0){
strcpy(z,"11010000110100111010110");
}
else if(strcmp(x,"0101001101")==0){
strcpy(z,"11010001000110100010011");
}
else if(strcmp(x,"0101001110")==0){
strcpy(z,"11010001011000001001010");
}
else if(strcmp(x,"0101001111")==0){
strcpy(z,"11010001101001101111100");
}
else if(strcmp(x,"0101010000")==0){
strcpy(z,"11010001111011010101001");
}
else if(strcmp(x,"0101010001")==0){
strcpy(z,"11010010001100111010000");
}
else if(strcmp(x,"0101010010")==0){
strcpy(z,"11010010011110011110011");
}
else if(strcmp(x,"0101010011")==0){
strcpy(z,"11010010110000000001111");
}
else if(strcmp(x,"0101010100")==0){
strcpy(z,"11010011000001100100111");
}
else if(strcmp(x,"0101010101")==0){
strcpy(z,"11010011010011000111001");
}
else if(strcmp(x,"0101010110")==0){
strcpy(z,"11010011100100101000110");
}
else if(strcmp(x,"0101010111")==0){
strcpy(z,"11010011110110001001110");
}
else if(strcmp(x,"0101011000")==0){
strcpy(z,"11010100000111101010000");
}
else if(strcmp(x,"0101011001")==0){
strcpy(z,"11010100011001001001110");
}
else if(strcmp(x,"0101011010")==0){
strcpy(z,"11010100101010101000110");
}
else if(strcmp(x,"0101011011")==0){
strcpy(z,"11010100111100000111001");
}
else if(strcmp(x,"0101011100")==0){
strcpy(z,"11010101001101100100110");
}
else if(strcmp(x,"0101011101")==0){
strcpy(z,"11010101011111000001111");
}
else if(strcmp(x,"0101011110")==0){
strcpy(z,"11010101110000011110010");
}
else if(strcmp(x,"0101011111")==0){
strcpy(z,"11010110000001111010000");
}
else if(strcmp(x,"0101100000")==0){
strcpy(z,"11010110010011010101001");
}
else if(strcmp(x,"0101100001")==0){
strcpy(z,"11010110100100101111101");
}
else if(strcmp(x,"0101100010")==0){
strcpy(z,"11010110110110001001011");
}
else if(strcmp(x,"0101100011")==0){
strcpy(z,"11010111000111100010101");
}
else if(strcmp(x,"0101100100")==0){
strcpy(z,"11010111011000111011001");
}
else if(strcmp(x,"0101100101")==0){
strcpy(z,"11010111101010010011000");
}
else if(strcmp(x,"0101100110")==0){
strcpy(z,"11010111111011101010010");
}
else if(strcmp(x,"0101100111")==0){
strcpy(z,"11011000001101000000111");
}
else if(strcmp(x,"0101101000")==0){
strcpy(z,"11011000011110010110111");
}
else if(strcmp(x,"0101101001")==0){
strcpy(z,"11011000101111101100010");
}
else if(strcmp(x,"0101101010")==0){
strcpy(z,"11011001000001000001000");
}
else if(strcmp(x,"0101101011")==0){
strcpy(z,"11011001010010010101000");
}
else if(strcmp(x,"0101101100")==0){
strcpy(z,"11011001100011101000100");
}
else if(strcmp(x,"0101101101")==0){
strcpy(z,"11011001110100111011010");
}
else if(strcmp(x,"0101101110")==0){
strcpy(z,"11011010000110001101100");
}
else if(strcmp(x,"0101101111")==0){
strcpy(z,"11011010010111011111000");
}
else if(strcmp(x,"0101110000")==0){
strcpy(z,"11011010101000101111111");
}
else if(strcmp(x,"0101110001")==0){
strcpy(z,"11011010111010000000010");
}
else if(strcmp(x,"0101110010")==0){
strcpy(z,"11011011001011001111111");
}
else if(strcmp(x,"0101110011")==0){
strcpy(z,"11011011011100011111000");
}
else if(strcmp(x,"0101110100")==0){
strcpy(z,"11011011101101101101011");
}
else if(strcmp(x,"0101110101")==0){
strcpy(z,"11011011111110111011001");
}
else if(strcmp(x,"0101110110")==0){
strcpy(z,"11011100010000001000011");
}
else if(strcmp(x,"0101110111")==0){
strcpy(z,"11011100100001010100111");
}
else if(strcmp(x,"0101111000")==0){
strcpy(z,"11011100110010100000111");
}
else if(strcmp(x,"0101111001")==0){
strcpy(z,"11011101000011101100001");
}
else if(strcmp(x,"0101111010")==0){
strcpy(z,"11011101010100110110111");
}
else if(strcmp(x,"0101111011")==0){
strcpy(z,"11011101100110000000111");
}
else if(strcmp(x,"0101111100")==0){
strcpy(z,"11011101110111001010011");
}
else if(strcmp(x,"0101111101")==0){
strcpy(z,"11011110001000010011010");
}
else if(strcmp(x,"0101111110")==0){
strcpy(z,"11011110011001011011100");
}
else if(strcmp(x,"0101111111")==0){
strcpy(z,"11011110101010100011000");
}
else if(strcmp(x,"0110000000")==0){
strcpy(z,"11011110111011101010001");
}
else if(strcmp(x,"0110000001")==0){
strcpy(z,"11011111001100110000100");
}
else if(strcmp(x,"0110000010")==0){
strcpy(z,"11011111011101110110010");
}
else if(strcmp(x,"0110000011")==0){
strcpy(z,"11011111101110111011011");
}
else if(strcmp(x,"0110000100")==0){
strcpy(z,"11100000000000000000000");
}
else if(strcmp(x,"0110000101")==0){
strcpy(z,"11100000010001000100000");
}
else if(strcmp(x,"0110000110")==0){
strcpy(z,"11100000100010000111011");
}
else if(strcmp(x,"0110000111")==0){
strcpy(z,"11100000110011001010001");
}
else if(strcmp(x,"0110001000")==0){
strcpy(z,"11100001000100001100010");
}
else if(strcmp(x,"0110001001")==0){
strcpy(z,"11100001010101001101110");
}
else if(strcmp(x,"0110001010")==0){
strcpy(z,"11100001100110001110110");
}
else if(strcmp(x,"0110001011")==0){
strcpy(z,"11100001110111001111000");
}
else if(strcmp(x,"0110001100")==0){
strcpy(z,"11100010001000001110110");
}
else if(strcmp(x,"0110001101")==0){
strcpy(z,"11100010011001001110000");
}
else if(strcmp(x,"0110001110")==0){
strcpy(z,"11100010101010001100100");
}
else if(strcmp(x,"0110001111")==0){
strcpy(z,"11100010111011001010100");
}
else if(strcmp(x,"0110010000")==0){
strcpy(z,"11100011001100000111110");
}
else if(strcmp(x,"0110010001")==0){
strcpy(z,"11100011011101000100100");
}
else if(strcmp(x,"0110010010")==0){
strcpy(z,"11100011101110000000110");
}
else if(strcmp(x,"0110010011")==0){
strcpy(z,"11100011111110111100010");
}
else if(strcmp(x,"0110010100")==0){
strcpy(z,"11100100001111110111010");
}
else if(strcmp(x,"0110010101")==0){
strcpy(z,"11100100100000110001101");
}
else if(strcmp(x,"0110010110")==0){
strcpy(z,"11100100110001101011100");
}
else if(strcmp(x,"0110010111")==0){
strcpy(z,"11100101000010100100101");
}
else if(strcmp(x,"0110011000")==0){
strcpy(z,"11100101010011011101010");
}
else if(strcmp(x,"0110011001")==0){
strcpy(z,"11100101100100010101011");
}
else if(strcmp(x,"0110011010")==0){
strcpy(z,"11100101110101001100110");
}
else if(strcmp(x,"0110011011")==0){
strcpy(z,"11100110000110000011101");
}
else if(strcmp(x,"0110011100")==0){
strcpy(z,"11100110010110111001111");
}
else if(strcmp(x,"0110011101")==0){
strcpy(z,"11100110100111101111101");
}
else if(strcmp(x,"0110011110")==0){
strcpy(z,"11100110111000100100110");
}
else if(strcmp(x,"0110011111")==0){
strcpy(z,"11100111001001011001010");
}
else if(strcmp(x,"0110100000")==0){
strcpy(z,"11100111011010001101010");
}
else if(strcmp(x,"0110100001")==0){
strcpy(z,"11100111101011000000101");
}
else if(strcmp(x,"0110100010")==0){
strcpy(z,"11100111111011110011011");
}
else if(strcmp(x,"0110100011")==0){
strcpy(z,"11101000001100100101101");
}
else if(strcmp(x,"0110100100")==0){
strcpy(z,"11101000011101010111010");
}
else if(strcmp(x,"0110100101")==0){
strcpy(z,"11101000101110001000010");
}
else if(strcmp(x,"0110100110")==0){
strcpy(z,"11101000111110111000110");
}
else if(strcmp(x,"0110100111")==0){
strcpy(z,"11101001001111101000110");
}
else if(strcmp(x,"0110101000")==0){
strcpy(z,"11101001100000011000000");
}
else if(strcmp(x,"0110101001")==0){
strcpy(z,"11101001110001000110111");
}
else if(strcmp(x,"0110101010")==0){
strcpy(z,"11101010000001110101000");
}
else if(strcmp(x,"0110101011")==0){
strcpy(z,"11101010010010100010101");
}
else if(strcmp(x,"0110101100")==0){
strcpy(z,"11101010100011001111110");
}
else if(strcmp(x,"0110101101")==0){
strcpy(z,"11101010110011111100010");
}
else if(strcmp(x,"0110101110")==0){
strcpy(z,"11101011000100101000001");
}
else if(strcmp(x,"0110101111")==0){
strcpy(z,"11101011010101010011100");
}
else if(strcmp(x,"0110110000")==0){
strcpy(z,"11101011100101111110010");
}
else if(strcmp(x,"0110110001")==0){
strcpy(z,"11101011110110101000100");
}
else if(strcmp(x,"0110110010")==0){
strcpy(z,"11101100000111010010001");
}
else if(strcmp(x,"0110110011")==0){
strcpy(z,"11101100010111111011010");
}
else if(strcmp(x,"0110110100")==0){
strcpy(z,"11101100101000100011110");
}
else if(strcmp(x,"0110110101")==0){
strcpy(z,"11101100111001001011110");
}
else if(strcmp(x,"0110110110")==0){
strcpy(z,"11101101001001110011001");
}
else if(strcmp(x,"0110110111")==0){
strcpy(z,"11101101011010011010000");
}
else if(strcmp(x,"0110111000")==0){
strcpy(z,"11101101101011000000011");
}
else if(strcmp(x,"0110111001")==0){
strcpy(z,"11101101111011100110001");
}
else if(strcmp(x,"0110111010")==0){
strcpy(z,"11101110001100001011010");
}
else if(strcmp(x,"0110111011")==0){
strcpy(z,"11101110011100101111111");
}
else if(strcmp(x,"0110111100")==0){
strcpy(z,"11101110101101010100000");
}
else if(strcmp(x,"0110111101")==0){
strcpy(z,"11101110111101110111100");
}
else if(strcmp(x,"0110111110")==0){
strcpy(z,"11101111001110011010011");
}
else if(strcmp(x,"0110111111")==0){
strcpy(z,"11101111011110111100111");
}
else if(strcmp(x,"0111000000")==0){
strcpy(z,"11101111101111011110110");
}
else if(strcmp(x,"0111000001")==0){
strcpy(z,"11110000000000000000000");
}
else if(strcmp(x,"0111000010")==0){
strcpy(z,"11110000010000100000110");
}
else if(strcmp(x,"0111000011")==0){
strcpy(z,"11110000100001000001000");
}
else if(strcmp(x,"0111000100")==0){
strcpy(z,"11110000110001100000101");
}
else if(strcmp(x,"0111000101")==0){
strcpy(z,"11110001000001111111110");
}
else if(strcmp(x,"0111000110")==0){
strcpy(z,"11110001010010011110010");
}
else if(strcmp(x,"0111000111")==0){
strcpy(z,"11110001100010111100011");
}
else if(strcmp(x,"0111001000")==0){
strcpy(z,"11110001110011011001110");
}
else if(strcmp(x,"0111001001")==0){
strcpy(z,"11110010000011110110110");
}
else if(strcmp(x,"0111001010")==0){
strcpy(z,"11110010010100010011001");
}
else if(strcmp(x,"0111001011")==0){
strcpy(z,"11110010100100101111000");
}
else if(strcmp(x,"0111001100")==0){
strcpy(z,"11110010110101001010010");
}
else if(strcmp(x,"0111001101")==0){
strcpy(z,"11110011000101100101000");
}
else if(strcmp(x,"0111001110")==0){
strcpy(z,"11110011010101111111010");
}
else if(strcmp(x,"0111001111")==0){
strcpy(z,"11110011100110011001000");
}
else if(strcmp(x,"0111010000")==0){
strcpy(z,"11110011110110110010001");
}
else if(strcmp(x,"0111010001")==0){
strcpy(z,"11110100000111001010110");
}
else if(strcmp(x,"0111010010")==0){
strcpy(z,"11110100010111100010110");
}
else if(strcmp(x,"0111010011")==0){
strcpy(z,"11110100100111111010010");
}
else if(strcmp(x,"0111010100")==0){
strcpy(z,"11110100111000010001011");
}
else if(strcmp(x,"0111010101")==0){
strcpy(z,"11110101001000100111110");
}
else if(strcmp(x,"0111010110")==0){
strcpy(z,"11110101011000111101110");
}
else if(strcmp(x,"0111010111")==0){
strcpy(z,"11110101101001010011001");
}
else if(strcmp(x,"0111011000")==0){
strcpy(z,"11110101111001101000000");
}
else if(strcmp(x,"0111011001")==0){
strcpy(z,"11110110001001111100011");
}
else if(strcmp(x,"0111011010")==0){
strcpy(z,"11110110011010010000001");
}
else if(strcmp(x,"0111011011")==0){
strcpy(z,"11110110101010100011011");
}
else if(strcmp(x,"0111011100")==0){
strcpy(z,"11110110111010110110001");
}
else if(strcmp(x,"0111011101")==0){
strcpy(z,"11110111001011001000011");
}
else if(strcmp(x,"0111011110")==0){
strcpy(z,"11110111011011011010001");
}
else if(strcmp(x,"0111011111")==0){
strcpy(z,"11110111101011101011010");
}
else if(strcmp(x,"0111100000")==0){
strcpy(z,"11110111111011111011111");
}
else if(strcmp(x,"0111100001")==0){
strcpy(z,"11111000001100001100000");
}
else if(strcmp(x,"0111100010")==0){
strcpy(z,"11111000011100011011101");
}
else if(strcmp(x,"0111100011")==0){
strcpy(z,"11111000101100101010110");
}
else if(strcmp(x,"0111100100")==0){
strcpy(z,"11111000111100111001010");
}
else if(strcmp(x,"0111100101")==0){
strcpy(z,"11111001001101000111010");
}
else if(strcmp(x,"0111100110")==0){
strcpy(z,"11111001011101010100111");
}
else if(strcmp(x,"0111100111")==0){
strcpy(z,"11111001101101100001111");
}
else if(strcmp(x,"0111101000")==0){
strcpy(z,"11111001111101101110010");
}
else if(strcmp(x,"0111101001")==0){
strcpy(z,"11111010001101111010010");
}
else if(strcmp(x,"0111101010")==0){
strcpy(z,"11111010011110000101101");
}
else if(strcmp(x,"0111101011")==0){
strcpy(z,"11111010101110010000101");
}
else if(strcmp(x,"0111101100")==0){
strcpy(z,"11111010111110011011000");
}
else if(strcmp(x,"0111101101")==0){
strcpy(z,"11111011001110100100111");
}
else if(strcmp(x,"0111101110")==0){
strcpy(z,"11111011011110101110010");
}
else if(strcmp(x,"0111101111")==0){
strcpy(z,"11111011101110110111001");
}
else if(strcmp(x,"0111110000")==0){
strcpy(z,"11111011111110111111100");
}
else if(strcmp(x,"0111110001")==0){
strcpy(z,"11111100001111000111011");
}
else if(strcmp(x,"0111110010")==0){
strcpy(z,"11111100011111001110101");
}
else if(strcmp(x,"0111110011")==0){
strcpy(z,"11111100101111010101100");
}
else if(strcmp(x,"0111110100")==0){
strcpy(z,"11111100111111011011110");
}
else if(strcmp(x,"0111110101")==0){
strcpy(z,"11111101001111100001101");
}
else if(strcmp(x,"0111110110")==0){
strcpy(z,"11111101011111100110111");
}
else if(strcmp(x,"0111110111")==0){
strcpy(z,"11111101101111101011101");
}
else if(strcmp(x,"0111111000")==0){
strcpy(z,"11111101111111101111111");
}
else if(strcmp(x,"0111111001")==0){
strcpy(z,"11111110001111110011110");
}
else if(strcmp(x,"0111111010")==0){
strcpy(z,"11111110011111110111000");
}
else if(strcmp(x,"0111111011")==0){
strcpy(z,"11111110101111111001110");
}
else if(strcmp(x,"0111111100")==0){
strcpy(z,"11111110111111111100000");
}
else if(strcmp(x,"0111111101")==0){
strcpy(z,"11111111001111111101110");
}
else if(strcmp(x,"0111111110")==0){
strcpy(z,"11111111011111111111000");
}
else if(strcmp(x,"0111111111")==0){
strcpy(z,"11111111101111111111110");
}
else if(strcmp(x,"1000000000")==0){
strcpy(z,"00000000000000000000000");
}
else if(strcmp(x,"1000000001")==0){
strcpy(z,"00000000001111111111100");
}
else if(strcmp(x,"1000000010")==0){
strcpy(z,"00000000011111111110000");
}
else if(strcmp(x,"1000000011")==0){
strcpy(z,"00000000101111111011100");
}
else if(strcmp(x,"1000000100")==0){
strcpy(z,"00000000111111111000000");
}
else if(strcmp(x,"1000000101")==0){
strcpy(z,"00000001001111110011100");
}
else if(strcmp(x,"1000000110")==0){
strcpy(z,"00000001011111101110001");
}
else if(strcmp(x,"1000000111")==0){
strcpy(z,"00000001101111100111101");
}
else if(strcmp(x,"1000001000")==0){
strcpy(z,"00000001111111100000010");
}
else if(strcmp(x,"1000001001")==0){
strcpy(z,"00000010001111010111111");
}
else if(strcmp(x,"1000001010")==0){
strcpy(z,"00000010011111001110100");
}
else if(strcmp(x,"1000001011")==0){
strcpy(z,"00000010101111000100001");
}
else if(strcmp(x,"1000001100")==0){
strcpy(z,"00000010111110111000111");
}
else if(strcmp(x,"1000001101")==0){
strcpy(z,"00000011001110101100100");
}
else if(strcmp(x,"1000001110")==0){
strcpy(z,"00000011011110011111011");
}
else if(strcmp(x,"1000001111")==0){
strcpy(z,"00000011101110010001001");
}
else if(strcmp(x,"1000010000")==0){
strcpy(z,"00000011111110000010000");
}
else if(strcmp(x,"1000010001")==0){
strcpy(z,"00000100001101110001111");
}
else if(strcmp(x,"1000010010")==0){
strcpy(z,"00000100011101100000110");
}
else if(strcmp(x,"1000010011")==0){
strcpy(z,"00000100101101001110110");
}
else if(strcmp(x,"1000010100")==0){
strcpy(z,"00000100111100111011111");
}
else if(strcmp(x,"1000010101")==0){
strcpy(z,"00000101001100100111111");
}
else if(strcmp(x,"1000010110")==0){
strcpy(z,"00000101011100010011001");
}
else if(strcmp(x,"1000010111")==0){
strcpy(z,"00000101101011111101010");
}
else if(strcmp(x,"1000011000")==0){
strcpy(z,"00000101111011100110100");
}
else if(strcmp(x,"1000011001")==0){
strcpy(z,"00000110001011001110111");
}
else if(strcmp(x,"1000011010")==0){
strcpy(z,"00000110011010110110011");
}
else if(strcmp(x,"1000011011")==0){
strcpy(z,"00000110101010011100110");
}
else if(strcmp(x,"1000011100")==0){
strcpy(z,"00000110111010000010011");
}
else if(strcmp(x,"1000011101")==0){
strcpy(z,"00000111001001100111000");
}
else if(strcmp(x,"1000011110")==0){
strcpy(z,"00000111011001001010110");
}
else if(strcmp(x,"1000011111")==0){
strcpy(z,"00000111101000101101100");
}
else if(strcmp(x,"1000100000")==0){
strcpy(z,"00000111111000001111011");
}
else if(strcmp(x,"1000100001")==0){
strcpy(z,"00001000000111110000011");
}
else if(strcmp(x,"1000100010")==0){
strcpy(z,"00001000010111010000011");
}
else if(strcmp(x,"1000100011")==0){
strcpy(z,"00001000100110101111101");
}
else if(strcmp(x,"1000100100")==0){
strcpy(z,"00001000110110001101111");
}
else if(strcmp(x,"1000100101")==0){
strcpy(z,"00001001000101101011001");
}
else if(strcmp(x,"1000100110")==0){
strcpy(z,"00001001010101000111101");
}
else if(strcmp(x,"1000100111")==0){
strcpy(z,"00001001100100100011001");
}
else if(strcmp(x,"1000101000")==0){
strcpy(z,"00001001110011111101110");
}
else if(strcmp(x,"1000101001")==0){
strcpy(z,"00001010000011010111100");
}
else if(strcmp(x,"1000101010")==0){
strcpy(z,"00001010010010110000011");
}
else if(strcmp(x,"1000101011")==0){
strcpy(z,"00001010100010001000011");
}
else if(strcmp(x,"1000101100")==0){
strcpy(z,"00001010110001011111100");
}
else if(strcmp(x,"1000101101")==0){
strcpy(z,"00001011000000110101110");
}
else if(strcmp(x,"1000101110")==0){
strcpy(z,"00001011010000001011000");
}
else if(strcmp(x,"1000101111")==0){
strcpy(z,"00001011011111011111100");
}
else if(strcmp(x,"1000110000")==0){
strcpy(z,"00001011101110110011000");
}
else if(strcmp(x,"1000110001")==0){
strcpy(z,"00001011111110000101110");
}
else if(strcmp(x,"1000110010")==0){
strcpy(z,"00001100001101010111100");
}
else if(strcmp(x,"1000110011")==0){
strcpy(z,"00001100011100101000100");
}
else if(strcmp(x,"1000110100")==0){
strcpy(z,"00001100101011111000101");
}
else if(strcmp(x,"1000110101")==0){
strcpy(z,"00001100111011000111110");
}
else if(strcmp(x,"1000110110")==0){
strcpy(z,"00001101001010010110001");
}
else if(strcmp(x,"1000110111")==0){
strcpy(z,"00001101011001100011101");
}
else if(strcmp(x,"1000111000")==0){
strcpy(z,"00001101101000110000010");
}
else if(strcmp(x,"1000111001")==0){
strcpy(z,"00001101110111111100001");
}
else if(strcmp(x,"1000111010")==0){
strcpy(z,"00001110000111000111000");
}
else if(strcmp(x,"1000111011")==0){
strcpy(z,"00001110010110010001001");
}
else if(strcmp(x,"1000111100")==0){
strcpy(z,"00001110100101011010011");
}
else if(strcmp(x,"1000111101")==0){
strcpy(z,"00001110110100100010110");
}
else if(strcmp(x,"1000111110")==0){
strcpy(z,"00001111000011101010010");
}
else if(strcmp(x,"1000111111")==0){
strcpy(z,"00001111010010110001000");
}
else if(strcmp(x,"1001000000")==0){
strcpy(z,"00001111100001110110110");
}
else if(strcmp(x,"1001000001")==0){
strcpy(z,"00001111110000111011111");
}
else if(strcmp(x,"1001000010")==0){
strcpy(z,"00010000000000000000000");
}
else if(strcmp(x,"1001000011")==0){
strcpy(z,"00010000001111000011011");
}
else if(strcmp(x,"1001000100")==0){
strcpy(z,"00010000011110000101111");
}
else if(strcmp(x,"1001000101")==0){
strcpy(z,"00010000101101000111100");
}
else if(strcmp(x,"1001000110")==0){
strcpy(z,"00010000111100001000011");
}
else if(strcmp(x,"1001000111")==0){
strcpy(z,"00010001001011001000100");
}
else if(strcmp(x,"1001001000")==0){
strcpy(z,"00010001011010000111101");
}
else if(strcmp(x,"1001001001")==0){
strcpy(z,"00010001101001000110000");
}
else if(strcmp(x,"1001001010")==0){
strcpy(z,"00010001111000000011101");
}
else if(strcmp(x,"1001001011")==0){
strcpy(z,"00010010000111000000011");
}
else if(strcmp(x,"1001001100")==0){
strcpy(z,"00010010010101111100011");
}
else if(strcmp(x,"1001001101")==0){
strcpy(z,"00010010100100110111100");
}
else if(strcmp(x,"1001001110")==0){
strcpy(z,"00010010110011110001110");
}
else if(strcmp(x,"1001001111")==0){
strcpy(z,"00010011000010101011010");
}
else if(strcmp(x,"1001010000")==0){
strcpy(z,"00010011010001100100000");
}
else if(strcmp(x,"1001010001")==0){
strcpy(z,"00010011100000011011111");
}
else if(strcmp(x,"1001010010")==0){
strcpy(z,"00010011101111010011000");
}
else if(strcmp(x,"1001010011")==0){
strcpy(z,"00010011111110001001010");
}
else if(strcmp(x,"1001010100")==0){
strcpy(z,"00010100001100111110110");
}
else if(strcmp(x,"1001010101")==0){
strcpy(z,"00010100011011110011100");
}
else if(strcmp(x,"1001010110")==0){
strcpy(z,"00010100101010100111011");
}
else if(strcmp(x,"1001010111")==0){
strcpy(z,"00010100111001011010100");
}
else if(strcmp(x,"1001011000")==0){
strcpy(z,"00010101001000001100111");
}
else if(strcmp(x,"1001011001")==0){
strcpy(z,"00010101010110111110011");
}
else if(strcmp(x,"1001011010")==0){
strcpy(z,"00010101100101101111001");
}
else if(strcmp(x,"1001011011")==0){
strcpy(z,"00010101110100011111001");
}
else if(strcmp(x,"1001011100")==0){
strcpy(z,"00010110000011001110010");
}
else if(strcmp(x,"1001011101")==0){
strcpy(z,"00010110010001111100101");
}
else if(strcmp(x,"1001011110")==0){
strcpy(z,"00010110100000101010010");
}
else if(strcmp(x,"1001011111")==0){
strcpy(z,"00010110101111010111001");
}
else if(strcmp(x,"1001100000")==0){
strcpy(z,"00010110111110000011010");
}
else if(strcmp(x,"1001100001")==0){
strcpy(z,"00010111001100101110100");
}
else if(strcmp(x,"1001100010")==0){
strcpy(z,"00010111011011011001000");
}
else if(strcmp(x,"1001100011")==0){
strcpy(z,"00010111101010000010110");
}
else if(strcmp(x,"1001100100")==0){
strcpy(z,"00010111111000101011110");
}
else if(strcmp(x,"1001100101")==0){
strcpy(z,"00011000000111010100000");
}
else if(strcmp(x,"1001100110")==0){
strcpy(z,"00011000010101111011100");
}
else if(strcmp(x,"1001100111")==0){
strcpy(z,"00011000100100100010010");
}
else if(strcmp(x,"1001101000")==0){
strcpy(z,"00011000110011001000001");
}
else if(strcmp(x,"1001101001")==0){
strcpy(z,"00011001000001101101011");
}
else if(strcmp(x,"1001101010")==0){
strcpy(z,"00011001010000010001110");
}
else if(strcmp(x,"1001101011")==0){
strcpy(z,"00011001011110110101011");
}
else if(strcmp(x,"1001101100")==0){
strcpy(z,"00011001101101011000011");
}
else if(strcmp(x,"1001101101")==0){
strcpy(z,"00011001111011111010100");
}
else if(strcmp(x,"1001101110")==0){
strcpy(z,"00011010001010011100000");
}
else if(strcmp(x,"1001101111")==0){
strcpy(z,"00011010011000111100101");
}
else if(strcmp(x,"1001110000")==0){
strcpy(z,"00011010100111011100100");
}
else if(strcmp(x,"1001110001")==0){
strcpy(z,"00011010110101111011110");
}
else if(strcmp(x,"1001110010")==0){
strcpy(z,"00011011000100011010010");
}
else if(strcmp(x,"1001110011")==0){
strcpy(z,"00011011010010110111111");
}
else if(strcmp(x,"1001110100")==0){
strcpy(z,"00011011100001010100111");
}
else if(strcmp(x,"1001110101")==0){
strcpy(z,"00011011101111110001001");
}
else if(strcmp(x,"1001110110")==0){
strcpy(z,"00011011111110001100101");
}
else if(strcmp(x,"1001110111")==0){
strcpy(z,"00011100001100100111011");
}
else if(strcmp(x,"1001111000")==0){
strcpy(z,"00011100011011000001011");
}
else if(strcmp(x,"1001111001")==0){
strcpy(z,"00011100101001011010110");
}
else if(strcmp(x,"1001111010")==0){
strcpy(z,"00011100110111110011010");
}
else if(strcmp(x,"1001111011")==0){
strcpy(z,"00011101000110001011001");
}
else if(strcmp(x,"1001111100")==0){
strcpy(z,"00011101010100100010010");
}
else if(strcmp(x,"1001111101")==0){
strcpy(z,"00011101100010111000110");
}
else if(strcmp(x,"1001111110")==0){
strcpy(z,"00011101110001001110011");
}
else if(strcmp(x,"1001111111")==0){
strcpy(z,"00011101111111100011011");
}
else if(strcmp(x,"1010000000")==0){
strcpy(z,"00011110001101110111101");
}
else if(strcmp(x,"1010000001")==0){
strcpy(z,"00011110011100001011001");
}
else if(strcmp(x,"1010000010")==0){
strcpy(z,"00011110101010011110000");
}
else if(strcmp(x,"1010000011")==0){
strcpy(z,"00011110111000110000001");
}
else if(strcmp(x,"1010000100")==0){
strcpy(z,"00011111000111000001100");
}
else if(strcmp(x,"1010000101")==0){
strcpy(z,"00011111010101010010001");
}
else if(strcmp(x,"1010000110")==0){
strcpy(z,"00011111100011100010001");
}
else if(strcmp(x,"1010000111")==0){
strcpy(z,"00011111110001110001011");
}
else if(strcmp(x,"1010001000")==0){
strcpy(z,"00100000000000000000000");
}
else if(strcmp(x,"1010001001")==0){
strcpy(z,"00100000001110001101111");
}
else if(strcmp(x,"1010001010")==0){
strcpy(z,"00100000011100011011000");
}
else if(strcmp(x,"1010001011")==0){
strcpy(z,"00100000101010100111100");
}
else if(strcmp(x,"1010001100")==0){
strcpy(z,"00100000111000110011010");
}
else if(strcmp(x,"1010001101")==0){
strcpy(z,"00100001000110111110011");
}
else if(strcmp(x,"1010001110")==0){
strcpy(z,"00100001010101001000110");
}
else if(strcmp(x,"1010001111")==0){
strcpy(z,"00100001100011010010100");
}
else if(strcmp(x,"1010010000")==0){
strcpy(z,"00100001110001011011100");
}
else if(strcmp(x,"1010010001")==0){
strcpy(z,"00100001111111100011110");
}
else if(strcmp(x,"1010010010")==0){
strcpy(z,"00100010001101101011011");
}
else if(strcmp(x,"1010010011")==0){
strcpy(z,"00100010011011110010010");
}
else if(strcmp(x,"1010010100")==0){
strcpy(z,"00100010101001111000100");
}
else if(strcmp(x,"1010010101")==0){
strcpy(z,"00100010110111111110001");
}
else if(strcmp(x,"1010010110")==0){
strcpy(z,"00100011000110000011000");
}
else if(strcmp(x,"1010010111")==0){
strcpy(z,"00100011010100000111010");
}
else if(strcmp(x,"1010011000")==0){
strcpy(z,"00100011100010001010110");
}
else if(strcmp(x,"1010011001")==0){
strcpy(z,"00100011110000001101101");
}
else if(strcmp(x,"1010011010")==0){
strcpy(z,"00100011111110001111110");
}
else if(strcmp(x,"1010011011")==0){
strcpy(z,"00100100001100010001010");
}
else if(strcmp(x,"1010011100")==0){
strcpy(z,"00100100011010010010001");
}
else if(strcmp(x,"1010011101")==0){
strcpy(z,"00100100101000010010010");
}
else if(strcmp(x,"1010011110")==0){
strcpy(z,"00100100110110010001110");
}
else if(strcmp(x,"1010011111")==0){
strcpy(z,"00100101000100010000101");
}
else if(strcmp(x,"1010100000")==0){
strcpy(z,"00100101010010001110110");
}
else if(strcmp(x,"1010100001")==0){
strcpy(z,"00100101100000001100010");
}
else if(strcmp(x,"1010100010")==0){
strcpy(z,"00100101101110001001000");
}
else if(strcmp(x,"1010100011")==0){
strcpy(z,"00100101111100000101010");
}
else if(strcmp(x,"1010100100")==0){
strcpy(z,"00100110001010000000110");
}
else if(strcmp(x,"1010100101")==0){
strcpy(z,"00100110010111111011100");
}
else if(strcmp(x,"1010100110")==0){
strcpy(z,"00100110100101110101110");
}
else if(strcmp(x,"1010100111")==0){
strcpy(z,"00100110110011101111010");
}
else if(strcmp(x,"1010101000")==0){
strcpy(z,"00100111000001101000001");
}
else if(strcmp(x,"1010101001")==0){
strcpy(z,"00100111001111100000011");
}
else if(strcmp(x,"1010101010")==0){
strcpy(z,"00100111011101010111111");
}
else if(strcmp(x,"1010101011")==0){
strcpy(z,"00100111101011001110111");
}
else if(strcmp(x,"1010101100")==0){
strcpy(z,"00100111111001000101001");
}
else if(strcmp(x,"1010101101")==0){
strcpy(z,"00101000000110111010110");
}
else if(strcmp(x,"1010101110")==0){
strcpy(z,"00101000010100101111110");
}
else if(strcmp(x,"1010101111")==0){
strcpy(z,"00101000100010100100000");
}
else if(strcmp(x,"1010110000")==0){
strcpy(z,"00101000110000010111110");
}
else if(strcmp(x,"1010110001")==0){
strcpy(z,"00101000111110001010110");
}
else if(strcmp(x,"1010110010")==0){
strcpy(z,"00101001001011111101001");
}
else if(strcmp(x,"1010110011")==0){
strcpy(z,"00101001011001101111000");
}
else if(strcmp(x,"1010110100")==0){
strcpy(z,"00101001100111100000001");
}
else if(strcmp(x,"1010110101")==0){
strcpy(z,"00101001110101010000100");
}
else if(strcmp(x,"1010110110")==0){
strcpy(z,"00101010000011000000011");
}
else if(strcmp(x,"1010110111")==0){
strcpy(z,"00101010010000101111101");
}
else if(strcmp(x,"1010111000")==0){
strcpy(z,"00101010011110011110010");
}
else if(strcmp(x,"1010111001")==0){
strcpy(z,"00101010101100001100001");
}
else if(strcmp(x,"1010111010")==0){
strcpy(z,"00101010111001111001100");
}
else if(strcmp(x,"1010111011")==0){
strcpy(z,"00101011000111100110010");
}
else if(strcmp(x,"1010111100")==0){
strcpy(z,"00101011010101010010010");
}
else if(strcmp(x,"1010111101")==0){
strcpy(z,"00101011100010111101110");
}
else if(strcmp(x,"1010111110")==0){
strcpy(z,"00101011110000101000101");
}
else if(strcmp(x,"1010111111")==0){
strcpy(z,"00101011111110010010110");
}
else if(strcmp(x,"1011000000")==0){
strcpy(z,"00101100001011111100011");
}
else if(strcmp(x,"1011000001")==0){
strcpy(z,"00101100011001100101010");
}
else if(strcmp(x,"1011000010")==0){
strcpy(z,"00101100100111001101101");
}
else if(strcmp(x,"1011000011")==0){
strcpy(z,"00101100110100110101011");
}
else if(strcmp(x,"1011000100")==0){
strcpy(z,"00101101000010011100100");
}
else if(strcmp(x,"1011000101")==0){
strcpy(z,"00101101010000000011000");
}
else if(strcmp(x,"1011000110")==0){
strcpy(z,"00101101011101101000111");
}
else if(strcmp(x,"1011000111")==0){
strcpy(z,"00101101101011001110001");
}
else if(strcmp(x,"1011001000")==0){
strcpy(z,"00101101111000110010110");
}
else if(strcmp(x,"1011001001")==0){
strcpy(z,"00101110000110010110111");
}
else if(strcmp(x,"1011001010")==0){
strcpy(z,"00101110010011111010010");
}
else if(strcmp(x,"1011001011")==0){
strcpy(z,"00101110100001011101001");
}
else if(strcmp(x,"1011001100")==0){
strcpy(z,"00101110101110111111010");
}
else if(strcmp(x,"1011001101")==0){
strcpy(z,"00101110111100100000111");
}
else if(strcmp(x,"1011001110")==0){
strcpy(z,"00101111001010000010000");
}
else if(strcmp(x,"1011001111")==0){
strcpy(z,"00101111010111100010011");
}
else if(strcmp(x,"1011010000")==0){
strcpy(z,"00101111100101000010001");
}
else if(strcmp(x,"1011010001")==0){
strcpy(z,"00101111110010100001011");
}
else if(strcmp(x,"1011010010")==0){
strcpy(z,"00110000000000000000000");
}
else if(strcmp(x,"1011010011")==0){
strcpy(z,"00110000001101011110000");
}
else if(strcmp(x,"1011010100")==0){
strcpy(z,"00110000011010111011100");
}
else if(strcmp(x,"1011010101")==0){
strcpy(z,"00110000101000011000010");
}
else if(strcmp(x,"1011010110")==0){
strcpy(z,"00110000110101110100100");
}
else if(strcmp(x,"1011010111")==0){
strcpy(z,"00110001000011010000001");
}
else if(strcmp(x,"1011011000")==0){
strcpy(z,"00110001010000101011010");
}
else if(strcmp(x,"1011011001")==0){
strcpy(z,"00110001011110000101101");
}
else if(strcmp(x,"1011011010")==0){
strcpy(z,"00110001101011011111100");
}
else if(strcmp(x,"1011011011")==0){
strcpy(z,"00110001111000111000110");
}
else if(strcmp(x,"1011011100")==0){
strcpy(z,"00110010000110010001100");
}
else if(strcmp(x,"1011011101")==0){
strcpy(z,"00110010010011101001101");
}
else if(strcmp(x,"1011011110")==0){
strcpy(z,"00110010100001000001001");
}
else if(strcmp(x,"1011011111")==0){
strcpy(z,"00110010101110011000001");
}
else if(strcmp(x,"1011100000")==0){
strcpy(z,"00110010111011101110100");
}
else if(strcmp(x,"1011100001")==0){
strcpy(z,"00110011001001000100010");
}
else if(strcmp(x,"1011100010")==0){
strcpy(z,"00110011010110011001100");
}
else if(strcmp(x,"1011100011")==0){
strcpy(z,"00110011100011101110001");
}
else if(strcmp(x,"1011100100")==0){
strcpy(z,"00110011110001000010001");
}
else if(strcmp(x,"1011100101")==0){
strcpy(z,"00110011111110010101101");
}
else if(strcmp(x,"1011100110")==0){
strcpy(z,"00110100001011101000100");
}
else if(strcmp(x,"1011100111")==0){
strcpy(z,"00110100011000111010111");
}
else if(strcmp(x,"1011101000")==0){
strcpy(z,"00110100100110001100101");
}
else if(strcmp(x,"1011101001")==0){
strcpy(z,"00110100110011011101110");
}
else if(strcmp(x,"1011101010")==0){
strcpy(z,"00110101000000101110011");
}
else if(strcmp(x,"1011101011")==0){
strcpy(z,"00110101001101111110100");
}
else if(strcmp(x,"1011101100")==0){
strcpy(z,"00110101011011001101111");
}
else if(strcmp(x,"1011101101")==0){
strcpy(z,"00110101101000011100111");
}
else if(strcmp(x,"1011101110")==0){
strcpy(z,"00110101110101101011001");
}
else if(strcmp(x,"1011101111")==0){
strcpy(z,"00110110000010111001000");
}
else if(strcmp(x,"1011110000")==0){
strcpy(z,"00110110010000000110010");
}
else if(strcmp(x,"1011110001")==0){
strcpy(z,"00110110011101010010111");
}
else if(strcmp(x,"1011110010")==0){
strcpy(z,"00110110101010011111000");
}
else if(strcmp(x,"1011110011")==0){
strcpy(z,"00110110110111101010100");
}
else if(strcmp(x,"1011110100")==0){
strcpy(z,"00110111000100110101100");
}
else if(strcmp(x,"1011110101")==0){
strcpy(z,"00110111010001111111111");
}
else if(strcmp(x,"1011110110")==0){
strcpy(z,"00110111011111001001110");
}
else if(strcmp(x,"1011110111")==0){
strcpy(z,"00110111101100010011001");
}
else if(strcmp(x,"1011111000")==0){
strcpy(z,"00110111111001011011111");
}
else if(strcmp(x,"1011111001")==0){
strcpy(z,"00111000000110100100000");
}
else if(strcmp(x,"1011111010")==0){
strcpy(z,"00111000010011101011101");
}
else if(strcmp(x,"1011111011")==0){
strcpy(z,"00111000100000110010110");
}
else if(strcmp(x,"1011111100")==0){
strcpy(z,"00111000101101111001011");
}
else if(strcmp(x,"1011111101")==0){
strcpy(z,"00111000111010111111011");
}
else if(strcmp(x,"1011111110")==0){
strcpy(z,"00111001001000000100110");
}
else if(strcmp(x,"1011111111")==0){
strcpy(z,"00111001010101001001110");
}
else if(strcmp(x,"1100000000")==0){
strcpy(z,"00111001100010001110001");
}
else if(strcmp(x,"1100000001")==0){
strcpy(z,"00111001101111010001111");
}
else if(strcmp(x,"1100000010")==0){
strcpy(z,"00111001111100010101001");
}
else if(strcmp(x,"1100000011")==0){
strcpy(z,"00111010001001010111111");
}
else if(strcmp(x,"1100000100")==0){
strcpy(z,"00111010010110011010001");
}
else if(strcmp(x,"1100000101")==0){
strcpy(z,"00111010100011011011110");
}
else if(strcmp(x,"1100000110")==0){
strcpy(z,"00111010110000011100111");
}
else if(strcmp(x,"1100000111")==0){
strcpy(z,"00111010111101011101100");
}
else if(strcmp(x,"1100001000")==0){
strcpy(z,"00111011001010011101100");
}
else if(strcmp(x,"1100001001")==0){
strcpy(z,"00111011010111011101000");
}
else if(strcmp(x,"1100001010")==0){
strcpy(z,"00111011100100011100000");
}
else if(strcmp(x,"1100001011")==0){
strcpy(z,"00111011110001011010011");
}
else if(strcmp(x,"1100001100")==0){
strcpy(z,"00111011111110011000010");
}
else if(strcmp(x,"1100001101")==0){
strcpy(z,"00111100001011010101101");
}
else if(strcmp(x,"1100001110")==0){
strcpy(z,"00111100011000010010100");
}
else if(strcmp(x,"1100001111")==0){
strcpy(z,"00111100100101001110111");
}
else if(strcmp(x,"1100010000")==0){
strcpy(z,"00111100110010001010101");
}
else if(strcmp(x,"1100010001")==0){
strcpy(z,"00111100111111000101111");
}
else if(strcmp(x,"1100010010")==0){
strcpy(z,"00111101001100000000101");
}
else if(strcmp(x,"1100010011")==0){
strcpy(z,"00111101011000111010110");
}
else if(strcmp(x,"1100010100")==0){
strcpy(z,"00111101100101110100100");
}
else if(strcmp(x,"1100010101")==0){
strcpy(z,"00111101110010101101101");
}
else if(strcmp(x,"1100010110")==0){
strcpy(z,"00111101111111100110010");
}
else if(strcmp(x,"1100010111")==0){
strcpy(z,"00111110001100011110011");
}
else if(strcmp(x,"1100011000")==0){
strcpy(z,"00111110011001010101111");
}
else if(strcmp(x,"1100011001")==0){
strcpy(z,"00111110100110001101000");
}
else if(strcmp(x,"1100011010")==0){
strcpy(z,"00111110110011000011100");
}
else if(strcmp(x,"1100011011")==0){
strcpy(z,"00111110111111111001101");
}
else if(strcmp(x,"1100011100")==0){
strcpy(z,"00111111001100101111001");
}
else if(strcmp(x,"1100011101")==0){
strcpy(z,"00111111011001100100001");
}
else if(strcmp(x,"1100011110")==0){
strcpy(z,"00111111100110011000101");
}
else if(strcmp(x,"1100011111")==0){
strcpy(z,"00111111110011001100100");
}
else if(strcmp(x,"1100100000")==0){
strcpy(z,"01000000000000000000000");
}
else if(strcmp(x,"1100100001")==0){
strcpy(z,"01000000001100110011000");
}
else if(strcmp(x,"1100100010")==0){
strcpy(z,"01000000011001100101011");
}
else if(strcmp(x,"1100100011")==0){
strcpy(z,"01000000100110010111010");
}
else if(strcmp(x,"1100100100")==0){
strcpy(z,"01000000110011001000110");
}
else if(strcmp(x,"1100100101")==0){
strcpy(z,"01000000111111111001101");
}
else if(strcmp(x,"1100100110")==0){
strcpy(z,"01000001001100101010000");
}
else if(strcmp(x,"1100100111")==0){
strcpy(z,"01000001011001011001111");
}
else if(strcmp(x,"1100101000")==0){
strcpy(z,"01000001100110001001010");
}
else if(strcmp(x,"1100101001")==0){
strcpy(z,"01000001110010111000001");
}
else if(strcmp(x,"1100101010")==0){
strcpy(z,"01000001111111100110100");
}
else if(strcmp(x,"1100101011")==0){
strcpy(z,"01000010001100010100011");
}
else if(strcmp(x,"1100101100")==0){
strcpy(z,"01000010011001000001110");
}
else if(strcmp(x,"1100101101")==0){
strcpy(z,"01000010100101101110101");
}
else if(strcmp(x,"1100101110")==0){
strcpy(z,"01000010110010011011000");
}
else if(strcmp(x,"1100101111")==0){
strcpy(z,"01000010111111000110111");
}
else if(strcmp(x,"1100110000")==0){
strcpy(z,"01000011001011110010010");
}
else if(strcmp(x,"1100110001")==0){
strcpy(z,"01000011011000011101010");
}
else if(strcmp(x,"1100110010")==0){
strcpy(z,"01000011100101000111101");
}
else if(strcmp(x,"1100110011")==0){
strcpy(z,"01000011110001110001100");
}
else if(strcmp(x,"1100110100")==0){
strcpy(z,"01000011111110011010111");
}
else if(strcmp(x,"1100110101")==0){
strcpy(z,"01000100001011000011110");
}
else if(strcmp(x,"1100110110")==0){
strcpy(z,"01000100010111101100001");
}
else if(strcmp(x,"1100110111")==0){
strcpy(z,"01000100100100010100001");
}
else if(strcmp(x,"1100111000")==0){
strcpy(z,"01000100110000111011100");
}
else if(strcmp(x,"1100111001")==0){
strcpy(z,"01000100111101100010100");
}
else if(strcmp(x,"1100111010")==0){
strcpy(z,"01000101001010001000111");
}
else if(strcmp(x,"1100111011")==0){
strcpy(z,"01000101010110101110111");
}
else if(strcmp(x,"1100111100")==0){
strcpy(z,"01000101100011010100011");
}
else if(strcmp(x,"1100111101")==0){
strcpy(z,"01000101101111111001011");
}
else if(strcmp(x,"1100111110")==0){
strcpy(z,"01000101111100011101111");
}
else if(strcmp(x,"1100111111")==0){
strcpy(z,"01000110001001000001111");
}
else if(strcmp(x,"1101000000")==0){
strcpy(z,"01000110010101100101011");
}
else if(strcmp(x,"1101000001")==0){
strcpy(z,"01000110100010001000011");
}
else if(strcmp(x,"1101000010")==0){
strcpy(z,"01000110101110101011000");
}
else if(strcmp(x,"1101000011")==0){
strcpy(z,"01000110111011001101001");
}
else if(strcmp(x,"1101000100")==0){
strcpy(z,"01000111000111101110101");
}
else if(strcmp(x,"1101000101")==0){
strcpy(z,"01000111010100001111111");
}
else if(strcmp(x,"1101000110")==0){
strcpy(z,"01000111100000110000100");
}
else if(strcmp(x,"1101000111")==0){
strcpy(z,"01000111101101010000101");
}
else if(strcmp(x,"1101001000")==0){
strcpy(z,"01000111111001110000011");
}
else if(strcmp(x,"1101001001")==0){
strcpy(z,"01001000000110001111100");
}
else if(strcmp(x,"1101001010")==0){
strcpy(z,"01001000010010101110010");
}
else if(strcmp(x,"1101001011")==0){
strcpy(z,"01001000011111001100101");
}
else if(strcmp(x,"1101001100")==0){
strcpy(z,"01001000101011101010011");
}
else if(strcmp(x,"1101001101")==0){
strcpy(z,"01001000111000000111101");
}
else if(strcmp(x,"1101001110")==0){
strcpy(z,"01001001000100100100100");
}
else if(strcmp(x,"1101001111")==0){
strcpy(z,"01001001010001000000111");
}
else if(strcmp(x,"1101010000")==0){
strcpy(z,"01001001011101011100111");
}
else if(strcmp(x,"1101010001")==0){
strcpy(z,"01001001101001111000010");
}
else if(strcmp(x,"1101010010")==0){
strcpy(z,"01001001110110010011010");
}
else if(strcmp(x,"1101010011")==0){
strcpy(z,"01001010000010101101110");
}
else if(strcmp(x,"1101010100")==0){
strcpy(z,"01001010001111000111110");
}
else if(strcmp(x,"1101010101")==0){
strcpy(z,"01001010011011100001011");
}
else if(strcmp(x,"1101010110")==0){
strcpy(z,"01001010100111111010100");
}
else if(strcmp(x,"1101010111")==0){
strcpy(z,"01001010110100010011001");
}
else if(strcmp(x,"1101011000")==0){
strcpy(z,"01001011000000101011010");
}
else if(strcmp(x,"1101011001")==0){
strcpy(z,"01001011001101000011000");
}
else if(strcmp(x,"1101011010")==0){
strcpy(z,"01001011011001011010010");
}
else if(strcmp(x,"1101011011")==0){
strcpy(z,"01001011100101110001001");
}
else if(strcmp(x,"1101011100")==0){
strcpy(z,"01001011110010000111011");
}
else if(strcmp(x,"1101011101")==0){
strcpy(z,"01001011111110011101010");
}
else if(strcmp(x,"1101011110")==0){
strcpy(z,"01001100001010110010110");
}
else if(strcmp(x,"1101011111")==0){
strcpy(z,"01001100010111000111101");
}
else if(strcmp(x,"1101100000")==0){
strcpy(z,"01001100100011011100001");
}
else if(strcmp(x,"1101100001")==0){
strcpy(z,"01001100101111110000010");
}
else if(strcmp(x,"1101100010")==0){
strcpy(z,"01001100111100000011111");
}
else if(strcmp(x,"1101100011")==0){
strcpy(z,"01001101001000010111000");
}
else if(strcmp(x,"1101100100")==0){
strcpy(z,"01001101010100101001101");
}
else if(strcmp(x,"1101100101")==0){
strcpy(z,"01001101100000111011111");
}
else if(strcmp(x,"1101100110")==0){
strcpy(z,"01001101101101001101101");
}
else if(strcmp(x,"1101100111")==0){
strcpy(z,"01001101111001011111000");
}
else if(strcmp(x,"1101101000")==0){
strcpy(z,"01001110000101101111111");
}
else if(strcmp(x,"1101101001")==0){
strcpy(z,"01001110010010000000010");
}
else if(strcmp(x,"1101101010")==0){
strcpy(z,"01001110011110010000010");
}
else if(strcmp(x,"1101101011")==0){
strcpy(z,"01001110101010011111110");
}
else if(strcmp(x,"1101101100")==0){
strcpy(z,"01001110110110101110111");
}
else if(strcmp(x,"1101101101")==0){
strcpy(z,"01001111000010111101100");
}
else if(strcmp(x,"1101101110")==0){
strcpy(z,"01001111001111001011110");
}
else if(strcmp(x,"1101101111")==0){
strcpy(z,"01001111011011011001011");
}
else if(strcmp(x,"1101110000")==0){
strcpy(z,"01001111100111100110110");
}
else if(strcmp(x,"1101110001")==0){
strcpy(z,"01001111110011110011101");
}
else if(strcmp(x,"1101110010")==0){
strcpy(z,"01010000000000000000000");
}
else if(strcmp(x,"1101110011")==0){
strcpy(z,"01010000001100001100000");
}
else if(strcmp(x,"1101110100")==0){
strcpy(z,"01010000011000010111100");
}
else if(strcmp(x,"1101110101")==0){
strcpy(z,"01010000100100100010101");
}
else if(strcmp(x,"1101110110")==0){
strcpy(z,"01010000110000101101010");
}
else if(strcmp(x,"1101110111")==0){
strcpy(z,"01010000111100110111100");
}
else if(strcmp(x,"1101111000")==0){
strcpy(z,"01010001001001000001010");
}
else if(strcmp(x,"1101111001")==0){
strcpy(z,"01010001010101001010100");
}
else if(strcmp(x,"1101111010")==0){
strcpy(z,"01010001100001010011011");
}
else if(strcmp(x,"1101111011")==0){
strcpy(z,"01010001101101011011111");
}
else if(strcmp(x,"1101111100")==0){
strcpy(z,"01010001111001100011111");
}
else if(strcmp(x,"1101111101")==0){
strcpy(z,"01010010000101101011100");
}
else if(strcmp(x,"1101111110")==0){
strcpy(z,"01010010010001110010101");
}
else if(strcmp(x,"1101111111")==0){
strcpy(z,"01010010011101111001011");
}
else if(strcmp(x,"1110000000")==0){
strcpy(z,"01010010101001111111101");
}
else if(strcmp(x,"1110000001")==0){
strcpy(z,"01010010110110000101100");
}
else if(strcmp(x,"1110000010")==0){
strcpy(z,"01010011000010001011000");
}
else if(strcmp(x,"1110000011")==0){
strcpy(z,"01010011001110001111111");
}
else if(strcmp(x,"1110000100")==0){
strcpy(z,"01010011011010010100100");
}
else if(strcmp(x,"1110000101")==0){
strcpy(z,"01010011100110011000101");
}
else if(strcmp(x,"1110000110")==0){
strcpy(z,"01010011110010011100011");
}
else if(strcmp(x,"1110000111")==0){
strcpy(z,"01010011111110011111101");
}
else if(strcmp(x,"1110001000")==0){
strcpy(z,"01010100001010100010100");
}
else if(strcmp(x,"1110001001")==0){
strcpy(z,"01010100010110100100111");
}
else if(strcmp(x,"1110001010")==0){
strcpy(z,"01010100100010100110111");
}
else if(strcmp(x,"1110001011")==0){
strcpy(z,"01010100101110101000100");
}
else if(strcmp(x,"1110001100")==0){
strcpy(z,"01010100111010101001101");
}
else if(strcmp(x,"1110001101")==0){
strcpy(z,"01010101000110101010011");
}
else if(strcmp(x,"1110001110")==0){
strcpy(z,"01010101010010101010101");
}
else if(strcmp(x,"1110001111")==0){
strcpy(z,"01010101011110101010100");
}
else if(strcmp(x,"1110010000")==0){
strcpy(z,"01010101101010101010000");
}
else if(strcmp(x,"1110010001")==0){
strcpy(z,"01010101110110101001000");
}
else if(strcmp(x,"1110010010")==0){
strcpy(z,"01010110000010100111101");
}
else if(strcmp(x,"1110010011")==0){
strcpy(z,"01010110001110100101111");
}
else if(strcmp(x,"1110010100")==0){
strcpy(z,"01010110011010100011101");
}
else if(strcmp(x,"1110010101")==0){
strcpy(z,"01010110100110100001000");
}
else if(strcmp(x,"1110010110")==0){
strcpy(z,"01010110110010011110000");
}
else if(strcmp(x,"1110010111")==0){
strcpy(z,"01010110111110011010100");
}
else if(strcmp(x,"1110011000")==0){
strcpy(z,"01010111001010010110101");
}
else if(strcmp(x,"1110011001")==0){
strcpy(z,"01010111010110010010010");
}
else if(strcmp(x,"1110011010")==0){
strcpy(z,"01010111100010001101101");
}
else if(strcmp(x,"1110011011")==0){
strcpy(z,"01010111101110001000100");
}
else if(strcmp(x,"1110011100")==0){
strcpy(z,"01010111111010000010111");
}
else if(strcmp(x,"1110011101")==0){
strcpy(z,"01011000000101111101000");
}
else if(strcmp(x,"1110011110")==0){
strcpy(z,"01011000010001110110101");
}
else if(strcmp(x,"1110011111")==0){
strcpy(z,"01011000011101101111111");
}
else if(strcmp(x,"1110100000")==0){
strcpy(z,"01011000101001101000101");
}
else if(strcmp(x,"1110100001")==0){
strcpy(z,"01011000110101100001000");
}
else if(strcmp(x,"1110100010")==0){
strcpy(z,"01011001000001011001000");
}
else if(strcmp(x,"1110100011")==0){
strcpy(z,"01011001001101010000101");
}
else if(strcmp(x,"1110100100")==0){
strcpy(z,"01011001011001000111110");
}
else if(strcmp(x,"1110100101")==0){
strcpy(z,"01011001100100111110101");
}
else if(strcmp(x,"1110100110")==0){
strcpy(z,"01011001110000110101000");
}
else if(strcmp(x,"1110100111")==0){
strcpy(z,"01011001111100101010111");
}
else if(strcmp(x,"1110101000")==0){
strcpy(z,"01011010001000100000100");
}
else if(strcmp(x,"1110101001")==0){
strcpy(z,"01011010010100010101101");
}
else if(strcmp(x,"1110101010")==0){
strcpy(z,"01011010100000001010011");
}
else if(strcmp(x,"1110101011")==0){
strcpy(z,"01011010101011111110101");
}
else if(strcmp(x,"1110101100")==0){
strcpy(z,"01011010110111110010101");
}
else if(strcmp(x,"1110101101")==0){
strcpy(z,"01011011000011100110001");
}
else if(strcmp(x,"1110101110")==0){
strcpy(z,"01011011001111011001010");
}
else if(strcmp(x,"1110101111")==0){
strcpy(z,"01011011011011001100000");
}
else if(strcmp(x,"1110110000")==0){
strcpy(z,"01011011100110111110011");
}
else if(strcmp(x,"1110110001")==0){
strcpy(z,"01011011110010110000010");
}
else if(strcmp(x,"1110110010")==0){
strcpy(z,"01011011111110100001111");
}
else if(strcmp(x,"1110110011")==0){
strcpy(z,"01011100001010010011000");
}
else if(strcmp(x,"1110110100")==0){
strcpy(z,"01011100010110000011110");
}
else if(strcmp(x,"1110110101")==0){
strcpy(z,"01011100100001110100000");
}
else if(strcmp(x,"1110110110")==0){
strcpy(z,"01011100101101100100000");
}
else if(strcmp(x,"1110110111")==0){
strcpy(z,"01011100111001010011100");
}
else if(strcmp(x,"1110111000")==0){
strcpy(z,"01011101000101000010110");
}
else if(strcmp(x,"1110111001")==0){
strcpy(z,"01011101010000110001100");
}
else if(strcmp(x,"1110111010")==0){
strcpy(z,"01011101011100011111111");
}
else if(strcmp(x,"1110111011")==0){
strcpy(z,"01011101101000001101111");
}
else if(strcmp(x,"1110111100")==0){
strcpy(z,"01011101110011111011011");
}
else if(strcmp(x,"1110111101")==0){
strcpy(z,"01011101111111101000101");
}
else if(strcmp(x,"1110111110")==0){
strcpy(z,"01011110001011010101011");
}
else if(strcmp(x,"1110111111")==0){
strcpy(z,"01011110010111000001110");
}
else if(strcmp(x,"1111000000")==0){
strcpy(z,"01011110100010101101111");
}
else if(strcmp(x,"1111000001")==0){
strcpy(z,"01011110101110011001100");
}
else if(strcmp(x,"1111000010")==0){
strcpy(z,"01011110111010000100110");
}
else if(strcmp(x,"1111000011")==0){
strcpy(z,"01011111000101101111100");
}
else if(strcmp(x,"1111000100")==0){
strcpy(z,"01011111010001011010000");
}
else if(strcmp(x,"1111000101")==0){
strcpy(z,"01011111011101000100001");
}
else if(strcmp(x,"1111000110")==0){
strcpy(z,"01011111101000101101110");
}
else if(strcmp(x,"1111000111")==0){
strcpy(z,"01011111110100010111001");
}
else if(strcmp(x,"1111001000")==0){
strcpy(z,"01100000000000000000000");
}
else if(strcmp(x,"1111001001")==0){
strcpy(z,"01100000001011101000100");
}
else if(strcmp(x,"1111001010")==0){
strcpy(z,"01100000010111010000101");
}
else if(strcmp(x,"1111001011")==0){
strcpy(z,"01100000100010111000100");
}
else if(strcmp(x,"1111001100")==0){
strcpy(z,"01100000101110011111111");
}
else if(strcmp(x,"1111001101")==0){
strcpy(z,"01100000111010000110111");
}
else if(strcmp(x,"1111001110")==0){
strcpy(z,"01100001000101101101100");
}
else if(strcmp(x,"1111001111")==0){
strcpy(z,"01100001010001010011110");
}
else if(strcmp(x,"1111010000")==0){
strcpy(z,"01100001011100111001100");
}
else if(strcmp(x,"1111010001")==0){
strcpy(z,"01100001101000011111000");
}
else if(strcmp(x,"1111010010")==0){
strcpy(z,"01100001110100000100001");
}
else if(strcmp(x,"1111010011")==0){
strcpy(z,"01100001111111101000111");
}
else if(strcmp(x,"1111010100")==0){
strcpy(z,"01100010001011001101010");
}
else if(strcmp(x,"1111010101")==0){
strcpy(z,"01100010010110110001001");
}
else if(strcmp(x,"1111010110")==0){
strcpy(z,"01100010100010010100110");
}
else if(strcmp(x,"1111010111")==0){
strcpy(z,"01100010101101111000000");
}
else if(strcmp(x,"1111011000")==0){
strcpy(z,"01100010111001011010110");
}
else if(strcmp(x,"1111011001")==0){
strcpy(z,"01100011000100111101010");
}
else if(strcmp(x,"1111011010")==0){
strcpy(z,"01100011010000011111011");
}
else if(strcmp(x,"1111011011")==0){
strcpy(z,"01100011011100000001000");
}
else if(strcmp(x,"1111011100")==0){
strcpy(z,"01100011100111100010011");
}
else if(strcmp(x,"1111011101")==0){
strcpy(z,"01100011110011000011011");
}
else if(strcmp(x,"1111011110")==0){
strcpy(z,"01100011111110100100000");
}
else if(strcmp(x,"1111011111")==0){
strcpy(z,"01100100001010000100001");
}
else if(strcmp(x,"1111100000")==0){
strcpy(z,"01100100010101100100000");
}
else if(strcmp(x,"1111100001")==0){
strcpy(z,"01100100100001000011100");
}
else if(strcmp(x,"1111100010")==0){
strcpy(z,"01100100101100100010101");
}
else if(strcmp(x,"1111100011")==0){
strcpy(z,"01100100111000000001011");
}
else if(strcmp(x,"1111100100")==0){
strcpy(z,"01100101000011011111110");
}
else if(strcmp(x,"1111100101")==0){
strcpy(z,"01100101001110111101110");
}
else if(strcmp(x,"1111100110")==0){
strcpy(z,"01100101011010011011011");
}
else if(strcmp(x,"1111100111")==0){
strcpy(z,"01100101100101111000101");
}
else if(strcmp(x,"1111101000")==0){
strcpy(z,"01100101110001010101100");
}
else if(strcmp(x,"1111101001")==0){
strcpy(z,"01100101111100110010000");
}
else if(strcmp(x,"1111101010")==0){
strcpy(z,"01100110001000001110010");
}
else if(strcmp(x,"1111101011")==0){
strcpy(z,"01100110010011101010000");
}
else if(strcmp(x,"1111101100")==0){
strcpy(z,"01100110011111000101100");
}
else if(strcmp(x,"1111101101")==0){
strcpy(z,"01100110101010100000100");
}
else if(strcmp(x,"1111101110")==0){
strcpy(z,"01100110110101111011010");
}
else if(strcmp(x,"1111101111")==0){
strcpy(z,"01100111000001010101101");
}
else if(strcmp(x,"1111110000")==0){
strcpy(z,"01100111001100101111100");
}
else if(strcmp(x,"1111110001")==0){
strcpy(z,"01100111011000001001001");
}
else if(strcmp(x,"1111110010")==0){
strcpy(z,"01100111100011100010011");
}
else if(strcmp(x,"1111110011")==0){
strcpy(z,"01100111101110111011011");
}
else if(strcmp(x,"1111110100")==0){
strcpy(z,"01100111111010010011111");
}
else if(strcmp(x,"1111110101")==0){
strcpy(z,"01101000000101101100000");
}
else if(strcmp(x,"1111110110")==0){
strcpy(z,"01101000010001000011111");
}
else if(strcmp(x,"1111110111")==0){
strcpy(z,"01101000011100011011011");
}
else if(strcmp(x,"1111111000")==0){
strcpy(z,"01101000100111110010011");
}
else if(strcmp(x,"1111111001")==0){
strcpy(z,"01101000110011001001001");
}
else if(strcmp(x,"1111111010")==0){
strcpy(z,"01101000111110011111100");
}
else if(strcmp(x,"1111111011")==0){
strcpy(z,"01101001001001110101101");
}
else if(strcmp(x,"1111111100")==0){
strcpy(z,"01101001010101001011010");
}
else if(strcmp(x,"1111111101")==0){
strcpy(z,"01101001100000100000101");
}
else if(strcmp(x,"1111111110")==0){
strcpy(z,"01101001101011110101100");
}
else if(strcmp(x,"1111111111")==0){
strcpy(z,"01101001110111001010001");
}
}


void fsqrtinv_tabel(char y[24],char x[11]){
if(strcmp(x,"0000000000")==0){
strcpy(y,"01101010000010011110011");
}
else if(strcmp(x,"0000000001")==0){
strcpy(y,"01101001101011111000011");
}
else if(strcmp(x,"0000000010")==0){
strcpy(y,"01101001010101010110100");
}
else if(strcmp(x,"0000000011")==0){
strcpy(y,"01101000111110111000111");
}
else if(strcmp(x,"0000000100")==0){
strcpy(y,"01101000101000011111100");
}
else if(strcmp(x,"0000000101")==0){
strcpy(y,"01101000010010001010010");
}
else if(strcmp(x,"0000000110")==0){
strcpy(y,"01100111111011111001001");
}
else if(strcmp(x,"0000000111")==0){
strcpy(y,"01100111100101101100001");
}
else if(strcmp(x,"0000001000")==0){
strcpy(y,"01100111001111100011001");
}
else if(strcmp(x,"0000001001")==0){
strcpy(y,"01100110111001011110011");
}
else if(strcmp(x,"0000001010")==0){
strcpy(y,"01100110100011011101101");
}
else if(strcmp(x,"0000001011")==0){
strcpy(y,"01100110001101100000111");
}
else if(strcmp(x,"0000001100")==0){
strcpy(y,"01100101110111101000001");
}
else if(strcmp(x,"0000001101")==0){
strcpy(y,"01100101100001110011100");
}
else if(strcmp(x,"0000001110")==0){
strcpy(y,"01100101001100000010110");
}
else if(strcmp(x,"0000001111")==0){
strcpy(y,"01100100110110010110000");
}
else if(strcmp(x,"0000010000")==0){
strcpy(y,"01100100100000101101010");
}
else if(strcmp(x,"0000010001")==0){
strcpy(y,"01100100001011001000011");
}
else if(strcmp(x,"0000010010")==0){
strcpy(y,"01100011110101100111011");
}
else if(strcmp(x,"0000010011")==0){
strcpy(y,"01100011100000001010011");
}
else if(strcmp(x,"0000010100")==0){
strcpy(y,"01100011001010110001001");
}
else if(strcmp(x,"0000010101")==0){
strcpy(y,"01100010110101011011110");
}
else if(strcmp(x,"0000010110")==0){
strcpy(y,"01100010100000001010010");
}
else if(strcmp(x,"0000010111")==0){
strcpy(y,"01100010001010111100101");
}
else if(strcmp(x,"0000011000")==0){
strcpy(y,"01100001110101110010110");
}
else if(strcmp(x,"0000011001")==0){
strcpy(y,"01100001100000101100101");
}
else if(strcmp(x,"0000011010")==0){
strcpy(y,"01100001001011101010010");
}
else if(strcmp(x,"0000011011")==0){
strcpy(y,"01100000110110101011110");
}
else if(strcmp(x,"0000011100")==0){
strcpy(y,"01100000100001110000111");
}
else if(strcmp(x,"0000011101")==0){
strcpy(y,"01100000001100111001110");
}
else if(strcmp(x,"0000011110")==0){
strcpy(y,"01011111111000000110010");
}
else if(strcmp(x,"0000011111")==0){
strcpy(y,"01011111100011010110100");
}
else if(strcmp(x,"0000100000")==0){
strcpy(y,"01011111001110101010011");
}
else if(strcmp(x,"0000100001")==0){
strcpy(y,"01011110111010000010000");
}
else if(strcmp(x,"0000100010")==0){
strcpy(y,"01011110100101011101001");
}
else if(strcmp(x,"0000100011")==0){
strcpy(y,"01011110010000111011111");
}
else if(strcmp(x,"0000100100")==0){
strcpy(y,"01011101111100011110010");
}
else if(strcmp(x,"0000100101")==0){
strcpy(y,"01011101101000000100010");
}
else if(strcmp(x,"0000100110")==0){
strcpy(y,"01011101010011101101110");
}
else if(strcmp(x,"0000100111")==0){
strcpy(y,"01011100111111011010111");
}
else if(strcmp(x,"0000101000")==0){
strcpy(y,"01011100101011001011100");
}
else if(strcmp(x,"0000101001")==0){
strcpy(y,"01011100010110111111101");
}
else if(strcmp(x,"0000101010")==0){
strcpy(y,"01011100000010110111010");
}
else if(strcmp(x,"0000101011")==0){
strcpy(y,"01011011101110110010011");
}
else if(strcmp(x,"0000101100")==0){
strcpy(y,"01011011011010110000111");
}
else if(strcmp(x,"0000101101")==0){
strcpy(y,"01011011000110110010111");
}
else if(strcmp(x,"0000101110")==0){
strcpy(y,"01011010110010111000011");
}
else if(strcmp(x,"0000101111")==0){
strcpy(y,"01011010011111000001010");
}
else if(strcmp(x,"0000110000")==0){
strcpy(y,"01011010001011001101100");
}
else if(strcmp(x,"0000110001")==0){
strcpy(y,"01011001110111011101010");
}
else if(strcmp(x,"0000110010")==0){
strcpy(y,"01011001100011110000010");
}
else if(strcmp(x,"0000110011")==0){
strcpy(y,"01011001010000000110110");
}
else if(strcmp(x,"0000110100")==0){
strcpy(y,"01011000111100100000100");
}
else if(strcmp(x,"0000110101")==0){
strcpy(y,"01011000101000111101101");
}
else if(strcmp(x,"0000110110")==0){
strcpy(y,"01011000010101011110000");
}
else if(strcmp(x,"0000110111")==0){
strcpy(y,"01011000000010000001110");
}
else if(strcmp(x,"0000111000")==0){
strcpy(y,"01010111101110101000110");
}
else if(strcmp(x,"0000111001")==0){
strcpy(y,"01010111011011010011000");
}
else if(strcmp(x,"0000111010")==0){
strcpy(y,"01010111001000000000100");
}
else if(strcmp(x,"0000111011")==0){
strcpy(y,"01010110110100110001010");
}
else if(strcmp(x,"0000111100")==0){
strcpy(y,"01010110100001100101010");
}
else if(strcmp(x,"0000111101")==0){
strcpy(y,"01010110001110011100100");
}
else if(strcmp(x,"0000111110")==0){
strcpy(y,"01010101111011010110111");
}
else if(strcmp(x,"0000111111")==0){
strcpy(y,"01010101101000010100100");
}
else if(strcmp(x,"0001000000")==0){
strcpy(y,"01010101010101010101011");
}
else if(strcmp(x,"0001000001")==0){
strcpy(y,"01010101000010011001010");
}
else if(strcmp(x,"0001000010")==0){
strcpy(y,"01010100101111100000011");
}
else if(strcmp(x,"0001000011")==0){
strcpy(y,"01010100011100101010101");
}
else if(strcmp(x,"0001000100")==0){
strcpy(y,"01010100001001111000000");
}
else if(strcmp(x,"0001000101")==0){
strcpy(y,"01010011110111001000011");
}
else if(strcmp(x,"0001000110")==0){
strcpy(y,"01010011100100011100000");
}
else if(strcmp(x,"0001000111")==0){
strcpy(y,"01010011010001110010101");
}
else if(strcmp(x,"0001001000")==0){
strcpy(y,"01010010111111001100010");
}
else if(strcmp(x,"0001001001")==0){
strcpy(y,"01010010101100101001000");
}
else if(strcmp(x,"0001001010")==0){
strcpy(y,"01010010011010001000110");
}
else if(strcmp(x,"0001001011")==0){
strcpy(y,"01010010000111101011101");
}
else if(strcmp(x,"0001001100")==0){
strcpy(y,"01010001110101010001100");
}
else if(strcmp(x,"0001001101")==0){
strcpy(y,"01010001100010111010010");
}
else if(strcmp(x,"0001001110")==0){
strcpy(y,"01010001010000100110001");
}
else if(strcmp(x,"0001001111")==0){
strcpy(y,"01010000111110010100111");
}
else if(strcmp(x,"0001010000")==0){
strcpy(y,"01010000101100000110101");
}
else if(strcmp(x,"0001010001")==0){
strcpy(y,"01010000011001111011011");
}
else if(strcmp(x,"0001010010")==0){
strcpy(y,"01010000000111110011000");
}
else if(strcmp(x,"0001010011")==0){
strcpy(y,"01001111110101101101101");
}
else if(strcmp(x,"0001010100")==0){
strcpy(y,"01001111100011101011001");
}
else if(strcmp(x,"0001010101")==0){
strcpy(y,"01001111010001101011100");
}
else if(strcmp(x,"0001010110")==0){
strcpy(y,"01001110111111101110110");
}
else if(strcmp(x,"0001010111")==0){
strcpy(y,"01001110101101110100111");
}
else if(strcmp(x,"0001011000")==0){
strcpy(y,"01001110011011111110000");
}
else if(strcmp(x,"0001011001")==0){
strcpy(y,"01001110001010001001111");
}
else if(strcmp(x,"0001011010")==0){
strcpy(y,"01001101111000011000100");
}
else if(strcmp(x,"0001011011")==0){
strcpy(y,"01001101100110101010001");
}
else if(strcmp(x,"0001011100")==0){
strcpy(y,"01001101010100111110100");
}
else if(strcmp(x,"0001011101")==0){
strcpy(y,"01001101000011010101101");
}
else if(strcmp(x,"0001011110")==0){
strcpy(y,"01001100110001101111101");
}
else if(strcmp(x,"0001011111")==0){
strcpy(y,"01001100100000001100011");
}
else if(strcmp(x,"0001100000")==0){
strcpy(y,"01001100001110101011111");
}
else if(strcmp(x,"0001100001")==0){
strcpy(y,"01001011111101001110010");
}
else if(strcmp(x,"0001100010")==0){
strcpy(y,"01001011101011110011010");
}
else if(strcmp(x,"0001100011")==0){
strcpy(y,"01001011011010011011000");
}
else if(strcmp(x,"0001100100")==0){
strcpy(y,"01001011001001000101100");
}
else if(strcmp(x,"0001100101")==0){
strcpy(y,"01001010110111110010110");
}
else if(strcmp(x,"0001100110")==0){
strcpy(y,"01001010100110100010101");
}
else if(strcmp(x,"0001100111")==0){
strcpy(y,"01001010010101010101010");
}
else if(strcmp(x,"0001101000")==0){
strcpy(y,"01001010000100001010101");
}
else if(strcmp(x,"0001101001")==0){
strcpy(y,"01001001110011000010101");
}
else if(strcmp(x,"0001101010")==0){
strcpy(y,"01001001100001111101010");
}
else if(strcmp(x,"0001101011")==0){
strcpy(y,"01001001010000111010100");
}
else if(strcmp(x,"0001101100")==0){
strcpy(y,"01001000111111111010011");
}
else if(strcmp(x,"0001101101")==0){
strcpy(y,"01001000101110111101000");
}
else if(strcmp(x,"0001101110")==0){
strcpy(y,"01001000011110000010001");
}
else if(strcmp(x,"0001101111")==0){
strcpy(y,"01001000001101001001111");
}
else if(strcmp(x,"0001110000")==0){
strcpy(y,"01000111111100010100010");
}
else if(strcmp(x,"0001110001")==0){
strcpy(y,"01000111101011100001010");
}
else if(strcmp(x,"0001110010")==0){
strcpy(y,"01000111011010110000111");
}
else if(strcmp(x,"0001110011")==0){
strcpy(y,"01000111001010000010111");
}
else if(strcmp(x,"0001110100")==0){
strcpy(y,"01000110111001010111101");
}
else if(strcmp(x,"0001110101")==0){
strcpy(y,"01000110101000101110111");
}
else if(strcmp(x,"0001110110")==0){
strcpy(y,"01000110011000001000101");
}
else if(strcmp(x,"0001110111")==0){
strcpy(y,"01000110000111100100111");
}
else if(strcmp(x,"0001111000")==0){
strcpy(y,"01000101110111000011101");
}
else if(strcmp(x,"0001111001")==0){
strcpy(y,"01000101100110100101000");
}
else if(strcmp(x,"0001111010")==0){
strcpy(y,"01000101010110001000110");
}
else if(strcmp(x,"0001111011")==0){
strcpy(y,"01000101000101101111000");
}
else if(strcmp(x,"0001111100")==0){
strcpy(y,"01000100110101010111110");
}
else if(strcmp(x,"0001111101")==0){
strcpy(y,"01000100100101000011000");
}
else if(strcmp(x,"0001111110")==0){
strcpy(y,"01000100010100110000101");
}
else if(strcmp(x,"0001111111")==0){
strcpy(y,"01000100000100100000111");
}
else if(strcmp(x,"0010000000")==0){
strcpy(y,"01000011110100010011011");
}
else if(strcmp(x,"0010000001")==0){
strcpy(y,"01000011100100001000011");
}
else if(strcmp(x,"0010000010")==0){
strcpy(y,"01000011010011111111110");
}
else if(strcmp(x,"0010000011")==0){
strcpy(y,"01000011000011111001101");
}
else if(strcmp(x,"0010000100")==0){
strcpy(y,"01000010110011110101111");
}
else if(strcmp(x,"0010000101")==0){
strcpy(y,"01000010100011110100100");
}
else if(strcmp(x,"0010000110")==0){
strcpy(y,"01000010010011110101100");
}
else if(strcmp(x,"0010000111")==0){
strcpy(y,"01000010000011111000111");
}
else if(strcmp(x,"0010001000")==0){
strcpy(y,"01000001110011111110101");
}
else if(strcmp(x,"0010001001")==0){
strcpy(y,"01000001100100000110101");
}
else if(strcmp(x,"0010001010")==0){
strcpy(y,"01000001010100010001001");
}
else if(strcmp(x,"0010001011")==0){
strcpy(y,"01000001000100011101111");
}
else if(strcmp(x,"0010001100")==0){
strcpy(y,"01000000110100101101000");
}
else if(strcmp(x,"0010001101")==0){
strcpy(y,"01000000100100111110011");
}
else if(strcmp(x,"0010001110")==0){
strcpy(y,"01000000010101010010001");
}
else if(strcmp(x,"0010001111")==0){
strcpy(y,"01000000000101101000001");
}
else if(strcmp(x,"0010010000")==0){
strcpy(y,"00111111110110000000100");
}
else if(strcmp(x,"0010010001")==0){
strcpy(y,"00111111100110011011001");
}
else if(strcmp(x,"0010010010")==0){
strcpy(y,"00111111010110111000000");
}
else if(strcmp(x,"0010010011")==0){
strcpy(y,"00111111000111010111001");
}
else if(strcmp(x,"0010010100")==0){
strcpy(y,"00111110110111111000100");
}
else if(strcmp(x,"0010010101")==0){
strcpy(y,"00111110101000011100001");
}
else if(strcmp(x,"0010010110")==0){
strcpy(y,"00111110011001000010000");
}
else if(strcmp(x,"0010010111")==0){
strcpy(y,"00111110001001101010001");
}
else if(strcmp(x,"0010011000")==0){
strcpy(y,"00111101111010010100100");
}
else if(strcmp(x,"0010011001")==0){
strcpy(y,"00111101101011000001000");
}
else if(strcmp(x,"0010011010")==0){
strcpy(y,"00111101011011101111111");
}
else if(strcmp(x,"0010011011")==0){
strcpy(y,"00111101001100100000110");
}
else if(strcmp(x,"0010011100")==0){
strcpy(y,"00111100111101010100000");
}
else if(strcmp(x,"0010011101")==0){
strcpy(y,"00111100101110001001010");
}
else if(strcmp(x,"0010011110")==0){
strcpy(y,"00111100011111000000110");
}
else if(strcmp(x,"0010011111")==0){
strcpy(y,"00111100001111111010100");
}
else if(strcmp(x,"0010100000")==0){
strcpy(y,"00111100000000110110011");
}
else if(strcmp(x,"0010100001")==0){
strcpy(y,"00111011110001110100010");
}
else if(strcmp(x,"0010100010")==0){
strcpy(y,"00111011100010110100011");
}
else if(strcmp(x,"0010100011")==0){
strcpy(y,"00111011010011110110110");
}
else if(strcmp(x,"0010100100")==0){
strcpy(y,"00111011000100111011001");
}
else if(strcmp(x,"0010100101")==0){
strcpy(y,"00111010110110000001101");
}
else if(strcmp(x,"0010100110")==0){
strcpy(y,"00111010100111001010010");
}
else if(strcmp(x,"0010100111")==0){
strcpy(y,"00111010011000010100111");
}
else if(strcmp(x,"0010101000")==0){
strcpy(y,"00111010001001100001110");
}
else if(strcmp(x,"0010101001")==0){
strcpy(y,"00111001111010110000101");
}
else if(strcmp(x,"0010101010")==0){
strcpy(y,"00111001101100000001101");
}
else if(strcmp(x,"0010101011")==0){
strcpy(y,"00111001011101010100101");
}
else if(strcmp(x,"0010101100")==0){
strcpy(y,"00111001001110101001110");
}
else if(strcmp(x,"0010101101")==0){
strcpy(y,"00111001000000000001000");
}
else if(strcmp(x,"0010101110")==0){
strcpy(y,"00111000110001011010001");
}
else if(strcmp(x,"0010101111")==0){
strcpy(y,"00111000100010110101011");
}
else if(strcmp(x,"0010110000")==0){
strcpy(y,"00111000010100010010110");
}
else if(strcmp(x,"0010110001")==0){
strcpy(y,"00111000000101110010000");
}
else if(strcmp(x,"0010110010")==0){
strcpy(y,"00110111110111010011011");
}
else if(strcmp(x,"0010110011")==0){
strcpy(y,"00110111101000110110110");
}
else if(strcmp(x,"0010110100")==0){
strcpy(y,"00110111011010011100001");
}
else if(strcmp(x,"0010110101")==0){
strcpy(y,"00110111001100000011100");
}
else if(strcmp(x,"0010110110")==0){
strcpy(y,"00110110111101101100111");
}
else if(strcmp(x,"0010110111")==0){
strcpy(y,"00110110101111011000001");
}
else if(strcmp(x,"0010111000")==0){
strcpy(y,"00110110100001000101100");
}
else if(strcmp(x,"0010111001")==0){
strcpy(y,"00110110010010110100110");
}
else if(strcmp(x,"0010111010")==0){
strcpy(y,"00110110000100100110000");
}
else if(strcmp(x,"0010111011")==0){
strcpy(y,"00110101110110011001001");
}
else if(strcmp(x,"0010111100")==0){
strcpy(y,"00110101101000001110011");
}
else if(strcmp(x,"0010111101")==0){
strcpy(y,"00110101011010000101011");
}
else if(strcmp(x,"0010111110")==0){
strcpy(y,"00110101001011111110011");
}
else if(strcmp(x,"0010111111")==0){
strcpy(y,"00110100111101111001011");
}
else if(strcmp(x,"0011000000")==0){
strcpy(y,"00110100101111110110010");
}
else if(strcmp(x,"0011000001")==0){
strcpy(y,"00110100100001110101000");
}
else if(strcmp(x,"0011000010")==0){
strcpy(y,"00110100010011110101110");
}
else if(strcmp(x,"0011000011")==0){
strcpy(y,"00110100000101111000010");
}
else if(strcmp(x,"0011000100")==0){
strcpy(y,"00110011110111111100110");
}
else if(strcmp(x,"0011000101")==0){
strcpy(y,"00110011101010000011001");
}
else if(strcmp(x,"0011000110")==0){
strcpy(y,"00110011011100001011011");
}
else if(strcmp(x,"0011000111")==0){
strcpy(y,"00110011001110010101100");
}
else if(strcmp(x,"0011001000")==0){
strcpy(y,"00110011000000100001100");
}
else if(strcmp(x,"0011001001")==0){
strcpy(y,"00110010110010101111011");
}
else if(strcmp(x,"0011001010")==0){
strcpy(y,"00110010100100111111000");
}
else if(strcmp(x,"0011001011")==0){
strcpy(y,"00110010010111010000101");
}
else if(strcmp(x,"0011001100")==0){
strcpy(y,"00110010001001100100000");
}
else if(strcmp(x,"0011001101")==0){
strcpy(y,"00110001111011111001010");
}
else if(strcmp(x,"0011001110")==0){
strcpy(y,"00110001101110010000010");
}
else if(strcmp(x,"0011001111")==0){
strcpy(y,"00110001100000101001001");
}
else if(strcmp(x,"0011010000")==0){
strcpy(y,"00110001010011000011111");
}
else if(strcmp(x,"0011010001")==0){
strcpy(y,"00110001000101100000011");
}
else if(strcmp(x,"0011010010")==0){
strcpy(y,"00110000110111111110101");
}
else if(strcmp(x,"0011010011")==0){
strcpy(y,"00110000101010011110110");
}
else if(strcmp(x,"0011010100")==0){
strcpy(y,"00110000011101000000101");
}
else if(strcmp(x,"0011010101")==0){
strcpy(y,"00110000001111100100011");
}
else if(strcmp(x,"0011010110")==0){
strcpy(y,"00110000000010001001110");
}
else if(strcmp(x,"0011010111")==0){
strcpy(y,"00101111110100110001000");
}
else if(strcmp(x,"0011011000")==0){
strcpy(y,"00101111100111011010000");
}
else if(strcmp(x,"0011011001")==0){
strcpy(y,"00101111011010000100110");
}
else if(strcmp(x,"0011011010")==0){
strcpy(y,"00101111001100110001010");
}
else if(strcmp(x,"0011011011")==0){
strcpy(y,"00101110111111011111100");
}
else if(strcmp(x,"0011011100")==0){
strcpy(y,"00101110110010001111100");
}
else if(strcmp(x,"0011011101")==0){
strcpy(y,"00101110100101000001010");
}
else if(strcmp(x,"0011011110")==0){
strcpy(y,"00101110010111110100101");
}
else if(strcmp(x,"0011011111")==0){
strcpy(y,"00101110001010101001111");
}
else if(strcmp(x,"0011100000")==0){
strcpy(y,"00101101111101100000110");
}
else if(strcmp(x,"0011100001")==0){
strcpy(y,"00101101110000011001011");
}
else if(strcmp(x,"0011100010")==0){
strcpy(y,"00101101100011010011110");
}
else if(strcmp(x,"0011100011")==0){
strcpy(y,"00101101010110001111110");
}
else if(strcmp(x,"0011100100")==0){
strcpy(y,"00101101001001001101100");
}
else if(strcmp(x,"0011100101")==0){
strcpy(y,"00101100111100001100111");
}
else if(strcmp(x,"0011100110")==0){
strcpy(y,"00101100101111001110000");
}
else if(strcmp(x,"0011100111")==0){
strcpy(y,"00101100100010010000110");
}
else if(strcmp(x,"0011101000")==0){
strcpy(y,"00101100010101010101001");
}
else if(strcmp(x,"0011101001")==0){
strcpy(y,"00101100001000011011010");
}
else if(strcmp(x,"0011101010")==0){
strcpy(y,"00101011111011100011000");
}
else if(strcmp(x,"0011101011")==0){
strcpy(y,"00101011101110101100100");
}
else if(strcmp(x,"0011101100")==0){
strcpy(y,"00101011100001110111100");
}
else if(strcmp(x,"0011101101")==0){
strcpy(y,"00101011010101000100010");
}
else if(strcmp(x,"0011101110")==0){
strcpy(y,"00101011001000010010101");
}
else if(strcmp(x,"0011101111")==0){
strcpy(y,"00101010111011100010101");
}
else if(strcmp(x,"0011110000")==0){
strcpy(y,"00101010101110110100010");
}
else if(strcmp(x,"0011110001")==0){
strcpy(y,"00101010100010000111100");
}
else if(strcmp(x,"0011110010")==0){
strcpy(y,"00101010010101011100011");
}
else if(strcmp(x,"0011110011")==0){
strcpy(y,"00101010001000110010111");
}
else if(strcmp(x,"0011110100")==0){
strcpy(y,"00101001111100001010111");
}
else if(strcmp(x,"0011110101")==0){
strcpy(y,"00101001101111100100101");
}
else if(strcmp(x,"0011110110")==0){
strcpy(y,"00101001100010111111111");
}
else if(strcmp(x,"0011110111")==0){
strcpy(y,"00101001010110011100110");
}
else if(strcmp(x,"0011111000")==0){
strcpy(y,"00101001001001111011001");
}
else if(strcmp(x,"0011111001")==0){
strcpy(y,"00101000111101011011010");
}
else if(strcmp(x,"0011111010")==0){
strcpy(y,"00101000110000111100111");
}
else if(strcmp(x,"0011111011")==0){
strcpy(y,"00101000100100100000000");
}
else if(strcmp(x,"0011111100")==0){
strcpy(y,"00101000011000000100110");
}
else if(strcmp(x,"0011111101")==0){
strcpy(y,"00101000001011101011000");
}
else if(strcmp(x,"0011111110")==0){
strcpy(y,"00100111111111010010111");
}
else if(strcmp(x,"0011111111")==0){
strcpy(y,"00100111110010111100011");
}
else if(strcmp(x,"0100000000")==0){
strcpy(y,"00100111100110100111010");
}
else if(strcmp(x,"0100000001")==0){
strcpy(y,"00100111011010010011110");
}
else if(strcmp(x,"0100000010")==0){
strcpy(y,"00100111001110000001110");
}
else if(strcmp(x,"0100000011")==0){
strcpy(y,"00100111000001110001011");
}
else if(strcmp(x,"0100000100")==0){
strcpy(y,"00100110110101100010011");
}
else if(strcmp(x,"0100000101")==0){
strcpy(y,"00100110101001010101000");
}
else if(strcmp(x,"0100000110")==0){
strcpy(y,"00100110011101001001001");
}
else if(strcmp(x,"0100000111")==0){
strcpy(y,"00100110010000111110110");
}
else if(strcmp(x,"0100001000")==0){
strcpy(y,"00100110000100110101111");
}
else if(strcmp(x,"0100001001")==0){
strcpy(y,"00100101111000101110100");
}
else if(strcmp(x,"0100001010")==0){
strcpy(y,"00100101101100101000101");
}
else if(strcmp(x,"0100001011")==0){
strcpy(y,"00100101100000100100010");
}
else if(strcmp(x,"0100001100")==0){
strcpy(y,"00100101010100100001011");
}
else if(strcmp(x,"0100001101")==0){
strcpy(y,"00100101001000100000000");
}
else if(strcmp(x,"0100001110")==0){
strcpy(y,"00100100111100100000000");
}
else if(strcmp(x,"0100001111")==0){
strcpy(y,"00100100110000100001101");
}
else if(strcmp(x,"0100010000")==0){
strcpy(y,"00100100100100100100101");
}
else if(strcmp(x,"0100010001")==0){
strcpy(y,"00100100011000101001000");
}
else if(strcmp(x,"0100010010")==0){
strcpy(y,"00100100001100101111000");
}
else if(strcmp(x,"0100010011")==0){
strcpy(y,"00100100000000110110011");
}
else if(strcmp(x,"0100010100")==0){
strcpy(y,"00100011110100111111001");
}
else if(strcmp(x,"0100010101")==0){
strcpy(y,"00100011101001001001011");
}
else if(strcmp(x,"0100010110")==0){
strcpy(y,"00100011011101010101001");
}
else if(strcmp(x,"0100010111")==0){
strcpy(y,"00100011010001100010010");
}
else if(strcmp(x,"0100011000")==0){
strcpy(y,"00100011000101110000111");
}
else if(strcmp(x,"0100011001")==0){
strcpy(y,"00100010111010000000111");
}
else if(strcmp(x,"0100011010")==0){
strcpy(y,"00100010101110010010010");
}
else if(strcmp(x,"0100011011")==0){
strcpy(y,"00100010100010100101001");
}
else if(strcmp(x,"0100011100")==0){
strcpy(y,"00100010010110111001010");
}
else if(strcmp(x,"0100011101")==0){
strcpy(y,"00100010001011001111000");
}
else if(strcmp(x,"0100011110")==0){
strcpy(y,"00100001111111100110000");
}
else if(strcmp(x,"0100011111")==0){
strcpy(y,"00100001110011111110100");
}
else if(strcmp(x,"0100100000")==0){
strcpy(y,"00100001101000011000011");
}
else if(strcmp(x,"0100100001")==0){
strcpy(y,"00100001011100110011100");
}
else if(strcmp(x,"0100100010")==0){
strcpy(y,"00100001010001010000001");
}
else if(strcmp(x,"0100100011")==0){
strcpy(y,"00100001000101101110010");
}
else if(strcmp(x,"0100100100")==0){
strcpy(y,"00100000111010001101101");
}
else if(strcmp(x,"0100100101")==0){
strcpy(y,"00100000101110101110011");
}
else if(strcmp(x,"0100100110")==0){
strcpy(y,"00100000100011010000100");
}
else if(strcmp(x,"0100100111")==0){
strcpy(y,"00100000010111110100000");
}
else if(strcmp(x,"0100101000")==0){
strcpy(y,"00100000001100011000110");
}
else if(strcmp(x,"0100101001")==0){
strcpy(y,"00100000000000111111000");
}
else if(strcmp(x,"0100101010")==0){
strcpy(y,"00011111110101100110101");
}
else if(strcmp(x,"0100101011")==0){
strcpy(y,"00011111101010001111100");
}
else if(strcmp(x,"0100101100")==0){
strcpy(y,"00011111011110111001110");
}
else if(strcmp(x,"0100101101")==0){
strcpy(y,"00011111010011100101010");
}
else if(strcmp(x,"0100101110")==0){
strcpy(y,"00011111001000010010010");
}
else if(strcmp(x,"0100101111")==0){
strcpy(y,"00011110111101000000100");
}
else if(strcmp(x,"0100110000")==0){
strcpy(y,"00011110110001110000001");
}
else if(strcmp(x,"0100110001")==0){
strcpy(y,"00011110100110100001000");
}
else if(strcmp(x,"0100110010")==0){
strcpy(y,"00011110011011010011010");
}
else if(strcmp(x,"0100110011")==0){
strcpy(y,"00011110010000000110110");
}
else if(strcmp(x,"0100110100")==0){
strcpy(y,"00011110000100111011101");
}
else if(strcmp(x,"0100110101")==0){
strcpy(y,"00011101111001110001110");
}
else if(strcmp(x,"0100110110")==0){
strcpy(y,"00011101101110101001010");
}
else if(strcmp(x,"0100110111")==0){
strcpy(y,"00011101100011100010000");
}
else if(strcmp(x,"0100111000")==0){
strcpy(y,"00011101011000011100000");
}
else if(strcmp(x,"0100111001")==0){
strcpy(y,"00011101001101010111011");
}
else if(strcmp(x,"0100111010")==0){
strcpy(y,"00011101000010010100000");
}
else if(strcmp(x,"0100111011")==0){
strcpy(y,"00011100110111010001111");
}
else if(strcmp(x,"0100111100")==0){
strcpy(y,"00011100101100010001001");
}
else if(strcmp(x,"0100111101")==0){
strcpy(y,"00011100100001010001101");
}
else if(strcmp(x,"0100111110")==0){
strcpy(y,"00011100010110010011011");
}
else if(strcmp(x,"0100111111")==0){
strcpy(y,"00011100001011010110011");
}
else if(strcmp(x,"0101000000")==0){
strcpy(y,"00011100000000011010101");
}
else if(strcmp(x,"0101000001")==0){
strcpy(y,"00011011110101100000001");
}
else if(strcmp(x,"0101000010")==0){
strcpy(y,"00011011101010100111000");
}
else if(strcmp(x,"0101000011")==0){
strcpy(y,"00011011011111101111000");
}
else if(strcmp(x,"0101000100")==0){
strcpy(y,"00011011010100111000010");
}
else if(strcmp(x,"0101000101")==0){
strcpy(y,"00011011001010000010111");
}
else if(strcmp(x,"0101000110")==0){
strcpy(y,"00011010111111001110101");
}
else if(strcmp(x,"0101000111")==0){
strcpy(y,"00011010110100011011101");
}
else if(strcmp(x,"0101001000")==0){
strcpy(y,"00011010101001101001111");
}
else if(strcmp(x,"0101001001")==0){
strcpy(y,"00011010011110111001011");
}
else if(strcmp(x,"0101001010")==0){
strcpy(y,"00011010010100001010001");
}
else if(strcmp(x,"0101001011")==0){
strcpy(y,"00011010001001011100000");
}
else if(strcmp(x,"0101001100")==0){
strcpy(y,"00011001111110101111001");
}
else if(strcmp(x,"0101001101")==0){
strcpy(y,"00011001110100000011100");
}
else if(strcmp(x,"0101001110")==0){
strcpy(y,"00011001101001011001001");
}
else if(strcmp(x,"0101001111")==0){
strcpy(y,"00011001011110101111111");
}
else if(strcmp(x,"0101010000")==0){
strcpy(y,"00011001010100000111111");
}
else if(strcmp(x,"0101010001")==0){
strcpy(y,"00011001001001100001001");
}
else if(strcmp(x,"0101010010")==0){
strcpy(y,"00011000111110111011100");
}
else if(strcmp(x,"0101010011")==0){
strcpy(y,"00011000110100010111001");
}
else if(strcmp(x,"0101010100")==0){
strcpy(y,"00011000101001110011111");
}
else if(strcmp(x,"0101010101")==0){
strcpy(y,"00011000011111010001111");
}
else if(strcmp(x,"0101010110")==0){
strcpy(y,"00011000010100110001000");
}
else if(strcmp(x,"0101010111")==0){
strcpy(y,"00011000001010010001011");
}
else if(strcmp(x,"0101011000")==0){
strcpy(y,"00010111111111110010111");
}
else if(strcmp(x,"0101011001")==0){
strcpy(y,"00010111110101010101101");
}
else if(strcmp(x,"0101011010")==0){
strcpy(y,"00010111101010111001011");
}
else if(strcmp(x,"0101011011")==0){
strcpy(y,"00010111100000011110100");
}
else if(strcmp(x,"0101011100")==0){
strcpy(y,"00010111010110000100101");
}
else if(strcmp(x,"0101011101")==0){
strcpy(y,"00010111001011101100000");
}
else if(strcmp(x,"0101011110")==0){
strcpy(y,"00010111000001010100100");
}
else if(strcmp(x,"0101011111")==0){
strcpy(y,"00010110110110111110001");
}
else if(strcmp(x,"0101100000")==0){
strcpy(y,"00010110101100101001000");
}
else if(strcmp(x,"0101100001")==0){
strcpy(y,"00010110100010010100111");
}
else if(strcmp(x,"0101100010")==0){
strcpy(y,"00010110011000000010000");
}
else if(strcmp(x,"0101100011")==0){
strcpy(y,"00010110001101110000010");
}
else if(strcmp(x,"0101100100")==0){
strcpy(y,"00010110000011011111101");
}
else if(strcmp(x,"0101100101")==0){
strcpy(y,"00010101111001010000001");
}
else if(strcmp(x,"0101100110")==0){
strcpy(y,"00010101101111000001110");
}
else if(strcmp(x,"0101100111")==0){
strcpy(y,"00010101100100110100100");
}
else if(strcmp(x,"0101101000")==0){
strcpy(y,"00010101011010101000100");
}
else if(strcmp(x,"0101101001")==0){
strcpy(y,"00010101010000011101100");
}
else if(strcmp(x,"0101101010")==0){
strcpy(y,"00010101000110010011101");
}
else if(strcmp(x,"0101101011")==0){
strcpy(y,"00010100111100001010111");
}
else if(strcmp(x,"0101101100")==0){
strcpy(y,"00010100110010000011010");
}
else if(strcmp(x,"0101101101")==0){
strcpy(y,"00010100100111111100101");
}
else if(strcmp(x,"0101101110")==0){
strcpy(y,"00010100011101110111010");
}
else if(strcmp(x,"0101101111")==0){
strcpy(y,"00010100010011110010111");
}
else if(strcmp(x,"0101110000")==0){
strcpy(y,"00010100001001101111101");
}
else if(strcmp(x,"0101110001")==0){
strcpy(y,"00010011111111101101100");
}
else if(strcmp(x,"0101110010")==0){
strcpy(y,"00010011110101101100100");
}
else if(strcmp(x,"0101110011")==0){
strcpy(y,"00010011101011101100100");
}
else if(strcmp(x,"0101110100")==0){
strcpy(y,"00010011100001101101101");
}
else if(strcmp(x,"0101110101")==0){
strcpy(y,"00010011010111101111111");
}
else if(strcmp(x,"0101110110")==0){
strcpy(y,"00010011001101110011010");
}
else if(strcmp(x,"0101110111")==0){
strcpy(y,"00010011000011110111101");
}
else if(strcmp(x,"0101111000")==0){
strcpy(y,"00010010111001111101000");
}
else if(strcmp(x,"0101111001")==0){
strcpy(y,"00010010110000000011100");
}
else if(strcmp(x,"0101111010")==0){
strcpy(y,"00010010100110001011001");
}
else if(strcmp(x,"0101111011")==0){
strcpy(y,"00010010011100010011110");
}
else if(strcmp(x,"0101111100")==0){
strcpy(y,"00010010010010011101100");
}
else if(strcmp(x,"0101111101")==0){
strcpy(y,"00010010001000101000010");
}
else if(strcmp(x,"0101111110")==0){
strcpy(y,"00010001111110110100001");
}
else if(strcmp(x,"0101111111")==0){
strcpy(y,"00010001110101000001000");
}
else if(strcmp(x,"0110000000")==0){
strcpy(y,"00010001101011001110111");
}
else if(strcmp(x,"0110000001")==0){
strcpy(y,"00010001100001011101111");
}
else if(strcmp(x,"0110000010")==0){
strcpy(y,"00010001010111101101111");
}
else if(strcmp(x,"0110000011")==0){
strcpy(y,"00010001001101111111000");
}
else if(strcmp(x,"0110000100")==0){
strcpy(y,"00010001000100010001001");
}
else if(strcmp(x,"0110000101")==0){
strcpy(y,"00010000111010100100010");
}
else if(strcmp(x,"0110000110")==0){
strcpy(y,"00010000110000111000011");
}
else if(strcmp(x,"0110000111")==0){
strcpy(y,"00010000100111001101101");
}
else if(strcmp(x,"0110001000")==0){
strcpy(y,"00010000011101100011110");
}
else if(strcmp(x,"0110001001")==0){
strcpy(y,"00010000010011111011000");
}
else if(strcmp(x,"0110001010")==0){
strcpy(y,"00010000001010010011011");
}
else if(strcmp(x,"0110001011")==0){
strcpy(y,"00010000000000101100101");
}
else if(strcmp(x,"0110001100")==0){
strcpy(y,"00001111110111000110111");
}
else if(strcmp(x,"0110001101")==0){
strcpy(y,"00001111101101100010010");
}
else if(strcmp(x,"0110001110")==0){
strcpy(y,"00001111100011111110101");
}
else if(strcmp(x,"0110001111")==0){
strcpy(y,"00001111011010011011111");
}
else if(strcmp(x,"0110010000")==0){
strcpy(y,"00001111010000111010010");
}
else if(strcmp(x,"0110010001")==0){
strcpy(y,"00001111000111011001101");
}
else if(strcmp(x,"0110010010")==0){
strcpy(y,"00001110111101111010000");
}
else if(strcmp(x,"0110010011")==0){
strcpy(y,"00001110110100011011010");
}
else if(strcmp(x,"0110010100")==0){
strcpy(y,"00001110101010111101101");
}
else if(strcmp(x,"0110010101")==0){
strcpy(y,"00001110100001100001000");
}
else if(strcmp(x,"0110010110")==0){
strcpy(y,"00001110011000000101010");
}
else if(strcmp(x,"0110010111")==0){
strcpy(y,"00001110001110101010101");
}
else if(strcmp(x,"0110011000")==0){
strcpy(y,"00001110000101010000111");
}
else if(strcmp(x,"0110011001")==0){
strcpy(y,"00001101111011111000001");
}
else if(strcmp(x,"0110011010")==0){
strcpy(y,"00001101110010100000011");
}
else if(strcmp(x,"0110011011")==0){
strcpy(y,"00001101101001001001101");
}
else if(strcmp(x,"0110011100")==0){
strcpy(y,"00001101011111110011110");
}
else if(strcmp(x,"0110011101")==0){
strcpy(y,"00001101010110011110111");
}
else if(strcmp(x,"0110011110")==0){
strcpy(y,"00001101001101001011000");
}
else if(strcmp(x,"0110011111")==0){
strcpy(y,"00001101000011111000001");
}
else if(strcmp(x,"0110100000")==0){
strcpy(y,"00001100111010100110010");
}
else if(strcmp(x,"0110100001")==0){
strcpy(y,"00001100110001010101010");
}
else if(strcmp(x,"0110100010")==0){
strcpy(y,"00001100101000000101001");
}
else if(strcmp(x,"0110100011")==0){
strcpy(y,"00001100011110110110001");
}
else if(strcmp(x,"0110100100")==0){
strcpy(y,"00001100010101101000000");
}
else if(strcmp(x,"0110100101")==0){
strcpy(y,"00001100001100011010110");
}
else if(strcmp(x,"0110100110")==0){
strcpy(y,"00001100000011001110100");
}
else if(strcmp(x,"0110100111")==0){
strcpy(y,"00001011111010000011010");
}
else if(strcmp(x,"0110101000")==0){
strcpy(y,"00001011110000111000111");
}
else if(strcmp(x,"0110101001")==0){
strcpy(y,"00001011100111101111100");
}
else if(strcmp(x,"0110101010")==0){
strcpy(y,"00001011011110100111000");
}
else if(strcmp(x,"0110101011")==0){
strcpy(y,"00001011010101011111100");
}
else if(strcmp(x,"0110101100")==0){
strcpy(y,"00001011001100011000111");
}
else if(strcmp(x,"0110101101")==0){
strcpy(y,"00001011000011010011010");
}
else if(strcmp(x,"0110101110")==0){
strcpy(y,"00001010111010001110100");
}
else if(strcmp(x,"0110101111")==0){
strcpy(y,"00001010110001001010101");
}
else if(strcmp(x,"0110110000")==0){
strcpy(y,"00001010101000000111110");
}
else if(strcmp(x,"0110110001")==0){
strcpy(y,"00001010011111000101110");
}
else if(strcmp(x,"0110110010")==0){
strcpy(y,"00001010010110000100101");
}
else if(strcmp(x,"0110110011")==0){
strcpy(y,"00001010001101000100100");
}
else if(strcmp(x,"0110110100")==0){
strcpy(y,"00001010000100000101010");
}
else if(strcmp(x,"0110110101")==0){
strcpy(y,"00001001111011000111000");
}
else if(strcmp(x,"0110110110")==0){
strcpy(y,"00001001110010001001100");
}
else if(strcmp(x,"0110110111")==0){
strcpy(y,"00001001101001001101000");
}
else if(strcmp(x,"0110111000")==0){
strcpy(y,"00001001100000010001011");
}
else if(strcmp(x,"0110111001")==0){
strcpy(y,"00001001010111010110101");
}
else if(strcmp(x,"0110111010")==0){
strcpy(y,"00001001001110011100111");
}
else if(strcmp(x,"0110111011")==0){
strcpy(y,"00001001000101100011111");
}
else if(strcmp(x,"0110111100")==0){
strcpy(y,"00001000111100101011111");
}
else if(strcmp(x,"0110111101")==0){
strcpy(y,"00001000110011110100110");
}
else if(strcmp(x,"0110111110")==0){
strcpy(y,"00001000101010111110100");
}
else if(strcmp(x,"0110111111")==0){
strcpy(y,"00001000100010001001001");
}
else if(strcmp(x,"0111000000")==0){
strcpy(y,"00001000011001010100101");
}
else if(strcmp(x,"0111000001")==0){
strcpy(y,"00001000010000100001000");
}
else if(strcmp(x,"0111000010")==0){
strcpy(y,"00001000000111101110010");
}
else if(strcmp(x,"0111000011")==0){
strcpy(y,"00000111111110111100100");
}
else if(strcmp(x,"0111000100")==0){
strcpy(y,"00000111110110001011100");
}
else if(strcmp(x,"0111000101")==0){
strcpy(y,"00000111101101011011011");
}
else if(strcmp(x,"0111000110")==0){
strcpy(y,"00000111100100101100001");
}
else if(strcmp(x,"0111000111")==0){
strcpy(y,"00000111011011111101110");
}
else if(strcmp(x,"0111001000")==0){
strcpy(y,"00000111010011010000010");
}
else if(strcmp(x,"0111001001")==0){
strcpy(y,"00000111001010100011101");
}
else if(strcmp(x,"0111001010")==0){
strcpy(y,"00000111000001110111111");
}
else if(strcmp(x,"0111001011")==0){
strcpy(y,"00000110111001001101000");
}
else if(strcmp(x,"0111001100")==0){
strcpy(y,"00000110110000100010111");
}
else if(strcmp(x,"0111001101")==0){
strcpy(y,"00000110100111111001110");
}
else if(strcmp(x,"0111001110")==0){
strcpy(y,"00000110011111010001011");
}
else if(strcmp(x,"0111001111")==0){
strcpy(y,"00000110010110101001111");
}
else if(strcmp(x,"0111010000")==0){
strcpy(y,"00000110001110000011010");
}
else if(strcmp(x,"0111010001")==0){
strcpy(y,"00000110000101011101011");
}
else if(strcmp(x,"0111010010")==0){
strcpy(y,"00000101111100111000011");
}
else if(strcmp(x,"0111010011")==0){
strcpy(y,"00000101110100010100010");
}
else if(strcmp(x,"0111010100")==0){
strcpy(y,"00000101101011110001000");
}
else if(strcmp(x,"0111010101")==0){
strcpy(y,"00000101100011001110101");
}
else if(strcmp(x,"0111010110")==0){
strcpy(y,"00000101011010101101000");
}
else if(strcmp(x,"0111010111")==0){
strcpy(y,"00000101010010001100001");
}
else if(strcmp(x,"0111011000")==0){
strcpy(y,"00000101001001101100010");
}
else if(strcmp(x,"0111011001")==0){
strcpy(y,"00000101000001001101001");
}
else if(strcmp(x,"0111011010")==0){
strcpy(y,"00000100111000101110110");
}
else if(strcmp(x,"0111011011")==0){
strcpy(y,"00000100110000010001011");
}
else if(strcmp(x,"0111011100")==0){
strcpy(y,"00000100100111110100110");
}
else if(strcmp(x,"0111011101")==0){
strcpy(y,"00000100011111011000111");
}
else if(strcmp(x,"0111011110")==0){
strcpy(y,"00000100010110111101111");
}
else if(strcmp(x,"0111011111")==0){
strcpy(y,"00000100001110100011101");
}
else if(strcmp(x,"0111100000")==0){
strcpy(y,"00000100000110001010010");
}
else if(strcmp(x,"0111100001")==0){
strcpy(y,"00000011111101110001110");
}
else if(strcmp(x,"0111100010")==0){
strcpy(y,"00000011110101011010000");
}
else if(strcmp(x,"0111100011")==0){
strcpy(y,"00000011101101000011000");
}
else if(strcmp(x,"0111100100")==0){
strcpy(y,"00000011100100101100111");
}
else if(strcmp(x,"0111100101")==0){
strcpy(y,"00000011011100010111100");
}
else if(strcmp(x,"0111100110")==0){
strcpy(y,"00000011010100000011000");
}
else if(strcmp(x,"0111100111")==0){
strcpy(y,"00000011001011101111010");
}
else if(strcmp(x,"0111101000")==0){
strcpy(y,"00000011000011011100010");
}
else if(strcmp(x,"0111101001")==0){
strcpy(y,"00000010111011001010001");
}
else if(strcmp(x,"0111101010")==0){
strcpy(y,"00000010110010111000110");
}
else if(strcmp(x,"0111101011")==0){
strcpy(y,"00000010101010101000010");
}
else if(strcmp(x,"0111101100")==0){
strcpy(y,"00000010100010011000100");
}
else if(strcmp(x,"0111101101")==0){
strcpy(y,"00000010011010001001100");
}
else if(strcmp(x,"0111101110")==0){
strcpy(y,"00000010010001111011010");
}
else if(strcmp(x,"0111101111")==0){
strcpy(y,"00000010001001101101111");
}
else if(strcmp(x,"0111110000")==0){
strcpy(y,"00000010000001100001010");
}
else if(strcmp(x,"0111110001")==0){
strcpy(y,"00000001111001010101011");
}
else if(strcmp(x,"0111110010")==0){
strcpy(y,"00000001110001001010011");
}
else if(strcmp(x,"0111110011")==0){
strcpy(y,"00000001101001000000000");
}
else if(strcmp(x,"0111110100")==0){
strcpy(y,"00000001100000110110100");
}
else if(strcmp(x,"0111110101")==0){
strcpy(y,"00000001011000101101110");
}
else if(strcmp(x,"0111110110")==0){
strcpy(y,"00000001010000100101110");
}
else if(strcmp(x,"0111110111")==0){
strcpy(y,"00000001001000011110101");
}
else if(strcmp(x,"0111111000")==0){
strcpy(y,"00000001000000011000001");
}
else if(strcmp(x,"0111111001")==0){
strcpy(y,"00000000111000010010100");
}
else if(strcmp(x,"0111111010")==0){
strcpy(y,"00000000110000001101101");
}
else if(strcmp(x,"0111111011")==0){
strcpy(y,"00000000101000001001011");
}
else if(strcmp(x,"0111111100")==0){
strcpy(y,"00000000100000000110000");
}
else if(strcmp(x,"0111111101")==0){
strcpy(y,"00000000011000000011011");
}
else if(strcmp(x,"0111111110")==0){
strcpy(y,"00000000010000000001100");
}
else if(strcmp(x,"0111111111")==0){
strcpy(y,"00000000001000000000011");
}
else if(strcmp(x,"1000000000")==0){
strcpy(y,"00000000000000000000000");
}
else if(strcmp(x,"1000000001")==0){
strcpy(y,"11111111100000000011000");
}
else if(strcmp(x,"1000000010")==0){
strcpy(y,"11111111000000001100000");
}
else if(strcmp(x,"1000000011")==0){
strcpy(y,"11111110100000011010111");
}
else if(strcmp(x,"1000000100")==0){
strcpy(y,"11111110000000101111110");
}
else if(strcmp(x,"1000000101")==0){
strcpy(y,"11111101100001001010011");
}
else if(strcmp(x,"1000000110")==0){
strcpy(y,"11111101000001101011000");
}
else if(strcmp(x,"1000000111")==0){
strcpy(y,"11111100100010010001011");
}
else if(strcmp(x,"1000001000")==0){
strcpy(y,"11111100000010111101100");
}
else if(strcmp(x,"1000001001")==0){
strcpy(y,"11111011100011101111100");
}
else if(strcmp(x,"1000001010")==0){
strcpy(y,"11111011000100100111010");
}
else if(strcmp(x,"1000001011")==0){
strcpy(y,"11111010100101100100101");
}
else if(strcmp(x,"1000001100")==0){
strcpy(y,"11111010000110100111110");
}
else if(strcmp(x,"1000001101")==0){
strcpy(y,"11111001100111110000100");
}
else if(strcmp(x,"1000001110")==0){
strcpy(y,"11111001001000111110111");
}
else if(strcmp(x,"1000001111")==0){
strcpy(y,"11111000101010010010111");
}
else if(strcmp(x,"1000010000")==0){
strcpy(y,"11111000001011101100100");
}
else if(strcmp(x,"1000010001")==0){
strcpy(y,"11110111101101001011101");
}
else if(strcmp(x,"1000010010")==0){
strcpy(y,"11110111001110110000011");
}
else if(strcmp(x,"1000010011")==0){
strcpy(y,"11110110110000011010100");
}
else if(strcmp(x,"1000010100")==0){
strcpy(y,"11110110010010001010010");
}
else if(strcmp(x,"1000010101")==0){
strcpy(y,"11110101110011111111011");
}
else if(strcmp(x,"1000010110")==0){
strcpy(y,"11110101010101111001111");
}
else if(strcmp(x,"1000010111")==0){
strcpy(y,"11110100110111111001111");
}
else if(strcmp(x,"1000011000")==0){
strcpy(y,"11110100011001111111001");
}
else if(strcmp(x,"1000011001")==0){
strcpy(y,"11110011111100001001111");
}
else if(strcmp(x,"1000011010")==0){
strcpy(y,"11110011011110011001111");
}
else if(strcmp(x,"1000011011")==0){
strcpy(y,"11110011000000101111001");
}
else if(strcmp(x,"1000011100")==0){
strcpy(y,"11110010100011001001110");
}
else if(strcmp(x,"1000011101")==0){
strcpy(y,"11110010000101101001100");
}
else if(strcmp(x,"1000011110")==0){
strcpy(y,"11110001101000001110101");
}
else if(strcmp(x,"1000011111")==0){
strcpy(y,"11110001001010111000111");
}
else if(strcmp(x,"1000100000")==0){
strcpy(y,"11110000101101101000010");
}
else if(strcmp(x,"1000100001")==0){
strcpy(y,"11110000010000011100111");
}
else if(strcmp(x,"1000100010")==0){
strcpy(y,"11101111110011010110101");
}
else if(strcmp(x,"1000100011")==0){
strcpy(y,"11101111010110010101100");
}
else if(strcmp(x,"1000100100")==0){
strcpy(y,"11101110111001011001011");
}
else if(strcmp(x,"1000100101")==0){
strcpy(y,"11101110011100100010011");
}
else if(strcmp(x,"1000100110")==0){
strcpy(y,"11101101111111110000011");
}
else if(strcmp(x,"1000100111")==0){
strcpy(y,"11101101100011000011011");
}
else if(strcmp(x,"1000101000")==0){
strcpy(y,"11101101000110011011100");
}
else if(strcmp(x,"1000101001")==0){
strcpy(y,"11101100101001111000100");
}
else if(strcmp(x,"1000101010")==0){
strcpy(y,"11101100001101011010011");
}
else if(strcmp(x,"1000101011")==0){
strcpy(y,"11101011110001000001010");
}
else if(strcmp(x,"1000101100")==0){
strcpy(y,"11101011010100101101001");
}
else if(strcmp(x,"1000101101")==0){
strcpy(y,"11101010111000011101110");
}
else if(strcmp(x,"1000101110")==0){
strcpy(y,"11101010011100010011010");
}
else if(strcmp(x,"1000101111")==0){
strcpy(y,"11101010000000001101101");
}
else if(strcmp(x,"1000110000")==0){
strcpy(y,"11101001100100001100111");
}
else if(strcmp(x,"1000110001")==0){
strcpy(y,"11101001001000010000111");
}
else if(strcmp(x,"1000110010")==0){
strcpy(y,"11101000101100011001101");
}
else if(strcmp(x,"1000110011")==0){
strcpy(y,"11101000010000100111001");
}
else if(strcmp(x,"1000110100")==0){
strcpy(y,"11100111110100111001011");
}
else if(strcmp(x,"1000110101")==0){
strcpy(y,"11100111011001010000010");
}
else if(strcmp(x,"1000110110")==0){
strcpy(y,"11100110111101101100000");
}
else if(strcmp(x,"1000110111")==0){
strcpy(y,"11100110100010001100010");
}
else if(strcmp(x,"1000111000")==0){
strcpy(y,"11100110000110110001010");
}
else if(strcmp(x,"1000111001")==0){
strcpy(y,"11100101101011011010111");
}
else if(strcmp(x,"1000111010")==0){
strcpy(y,"11100101010000001001000");
}
else if(strcmp(x,"1000111011")==0){
strcpy(y,"11100100110100111011110");
}
else if(strcmp(x,"1000111100")==0){
strcpy(y,"11100100011001110011001");
}
else if(strcmp(x,"1000111101")==0){
strcpy(y,"11100011111110101111001");
}
else if(strcmp(x,"1000111110")==0){
strcpy(y,"11100011100011101111100");
}
else if(strcmp(x,"1000111111")==0){
strcpy(y,"11100011001000110100011");
}
else if(strcmp(x,"1001000000")==0){
strcpy(y,"11100010101101111101111");
}
else if(strcmp(x,"1001000001")==0){
strcpy(y,"11100010010011001011110");
}
else if(strcmp(x,"1001000010")==0){
strcpy(y,"11100001111000011110001");
}
else if(strcmp(x,"1001000011")==0){
strcpy(y,"11100001011101110100111");
}
else if(strcmp(x,"1001000100")==0){
strcpy(y,"11100001000011010000001");
}
else if(strcmp(x,"1001000101")==0){
strcpy(y,"11100000101000101111101");
}
else if(strcmp(x,"1001000110")==0){
strcpy(y,"11100000001110010011101");
}
else if(strcmp(x,"1001000111")==0){
strcpy(y,"11011111110011111100000");
}
else if(strcmp(x,"1001001000")==0){
strcpy(y,"11011111011001101000101");
}
else if(strcmp(x,"1001001001")==0){
strcpy(y,"11011110111111011001101");
}
else if(strcmp(x,"1001001010")==0){
strcpy(y,"11011110100101001110111");
}
else if(strcmp(x,"1001001011")==0){
strcpy(y,"11011110001011001000011");
}
else if(strcmp(x,"1001001100")==0){
strcpy(y,"11011101110001000110010");
}
else if(strcmp(x,"1001001101")==0){
strcpy(y,"11011101010111001000010");
}
else if(strcmp(x,"1001001110")==0){
strcpy(y,"11011100111101001110100");
}
else if(strcmp(x,"1001001111")==0){
strcpy(y,"11011100100011011001000");
}
else if(strcmp(x,"1001010000")==0){
strcpy(y,"11011100001001100111110");
}
else if(strcmp(x,"1001010001")==0){
strcpy(y,"11011011101111111010101");
}
else if(strcmp(x,"1001010010")==0){
strcpy(y,"11011011010110010001101");
}
else if(strcmp(x,"1001010011")==0){
strcpy(y,"11011010111100101100110");
}
else if(strcmp(x,"1001010100")==0){
strcpy(y,"11011010100011001100000");
}
else if(strcmp(x,"1001010101")==0){
strcpy(y,"11011010001001101111100");
}
else if(strcmp(x,"1001010110")==0){
strcpy(y,"11011001110000010110111");
}
else if(strcmp(x,"1001010111")==0){
strcpy(y,"11011001010111000010100");
}
else if(strcmp(x,"1001011000")==0){
strcpy(y,"11011000111101110010000");
}
else if(strcmp(x,"1001011001")==0){
strcpy(y,"11011000100100100101101");
}
else if(strcmp(x,"1001011010")==0){
strcpy(y,"11011000001011011101010");
}
else if(strcmp(x,"1001011011")==0){
strcpy(y,"11010111110010011001000");
}
else if(strcmp(x,"1001011100")==0){
strcpy(y,"11010111011001011000101");
}
else if(strcmp(x,"1001011101")==0){
strcpy(y,"11010111000000011100010");
}
else if(strcmp(x,"1001011110")==0){
strcpy(y,"11010110100111100011110");
}
else if(strcmp(x,"1001011111")==0){
strcpy(y,"11010110001110101111010");
}
else if(strcmp(x,"1001100000")==0){
strcpy(y,"11010101110101111110101");
}
else if(strcmp(x,"1001100001")==0){
strcpy(y,"11010101011101010010000");
}
else if(strcmp(x,"1001100010")==0){
strcpy(y,"11010101000100101001001");
}
else if(strcmp(x,"1001100011")==0){
strcpy(y,"11010100101100000100010");
}
else if(strcmp(x,"1001100100")==0){
strcpy(y,"11010100010011100011010");
}
else if(strcmp(x,"1001100101")==0){
strcpy(y,"11010011111011000110000");
}
else if(strcmp(x,"1001100110")==0){
strcpy(y,"11010011100010101100101");
}
else if(strcmp(x,"1001100111")==0){
strcpy(y,"11010011001010010111000");
}
else if(strcmp(x,"1001101000")==0){
strcpy(y,"11010010110010000101010");
}
else if(strcmp(x,"1001101001")==0){
strcpy(y,"11010010011001110111010");
}
else if(strcmp(x,"1001101010")==0){
strcpy(y,"11010010000001101101000");
}
else if(strcmp(x,"1001101011")==0){
strcpy(y,"11010001101001100110100");
}
else if(strcmp(x,"1001101100")==0){
strcpy(y,"11010001010001100011101");
}
else if(strcmp(x,"1001101101")==0){
strcpy(y,"11010000111001100100101");
}
else if(strcmp(x,"1001101110")==0){
strcpy(y,"11010000100001101001010");
}
else if(strcmp(x,"1001101111")==0){
strcpy(y,"11010000001001110001101");
}
else if(strcmp(x,"1001110000")==0){
strcpy(y,"11001111110001111101101");
}
else if(strcmp(x,"1001110001")==0){
strcpy(y,"11001111011010001101010");
}
else if(strcmp(x,"1001110010")==0){
strcpy(y,"11001111000010100000101");
}
else if(strcmp(x,"1001110011")==0){
strcpy(y,"11001110101010110111101");
}
else if(strcmp(x,"1001110100")==0){
strcpy(y,"11001110010011010010001");
}
else if(strcmp(x,"1001110101")==0){
strcpy(y,"11001101111011110000010");
}
else if(strcmp(x,"1001110110")==0){
strcpy(y,"11001101100100010010001");
}
else if(strcmp(x,"1001110111")==0){
strcpy(y,"11001101001100110111011");
}
else if(strcmp(x,"1001111000")==0){
strcpy(y,"11001100110101100000010");
}
else if(strcmp(x,"1001111001")==0){
strcpy(y,"11001100011110001100110");
}
else if(strcmp(x,"1001111010")==0){
strcpy(y,"11001100000110111100101");
}
else if(strcmp(x,"1001111011")==0){
strcpy(y,"11001011101111110000001");
}
else if(strcmp(x,"1001111100")==0){
strcpy(y,"11001011011000100111001");
}
else if(strcmp(x,"1001111101")==0){
strcpy(y,"11001011000001100001101");
}
else if(strcmp(x,"1001111110")==0){
strcpy(y,"11001010101010011111100");
}
else if(strcmp(x,"1001111111")==0){
strcpy(y,"11001010010011100000111");
}
else if(strcmp(x,"1010000000")==0){
strcpy(y,"11001001111100100101110");
}
else if(strcmp(x,"1010000001")==0){
strcpy(y,"11001001100101101110000");
}
else if(strcmp(x,"1010000010")==0){
strcpy(y,"11001001001110111001110");
}
else if(strcmp(x,"1010000011")==0){
strcpy(y,"11001000111000001000111");
}
else if(strcmp(x,"1010000100")==0){
strcpy(y,"11001000100001011011011");
}
else if(strcmp(x,"1010000101")==0){
strcpy(y,"11001000001010110001010");
}
else if(strcmp(x,"1010000110")==0){
strcpy(y,"11000111110100001010100");
}
else if(strcmp(x,"1010000111")==0){
strcpy(y,"11000111011101100111001");
}
else if(strcmp(x,"1010001000")==0){
strcpy(y,"11000111000111000111001");
}
else if(strcmp(x,"1010001001")==0){
strcpy(y,"11000110110000101010011");
}
else if(strcmp(x,"1010001010")==0){
strcpy(y,"11000110011010010001000");
}
else if(strcmp(x,"1010001011")==0){
strcpy(y,"11000110000011111010111");
}
else if(strcmp(x,"1010001100")==0){
strcpy(y,"11000101101101101000001");
}
else if(strcmp(x,"1010001101")==0){
strcpy(y,"11000101010111011000101");
}
else if(strcmp(x,"1010001110")==0){
strcpy(y,"11000101000001001100011");
}
else if(strcmp(x,"1010001111")==0){
strcpy(y,"11000100101011000011011");
}
else if(strcmp(x,"1010010000")==0){
strcpy(y,"11000100010100111101101");
}
else if(strcmp(x,"1010010001")==0){
strcpy(y,"11000011111110111011000");
}
else if(strcmp(x,"1010010010")==0){
strcpy(y,"11000011101000111011110");
}
else if(strcmp(x,"1010010011")==0){
strcpy(y,"11000011010010111111101");
}
else if(strcmp(x,"1010010100")==0){
strcpy(y,"11000010111101000110110");
}
else if(strcmp(x,"1010010101")==0){
strcpy(y,"11000010100111010001000");
}
else if(strcmp(x,"1010010110")==0){
strcpy(y,"11000010010001011110011");
}
else if(strcmp(x,"1010010111")==0){
strcpy(y,"11000001111011101111000");
}
else if(strcmp(x,"1010011000")==0){
strcpy(y,"11000001100110000010110");
}
else if(strcmp(x,"1010011001")==0){
strcpy(y,"11000001010000011001100");
}
else if(strcmp(x,"1010011010")==0){
strcpy(y,"11000000111010110011100");
}
else if(strcmp(x,"1010011011")==0){
strcpy(y,"11000000100101010000101");
}
else if(strcmp(x,"1010011100")==0){
strcpy(y,"11000000001111110000111");
}
else if(strcmp(x,"1010011101")==0){
strcpy(y,"10111111111010010100001");
}
else if(strcmp(x,"1010011110")==0){
strcpy(y,"10111111100100111010100");
}
else if(strcmp(x,"1010011111")==0){
strcpy(y,"10111111001111100011111");
}
else if(strcmp(x,"1010100000")==0){
strcpy(y,"10111110111010010000011");
}
else if(strcmp(x,"1010100001")==0){
strcpy(y,"10111110100100111111111");
}
else if(strcmp(x,"1010100010")==0){
strcpy(y,"10111110001111110010011");
}
else if(strcmp(x,"1010100011")==0){
strcpy(y,"10111101111010100111111");
}
else if(strcmp(x,"1010100100")==0){
strcpy(y,"10111101100101100000100");
}
else if(strcmp(x,"1010100101")==0){
strcpy(y,"10111101010000011100000");
}
else if(strcmp(x,"1010100110")==0){
strcpy(y,"10111100111011011010101");
}
else if(strcmp(x,"1010100111")==0){
strcpy(y,"10111100100110011100001");
}
else if(strcmp(x,"1010101000")==0){
strcpy(y,"10111100010001100000101");
}
else if(strcmp(x,"1010101001")==0){
strcpy(y,"10111011111100101000000");
}
else if(strcmp(x,"1010101010")==0){
strcpy(y,"10111011100111110010011");
}
else if(strcmp(x,"1010101011")==0){
strcpy(y,"10111011010010111111101");
}
else if(strcmp(x,"1010101100")==0){
strcpy(y,"10111010111110001111111");
}
else if(strcmp(x,"1010101101")==0){
strcpy(y,"10111010101001100011000");
}
else if(strcmp(x,"1010101110")==0){
strcpy(y,"10111010010100111001000");
}
else if(strcmp(x,"1010101111")==0){
strcpy(y,"10111010000000010010000");
}
else if(strcmp(x,"1010110000")==0){
strcpy(y,"10111001101011101101110");
}
else if(strcmp(x,"1010110001")==0){
strcpy(y,"10111001010111001100011");
}
else if(strcmp(x,"1010110010")==0){
strcpy(y,"10111001000010101101111");
}
else if(strcmp(x,"1010110011")==0){
strcpy(y,"10111000101110010010010");
}
else if(strcmp(x,"1010110100")==0){
strcpy(y,"10111000011001111001100");
}
else if(strcmp(x,"1010110101")==0){
strcpy(y,"10111000000101100011100");
}
else if(strcmp(x,"1010110110")==0){
strcpy(y,"10110111110001010000010");
}
else if(strcmp(x,"1010110111")==0){
strcpy(y,"10110111011100111111111");
}
else if(strcmp(x,"1010111000")==0){
strcpy(y,"10110111001000110010011");
}
else if(strcmp(x,"1010111001")==0){
strcpy(y,"10110110110100100111101");
}
else if(strcmp(x,"1010111010")==0){
strcpy(y,"10110110100000011111101");
}
else if(strcmp(x,"1010111011")==0){
strcpy(y,"10110110001100011010011");
}
else if(strcmp(x,"1010111100")==0){
strcpy(y,"10110101111000010111111");
}
else if(strcmp(x,"1010111101")==0){
strcpy(y,"10110101100100011000001");
}
else if(strcmp(x,"1010111110")==0){
strcpy(y,"10110101010000011011001");
}
else if(strcmp(x,"1010111111")==0){
strcpy(y,"10110100111100100000110");
}
else if(strcmp(x,"1011000000")==0){
strcpy(y,"10110100101000101001010");
}
else if(strcmp(x,"1011000001")==0){
strcpy(y,"10110100010100110100011");
}
else if(strcmp(x,"1011000010")==0){
strcpy(y,"10110100000001000010010");
}
else if(strcmp(x,"1011000011")==0){
strcpy(y,"10110011101101010010110");
}
else if(strcmp(x,"1011000100")==0){
strcpy(y,"10110011011001100110000");
}
else if(strcmp(x,"1011000101")==0){
strcpy(y,"10110011000101111011110");
}
else if(strcmp(x,"1011000110")==0){
strcpy(y,"10110010110010010100011");
}
else if(strcmp(x,"1011000111")==0){
strcpy(y,"10110010011110101111100");
}
else if(strcmp(x,"1011001000")==0){
strcpy(y,"10110010001011001101011");
}
else if(strcmp(x,"1011001001")==0){
strcpy(y,"10110001110111101101110");
}
else if(strcmp(x,"1011001010")==0){
strcpy(y,"10110001100100010000111");
}
else if(strcmp(x,"1011001011")==0){
strcpy(y,"10110001010000110110100");
}
else if(strcmp(x,"1011001100")==0){
strcpy(y,"10110000111101011110111");
}
else if(strcmp(x,"1011001101")==0){
strcpy(y,"10110000101010001001110");
}
else if(strcmp(x,"1011001110")==0){
strcpy(y,"10110000010110110111010");
}
else if(strcmp(x,"1011001111")==0){
strcpy(y,"10110000000011100111010");
}
else if(strcmp(x,"1011010000")==0){
strcpy(y,"10101111110000011001111");
}
else if(strcmp(x,"1011010001")==0){
strcpy(y,"10101111011101001111000");
}
else if(strcmp(x,"1011010010")==0){
strcpy(y,"10101111001010000110110");
}
else if(strcmp(x,"1011010011")==0){
strcpy(y,"10101110110111000001000");
}
else if(strcmp(x,"1011010100")==0){
strcpy(y,"10101110100011111101110");
}
else if(strcmp(x,"1011010101")==0){
strcpy(y,"10101110010000111101001");
}
else if(strcmp(x,"1011010110")==0){
strcpy(y,"10101101111101111111000");
}
else if(strcmp(x,"1011010111")==0){
strcpy(y,"10101101101011000011010");
}
else if(strcmp(x,"1011011000")==0){
strcpy(y,"10101101011000001010001");
}
else if(strcmp(x,"1011011001")==0){
strcpy(y,"10101101000101010011011");
}
else if(strcmp(x,"1011011010")==0){
strcpy(y,"10101100110010011111010");
}
else if(strcmp(x,"1011011011")==0){
strcpy(y,"10101100011111101101100");
}
else if(strcmp(x,"1011011100")==0){
strcpy(y,"10101100001100111110010");
}
else if(strcmp(x,"1011011101")==0){
strcpy(y,"10101011111010010001100");
}
else if(strcmp(x,"1011011110")==0){
strcpy(y,"10101011100111100111001");
}
else if(strcmp(x,"1011011111")==0){
strcpy(y,"10101011010100111111001");
}
else if(strcmp(x,"1011100000")==0){
strcpy(y,"10101011000010011001101");
}
else if(strcmp(x,"1011100001")==0){
strcpy(y,"10101010101111110110101");
}
else if(strcmp(x,"1011100010")==0){
strcpy(y,"10101010011101010110000");
}
else if(strcmp(x,"1011100011")==0){
strcpy(y,"10101010001010110111110");
}
else if(strcmp(x,"1011100100")==0){
strcpy(y,"10101001111000011011111");
}
else if(strcmp(x,"1011100101")==0){
strcpy(y,"10101001100110000010011");
}
else if(strcmp(x,"1011100110")==0){
strcpy(y,"10101001010011101011010");
}
else if(strcmp(x,"1011100111")==0){
strcpy(y,"10101001000001010110101");
}
else if(strcmp(x,"1011101000")==0){
strcpy(y,"10101000101111000100010");
}
else if(strcmp(x,"1011101001")==0){
strcpy(y,"10101000011100110100010");
}
else if(strcmp(x,"1011101010")==0){
strcpy(y,"10101000001010100110101");
}
else if(strcmp(x,"1011101011")==0){
strcpy(y,"10100111111000011011011");
}
else if(strcmp(x,"1011101100")==0){
strcpy(y,"10100111100110010010011");
}
else if(strcmp(x,"1011101101")==0){
strcpy(y,"10100111010100001011110");
}
else if(strcmp(x,"1011101110")==0){
strcpy(y,"10100111000010000111011");
}
else if(strcmp(x,"1011101111")==0){
strcpy(y,"10100110110000000101011");
}
else if(strcmp(x,"1011110000")==0){
strcpy(y,"10100110011110000101110");
}
else if(strcmp(x,"1011110001")==0){
strcpy(y,"10100110001100001000010");
}
else if(strcmp(x,"1011110010")==0){
strcpy(y,"10100101111010001101001");
}
else if(strcmp(x,"1011110011")==0){
strcpy(y,"10100101101000010100011");
}
else if(strcmp(x,"1011110100")==0){
strcpy(y,"10100101010110011101110");
}
else if(strcmp(x,"1011110101")==0){
strcpy(y,"10100101000100101001100");
}
else if(strcmp(x,"1011110110")==0){
strcpy(y,"10100100110010110111011");
}
else if(strcmp(x,"1011110111")==0){
strcpy(y,"10100100100001000111101");
}
else if(strcmp(x,"1011111000")==0){
strcpy(y,"10100100001111011010000");
}
else if(strcmp(x,"1011111001")==0){
strcpy(y,"10100011111101101110110");
}
else if(strcmp(x,"1011111010")==0){
strcpy(y,"10100011101100000101101");
}
else if(strcmp(x,"1011111011")==0){
strcpy(y,"10100011011010011110110");
}
else if(strcmp(x,"1011111100")==0){
strcpy(y,"10100011001000111010001");
}
else if(strcmp(x,"1011111101")==0){
strcpy(y,"10100010110111010111101");
}
else if(strcmp(x,"1011111110")==0){
strcpy(y,"10100010100101110111011");
}
else if(strcmp(x,"1011111111")==0){
strcpy(y,"10100010010100011001011");
}
else if(strcmp(x,"1100000000")==0){
strcpy(y,"10100010000010111101100");
}
else if(strcmp(x,"1100000001")==0){
strcpy(y,"10100001110001100011110");
}
else if(strcmp(x,"1100000010")==0){
strcpy(y,"10100001100000001100010");
}
else if(strcmp(x,"1100000011")==0){
strcpy(y,"10100001001110110110111");
}
else if(strcmp(x,"1100000100")==0){
strcpy(y,"10100000111101100011101");
}
else if(strcmp(x,"1100000101")==0){
strcpy(y,"10100000101100010010100");
}
else if(strcmp(x,"1100000110")==0){
strcpy(y,"10100000011011000011101");
}
else if(strcmp(x,"1100000111")==0){
strcpy(y,"10100000001001110110111");
}
else if(strcmp(x,"1100001000")==0){
strcpy(y,"10011111111000101100010");
}
else if(strcmp(x,"1100001001")==0){
strcpy(y,"10011111100111100011101");
}
else if(strcmp(x,"1100001010")==0){
strcpy(y,"10011111010110011101010");
}
else if(strcmp(x,"1100001011")==0){
strcpy(y,"10011111000101011000111");
}
else if(strcmp(x,"1100001100")==0){
strcpy(y,"10011110110100010110110");
}
else if(strcmp(x,"1100001101")==0){
strcpy(y,"10011110100011010110101");
}
else if(strcmp(x,"1100001110")==0){
strcpy(y,"10011110010010011000101");
}
else if(strcmp(x,"1100001111")==0){
strcpy(y,"10011110000001011100101");
}
else if(strcmp(x,"1100010000")==0){
strcpy(y,"10011101110000100010110");
}
else if(strcmp(x,"1100010001")==0){
strcpy(y,"10011101011111101011000");
}
else if(strcmp(x,"1100010010")==0){
strcpy(y,"10011101001110110101010");
}
else if(strcmp(x,"1100010011")==0){
strcpy(y,"10011100111110000001100");
}
else if(strcmp(x,"1100010100")==0){
strcpy(y,"10011100101101001111111");
}
else if(strcmp(x,"1100010101")==0){
strcpy(y,"10011100011100100000010");
}
else if(strcmp(x,"1100010110")==0){
strcpy(y,"10011100001011110010110");
}
else if(strcmp(x,"1100010111")==0){
strcpy(y,"10011011111011000111001");
}
else if(strcmp(x,"1100011000")==0){
strcpy(y,"10011011101010011101101");
}
else if(strcmp(x,"1100011001")==0){
strcpy(y,"10011011011001110110001");
}
else if(strcmp(x,"1100011010")==0){
strcpy(y,"10011011001001010000101");
}
else if(strcmp(x,"1100011011")==0){
strcpy(y,"10011010111000101101001");
}
else if(strcmp(x,"1100011100")==0){
strcpy(y,"10011010101000001011110");
}
else if(strcmp(x,"1100011101")==0){
strcpy(y,"10011010010111101100010");
}
else if(strcmp(x,"1100011110")==0){
strcpy(y,"10011010000111001110110");
}
else if(strcmp(x,"1100011111")==0){
strcpy(y,"10011001110110110011001");
}
else if(strcmp(x,"1100100000")==0){
strcpy(y,"10011001100110011001101");
}
else if(strcmp(x,"1100100001")==0){
strcpy(y,"10011001010110000010000");
}
else if(strcmp(x,"1100100010")==0){
strcpy(y,"10011001000101101100011");
}
else if(strcmp(x,"1100100011")==0){
strcpy(y,"10011000110101011000110");
}
else if(strcmp(x,"1100100100")==0){
strcpy(y,"10011000100101000111000");
}
else if(strcmp(x,"1100100101")==0){
strcpy(y,"10011000010100110111001");
}
else if(strcmp(x,"1100100110")==0){
strcpy(y,"10011000000100101001011");
}
else if(strcmp(x,"1100100111")==0){
strcpy(y,"10010111110100011101011");
}
else if(strcmp(x,"1100101000")==0){
strcpy(y,"10010111100100010011011");
}
else if(strcmp(x,"1100101001")==0){
strcpy(y,"10010111010100001011010");
}
else if(strcmp(x,"1100101010")==0){
strcpy(y,"10010111000100000101001");
}
else if(strcmp(x,"1100101011")==0){
strcpy(y,"10010110110100000000111");
}
else if(strcmp(x,"1100101100")==0){
strcpy(y,"10010110100011111110100");
}
else if(strcmp(x,"1100101101")==0){
strcpy(y,"10010110010011111110000");
}
else if(strcmp(x,"1100101110")==0){
strcpy(y,"10010110000011111111100");
}
else if(strcmp(x,"1100101111")==0){
strcpy(y,"10010101110100000010110");
}
else if(strcmp(x,"1100110000")==0){
strcpy(y,"10010101100100000111111");
}
else if(strcmp(x,"1100110001")==0){
strcpy(y,"10010101010100001111000");
}
else if(strcmp(x,"1100110010")==0){
strcpy(y,"10010101000100010111111");
}
else if(strcmp(x,"1100110011")==0){
strcpy(y,"10010100110100100010101");
}
else if(strcmp(x,"1100110100")==0){
strcpy(y,"10010100100100101111010");
}
else if(strcmp(x,"1100110101")==0){
strcpy(y,"10010100010100111101110");
}
else if(strcmp(x,"1100110110")==0){
strcpy(y,"10010100000101001110001");
}
else if(strcmp(x,"1100110111")==0){
strcpy(y,"10010011110101100000010");
}
else if(strcmp(x,"1100111000")==0){
strcpy(y,"10010011100101110100010");
}
else if(strcmp(x,"1100111001")==0){
strcpy(y,"10010011010110001010000");
}
else if(strcmp(x,"1100111010")==0){
strcpy(y,"10010011000110100001101");
}
else if(strcmp(x,"1100111011")==0){
strcpy(y,"10010010110110111011001");
}
else if(strcmp(x,"1100111100")==0){
strcpy(y,"10010010100111010110011");
}
else if(strcmp(x,"1100111101")==0){
strcpy(y,"10010010010111110011011");
}
else if(strcmp(x,"1100111110")==0){
strcpy(y,"10010010001000010010010");
}
else if(strcmp(x,"1100111111")==0){
strcpy(y,"10010001111000110011000");
}
else if(strcmp(x,"1101000000")==0){
strcpy(y,"10010001101001010101011");
}
else if(strcmp(x,"1101000001")==0){
strcpy(y,"10010001011001111001101");
}
else if(strcmp(x,"1101000010")==0){
strcpy(y,"10010001001010011111101");
}
else if(strcmp(x,"1101000011")==0){
strcpy(y,"10010000111011000111011");
}
else if(strcmp(x,"1101000100")==0){
strcpy(y,"10010000101011110000111");
}
else if(strcmp(x,"1101000101")==0){
strcpy(y,"10010000011100011100010");
}
else if(strcmp(x,"1101000110")==0){
strcpy(y,"10010000001101001001010");
}
else if(strcmp(x,"1101000111")==0){
strcpy(y,"10001111111101111000001");
}
else if(strcmp(x,"1101001000")==0){
strcpy(y,"10001111101110101000101");
}
else if(strcmp(x,"1101001001")==0){
strcpy(y,"10001111011111011010111");
}
else if(strcmp(x,"1101001010")==0){
strcpy(y,"10001111010000001111000");
}
else if(strcmp(x,"1101001011")==0){
strcpy(y,"10001111000001000100110");
}
else if(strcmp(x,"1101001100")==0){
strcpy(y,"10001110110001111100010");
}
else if(strcmp(x,"1101001101")==0){
strcpy(y,"10001110100010110101011");
}
else if(strcmp(x,"1101001110")==0){
strcpy(y,"10001110010011110000011");
}
else if(strcmp(x,"1101001111")==0){
strcpy(y,"10001110000100101101000");
}
else if(strcmp(x,"1101010000")==0){
strcpy(y,"10001101110101101011010");
}
else if(strcmp(x,"1101010001")==0){
strcpy(y,"10001101100110101011010");
}
else if(strcmp(x,"1101010010")==0){
strcpy(y,"10001101010111101101000");
}
else if(strcmp(x,"1101010011")==0){
strcpy(y,"10001101001000110000100");
}
else if(strcmp(x,"1101010100")==0){
strcpy(y,"10001100111001110101100");
}
else if(strcmp(x,"1101010101")==0){
strcpy(y,"10001100101010111100011");
}
else if(strcmp(x,"1101010110")==0){
strcpy(y,"10001100011100000100110");
}
else if(strcmp(x,"1101010111")==0){
strcpy(y,"10001100001101001110111");
}
else if(strcmp(x,"1101011000")==0){
strcpy(y,"10001011111110011010110");
}
else if(strcmp(x,"1101011001")==0){
strcpy(y,"10001011101111101000001");
}
else if(strcmp(x,"1101011010")==0){
strcpy(y,"10001011100000110111010");
}
else if(strcmp(x,"1101011011")==0){
strcpy(y,"10001011010010001000000");
}
else if(strcmp(x,"1101011100")==0){
strcpy(y,"10001011000011011010011");
}
else if(strcmp(x,"1101011101")==0){
strcpy(y,"10001010110100101110100");
}
else if(strcmp(x,"1101011110")==0){
strcpy(y,"10001010100110000100001");
}
else if(strcmp(x,"1101011111")==0){
strcpy(y,"10001010010111011011011");
}
else if(strcmp(x,"1101100000")==0){
strcpy(y,"10001010001000110100011");
}
else if(strcmp(x,"1101100001")==0){
strcpy(y,"10001001111010001110111");
}
else if(strcmp(x,"1101100010")==0){
strcpy(y,"10001001101011101011001");
}
else if(strcmp(x,"1101100011")==0){
strcpy(y,"10001001011101001000111");
}
else if(strcmp(x,"1101100100")==0){
strcpy(y,"10001001001110101000010");
}
else if(strcmp(x,"1101100101")==0){
strcpy(y,"10001001000000001001010");
}
else if(strcmp(x,"1101100110")==0){
strcpy(y,"10001000110001101011111");
}
else if(strcmp(x,"1101100111")==0){
strcpy(y,"10001000100011010000001");
}
else if(strcmp(x,"1101101000")==0){
strcpy(y,"10001000010100110101111");
}
else if(strcmp(x,"1101101001")==0){
strcpy(y,"10001000000110011101010");
}
else if(strcmp(x,"1101101010")==0){
strcpy(y,"10000111111000000110001");
}
else if(strcmp(x,"1101101011")==0){
strcpy(y,"10000111101001110000101");
}
else if(strcmp(x,"1101101100")==0){
strcpy(y,"10000111011011011100110");
}
else if(strcmp(x,"1101101101")==0){
strcpy(y,"10000111001101001010100");
}
else if(strcmp(x,"1101101110")==0){
strcpy(y,"10000110111110111001101");
}
else if(strcmp(x,"1101101111")==0){
strcpy(y,"10000110110000101010100");
}
else if(strcmp(x,"1101110000")==0){
strcpy(y,"10000110100010011100110");
}
else if(strcmp(x,"1101110001")==0){
strcpy(y,"10000110010100010000101");
}
else if(strcmp(x,"1101110010")==0){
strcpy(y,"10000110000110000110001");
}
else if(strcmp(x,"1101110011")==0){
strcpy(y,"10000101110111111101001");
}
else if(strcmp(x,"1101110100")==0){
strcpy(y,"10000101101001110101101");
}
else if(strcmp(x,"1101110101")==0){
strcpy(y,"10000101011011101111101");
}
else if(strcmp(x,"1101110110")==0){
strcpy(y,"10000101001101101011001");
}
else if(strcmp(x,"1101110111")==0){
strcpy(y,"10000100111111101000010");
}
else if(strcmp(x,"1101111000")==0){
strcpy(y,"10000100110001100110111");
}
else if(strcmp(x,"1101111001")==0){
strcpy(y,"10000100100011100111000");
}
else if(strcmp(x,"1101111010")==0){
strcpy(y,"10000100010101101000101");
}
else if(strcmp(x,"1101111011")==0){
strcpy(y,"10000100000111101011110");
}
else if(strcmp(x,"1101111100")==0){
strcpy(y,"10000011111001110000011");
}
else if(strcmp(x,"1101111101")==0){
strcpy(y,"10000011101011110110100");
}
else if(strcmp(x,"1101111110")==0){
strcpy(y,"10000011011101111110001");
}
else if(strcmp(x,"1101111111")==0){
strcpy(y,"10000011010000000111010");
}
else if(strcmp(x,"1110000000")==0){
strcpy(y,"10000011000010010001111");
}
else if(strcmp(x,"1110000001")==0){
strcpy(y,"10000010110100011110000");
}
else if(strcmp(x,"1110000010")==0){
strcpy(y,"10000010100110101011100");
}
else if(strcmp(x,"1110000011")==0){
strcpy(y,"10000010011000111010101");
}
else if(strcmp(x,"1110000100")==0){
strcpy(y,"10000010001011001011001");
}
else if(strcmp(x,"1110000101")==0){
strcpy(y,"10000001111101011101001");
}
else if(strcmp(x,"1110000110")==0){
strcpy(y,"10000001101111110000100");
}
else if(strcmp(x,"1110000111")==0){
strcpy(y,"10000001100010000101011");
}
else if(strcmp(x,"1110001000")==0){
strcpy(y,"10000001010100011011110");
}
else if(strcmp(x,"1110001001")==0){
strcpy(y,"10000001000110110011100");
}
else if(strcmp(x,"1110001010")==0){
strcpy(y,"10000000111001001100110");
}
else if(strcmp(x,"1110001011")==0){
strcpy(y,"10000000101011100111011");
}
else if(strcmp(x,"1110001100")==0){
strcpy(y,"10000000011110000011100");
}
else if(strcmp(x,"1110001101")==0){
strcpy(y,"10000000010000100001001");
}
else if(strcmp(x,"1110001110")==0){
strcpy(y,"10000000000011000000000");
}
else if(strcmp(x,"1110001111")==0){
strcpy(y,"01111111110101100000011");
}
else if(strcmp(x,"1110010000")==0){
strcpy(y,"01111111101000000010010");
}
else if(strcmp(x,"1110010001")==0){
strcpy(y,"01111111011010100101100");
}
else if(strcmp(x,"1110010010")==0){
strcpy(y,"01111111001101001010001");
}
else if(strcmp(x,"1110010011")==0){
strcpy(y,"01111110111111110000001");
}
else if(strcmp(x,"1110010100")==0){
strcpy(y,"01111110110010010111101");
}
else if(strcmp(x,"1110010101")==0){
strcpy(y,"01111110100101000000100");
}
else if(strcmp(x,"1110010110")==0){
strcpy(y,"01111110010111101010110");
}
else if(strcmp(x,"1110010111")==0){
strcpy(y,"01111110001010010110011");
}
else if(strcmp(x,"1110011000")==0){
strcpy(y,"01111101111101000011100");
}
else if(strcmp(x,"1110011001")==0){
strcpy(y,"01111101101111110001111");
}
else if(strcmp(x,"1110011010")==0){
strcpy(y,"01111101100010100001110");
}
else if(strcmp(x,"1110011011")==0){
strcpy(y,"01111101010101010010111");
}
else if(strcmp(x,"1110011100")==0){
strcpy(y,"01111101001000000101100");
}
else if(strcmp(x,"1110011101")==0){
strcpy(y,"01111100111010111001011");
}
else if(strcmp(x,"1110011110")==0){
strcpy(y,"01111100101101101110110");
}
else if(strcmp(x,"1110011111")==0){
strcpy(y,"01111100100000100101011");
}
else if(strcmp(x,"1110100000")==0){
strcpy(y,"01111100010011011101011");
}
else if(strcmp(x,"1110100001")==0){
strcpy(y,"01111100000110010110110");
}
else if(strcmp(x,"1110100010")==0){
strcpy(y,"01111011111001010001100");
}
else if(strcmp(x,"1110100011")==0){
strcpy(y,"01111011101100001101101");
}
else if(strcmp(x,"1110100100")==0){
strcpy(y,"01111011011111001011000");
}
else if(strcmp(x,"1110100101")==0){
strcpy(y,"01111011010010001001111");
}
else if(strcmp(x,"1110100110")==0){
strcpy(y,"01111011000101001001111");
}
else if(strcmp(x,"1110100111")==0){
strcpy(y,"01111010111000001011011");
}
else if(strcmp(x,"1110101000")==0){
strcpy(y,"01111010101011001110001");
}
else if(strcmp(x,"1110101001")==0){
strcpy(y,"01111010011110010010010");
}
else if(strcmp(x,"1110101010")==0){
strcpy(y,"01111010010001010111110");
}
else if(strcmp(x,"1110101011")==0){
strcpy(y,"01111010000100011110100");
}
else if(strcmp(x,"1110101100")==0){
strcpy(y,"01111001110111100110100");
}
else if(strcmp(x,"1110101101")==0){
strcpy(y,"01111001101010101111111");
}
else if(strcmp(x,"1110101110")==0){
strcpy(y,"01111001011101111010101");
}
else if(strcmp(x,"1110101111")==0){
strcpy(y,"01111001010001000110101");
}
else if(strcmp(x,"1110110000")==0){
strcpy(y,"01111001000100010011111");
}
else if(strcmp(x,"1110110001")==0){
strcpy(y,"01111000110111100010100");
}
else if(strcmp(x,"1110110010")==0){
strcpy(y,"01111000101010110010011");
}
else if(strcmp(x,"1110110011")==0){
strcpy(y,"01111000011110000011101");
}
else if(strcmp(x,"1110110100")==0){
strcpy(y,"01111000010001010110001");
}
else if(strcmp(x,"1110110101")==0){
strcpy(y,"01111000000100101001111");
}
else if(strcmp(x,"1110110110")==0){
strcpy(y,"01110111110111111110111");
}
else if(strcmp(x,"1110110111")==0){
strcpy(y,"01110111101011010101010");
}
else if(strcmp(x,"1110111000")==0){
strcpy(y,"01110111011110101100111");
}
else if(strcmp(x,"1110111001")==0){
strcpy(y,"01110111010010000101110");
}
else if(strcmp(x,"1110111010")==0){
strcpy(y,"01110111000101011111111");
}
else if(strcmp(x,"1110111011")==0){
strcpy(y,"01110110111000111011011");
}
else if(strcmp(x,"1110111100")==0){
strcpy(y,"01110110101100011000000");
}
else if(strcmp(x,"1110111101")==0){
strcpy(y,"01110110011111110101111");
}
else if(strcmp(x,"1110111110")==0){
strcpy(y,"01110110010011010101001");
}
else if(strcmp(x,"1110111111")==0){
strcpy(y,"01110110000110110101101");
}
else if(strcmp(x,"1111000000")==0){
strcpy(y,"01110101111010010111010");
}
else if(strcmp(x,"1111000001")==0){
strcpy(y,"01110101101101111010010");
}
else if(strcmp(x,"1111000010")==0){
strcpy(y,"01110101100001011110011");
}
else if(strcmp(x,"1111000011")==0){
strcpy(y,"01110101010101000011111");
}
else if(strcmp(x,"1111000100")==0){
strcpy(y,"01110101001000101010100");
}
else if(strcmp(x,"1111000101")==0){
strcpy(y,"01110100111100010010011");
}
else if(strcmp(x,"1111000110")==0){
strcpy(y,"01110100101111111011100");
}
else if(strcmp(x,"1111000111")==0){
strcpy(y,"01110100100011100101111");
}
else if(strcmp(x,"1111001000")==0){
strcpy(y,"01110100010111010001100");
}
else if(strcmp(x,"1111001001")==0){
strcpy(y,"01110100001010111110010");
}
else if(strcmp(x,"1111001010")==0){
strcpy(y,"01110011111110101100010");
}
else if(strcmp(x,"1111001011")==0){
strcpy(y,"01110011110010011011100");
}
else if(strcmp(x,"1111001100")==0){
strcpy(y,"01110011100110001100000");
}
else if(strcmp(x,"1111001101")==0){
strcpy(y,"01110011011001111101101");
}
else if(strcmp(x,"1111001110")==0){
strcpy(y,"01110011001101110000100");
}
else if(strcmp(x,"1111001111")==0){
strcpy(y,"01110011000001100100100");
}
else if(strcmp(x,"1111010000")==0){
strcpy(y,"01110010110101011001110");
}
else if(strcmp(x,"1111010001")==0){
strcpy(y,"01110010101001010000010");
}
else if(strcmp(x,"1111010010")==0){
strcpy(y,"01110010011101000111111");
}
else if(strcmp(x,"1111010011")==0){
strcpy(y,"01110010010001000000110");
}
else if(strcmp(x,"1111010100")==0){
strcpy(y,"01110010000100111010110");
}
else if(strcmp(x,"1111010101")==0){
strcpy(y,"01110001111000110101111");
}
else if(strcmp(x,"1111010110")==0){
strcpy(y,"01110001101100110010011");
}
else if(strcmp(x,"1111010111")==0){
strcpy(y,"01110001100000101111111");
}
else if(strcmp(x,"1111011000")==0){
strcpy(y,"01110001010100101110101");
}
else if(strcmp(x,"1111011001")==0){
strcpy(y,"01110001001000101110100");
}
else if(strcmp(x,"1111011010")==0){
strcpy(y,"01110000111100101111101");
}
else if(strcmp(x,"1111011011")==0){
strcpy(y,"01110000110000110001111");
}
else if(strcmp(x,"1111011100")==0){
strcpy(y,"01110000100100110101010");
}
else if(strcmp(x,"1111011101")==0){
strcpy(y,"01110000011000111001111");
}
else if(strcmp(x,"1111011110")==0){
strcpy(y,"01110000001100111111101");
}
else if(strcmp(x,"1111011111")==0){
strcpy(y,"01110000000001000110100");
}
else if(strcmp(x,"1111100000")==0){
strcpy(y,"01101111110101001110100");
}
else if(strcmp(x,"1111100001")==0){
strcpy(y,"01101111101001010111101");
}
else if(strcmp(x,"1111100010")==0){
strcpy(y,"01101111011101100010000");
}
else if(strcmp(x,"1111100011")==0){
strcpy(y,"01101111010001101101100");
}
else if(strcmp(x,"1111100100")==0){
strcpy(y,"01101111000101111010000");
}
else if(strcmp(x,"1111100101")==0){
strcpy(y,"01101110111010000111110");
}
else if(strcmp(x,"1111100110")==0){
strcpy(y,"01101110101110010110101");
}
else if(strcmp(x,"1111100111")==0){
strcpy(y,"01101110100010100110101");
}
else if(strcmp(x,"1111101000")==0){
strcpy(y,"01101110010110110111111");
}
else if(strcmp(x,"1111101001")==0){
strcpy(y,"01101110001011001010001");
}
else if(strcmp(x,"1111101010")==0){
strcpy(y,"01101101111111011101100");
}
else if(strcmp(x,"1111101011")==0){
strcpy(y,"01101101110011110010000");
}
else if(strcmp(x,"1111101100")==0){
strcpy(y,"01101101101000000111101");
}
else if(strcmp(x,"1111101101")==0){
strcpy(y,"01101101011100011110011");
}
else if(strcmp(x,"1111101110")==0){
strcpy(y,"01101101010000110110001");
}
else if(strcmp(x,"1111101111")==0){
strcpy(y,"01101101000101001111001");
}
else if(strcmp(x,"1111110000")==0){
strcpy(y,"01101100111001101001010");
}
else if(strcmp(x,"1111110001")==0){
strcpy(y,"01101100101110000100011");
}
else if(strcmp(x,"1111110010")==0){
strcpy(y,"01101100100010100000101");
}
else if(strcmp(x,"1111110011")==0){
strcpy(y,"01101100010110111110000");
}
else if(strcmp(x,"1111110100")==0){
strcpy(y,"01101100001011011100100");
}
else if(strcmp(x,"1111110101")==0){
strcpy(y,"01101011111111111100000");
}
else if(strcmp(x,"1111110110")==0){
strcpy(y,"01101011110100011100101");
}
else if(strcmp(x,"1111110111")==0){
strcpy(y,"01101011101000111110011");
}
else if(strcmp(x,"1111111000")==0){
strcpy(y,"01101011011101100001001");
}
else if(strcmp(x,"1111111001")==0){
strcpy(y,"01101011010010000101001");
}
else if(strcmp(x,"1111111010")==0){
strcpy(y,"01101011000110101010000");
}
else if(strcmp(x,"1111111011")==0){
strcpy(y,"01101010111011010000001");
}
else if(strcmp(x,"1111111100")==0){
strcpy(y,"01101010101111110111010");
}
else if(strcmp(x,"1111111101")==0){
strcpy(y,"01101010100100011111011");
}
else if(strcmp(x,"1111111110")==0){
strcpy(y,"01101010011001001000101");
}
else if(strcmp(x,"1111111111")==0){
strcpy(y,"01101010001101110011000");
}



}

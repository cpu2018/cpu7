#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ins.h"
#include <errno.h>
#include <unistd.h>
#include <signal.h>
#define R 32
#define M 500000

union IntAndFloat {
  int ival;
  float fval;
};

typedef struct cpu{
  int  memory[M];
  char reg[32][R+1];
  char freg[32][R+1];
  char lr[R+1];
  char cr[8][5];
  char cor[R+1];
  char s[R+1];
} CPU;

void init_cpu(CPU *cpu);/*cpuの0初期か*/
void read_memory(CPU *cpu,int *memory);/*cpuのメモリーにコピー*/
void exec(CPU *cpu,FILE *file2,FILE *file3);/*命令の実行*/
void i_to_b(char *g,int i_g,int b);/*iをbビットのgに変換。符号あり*/
void i_to_b_long(char *g,long i_g,int b);/*long版*/
void inc(char *s,int len);/*インクリメント*/
int pow2(int n,int m);/*nのm乗*/
unsigned int pow2_u(int n,int m);
long pow2_long(long n,int m);/*nのm乗*/
unsigned long pow2_long_u(long n,int m);
int change_char_int(char x);
void hanten(char *g,char *s,int b);/*bビットの文字列の反転sをgに反転*/
unsigned int b_to_ui(char *s,int b,int e);/*sのbビットからsビットを符号なしの整数に変換 以前と変更*/
unsigned long b_to_ulong(char *s,int b,int e);/*以前と変更*/
int b_to_i(char *s,int b,int e);/*符号あり 32bit*/
void r_shift(char *g,char *s,int x,int b);
void zero_count(char *g,char *s,int bg,int sg);
int or(char *s,int b,int e);
int andx(char *s,int b,int e);
void fpu_or(char *ans,char *so,int x,int y);
long b_to_long(char *s,int b,int e);



void fpu_fadd(char x1[33],char x2[33],char ans[33],char ovf[2]){
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

  char m1a[26] = "01";
  char m2a[26] = "01";
  strcat(m1a,m1);
  strcat(m2a,m2);

  char e2ai[9]={'\0'};
  hanten(e2ai,e2,8);/*e2のbit反転をe2aiに入れる。8はbit数*/

  char te9[10]={'\0'};
  int i_e1 = b_to_i(e1,0,7);/*8bitを整数に*/
  int i_e2ai = b_to_i(e2ai,0,7);
  int i_te9 = i_e1+i_e2ai;
  i_to_b(te9,i_te9,9);/*整数を9bitに変換*/

  char tde[9]={'\0'};
  char tde_sub1[10]={'\0'};
  char tde_sub2[10]={'\0'};
  int i_tde_sub1 = i_te9 + 1;
  i_to_b(tde_sub1,i_tde_sub1,9);
  hanten(tde_sub2,te9,9);
  if(te9[0]=='1'){
    strncpy(tde,tde_sub1+1,8);
  }
  else{
    strncpy(tde,tde_sub2+1,8);
  }

  char de5[6]={'\0'};
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

  char ms[26]={'\0'};
  char mi[26]={'\0'};
  char es[9]={'\0'};
  char ei[9]={'\0'};
  char ss[2]={'\0'};
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

  char mie[57]={'\0'};
  strcpy(mie,mi);
  for(int i=0;i<31;i++){
    mie[25+i]='0';
  }

  char mia[57]={'\0'};
  int i_de5 = b_to_i(de5,0,5);
  r_shift(mia,mie,i_de5,56);/*56bitのmieをi_de5だけ右に論理シフト*/
  
  char tstck[2]={'\0'};
  int or_mia = or(mia,27,55);/*miaの28bitから0bitのor*/
  if(or_mia==1){
    tstck[0]='1';
  }
  else{
    tstck[0]='0';
  }

  char mye[28]={'\0'};
  if(s1[0]==s2[0]){
    char mye_sub[28]={'\0'};
    strcpy(mye_sub,ms);
    strcat(mye_sub,"00");
    int i_mye_sub = b_to_i(mye_sub,0,26);
    int i_mye_sub2 = b_to_i(mia,0,26);
    int i_mye = i_mye_sub + i_mye_sub2;
    i_to_b(mye,i_mye,27);
  }
  else{
     char mye_sub[28]={'\0'};
    strcpy(mye_sub,ms);
    strcat(mye_sub,"00");
    int i_mye_sub = b_to_i(mye_sub,0,26);
    int i_mye_sub2 = b_to_i(mia,0,26);
    int i_mye = i_mye_sub - i_mye_sub2;
    i_to_b(mye,i_mye,27);
  }

  char esi[9]={'\0'};
  int i_es = b_to_i(es,0,7);
  int i_esi = i_es + 1;
  i_to_b(esi,i_esi,8);
  
  char eyd[9]={'\0'};
  char myd[28]={'\0'};
  char stck[2]={'\0'};
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


  char se[6]={'\0'};
  zero_count(se,myd,5,27);/*mydの25bitから数えて0の出てくる位置を5bitにする*/

  char eyf[10]={'\0'};
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


  char eyr[9]={'\0'};
  char myf[28]={'\0'};
  //int i_se = b_to_i(se,0,4);
  r_shift(myf,myd,i_se,27);
  strncpy(eyr,eyf+1,8);


  char myr[26]={'\0'};
  int i_myr = b_to_i(myf,0,24);
  if(((myf[25]=='1')&&(myf[26]=='1')&&(stck[0]=='0')&&(myf[24]=='1'))||((myf[25]=='1')&&(myf[26]=='0')&&(s1[0]==s2[0])&&(stck[0]==1))||((myf[25]=='1')&&(myf[26]=='1'))){
    i_myr+=1;
    i_to_b(myr,i_myr,27);
  }
  else{
    i_to_b(myr,i_myr,27);
  }


  char ey[9]={'\0'};
  char my[24]={'\0'};
  int i_ey=b_to_i(eyr,0,7);
  if(myr[0]=='1'){
    i_ey+=1;
  }
  i_to_b(ey,i_ey,8);
  strncpy(my,myr+4,23);

  char sy[2]={'\0'};
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

  char ovf_sub_exception[2]={'\0'};
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
  char nx2[33]={'\0'};
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

  int i_s1 = b_to_i(s1,0,0);
  int i_s2 = b_to_i(s2,0,0);
  int i_e1 = b_to_i(e1,0,7);
  int i_e2 = b_to_i(e2,0,7);
  

  char s[2]={'\0'};
  char e_sub[10]={'\0'};
  //char e_subsub[10]={'\0'};
  char e_subsubsub[10]={'\0'};
  char e[9]={'\0'};
  char m1_sub[25]="1";
  char m2_sub[25]="1";
  char m_sub[49]={'\0'};
  char m[24]={'\0'};
  char m_subsub[24]={'\0'};

  int i_s = i_s1 * i_s2;
  i_to_b(s,i_s,1);
  strcat(m1_sub,m1);
  strcat(m2_sub,m2);
  int i_m1_sub = b_to_i(m1_sub,0,23);
  int i_m2_sub = b_to_i(m2_sub,0,23);
  long i_m_sub = (long) i_m1_sub * (long) i_m2_sub;
  i_to_b_long(m_sub,i_m_sub,48);
  //printf("%d %d\n",i_m1_sub,i_m2_sub);
  //printf("sub %s\n",m_sub);
  if(m_sub[0]=='1'){
    printf("aaa\n");
    strncpy(m_subsub,m_sub+1,23);
  }
  else{
    strncpy(m_subsub,m_sub+2,23);
  }
  int i_e_sub = i_e1 + i_e2;
  //printf("%d %d %d\n",i_e1,i_e2,i_e_sub);
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

  //printf("%s\n",e_subsubsub);
  if(i_e_subsubsub >= 255){
    ovf[0]='1';
  }
  else{
    ovf[0]='0';
  }

  //printf("m_sub_sub %s\n",e_subsubsub);
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

  
  strcpy(ans,s);
  //printf("%s\n",ans);
  strcat(ans,e);
  //printf("%s\n",ans);
  strcat(ans,m);
  //printf("%s\n",ans);
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

void fpu_itof(char i[33],char ans[33]){
  char s[2]={'\0'};
  char e[9]={'\0'};
  char m[24]={'\0'};

  s[0]=i[0];

  char p33[34]={'\0'};
  char p32[33]={'\0'};
  char p[33]={'\0'};
  strcat(p33,"0");
  char ri[33]={'\0'};
  hanten(ri,i,32);
  strcat(p33,ri);
  inc(p33,33);
  if(s[0]=='1'){
    strcpy(p32,p33+1);
  }
  else{
    strcpy(p32,i);
  }

  long i_p32=b_to_long(p32,0,31);
  long i_p_sub;
  char p_sub[33]={'\0'};
  long i_p;

  if(p32[1]=='1'){
    strcat(p_sub,"0000000000000000000000000");
    p_sub[25]=p32[25];
    //strcat(p_sub,p32[25]);
    strcat(p_sub,"000000");
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }
  else if(p32[2]=='1'){
    strcat(p_sub,"00000000000000000000000000");
    p_sub[26]=p32[26];
    //strcat(p_sub,p32[26]);
    strcat(p_sub,"00000");
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }
  else if(p32[3]=='1'){
    strcat(p_sub,"000000000000000000000000000");
    p_sub[27]=p32[27];
    //strcat(p_sub,p32[27]);
    strcat(p_sub,"0000");
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }
  else if(p32[4]=='1'){
    strcat(p_sub,"0000000000000000000000000000");
    p_sub[28]=p32[28];
    //strcat(p_sub,p32[28]);
    strcat(p_sub,"000");
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }
  else if(p32[5]=='1'){
    strcat(p_sub,"00000000000000000000000000000");
    p_sub[29]=p32[29];
    //strcat(p_sub,p32[29]);
    strcat(p_sub,"00");
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }
  else if(p32[6]=='1'){
    strcat(p_sub,"000000000000000000000000000000");
    p_sub[30]=p32[30];
    //strcat(p_sub,p32[30]);
    strcat(p_sub,"0");
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }  
  else if(p32[7]=='1'){
    strcat(p_sub,"0000000000000000000000000000000");
    p_sub[31]=p32[31];
    //strcat(p_sub,p32[31]);
    i_p_sub=b_to_long(p_sub,0,31);
    i_p=i_p32+i_p_sub;
  }
  else{
    i_p=i_p32;
  }
  i_to_b_long(p,i_p,32);

  if(p[0]=='1'){
    strcpy(e,"10011110");
  }
  else if(p[1]=='1'){
    strcpy(e,"10011101");
  }
  else if(p[2]=='1'){
    strcpy(e,"10011100");
  }  
  else if(p[3]=='1'){
    strcpy(e,"10011011");
  }
  else if(p[4]=='1'){
    strcpy(e,"10011010");
  }
  else if(p[5]=='1'){
    strcpy(e,"10011001");
  }
  else if(p[6]=='1'){
    strcpy(e,"10011000");
  }
  else if(p[7]=='1'){
    strcpy(e,"10010111");
  }
  else if(p[8]=='1'){
    strcpy(e,"10010110");
  }
  else if(p[9]=='1'){
    strcpy(e,"10010101");
  }
  else if(p[10]=='1'){
    strcpy(e,"10010100");
  }
  else if(p[11]=='1'){
    strcpy(e,"10010011");
  }
  else if(p[12]=='1'){
    strcpy(e,"10010010");
  }
  else if(p[13]=='1'){
    strcpy(e,"10010001");
  }
  else if(p[14]=='1'){
    strcpy(e,"10010000");
  }
  else if(p[15]=='1'){
    strcpy(e,"10001111");
  }
  else if(p[16]=='1'){
    strcpy(e,"10001110");
  }
  else if(p[17]=='1'){
    strcpy(e,"10001101");
  }
  else if(p[18]=='1'){
    strcpy(e,"10001100");
  }
  else if(p[19]=='1'){
    strcpy(e,"10001011");
  }
  else if(p[20]=='1'){
    strcpy(e,"10001010");
  }
  else if(p[21]=='1'){
    strcpy(e,"10001001");
  }
  else if(p[22]=='1'){
    strcpy(e,"10001000");
  }
  else if(p[23]=='1'){
    strcpy(e,"10000111");
  }
  else if(p[24]=='1'){
    strcpy(e,"10000110");
  }
  else if(p[25]=='1'){
    strcpy(e,"10000101");
  }
  else if(p[26]=='1'){
    strcpy(e,"10000100");
  }
  else if(p[27]=='1'){
    strcpy(e,"10000011");
  }
  else if(p[28]=='1'){
    strcpy(e,"10000010");
  }
  else if(p[29]=='1'){
    strcpy(e,"10000001");
  }
  else if(p[30]=='1'){
    strcpy(e,"10000000");
  }
  else if(p[31]=='1'){
    strcpy(e,"01111111");
  }
  else{
    strcpy(e,"00000000");
  }


  
  if(p[0]=='1'){
    strncpy(m,p+1,23);
  }
  else if(p[1]=='1'){
    strncpy(m,p+2,23);
  }
  else if(p[2]=='1'){
    strncpy(m,p+3,23);
  }  
  else if(p[3]=='1'){
    strncpy(m,p+4,23);
  }
  else if(p[4]=='1'){
    strncpy(m,p+5,23);
  }
  else if(p[5]=='1'){
    strncpy(m,p+6,23);
  }
  else if(p[6]=='1'){
    strncpy(m,p+7,23);
  }
  else if(p[7]=='1'){
    strncpy(m,p+8,23);
  }
  else if(p[8]=='1'){
    strncpy(m,p+9,23);
  }
  else if(p[9]=='1'){
    strcpy(m,p+10);
    strcat(m,"0");
  }
  else if(p[10]=='1'){
    strcpy(m,p+11);
    strcat(m,"00");
  }
  else if(p[11]=='1'){
    strcpy(m,p+12);
    strcat(m,"000");
  }
  else if(p[12]=='1'){
    strcpy(m,p+13);
    strcat(m,"0000");
  }
  else if(p[13]=='1'){
    strcpy(m,p+14);
    strcat(m,"00000");
  }
  else if(p[14]=='1'){
    strcpy(m,p+15);
    strcat(m,"000000");
  }
  else if(p[15]=='1'){
    strcpy(m,p+16);
    strcat(m,"0000000");
  }
  else if(p[16]=='1'){
    strcpy(m,p+17);
    strcat(m,"00000000");
  }
  else if(p[17]=='1'){
    strcpy(m,p+18);
    strcat(m,"000000000");
  }
  else if(p[18]=='1'){
    strcpy(m,p+19);
    strcat(m,"0000000000");
  }
  else if(p[19]=='1'){
    strcpy(m,p+20);
    strcat(m,"00000000000");
  }
  else if(p[20]=='1'){
    strcpy(m,p+21);
    strcat(m,"000000000000");
  }
  else if(p[21]=='1'){
    strcpy(m,p+22);
    strcat(m,"0000000000000");
  }
  else if(p[22]=='1'){
    strcpy(m,p+23);
    strcat(m,"00000000000000");
  }
  else if(p[23]=='1'){
    strcpy(m,p+24);
    strcat(m,"000000000000000");
  }
  else if(p[24]=='1'){
    strcpy(m,p+25);
    strcat(m,"0000000000000000");
  }
  else if(p[25]=='1'){
    strcpy(m,p+26);
    strcat(m,"00000000000000000");
  }
  else if(p[26]=='1'){
    strcpy(m,p+27);
    strcat(m,"000000000000000000");
  }
  else if(p[27]=='1'){
    strcpy(m,p+28);
    strcat(m,"0000000000000000000");
  }
  else if(p[28]=='1'){
    strcpy(m,p+29);
    strcat(m,"00000000000000000000");
  }
  else if(p[29]=='1'){
    strcpy(m,p+30);
    strcat(m,"000000000000000000000");
  }
  else if(p[30]=='1'){
    strcpy(m,p+31);
    strcat(m,"0000000000000000000000");
  }
  else if(p[31]=='1'){
    strcat(m,"00000000000000000000000");
  }
  else{
    strcpy(m,"00000000000000000000000");
  }
  strcat(ans,s);
  strcat(ans,e);
  strcat(ans,m);
  //printf("ans %s\n",ans);
}

void fpu_floor(char x1[33],char ans[33]){
  char s1[2]={'\0'};
  char s[2]={'\0'};
  char e1[9]={'\0'};
  char e[9]={'\0'};
  char m1[24]={'\0'};
  char m[24]={'\0'};

  strncpy(s1,x1,1);
  strncpy(e1,x1+1,8);
  strncpy(m1,x1+9,23);

  char m_25[26]={'\0'};
  char s1_e1[10]={'\0'};
  int i_e1 = b_to_i(e1,0,7);
  strcat(s1_e1,s1);
  strcat(s1_e1,e1);
  strcat(m_25,"01");
  if(i_e1 >= 150){
    strcat(m_25,m1);
  }
  else if(strcmp(s1_e1,"010010101")==0){
    strncat(m_25,m1,22);
    strcat(m_25,"0");
  }
  else if(strcmp(s1_e1,"010010100")==0){
    strncat(m_25,m1,21);
    strcat(m_25,"00");
  }
  else if(strcmp(s1_e1,"010010011")==0){
    strncat(m_25,m1,20);
    strcat(m_25,"000");
  }
  else if(strcmp(s1_e1,"010010010")==0){
    strncat(m_25,m1,19);
    strcat(m_25,"0000");
  }
  else if(strcmp(s1_e1,"010010001")==0){
    strncat(m_25,m1,18);
    strcat(m_25,"00000");
  }
  else if(strcmp(s1_e1,"010010000")==0){
    strncat(m_25,m1,17);
    strcat(m_25,"000000");
  }
  else if(strcmp(s1_e1,"010001111")==0){
    strncat(m_25,m1,16);
    strcat(m_25,"0000000");
  }
  else if(strcmp(s1_e1,"010001110")==0){
    strncat(m_25,m1,15);
    strcat(m_25,"00000000");
  }
  else if(strcmp(s1_e1,"010001101")==0){
    strncat(m_25,m1,14);
    strcat(m_25,"000000000");
  }
  else if(strcmp(s1_e1,"010001100")==0){
    strncat(m_25,m1,13);
    strcat(m_25,"0000000000");
  }
  else if(strcmp(s1_e1,"010001011")==0){
    strncat(m_25,m1,12);
    strcat(m_25,"00000000000");
  }
  else if(strcmp(s1_e1,"010001010")==0){
    strncat(m_25,m1,11);
    strcat(m_25,"000000000000");
  }
  else if(strcmp(s1_e1,"010001001")==0){
    strncat(m_25,m1,10);
    strcat(m_25,"0000000000000");
  }
  else if(strcmp(s1_e1,"010001000")==0){
    strncat(m_25,m1,9);
    strcat(m_25,"00000000000000");
  }
  else if(strcmp(s1_e1,"010000111")==0){
    strncat(m_25,m1,8);
    strcat(m_25,"000000000000000");
  }
  else if(strcmp(s1_e1,"010000110")==0){
    strncat(m_25,m1,7);
    strcat(m_25,"0000000000000000");
  }
  else if(strcmp(s1_e1,"010000101")==0){
    strncat(m_25,m1,6);
    strcat(m_25,"00000000000000000");
  }
  else if(strcmp(s1_e1,"010000100")==0){
    strncat(m_25,m1,5);
    strcat(m_25,"000000000000000000");
  }
  else if(strcmp(s1_e1,"010000011")==0){
    strncat(m_25,m1,4);
    strcat(m_25,"0000000000000000000");
  }
  else if(strcmp(s1_e1,"010000010")==0){
    strncat(m_25,m1,3);
    strcat(m_25,"00000000000000000000");
  }
  else if(strcmp(s1_e1,"010000001")==0){
    strncat(m_25,m1,2);
    strcat(m_25,"000000000000000000000");
  }
  else if(strcmp(s1_e1,"010000000")==0){
    strncat(m_25,m1,1);
    strcat(m_25,"0000000000000000000000");
  }
  else if(strcmp(s1_e1,"110010101")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,22);
    strcat(m_25_s,"0");

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000000000000000000");
    strcat(m_25_g,m1+22);
    strcat(m_25_g,"0");

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110010100")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,21);/*m*/
    strcat(m_25_s,"00");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000000000000000000000");/*m*/
    fpu_or(m_25_g,m1,21,22);/*p*/
    strcat(m_25_g,"00");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110010011")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,20);/*m*/
    strcat(m_25_s,"000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000000000000000000000");/*m*/
    fpu_or(m_25_g,m1,20,22);/*m*/
    strcat(m_25_g,"000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110010010")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,19);/*m*/
    strcat(m_25_s,"0000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000000000000000");/*m*/
    fpu_or(m_25_g,m1,19,22);/*m*/
    strcat(m_25_g,"0000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110010001")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,18);/*m*/
    strcat(m_25_s,"00000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000000000000000000");/*m*/
    fpu_or(m_25_g,m1,18,22);/*m*/
    strcat(m_25_g,"00000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110010000")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,17);/*m*/
    strcat(m_25_s,"000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000000000000000000");/*m*/
    fpu_or(m_25_g,m1,17,22);/*m*/
    strcat(m_25_g,"000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110010000")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,16);/*m*/
    strcat(m_25_s,"0000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000000000000");/*m*/
    fpu_or(m_25_g,m1,16,22);/*m*/
    strcat(m_25_g,"0000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110001111")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,15);/*m*/
    strcat(m_25_s,"00000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000000000000000");/*m*/
    fpu_or(m_25_g,m1,15,22);/*m*/
    strcat(m_25_g,"00000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110001110")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,14);/*m*/
    strcat(m_25_s,"000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000000000000000");/*m*/
    fpu_or(m_25_g,m1,14,22);/*m*/
    strcat(m_25_g,"000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110001101")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,13);/*m*/
    strcat(m_25_s,"0000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000000000");/*m*/
    fpu_or(m_25_g,m1,13,22);/*m*/
    strcat(m_25_g,"0000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }  
  else if(strcmp(s1_e1,"110001100")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,12);/*m*/
    strcat(m_25_s,"00000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000000000000");/*m*/
    fpu_or(m_25_g,m1,12,22);/*m*/
    strcat(m_25_g,"00000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }    
  else if(strcmp(s1_e1,"110001011")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,11);/*m*/
    strcat(m_25_s,"000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000000000000");/*m*/
    fpu_or(m_25_g,m1,11,22);/*m*/
    strcat(m_25_g,"000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110001010")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,10);/*m*/
    strcat(m_25_s,"0000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000000");/*m*/
    fpu_or(m_25_g,m1,10,22);/*m*/
    strcat(m_25_g,"0000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110001001")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,10);/*m*/
    strcat(m_25_s,"0000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000000");/*m*/
    fpu_or(m_25_g,m1,10,22);/*m*/
    strcat(m_25_g,"0000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110001000")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,9);/*m*/
    strcat(m_25_s,"00000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000000000");/*m*/
    fpu_or(m_25_g,m1,9,22);/*m*/
    strcat(m_25_g,"00000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110000111")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,8);/*m*/
    strcat(m_25_s,"000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000000000");/*m*/
    fpu_or(m_25_g,m1,8,22);/*m*/
    strcat(m_25_g,"000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110000110")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,7);/*m*/
    strcat(m_25_s,"0000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000000");/*m*/
    fpu_or(m_25_g,m1,7,22);/*m*/
    strcat(m_25_g,"0000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110000101")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,6);/*m*/
    strcat(m_25_s,"00000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000000");/*m*/
    fpu_or(m_25_g,m1,6,22);/*m*/
    strcat(m_25_g,"00000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110000100")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,5);/*m*/
    strcat(m_25_s,"000000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000000");/*m*/
    fpu_or(m_25_g,m1,5,22);/*m*/
    strcat(m_25_g,"000000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }  
  else if(strcmp(s1_e1,"110000011")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,4);/*m*/
    strcat(m_25_s,"0000000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00000");/*m*/
    fpu_or(m_25_g,m1,4,22);/*m*/
    strcat(m_25_g,"0000000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110000010")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,3);/*m*/
    strcat(m_25_s,"00000000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0000");/*m*/
    fpu_or(m_25_g,m1,3,22);/*m*/
    strcat(m_25_g,"00000000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"110000001")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,2);/*m*/
    strcat(m_25_s,"000000000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"000");/*m*/
    fpu_or(m_25_g,m1,2,22);/*m*/
    strcat(m_25_g,"000000000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }  
  else if(strcmp(s1_e1,"110000000")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    strncat(m_25_s,m1,1);/*m*/
    strcat(m_25_s,"0000000000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"00");/*m*/
    fpu_or(m_25_g,m1,1,22);/*m*/
    strcat(m_25_g,"0000000000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if(strcmp(s1_e1,"101111111")==0){
    char m_25_s[26]={'\0'};
    strcat(m_25_s,"01");
    //strncat(m_25_s,m1,1);/*m*/
    strcat(m_25_s,"00000000000000000000000");/*p*/

    char m_25_g[26]={'\0'};
    strcat(m_25_g,"0");/*m*/
    fpu_or(m_25_g,m1,0,22);/*m*/
    strcat(m_25_g,"00000000000000000000000");/*p*/

    long i_m_25_s = b_to_long(m_25_s,0,24);
    long i_m_25_g = b_to_long(m_25_s,0,24);

    long i_m_25 = i_m_25_s + i_m_25_g;
    i_to_b_long(m_25,i_m_25,25);
  }
  else if((s1[0]=='1')&&(strcmp(e1,"00000000")!=0)&&(strcmp(m1,"00000000000000000000000")!=0)){
    strcpy(m_25,"1000000000000000000000001");
  }
  else{
    strcpy(m_25,"0000000000000000000000000");
  }

  strcpy(s,s1);
  if((m_25[0]=='1')&&(m_25[24]=='1')){
    strcpy(e,"01111111");
  }
  else if(m_25[0]=='1'){
    strcpy(e,e1);
    inc(e,8);
  }
  else if(m_25[1]=='1'){
    strcpy(e,e1);
  }
  else{
    strcpy(e,"00000000");
  }
  if(m_25[0]=='1'){
    strncpy(m,m_25+1,23);
  }
  else{
    strncpy(m,m_25+2,23);
  }
  strcat(ans,s);
  strcat(ans,e);
  strcat(ans,m);
}

void fpu_ftoi(char f[33],char ans[33]){
  char s[2]={'\0'};
  char e[9]={'\0'};
  char m[24]={'\0'};

  strncpy(s,f,1);
  strncpy(e,f+1,8);
  strncpy(m,f+9,23);

  int i_e=b_to_i(e,0,7);
  int i_m=b_to_i(m,0,22);
  //unsigned int i_f=b_to_ui(f,0,31);

  char ui24[25]={'\0'};
  char ui32[33]={'\0'};
  char uineg33[34]={'\0'};
  ui24[0]='1';
  strcat(ui24,m);
  //printf("%s\n",ui24);
  if(strcmp(f,"11001111000000000000000000000000")==0){
    strcpy(ui32,"10000000000000000000000000000000");
  }
  else{
    if(i_e>=158){
      strcpy(ui32,"01111111111111111111111111111111");
    }
    else if(i_e==157){
      ui32[0]='0';
      strcat(ui32,ui24);
      strcat(ui32,"0000000");
    }
    else if(i_e==156){
      strcpy(ui32,"00");
      strcat(ui32,ui24);
      strcat(ui32,"000000");
    }
    else if(i_e==155){
      strcpy(ui32,"000");
      strcat(ui32,ui24);
      strcat(ui32,"00000");
    }
    else if(i_e==154){
      strcpy(ui32,"0000");
      strcat(ui32,ui24);
      strcat(ui32,"0000");
    }
    else if(i_e==153){
      strcpy(ui32,"00000");
      strcat(ui32,ui24);
      strcat(ui32,"000");
    }
    else if(i_e==152){
      strcpy(ui32,"000000");
      strcat(ui32,ui24);
      strcat(ui32,"00");
    }
    else if(i_e==151){
      strcpy(ui32,"0000000");
      strcat(ui32,ui24);
      strcat(ui32,"0");
    }
    else if(i_e==150){
      strcpy(ui32,"00000000");
      strcat(ui32,ui24);
    }
    else if(i_e==149){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000");
      strncat(p,ui24,23);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[23];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);/*変更*/
    }
    else if(i_e==148){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000");
      strncat(p,ui24,22);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[22];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }   
    else if(i_e==147){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000");
      strncat(p,ui24,21);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[21];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==146){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000");
      strncat(p,ui24,20);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[20];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==145){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000");
      strncat(p,ui24,19);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[19];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==144){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000000");
      strncat(p,ui24,18);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[18];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==143){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000000");
      strncat(p,ui24,17);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[17];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==142){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000000");
      strncat(p,ui24,16);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[16];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==141){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000000000");
      strncat(p,ui24,15);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[15];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==140){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000000000");
      strncat(p,ui24,14);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[14];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==139){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000000000");
      strncat(p,ui24,13);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[13];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==138){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000000000000");
      strncat(p,ui24,12);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[12];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==137){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000000000000");
      strncat(p,ui24,11);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[11];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==136){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000000000000");
      strncat(p,ui24,10);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[10];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==135){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000000000000000");
      strncat(p,ui24,9);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[9];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==134){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000000000000000");
      strncat(p,ui24,8);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[8];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==133){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000000000000000");
      strncat(p,ui24,7);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[7];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==132){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000000000000000000");
      strncat(p,ui24,6);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[6];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==131){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000000000000000000");
      strncat(p,ui24,5);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[5];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==130){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000000000000000000");
      strncat(p,ui24,4);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[4];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==129){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"00000000000000000000000000000");
      strncat(p,ui24,3);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[3];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==128){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"000000000000000000000000000000");
      strncat(p,ui24,2);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[2];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==127){
      char p[33]={'\0'};
      char q[33]={'\0'};
      strcat(p,"0000000000000000000000000000000");
      strncat(p,ui24,1);
      strcat(q,"0000000000000000000000000000000");
      q[31]=ui24[1];
      unsigned int i_p=b_to_i(p,0,31);
      unsigned int i_q=b_to_i(q,0,31);
      unsigned int i_ui32=i_p+i_q;
      i_to_b(ui32,(int) i_ui32,32);
    }
    else if(i_e==126){
      strcat(ui32,"00000000000000000000000000000001");
    }
    else{
      strcat(ui32,"00000000000000000000000000000000");
    }
  }
  uineg33[0]='0';

//char uineg32[33]={'\0'};
  //char uineg33sub[33]={'\0'};
  hanten(uineg33,ui32,32);
  inc(uineg33,33);
  unsigned int i_ui32a=b_to_i(ui32,0,31);
  if((i_ui32a==0)||(s[0]=='0')){
    strcpy(ans,ui32);
  }
  else{
    strcpy(ans,uineg33+1);
  }
  //printf("ans %s\n",ans);
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
  fsqrtinv_table(xsi23,n);
  fsqrt_table(xs23,n);


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
  int s = change_ibit(1,f);
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
  if(s==0){
  return m;
  }
  else{
    return -m;
  }
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

void slw(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);

  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  unsigned int s = change_ibit(R,(cpu->reg)[rs]);
  unsigned int b = change_ibit(R,(cpu->reg)[rb]);

  unsigned int ns = s << b;

  change_int((cpu->reg)[ra],32,ns);
  *a+=4;
}

void srw(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);

  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  unsigned int s = change_ibit(R,(cpu->reg)[rs]);
  unsigned int b = change_ibit(R,(cpu->reg)[rb]);

  unsigned int ns = s >> b;

  change_int((cpu->reg)[ra],32,ns);
  *a+=4;
  printf("srw r%d, r%d, r%d\n",ra,rs,rb);
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
}/**/
      
static int i=0; 

void out(char *code,CPU *cpu,int *a,FILE *file){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int ra = change_ibit(5,code_6_10);

  int value = change_ibit_f(R,(cpu->reg)[ra]);
  char x = value;
  fwrite(&x,sizeof(x),1,file);
  *a+=4;
  i+=1;
}/**/

void cmpi(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4]={'\0'};
  strncpy(code_6_8,code+6,3);
  char code_10[2]={'\0'};
  strncpy(code_10,code+10,1);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);

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
  printf("cmpi cr%d, r%d, %d\n",bf,ra,sim);
}

void fcmpu(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4]={'\0'};
  strncpy(code_6_8,code+6,3);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int fra = change_ibit(5,code_11_15);
  int frb = change_ibit(5,code_16_20);
  float va = change_float((cpu->freg)[fra]);
  float vb = change_float((cpu->freg)[frb]);
  int bf = change_ibit(3,code_6_8);
  
  printf("v %d s %d\n",fra,frb);
  printf("%s -> ",(cpu->cr)[bf]);
  
  if(va < vb){
    strcpy((cpu->cr)[bf],"0001");
  }
  else if(va > vb){
    strcpy((cpu->cr)[bf],"0010");
  }
  else{
    strcpy((cpu->cr)[bf],"0100");
  }

  printf("%s\n",(cpu->cr)[bf]);
  
  *a+=4;
}/**/

void cmp(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4]={'\0'};
  strncpy(code_6_8,code+6,3);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);

  int va = change_ibit_f(R,(cpu->reg)[ra]);
  int vb = change_ibit_f(R,(cpu->reg)[rb]);
  int bf = change_ibit(3,code_6_8);


  printf("v %d s %d\n",va,vb);
  printf("%s -> ",(cpu->cr)[bf]);
  
  if(va < vb){
    strcpy((cpu->cr)[bf],"0001");
  }
  else if(va > vb){
    strcpy((cpu->cr)[bf],"0010");
  }
  else{
    strcpy((cpu->cr)[bf],"0100");
  }
  printf("%s\n",(cpu->cr)[bf]);
  *a+=4;
}/**/
  

void bne(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_29[15]={'\0'};
  strncpy(code_16_29,code+16,14);

  int cr = change_ibit(5,code_11_15);
  if(strcmp((cpu->cr)[cr],"0100")==0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  printf("bne cr%d\n",cr);
}

void bgt(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_29[15]={'\0'};
  strncpy(code_16_29,code+16,14);

  int cr = change_ibit(5,code_11_15);
  if(strcmp((cpu->cr)[cr],"0010")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
}

void beq(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_29[15]={'\0'};
  strncpy(code_16_29,code+16,14);

  int cr = change_ibit(5,code_11_15);
  if(strcmp((cpu->cr)[cr],"0100")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
}



void blt(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_29[15]={'\0'};
  strncpy(code_16_29,code+16,14);

  int cr = change_ibit(5,code_11_15);
  
  printf("cr%d\n",cr);
  if(strcmp((cpu->cr)[cr],"0001")!=0){
    
    *a+=4;
  }
  else{
    
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
}

/*1byteの読み込み*/
void in(char *code,CPU *cpu,int *a,FILE *file){
  int addr = *a;
  char x;
  fread(&x,sizeof(x),1,file);
  int y=change_char_int(x);
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int ra = change_ibit(5,code_6_10);
  char tmp[33]={'\0'};
  change_int(tmp,32,y);
  strncpy((cpu->reg)[ra]+24,tmp+24,8);
  *a+=4;

  printf("%s\n",(cpu->reg)[ra]);
  int k;
}

void fin(char *code,CPU *cpu,int *a,FILE *file){
  int addr = *a;
  char x;
  fread(&x,sizeof(x),1,file);
  int y=change_char_int(x);
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int ra = change_ibit(5,code_6_10);
  char tmp[33]={'\0'};
  change_int(tmp,32,y);
  strncpy((cpu->freg)[ra]+24,tmp+24,8);
  *a+=4;
  int k;
  printf("%s\n",(cpu->freg)[ra]);
}
/*
void read(char *code,CPU *cpu,int *a){
  int addr =*a;
  int x;
  printf("4byte読み込み: ");
  scanf("%d",&x);
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int ra = change_ibit(5,code_6_10);
  change_int((cpu->reg)[ra],32,x);
  *a+=4;
  }*/

void addi(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);

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
  printf("addi r%d, r%d, %d\n",rt,ra,si);
}

void fabs2(char *code,CPU *cpu,int *a){
  int addr =*a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int fra = change_ibit(5,code_11_15);
  strcpy((cpu->reg)[frd],(cpu->reg)[fra]);
  if((cpu->reg)[frd][0]=='1'){
    (cpu->reg)[frd][0]='0';
  }
  *a+=4;
  printf("fabs f%d, f%d\n",frd,fra);
}

void neg(char *code,CPU *cpu,int *a){
  int addr =*a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);

  hanten((cpu->reg)[rd],(cpu->reg)[ra],32);
  inc((cpu->reg)[rd],32);
  *a+=4;
  printf("neg r%d, r%d\n",rd,ra);
}

void fneg(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frd = change_ibit(5,code_6_10);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int fra = change_ibit(5,code_16_20);
  if(fra!=frd){
  strcpy((cpu->freg)[frd],(cpu->freg)[fra]);
  }
  if(((cpu->freg)[frd][0]=='0')&&(strcmp((cpu->freg)[frd],"00000000000000000000000000000000")!=0)){
    (cpu->freg)[frd][0]='1';
  }
  else{
    (cpu->freg)[frd][0]='0';
  }
  *a+=4;
  printf("fneg f%d, f%d\n",frd,fra);
}

  

void lis(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);
  int rt = change_ibit(5,code_6_10);
  int si = change_ibit_f(16,code_16_31);

  int ns = si << 16;
  change_int((cpu->reg)[rt],32,ns);
  *a+=4;
  printf("lis r%d, %d\n",rt,si);
}

void blr(char *code,CPU *cpu,int *addr){
  int x = change_ibit_f(R,(cpu->lr));
  if(x==1){
    *addr+=4;
	exit(0);
  }
  else{
    *addr = x;
  }
  printf("blr %d\n",x);
}

void stfd(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);
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

  int x=change_ibit_f(R,(cpu->freg)[frt]);
  int ea = b + d;
  (cpu->memory)[ea/4]=x;

  *a+=4;
  printf("stfd f%d, %d(r%d)\n",frt,d,ra);
}
void stfdx(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  int b;
  if(ra==0){
    b=0;
  }
  else{
    b = change_ibit_f(R,(cpu->reg)[ra]);
  }
  b += change_ibit_f(R,(cpu->reg)[rb]);
  int x=change_ibit_f(R,(cpu->freg)[rs]);
  (cpu->memory)[b/4]=x;

  *a+=4;
  printf("stfdx f%d, r%d, r%d\n",rs,ra,rb);
}

void stwx(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  int b;
  if(ra==0){
    b=0;
  }
  else{
    b = change_ibit_f(R,(cpu->reg)[ra]);
  }
  b += change_ibit_f(R,(cpu->reg)[rb]);

  int x=change_ibit_f(R,(cpu->reg)[rs]);
  (cpu->memory)[b/4]=x;

  *a+=4;
  printf("stwx r%d, r%d, r%d\n",rs,ra,rb);
}

void stw(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);

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
  int x=change_ibit_f(R,(cpu->reg)[rs]);
  printf("%d\n",addr2/4);
  (cpu->memory)[addr2/4]=x;

  *a+=4;
  printf("stw r%d, %d(r%d)\n",rs,d,ra);
}

void mflr(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);

  int rd = change_ibit(5,code_6_10);

  strcpy((cpu->reg)[rd],cpu->lr);

  *a+=4;
  printf("mflr r%d\n",rd);
}

void fmr(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_16_20);
  strcpy((cpu->freg)[rs],(cpu->freg)[ra]);
  *a+=4;
  printf("fmr f%d, f%d\n",rs,ra);
}

void mr(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  strcpy((cpu->reg)[ra],(cpu->reg)[rs]);
  *a+=4;
  printf("mr r%d, r%d\n",ra,rs);
}

void add(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rt = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(R,(cpu->reg)[ra]);
  int y = change_ibit_f(R,(cpu->reg)[rb]);
  int z = x + y;

  change_int((cpu->reg)[rt],32,z);
  *a+=4;
  printf("add r%d, r%d, r%d\n",rt,ra,rb);
}

void subf(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  int rt = change_ibit(5,code_6_10);
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(R,(cpu->reg)[ra]);
  int y = change_ibit_f(R,(cpu->reg)[rb]);
  int z = y - x;

  change_int((cpu->reg)[rt],32,z);
  *a+=4;
  printf("subf r%d, r%d, r%d\n",rt,ra,rb);
}

void b(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25]={'\0'};
  strncpy(code_6_29,code+6,24);
  int target = change_ibit_f(24,code_6_29) * 4;
  *a=target+*a;
  printf("b\n");
}

void bctr(char *code,CPU *cpu,int *a){
  int addr=*a;
  char code_31[2]={'\0'};
  strncpy(code_31,code+31,1);
  if(code_31[0]=='1'){
    change_int((cpu->lr),32,addr+4);
  }

  int next = b_to_i((cpu->cor),0,31);
  *a=next;
  printf("bctr\n");
}


  

void bl(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25]={'\0'};
  strncpy(code_6_29,code+6,24);
  int target = change_ibit_f(24,code_6_29) * 4;
  change_int((cpu->lr),32,addr+4);
  *a=target+*a;
  printf("bl %d\n",*a);
}

void lfd(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);
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
  char s[33]={'\0'};
  int ea = b + d;
  int x = (cpu->memory)[ea/4];
  i_to_b(s,x,R);
  strcpy((cpu->freg)[frt],s);
  *a+=4;
  printf("lfd f%d, %d(r%d)\n",frt,d,ra);
}

void lfdx(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rt = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  int b;
  if(ra==0){
    b=0;
  }
  else{
    b = change_ibit_f(R,(cpu->reg)[ra]);
  }
  b += change_ibit_f(R,(cpu->reg)[rb]);
  char s[33]={'\0'};
  int x = (cpu->memory)[b/4];
  i_to_b(s,x,R);
  strcpy((cpu->freg)[rt],s);
  *a+=4;
  printf("lfdx f%d, r%d, r%d\n",rt,ra,rb);
}

void lwzx(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int rt = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  int b;
  if(ra==0){
    b=0;
  }
  else{
    b = change_ibit_f(R,(cpu->reg)[ra]);
  }
  b += change_ibit_f(R,(cpu->reg)[rb]);
  char s[33]={'\0'};
  int x = (cpu->memory)[b/4];
  i_to_b(s,x,R);
  strcpy((cpu->reg)[rt],s);
  *a+=4;
  printf("lwzx r%d, r%d, r%d\n",rt,ra,rb);
}

void lwz(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);

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
  char s[33]={'\0'};
  int x = (cpu->memory)[ea/4];
  i_to_b(s,x,R);
  strcpy((cpu->reg)[rt],s);
  *a+=4;
  printf("lwz r%d, %d(r%d)\n",rt,d,ra);
}

void mtctr(char *code,CPU *cpu,int *addr){
  int a=*addr;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);

  int rs = change_ibit(5,code_6_10);
  strcpy((cpu->cor),(cpu->reg)[rs]);
  printf("%s %s\n",(cpu->cor),(cpu->reg)[rs]);
  *addr+=4;
  printf("mtctr r%d\n",rs);
}

void mtlr(char *code,CPU *cpu,int *addr){
  int a=*addr;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);

  int rs = change_ibit(5,code_6_10);
  strcpy((cpu->lr),(cpu->reg)[rs]);
  *addr+=4;
  printf("mtlr r%d\n",rs);
}

void stmw(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);
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
    int x = change_ibit_f(R,(cpu->reg)[r]);
    (cpu->memory)[ea/4]=x;
    r+=1;
    ea+=4;
  }
  *a+=4;
  printf("stmw r%d, %d(r%d)\n",rs,d,ra);
}

void fslwi(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);

  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int sh = change_ibit(5,code_16_20);

  char code_21_25[6]={'\0'};
  strncpy(code_21_25,code+21,5);
  int mb = change_ibit(5,code_21_25);

  char code_26_30[6]={'\0'};
  strncpy(code_26_30,code+26,5);
  int me = change_ibit(5,code_26_30);

  int n = sh;
  char rc[33]={'\0'};
  rot_l(rc,(cpu->freg)[rs],n);/*左にnだけ回転*/
  char mask[33]={'\0'};
  make_mask(mask,mb,me);
  char ra_c[33]={'\0'};
  and(ra_c,rc,mask);
  strcpy((cpu->freg)[ra],ra_c);
  *a+=4;
  printf("fslwi r%d, r%d, %d\n",ra,rs,n);
}

void rlwinm(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);

  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int sh = change_ibit(5,code_16_20);

  char code_21_25[6]={'\0'};
  strncpy(code_21_25,code+21,5);
  int mb = change_ibit(5,code_21_25);

  char code_26_30[6]={'\0'};
  strncpy(code_26_30,code+26,5);
  int me = change_ibit(5,code_26_30);

  int n = sh;
  char rc[33]={'\0'};
  rot_l(rc,(cpu->reg)[rs],n);/*左にnだけ回転*/
  char mask[33]={'\0'};
  make_mask(mask,mb,me);
  char ra_c[33]={'\0'};
  and(ra_c,rc,mask);
  strcpy((cpu->reg)[ra],ra_c);
  *a+=4;
  printf("rlwinm r%d, r%d, %d, %d, %d\n",ra,rs,sh,mb,me);
}
  

void stwu(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);
  int d = change_ibit_f(16,code_16_31);

  int ea = change_ibit_f(R,(cpu->reg)[ra]) + d;
  int x = change_ibit_f(R,(cpu->reg)[rs]);
  (cpu->memory)[ea/4]=x;

  change_int((cpu->reg)[ra],32,ea);
  *a+=4;
  printf("stwu r%d, %d(r%d)\n",rs,d,ra);
}

void lmw(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int rt = change_ibit(5,code_6_10);

  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17]={'\0'};
  strncpy(code_16_31,code+16,16);
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
    char s[33]={'\0'};
    int x = (cpu->memory)[ea/4];
    i_to_b(s,x,R);
    ea += 4;
    strcpy((cpu->reg)[r],s);
    r+=1;
  }
  *a+=4;
  printf("lmw r%d %d(r%d)\n",rt,d,ra);
}
/*itof rft ra*/
/*void itof(char *code,CPU *cpu,int *a){
  int addr=*a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frt=change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);
  int v = b_to_i((cpu->reg)[ra],0,31);
  //printf("これだ%d\n",v);
  change_float_to_string((cpu->freg)[frt],v);
  *a+=4;
  }*/

void itof(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frt=change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int ra = change_ibit(5,code_11_15);
  strcpy((cpu->freg)[frt],"");
  fpu_itof((cpu->reg)[ra],(cpu->freg)[frt]);
  *a+=4;
  printf("itof f%d, r%d\n",frt,ra);
}

/*ftoi rft ra*/
/*void ftoi(char *code,CPU *cpu,int *a){
  int addr=*a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int ra=change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int frt = change_ibit(5,code_11_15);
  change_float_to_int_string((cpu->reg)[ra],(cpu->freg)[frt]);
  *a+=4;
  }*/

void ftoi(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int ra = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int frt = change_ibit(5,code_11_15);
  strcpy((cpu->reg)[ra],"");
  fpu_ftoi((cpu->freg)[frt],(cpu->reg)[ra]);
  *a+=4;
  printf("ftoi r%d, f%d\n",ra,frt);
}

/*floor fa fd*/
/*void floor2(char *code,CPU *cpu,int *a){
  int addr =*a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int fa = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int fd = change_ibit(5,code_11_15);
  float v = change_float((cpu->freg)[fd]);
  v = floorf(v);
  change_float_to_string((cpu->freg)[fa],v);
  *a+=4;
  }*/

void floor2(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int fa = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int fd = change_ibit(5,code_11_15);
  strcpy((cpu->freg)[fa],"");
  fpu_floor((cpu->freg)[fd],(cpu->freg)[fa]);
  *a+=4;
  printf("floor f%d, f%d\n",fd,fa);
}


  
  

void fadd(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frt = change_ibit(5,code_6_10);

  char code_11_15[6] = {'\0'};
  strncpy(code_11_15,code+11,5);
  int fra = change_ibit(5,code_11_15);

  char code_16_20[6] = {'\0'};
  strncpy(code_16_20,code+16,5);
  int frb = change_ibit(5,code_16_20);

  char ovf[2]={'\0'};

  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  char f2[33]={'\0'};
  strcpy(f2,(cpu->freg)[frb]);
  char f3[33]={'\0'};
  printf("fadd f%d, f%d, f%d\n",frt,fra,frb);
  fpu_fadd(f1,f2,f3,ovf);
  strcpy((cpu->freg)[frt],f3);
  *a+=4;

}

void fsub(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6] = {'\0'};
  strncpy(code_6_10,code+6,5);
  int frt = change_ibit(5,code_6_10);

  char code_11_15[6] = {'\0'};
  strncpy(code_11_15,code+11,5);
  int fra = change_ibit(5,code_11_15);

  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int frb = change_ibit(5,code_16_20);

  char ovf[2] = {'\0'};

  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  char f2[33]={'\0'};
  strcpy(f2,(cpu->freg)[frb]);
  char f3[33]={'\0'};
  fpu_fsub(f1,f2,f3,ovf);
  *a+=4;
  strcpy((cpu->freg)[frt],f3);
  printf("fsub f%d, f%d, f%d\n",frt,fra,frb);
}

void fmul(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6] = {'\0'};
  strncpy(code_6_10,code+6,5);
  int frt = change_ibit(5,code_6_10);

  char code_11_15[6] = {'\0'};
  strncpy(code_11_15,code+11,5);
  int fra = change_ibit(5,code_11_15);

  char code_16_20[6] = {'\0'};
  strncpy(code_16_20,code+16,5);
  int frb = change_ibit(5,code_16_20);

  char ovf[2] = {'\0'};


  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  char f2[33]={'\0'};
  strcpy(f2,(cpu->freg)[frb]);
  char t[33]={'\0'};
  fpu_fmul(f2,f1,t,ovf);
  strcpy((cpu->freg)[frt],t);
  *a += 4;
  printf("fmul f%d, f%d, f%d\n",frt,fra,frb);
}

void fdiv(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int fra=change_ibit(5,code_11_15);
  char code_16_20[6]={'\0'};
  strncpy(code_16_20,code+16,5);
  int frb=change_ibit(5,code_16_20);
  char ovf[2]={'\0'};

  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  char f2[33]={'\0'};
  strcpy(f2,(cpu->freg)[frb]);
  char s[33]={'\0'};
  fpu_fdiv((cpu->freg)[fra],(cpu->freg)[frb],s,ovf);
  strcpy((cpu->freg)[frd],s);
  *a+=4;
  printf("fdiv f%d, f%d, f%d\n",frd,fra,frb);
}

void fsqrt(char *code,CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6]={'\0'};
  strncpy(code_6_10,code+6,5);
  int frd = change_ibit(5,code_6_10);
  char code_11_15[6]={'\0'};
  strncpy(code_11_15,code+11,5);
  int fra=change_ibit(5,code_11_15);
  char ovf[2]={'\0'};
  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  fpu_fsqrt(f1,(cpu->freg)[frd],ovf);
  *a+=4;
  printf("fsqrt f%d, f%d\n",frd,fra);
}

int main(int argc,char **argv){
  char f1[33]="00111101101110000101000111101100";
  char f2[33]="00111100110111010010111100011011";
  char ans[33]={'\0'};
  char ovf[2]={'\0'};
  fpu_fmul(f1,f2,ans,ovf);
  printf("%s\n",ans);
  FILE *file;
  file=fopen(argv[1],"rb");
  fseek(file,0,SEEK_END);
  int size=ftell(file);
  rewind(file);
  int *memory_sub = (int *) malloc(size);
  fread(memory_sub,sizeof(int),size,file);
  fclose(file);

  CPU cpu;
  init_cpu(&cpu);

  printf("実行\n");
  read_memory(&cpu,memory_sub);

  FILE *file2;
  FILE *file3;
  file2 = fopen(argv[2],"rb");
  file3 = fopen(argv[3],"w");


  exec(&cpu,file2,file3);

  fclose(file2);
  fclose(file3);
  return 0;
}

void read_memory(CPU *cpu,int *memory){
  for(int i=0;i<M;i++){
    int x = memory[i];
    int x1 = x & 0xff;
    int x2 = x & 0xff00;
    int x3 = x & 0xff0000;
    int x4 = x & 0xff000000;
    x1 = (x1 << 24) & 0xff000000;
    x2 = (x2 << 8) & 0xff0000;
    x3 = (x3 >> 8) & 0xff00;
    x4 = (x4 >> 24) & 0xff;
    x = x1 + x2 + x3 + x4;
    (cpu->memory)[i]=x;
    //printf("read %d\n",x);
  }
}


void init_cpu(CPU *cpu){
  for(int i=0;i<M;i++){
    (cpu->memory)[i]=0;
  }
  for(int i=0;i<R;i++){
    for(int j=0;j<R+1;j++){
      if(j==R){
        (cpu->reg)[i][j]='\0';
      }
      else{
        (cpu->reg)[i][j]='0';
      }
    }
  }
  for(int i=0;i<R;i++){
    for(int j=0;j<R+1;j++){
      if(j==R){
        (cpu->freg)[i][j]='\0';
      }
      else{
        (cpu->freg)[i][j]='0';
      }
    }
  }
  for(int i=0;i<R+1;i++){
    if(i==R){
      (cpu->lr)[i]='\0';
    }
    else{
      (cpu->lr)[i]='0';
    }
  }
  for(int i=0;i<R+1;i++){
    if(i==R){
      (cpu->cor)[i]='\0';
    }
    else{
      (cpu->cor)[i]='0';
    }
  }  
  for(int i=0;i<R+1;i++){
    if(i==R){
      (cpu->s)[i]='\0';
    }
    else{
      (cpu->s)[i]='0';
    }
  }
  for(int i=0;i<8;i++){
    for(int j=0;j<5;j++){
      if(j==4){
        (cpu->cr)[i][j]='\0';
      }
      else{
        (cpu->cr)[i][j]='0';
      }
    }
  }
  change_int((cpu->reg)[4],R,100000);
  change_int((cpu->reg)[3],R,100000);
}

void i_to_b(char *g,int i_g,int b){
  if(i_g>=0){
    for(int i=0;i<b;i++){
      int r = i_g % 2;
      g[b-i-1] = r + 48;
      i_g = i_g / 2;
    }
  }
  else{
    int g2 = ~i_g;
    for(int i=0;i<b;i++){
      int r=g2%2;
      if(r==0){
        g[b-i-1]='1';
      }
      else{
        g[b-i-1]='0';
      }
      g2=g2/2;
    }
  }
}

static int change_check=0;
static int ppp=0;
void check_change(){
  change_check=1;
  ppp=1;
}

void exec(CPU *cpu,FILE *file2,FILE *file3){
  int addr = 0;
  char code[33]={'\0'};
  int stopaddr = -1;
  int check=0;
  int x=0;
  printf("ブレークしたいアドレスを入力してください。不要なら負の値:");
  scanf("%d",&stopaddr);
  while(1){
    int rc=0;
    struct sigaction act;
    memset(&act,0,sizeof(act));
    act.sa_handler=check_change;
    rc=sigaction(SIGTSTP,&act,NULL);
    if(rc>0){
      printf("止まります\n");
    }
    rc=0;
    check=change_check;
    if(addr==stopaddr){
      check=1;
    }
    if(check==1){
      printf("cpuの状態を表示しますか?y:1 n:0");
      scanf("%d",&x);
      printf("自動実行に切り替えますか?y:0 n:1");
      scanf("%d",&check);
      change_check=check;
      if(check==0){
        printf("ブレークしたいアドレスを入力してください。不要なら負の値:");
        scanf("%d",&stopaddr);
        x=0;
      }
    }
    i_to_b(code,(cpu->memory)[addr/4],32);
    printf("addr %d %s\n",addr,code);
    char code_0_5[7]={'\0'};
    char code_22_30[10]={'\0'};
    char code_21_30[11]={'\0'};
    char code_6_10[6]={'\0'};
    char code_30[2]={'\0'};
    char code_31[2]={'\0'};
    char code_26_30[6]={'\0'};
    char code_11_20[11]={'\0'};
    strncpy(code_0_5,code,6);
    strncpy(code_22_30,code+22,9);
    strncpy(code_21_30,code+21,10);
    strncpy(code_6_10,code+6,5);
    strncpy(code_30,code+30,1);
    strncpy(code_31,code+31,1);
    strncpy(code_26_30,code+26,5);
    strncpy(code_11_20,code+11,10);
    if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_22_30,"100001010")==0){
        add(code,cpu,&addr);
      }
      else if(strcmp(code_22_30,"111111111")==0){
        itof(code,cpu,&addr);
      }
      else if(strcmp(code_22_30,"000101000")==0){
        subf(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"0110111100")==0){
        mr(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"0000010111")==0){
        lwzx(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"0010010111")==0){
        stwx(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"1001010111")==0){
        lfdx(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"1011010111")==0){
        stfdx(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"0101010011")==0){
        mflr(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"0111010011")==0){
        if(strcmp(code_11_20,"0000001000")==0){
          mtlr(code,cpu,&addr);
        }
        else if(strcmp(code_11_20,"0000001001")==0){
          mtctr(code,cpu,&addr);
        }
      }
      else if(strcmp(code_21_30,"0000000000")==0){
        cmp(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"0000011000")==0){
        slw(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"1000011000")==0){
        srw(code,cpu,&addr);
      }
      else if(strcmp(code_22_30,"001101000")==0){
        neg(code,cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"001111")==0){
      lis(code,cpu,&addr);
    }
    
    else if(strcmp(code_0_5,"110010")==0){
      lfd(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"110110")==0){
      stfd(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"001011")==0){
      cmpi(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"010000")==0){
      if(code_30[0]=='0'){
        if(strcmp(code_6_10,"00100")==0){
          bne(code,cpu,&addr);
        }
        else if(strcmp(code_6_10,"00010")==0){
          bgt(code,cpu,&addr);
        }
        else if(strcmp(code_6_10,"00001")==0){
          blt(code,cpu,&addr);
        }
        else if(strcmp(code_6_10,"01000")==0){
          beq(code,cpu,&addr);
        }
      }
    }
    else if(strcmp(code_0_5,"000010")==0){
      in(code,cpu,&addr,file2);
    }
    else if(strcmp(code_0_5,"000100")==0){
      fin(code,cpu,&addr,file2);
    }
    else if(strcmp(code_0_5,"000011")==0){
      /*read(code,cpu,&addr);*/
    }
    else if(strcmp(code_0_5,"001110")==0){
      addi(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"000001")==0){
      out(code,cpu,&addr,file3);
    }
    else if(strcmp(code_0_5,"010011")==0){
      if(strcmp(code_21_30,"0000010000")==0){
        blr(code,cpu,&addr);
      }
      else if(strcmp(code_21_30,"1000010000")==0){
        bctr(code,cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"100100")==0){
      stw(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_21_30,"0101010011")==0){
        mflr(code,cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_21_30,"0110111100")==0){
        mr(code,cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"010010")==0){
      if(code_31[0] == '1'){
        bl(code,cpu,&addr);
      }
      else{
        b(code,cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"011111")==0){
      if(strcmp(code_21_30,"0111010011")==0){
        mtlr(code,cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"100101")==0){
      stwu(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"101110")==0){
      lmw(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"101111")==0){
      stmw(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"100000")==0){
      lwz(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"010101")==0){
      rlwinm(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"101010")==0){
      fslwi(code,cpu,&addr);
    }
    else if(strcmp(code_0_5,"111111")==0){
      if(strcmp(code_26_30,"10101")==0){
        fadd(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"10100")==0){
        fsub(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"11001")==0){
        fmul(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"10010")==0){
        fdiv(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"11110")==0){
        fabs2(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"01000")==0){
        fmr(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"10110")==0){
        fsqrt(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"00000")==0){
        fneg(code,cpu,&addr);
      }
      else if(strcmp(code_26_30,"00001")==0){
        fcmpu(code,cpu,&addr);
      }
      else if(strcmp(code_22_30,"111111100")==0){
        ftoi(code,cpu,&addr);
      }
      else if(strcmp(code_22_30,"111111111")==0){
        floor2(code,cpu,&addr);
      }
    }
    else{
      break;
    }
    if(x==1){
      print_reg(cpu);
    }
    check=0;
  }
}

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

int pow2(int n,int m){
  int ans = 1;
  for(int i=1;i<m+1;i++){
    ans*=n;
  }
  return ans;
}

unsigned int pow2_u(int n,int m){
  unsigned int ans = 1;
  for(int i=1;i<m+1;i++){
    ans=ans*n;
  }
  return ans;
}

long pow2_long(long n,int m){
  long ans=1;
  for(int i=1;i<m+1;i++){
    ans=ans * n;
  }
  return ans;
}

unsigned long pow2_ulong(long n,int m){
  unsigned long ans=1;
  for(int i=1;i<m+1;i++){
    ans=ans*n;
  }
  return ans;
}

int change_char_int(char x){
  int y=(int)x;
  int tmp=0;
  if(y>=0){
  for(int i=0;i<8;i++){
    tmp+=(y%2)*pow2(2,i);
    y=y/2;
  }
  }
  else{
    int y2 = ~y;
    for(int i=0;i<8;i++){
      if(y2%2==0){
        tmp+=pow(2,i);
      }
      y2=y2/2;
    }
  }
  return tmp;
}

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

void i_to_b_long(char *g,long i_g,int b ){
  if(i_g>=0){
  for(int i=0;i<b;i++){
    int r = i_g % 2;
    g[b-i-1] = r + 48;
    i_g = i_g / 2;
  }
  }
  else{
    long g2 = ~i_g;
    for(int i=0;i<b;i++){
      int r=g2%2;
      if(r==0){
        g[b-i-1]='1';
      }
      else{
        g[b-i-1]='0';
      }
      g2=g2/2;
    }
  }
}

unsigned int b_to_ui(char *s,int b,int e){
  int ans=0;
  for(int i=b;i<e+1;i++){
    if(s[i] == '1'){
      ans += pow2_u(2,e-i);
    }
  }
  return ans;
}

unsigned long b_to_ulong(char *s,int b,int e){
  long ans=0;
  for(int i=b;i<e+1;i++){
    if(s[i]=='1'){
      ans += pow2_ulong(2,e-i);
    }
  }
  return ans;
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

/*int b_to_i(char *s){
  int ans=0;
  if(s[0]=='0'){
    for(int i=1;i<32;i++){
      if(s[i]=='1'){
        ans+=pow2(2,31-i);
      }
    }
  }
  else{
    for(int i=1;i<32;i++){
      if(s[i]=='1'){
        ans+=pow2(2,31-i);
      }
    }
    ans -= pow2(2,31);
  }
  return ans;
  }*/

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

void fpu_or(char *ans,char *so,int x,int y){
  char tmp[2]="0";
  for(int i=x;i<y+1;i++){
    if(so[i]=='1'){
      tmp[0]='1';
    }
  }
  strcat(ans,tmp);
}

long b_to_long(char *s,int b,int e){
  long ans=0;
  for(int i=b;i<e+1;i++){
    if(s[i]=='1'){
      ans += pow2_long(2,e-i);
    }
  }
  return ans;
}

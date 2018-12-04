#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define N 50

typedef struct int_24{
  int addr : 24;
} addr_24;

typedef struct meirei{
  char name[100];
  char arg1[100];
  char arg2[100];
  char arg3[100];
  unsigned int addr;
} ins;

typedef struct llabel{
  char name[100];
  unsigned int addr;
  ins meirei[150];
} label;

void clean(char buf[256]){
  memset(buf,'\0',256);
}
void clean2(char buf[N][33]){
  for(int i=0;i<N;i++){
    memset(buf[i],'\0',33);
  }
}
unsigned char pow2(unsigned char d,int p){
  int t=1;
  for(int i=0;i<p;i++){
    t*=d;
  }
  return t;
}

/*1桁の数字のみ*/
int ctoi(char c){
  return 'c' - '0';
}

void change3bit(unsigned int l,char start[4]){
  int l1 = (int) (l >> 2);
  char k = '0' + l1;
  start[0]=k;
  for(int i=0;i<2;i++){
    int x = (int) (l>>i) - (int) ((l>>(i+1)) <<1);
    char n = '0' + x;
    start[2-i] = n;
  }
}

void change5bit(unsigned int i,char s[6]){
  int l1 = (int) (i>>4);
  int l2 = (int) (i>>3) - (int) ((i >> 4) << 1);
  int l3 = (int) (i>>2) - (int) ((i >> 3) << 1);
  int l4 = (int) (i>>1) - (int) ((i >> 2) << 1);
  int l5 = (int) i - (int) ((i>>1) << 1);

  s[0] = '0' + l1;
  s[1] = '0' + l2;
  s[2] = '0' + l3;
  s[3] = '0' + l4;
  s[4] = '0' + l5;
}

void change16bit(unsigned int l,char start[17]){
  int l1 = (int) (l >> 15);
  char k = '0' + l1;
  start[0] = k;
  for(int i=0;i<15;i++){
    int x1 = (int) (l>>i);
    int x2 = (int) ((l>>(i+1)) << 1);
    int x = x1 - x2;
    char n = '0' + x;
    start[15-i] = n;
  }
}


void change5bitf(int l,char s[6]){
  if(l>0){
    for(int i=0;i<5;i++){
      int x1 = l >> i;
      int x2 = (l >> (i+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      s[4-i]=n;
    }
  }
  else if(l==0){
    for(int i=0;i<5;i++){
      s[4-i]='0';
    }
  }
  else{
    int l2 = ~l;
    for(int i=0;i<5;i++){
      int x1 = l2 >> i;
      int x2 = (l2 >> (i+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      if(n=='0'){
        s[4-i] = '1';
      }
      else{
        s[4-i] = '0';
      }
    }
  }
}


void change16bitf(int l,char s[17]){
  if(l>0){
    for(int i=0;i<16;i++){
      int x1 = l >> i;
      int x2 = (l >> (i+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      s[15-i]=n;
    }
  }
  else if(l==0){
    for(int i=0;i<16;i++){
      s[15-i]='0';
    }
  }
  else{
    int l2 = ~l;
    for(int i=0;i<16;i++){
      int x1 = l2 >> i;
      int x2 = (l2 >> (i+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      if(n=='0'){
        s[15-i] = '1';
      }
      else{
        s[15-i] = '0';
      }
    }
  }
}


unsigned int search(label labellist[100],char *s){
  for(int i=0;i<100;i++){
    if(strcmp(labellist[i].name,s)==0){
      return labellist[i].addr;
    }
  }
  return (unsigned int) 0;
}

void extend15(int addr,char s[15]){
  if(addr > 0){
    for(int i=0;i<14;i++){
      s[i]='0';
    }
    for(int i=0;i<14;i++){
      int l = (addr >> i) - ((addr >> (i+1)) << 1);
      char n = '0' + l;
      s[13-i]=n;
    }
  }
  else if(addr == 0){
    for(int i=0;i<14;i++){
      s[i]='0';
    }
  }
  else{
    int naddr = ~addr;
    for(int i=0;i<14;i++){
      int l = (naddr >> i) - ((naddr >> (i+1)) << 1);
      char n;
      if(l==1){
        n='0';
      }
      else{
        n='1';
      }
      s[13-i]=n;
    }
  }
}

void cpy14bit(int addr,char s[15]){
  if(addr > 0){
    for(int i=0;i<14;i++){
      s[i]='0';
    }
    for(int i=0;i<14;i++){
      int l = (addr >> i) - ((addr >> (i+1)) << 1);
      char n = '0' + l;
      s[13-i]=n;
    }
  }
  else if(addr == 0){
    for(int i=0;i<14;i++){
      s[i]='0';
    }
  }
  else{
    int naddr = ~addr;
    for(int i=0;i<14;i++){
      int l = (naddr >> i) - ((naddr >> (i+1)) << 1);
      char n;
      if(l==1){
        n='0';
      }
      else{
        n='1';
      }
      s[13-i]=n;
    }
  }
}

void cpy24bit(int addr,char s[25]){
  if(addr > 0){
    for(int i=0;i<24;i++){
      s[i]='0';
    }
    for(int i=0;i<24;i++){
      int l = (addr >> i) - ((addr >> (i+1)) << 1);
      char n = '0' + l;
      s[23-i]=n;
    }
  }
  else if(addr == 0){
    for(int i=0;i<24;i++){
      s[i]='0';
    }
  }
  else{
    int naddr = ~addr;
    for(int i=0;i<24;i++){
      int l = (naddr >> i) - ((naddr >> (i+1)) << 1);
      char n;
      if(l==1){
        n='0';
      }
      else{
        n='1';
      }
      s[23-i]=n;
    }
  }
}
  
void change_reg_5bit(char *arg,char s[6]){
  int i=0;
  while(arg[i] != '('){
    i+=1;
  }
  i+=1;
  char t[10]={'\0'};
  int k=0;
  while(arg[i] != ')'){
    if(('0' <= arg[i]) && (arg[i] <= '9')){
    t[k] = arg[i];
    k+=1;
    }
    i+=1;
  }
  unsigned int x = (unsigned int) atoi(t);
  change5bit(x,s);
}

void change_reg_im_5bit(char *arg,char s[6]){
  int i=0;
  char t[10]={'\0'};
  int k=0;
  while(arg[i] != '('){
    t[k] = arg[i];
    i+=1;
    k+=1;
  }
  int x = atoi(t);
  change5bitf(x,s);
}

void change_reg_im_16bit(char *arg,char s[17]){
  int i=0;
  char t[10]={'\0'};
  int k=0;
  while(arg[i] != '('){
    t[k] = arg[i];
    i+=1;
    k+=1;
  }
  int x = atoi(t);
  change16bitf(x,s);
  }

static int count=0;

void changeb(label labellist[100],char ans[][33],label label){
  int num=0;
  for(int k=0;k<N;k++){
    num+=1;
    if((label.meirei[k]).name[0]!='\0'){
      count+=1;
      printf("%s %d\n",(label.meirei[k]).name,count);
    }
  if(strcmp((label.meirei[k]).name,"cmpwi")==0){
    char s1[7]="001011";
    char t[10];
    strncpy(t,(label.meirei[k]).arg1+2,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s2[4]={'\0'};
    change3bit(x,s2);

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg2+1,2);
    unsigned int x2 = (unsigned int) (atoi(t2));
    char s3[6]={'\0'};
    change5bit(x2,s3);

    unsigned int x3 = (unsigned int) (atoi((label.meirei[k]).arg3));
    char s4[17]={'\0'};
    change16bit(x3,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    ans[k][9]='0';
    ans[k][10]='0';
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if(strcmp((label.meirei[k]).name,"slw")==0){
    char s1[7] = "011111";

    char t[10];
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s2[6]={'\0'};
    change5bit(x,s2);

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg2+1,2);
    unsigned int x2 = (unsigned int) (atoi(t2));
    char s3[6]={'\0'};
    change5bit(x2,s3);

    char t3[10];
    strncpy(t3,(label.meirei[k]).arg3+1,2);
    unsigned int x3 = (unsigned int) (atoi(t3));
    char s4[6]={'\0'};
    change5bit(x3,s4);

    char s5[11]="0000011000";

    strcat(ans[k],s1);
    strcat(ans[k],s3);
    strcat(ans[k],s2);
    strcat(ans[k],s4);
    strcat(ans[k],s5);
    strcat(ans[k],"0");
  }
  else if(strcmp((label.meirei[k]).name,"cmpw")==0){
    char s1[7] = "100000";
    char t[10];

    strncpy(t,(label.meirei[k]).arg1+2,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s2[4]={'\0'};
    change3bit(x,s2);

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg2+1,2);
    unsigned int x2 = (unsigned int) (atoi(t2));
    char s3[6]={'\0'};
    change5bit(x2,s3);

    char t3[10];
    strncpy(t3,(label.meirei[k]).arg3+1,2);
    unsigned int x3 = (unsigned int) (atoi(t3));
    char s4[6] = {'\0'};
    change5bit(x3,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],"0");
    strcat(ans[k],"0");
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],"0000000000");
    strcat(ans[k],"0");
  }   
  else if(strcmp((label.meirei[k]).name,"bne")==0){
    char s1[7]="010000";

    char t[10];
    strncpy(t,(label.meirei[k]).arg1+2,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s[6]={'\0'};
    change5bit((unsigned int) (x*4+2),s);

    unsigned int addr1 = search(labellist,(label.meirei[k]).arg2);
    printf("addr1 %d\n",addr1);
    unsigned int addr2 = (label.meirei[k]).addr;
    int raddr = ((int) addr1 - (int) addr2)/4;/*本当はaddr1などはint型が良い*/
    char s2[15]={'\0'};
    extend15(raddr,s2);

    strcat(ans[k],s1);
    strcat(ans[k],"00100");
    strcat(ans[k],s);
    strcat(ans[k],s2);
    ans[k][30]='0';
    ans[k][31]='0';
  }
  else if(strcmp((label.meirei[k]).name,"blt")==0){
    char s1[7]="010000";

    char t[10];
    strncpy(t,(label.meirei[k]).arg1+2,2);
    unsigned int x = (unsigned int) atoi(t);
    char s[6] = {'\0'};
    change5bit((unsigned int) (x*4+0),s);

    unsigned int addr1 = search(labellist,(label.meirei[k]).arg2);
    unsigned int addr2 = (label.meirei[k]).addr;
    int raddr = ((int) addr1 - (int) addr2)/4;
    char s2[15]={'\0'};
    extend15(raddr,s2);

    strcat(ans[k],s1);
    strcat(ans[k],"00001");
    strcat(ans[k],s);
    strcat(ans[k],s2);
    ans[k][30]='0';
    ans[k][31]='0';
  }
  else if(strcmp((label.meirei[k]).name,"beq")==0){
     char s1[7]="010000";

    char t[10];
    strncpy(t,(label.meirei[k]).arg1+2,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s[6]={'\0'};
    change5bit((unsigned int) (x*4+1),s);

    unsigned int addr1 = search(labellist,(label.meirei[k]).arg2);
    unsigned int addr2 = (label.meirei[k]).addr;
    int raddr = ((int) addr1 - (int) addr2)/4;
    char s2[15]={'\0'};
    extend15(raddr,s2);

    strcat(ans[k],s1);
    strcat(ans[k],"00100");
    strcat(ans[k],s);
    strcat(ans[k],s2);
    ans[k][30]='0';
    ans[k][31]='0';
  }
  else if(strcmp((label.meirei[k]).name,"bgt")==0){
    char s1[7]="010000";

    char t[10];
    strncpy(t,(label.meirei[k]).arg1+2,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s[6]={'\0'};
    change5bit((unsigned int) (x*4+1),s);

    unsigned int addr1 = search(labellist,(label.meirei[k]).arg2);
    unsigned int addr2 = (label.meirei[k]).addr;
    int raddr = ((int) addr1 - (int) addr2)/4;
    char s2[15]={'\0'};
    extend15(raddr,s2);

    strcat(ans[k],s1);
    strcat(ans[k],"00010");
    strcat(ans[k],s);
    strcat(ans[k],s2);
    ans[k][30]='0';
    ans[k][31]='0';
  }                               
  else if(strcmp((label.meirei[k]).name,"li")==0){
    char s1[7]="001110";

    char t[10];
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) (atoi(t));
    char s[6]={'\0'};
    change5bit(x,s);

    int x2 = atoi((label.meirei[k]).arg2);
    char s2[17]={'\0'};
    change16bitf(x2,s2);

    strcat(ans[k],s1);
    strcat(ans[k],s);
    strcat(ans[k],"00000");
    strcat(ans[k],s2);
  }
  else if(strcmp((label.meirei[k]).name,"blr")==0){
    char s1[7] = "010011";

    char s2[6] = "10100";

    char s3[6] = "00000";

    char s4[4] = "000";/*なんでも良い*/

    char s5[3] = "00";

    char s6[11] = "0000010000";

    char s7[2] = "0";
    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],s5);
    strcat(ans[k],s6);
    strcat(ans[k],s7);
  }
  else if(strcmp((label.meirei[k]).name,"subi")==0){
    char s1[7] = "001110";

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    unsigned int x2 = (unsigned int) atoi(t2);
    char s2[6]={'\0'};
    change5bit(x2,s2);

    char t3[10];
    strncpy(t3,(label.meirei[k]).arg2+1,2);
    unsigned int x3 = (unsigned int) atoi(t3);
    char s3[6] = {'\0'};
    change5bit(x3,s3);

    char t4[10];
    int x4 = atoi((label.meirei[k]).arg3);
    char s4[17]={'\0'};
    change16bitf(-x4,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if(strcmp((label.meirei[k]).name,"stw")==0){
    char s1[7] = "100100";

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    char s2[6] = {'\0'};
    unsigned int x2 = (unsigned int) atoi(t2);
    change5bit(x2,s2);

    char s3[6] = {'\0'};
    change_reg_5bit((label.meirei[k]).arg2,s3);/*0(r3)などから3をchar型で取り出す*/

    char s4[17] = {'\0'};
    change_reg_im_16bit((label.meirei[k]).arg2,s4);/*0(r3)などから0をchar型で取り出す*/
    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if(strcmp((label.meirei[k]).name,"mflr")==0){
    char s1[7] = "011111";

    char t2[10] = {'\0'};
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    char s2[6] = {'\0'};
    unsigned int x2 = (unsigned int) atoi(t2);
    change5bit(x2,s2);

    char s3[11] = "0000001000";

    char s4[11] = "0101010011";

    char s5[2] = "0";/*ここは1でも0でも良い*/

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],s5);
  }
  else if((strcmp((label.meirei[k]).name,"mr")==0)){
    char s1[7] = "011111";

    char s2[6] = {'\0'};
    char t2[10] = {'\0'};
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    unsigned int x2 = (unsigned int) atoi(t2);
    change5bit(x2,s2);

    char s3[6] = {'\0'};
    char t3[10] = {'\0'};
    strncpy(t3,(label.meirei[k]).arg2+1,2);
    unsigned int x3 = (unsigned int) atoi(t3);
    change5bit(x3,s3);

    char s4[11] = "0110111100";

    char s5[2] = "0";
    strcat(ans[k],s1);
    strcat(ans[k],s3);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],s5);
  }
  else if((strcmp((label.meirei[k]).name,"addi")==0)){
    char s1[7] = "001110";

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    unsigned int x2 = (unsigned int) atoi(t2);
    char s2[6]={'\0'};
    change5bit(x2,s2);

    char t3[10];
    strncpy(t3,(label.meirei[k]).arg2+1,2);
    unsigned int x3 = (unsigned int) atoi(t3);
    char s3[6] = {'\0'};
    change5bit(x3,s3);

    char t4[10];
    int x4 = atoi((label.meirei[k]).arg3);
    char s4[17]={'\0'};
    change16bitf(x4,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);   
  }
  else if((strcmp((label.meirei[k]).name,"add")==0)){
    char s1[7] = "011111";

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    unsigned int x2 = (unsigned int) atoi(t2);
    char s2[6]={'\0'};
    change5bit(x2,s2);

    char t3[10];
    strncpy(t3,(label.meirei[k]).arg2+1,2);
    unsigned int x3 = (unsigned int) atoi(t3);
    char s3[6]={'\0'};
    change5bit(x3,s3);

    char t4[10];
    strncpy(t4,(label.meirei[k]).arg3+1,2);
    unsigned int x4 = (unsigned int) atoi(t4);
    char s4[6]={'\0'};
    change5bit(x4,s4);

    char s5[2] = "0";

    char s6[10] = "100001010";

    char s7[2] = "0";
    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],s5);
    strcat(ans[k],s6);
    strcat(ans[k],s7);
  }
  else if((strcmp((label.meirei[k]).name,"sub")==0)){
    char s1[7] = "011111";

    char t2[10];
    strncpy(t2,(label.meirei[k]).arg1+1,2);
    unsigned int x2 = (unsigned int) atoi(t2);
    char s2[6]={'\0'};
    change5bit(x2,s2);

    char t3[10];
    strncpy(t3,(label.meirei[k]).arg2+1,2);
    unsigned int x3 = (unsigned int) atoi(t3);
    char s3[6]={'\0'};
    change5bit(x3,s3);

    char t4[10];
    strncpy(t4,(label.meirei[k]).arg3+1,2);
    unsigned int x4 = (unsigned int) atoi(t4);
    char s4[6]={'\0'};
    change5bit(x4,s4);

    char s5[2]="0";

    char s6[10] = "000101000";
    char s7[2]="0";

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s4);
    strcat(ans[k],s3);
    strcat(ans[k],s5);
    strcat(ans[k],s6);
    strcat(ans[k],s7);
  }
  else if((strcmp((label.meirei[k]).name,"bl")==0)){
    char s1[7] = "010010";


    unsigned int addr1 = search(labellist,(label.meirei[k]).arg1);
    unsigned int addr2 = (label.meirei[k]).addr;
    //printf("ラベル%d\n",(int) addr1);
    int rel = ((int) addr1 - (int) addr2)/4;
    char s2[25]={'\0'};
    cpy24bit(rel,s2);

    char s3[2] = "0";

    char s4[2] = "1";

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if((strcmp((label.meirei[k]).name,"lwz")==0)){
    char s1[7] = "100000";

    char s2[6] = {'\0'};
    char t[10] = {'\0'};

    strncpy(t,(label.meirei[k]).arg1+1,3);
    unsigned int x = (unsigned int) atoi(t);
    change5bit(x,s2);

    char s3[6]={'\0'};
    change_reg_5bit((label.meirei[k]).arg2,s3);

    char s4[17]={'\0'};
    change_reg_im_16bit((label.meirei[k]).arg2,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if((strcmp((label.meirei[k]).name,"mtlr")==0)){
    char s1[7] = "011111";

    char s2[6] = {'\0'};
    char t[10] = {'\0'};
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) atoi(t);
    change5bit(x,s2);

    char s3[11] = "0000001000";

    char s4[11] = "0111010011";
    char s5[2] = "0";/*なんでも良い*/

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],s5);
  }
  else if((strcmp((label.meirei[k]).name,"stmw")==0)){
    char s1[7] = "101111";

    char s2[6] = {'\0'};
    char t[10] = {'\0'};
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) atoi(t);
    change5bit(x,s2);

    char s3[6] = {'\0'};
    change_reg_5bit((label.meirei[k]).arg2,s3);

    char s4[17] = {'\0'};
    change_reg_im_16bit((label.meirei[k]).arg2,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if((strcmp((label.meirei[k]).name,"stwu")==0)){
    char s1[7] = "100101";

    char s2[6] = {'\0'};
    char t[10] = {'\0'};
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) atoi(t);
    change5bit(x,s2);

    char s3[6] = {'\0'};
    change_reg_5bit((label.meirei[k]).arg2,s3);

    char s4[17] = {'\0'};
    change_reg_im_16bit((label.meirei[k]).arg2,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if((strcmp((label.meirei[k]).name,"bcl")==0)){
    char s1[7] = "010000";
    char s2[6] = {'\0'};
    change_reg_im_5bit((label.meirei[k]).arg1,s2);
    char s3[6] = {'\0'};
    change_reg_im_5bit((label.meirei[k]).arg2,s3);

    unsigned int addr1 = search(labellist,(label.meirei[k]).arg3);
    unsigned int addr2 = (label.meirei[k]).addr;
    int rel = ((int) addr1 - (int) addr2)/4;
    char s4[15]={'\0'};
    cpy14bit(rel,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
    strcat(ans[k],"01");
  }
  else if((strcmp((label.meirei[k]).name,"lmw")==0)){
    char s1[7] = "101110";

    char s2[6] = {'\0'};
    char t[10] = {'\0'};
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) atoi(t);
    change5bit(x,s2);

    char s3[6] = {'\0'};
    change_reg_5bit((label.meirei[k]).arg2,s3);

    char s4[17] = {'\0'};
    change_reg_im_16bit((label.meirei[k]).arg2,s4);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],s3);
    strcat(ans[k],s4);
  }
  else if((strcmp((label.meirei[k]).name,"out")==0)){
    char s1[7] = "000001";
    char s2[6] = {'\0'};
    char t[10];
    strncpy(t,(label.meirei[k]).arg1+1,2);
    unsigned int x = (unsigned int) atoi(t);
    change5bit(x,s2);

    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],"000000000000000000000");
  }
  else if((strcmp((label.meirei[k]).name,"b")==0)){
    char s1[7]="010010";

    unsigned int addr1 = search(labellist,(label.meirei[k]).arg1);
    unsigned int addr2 = (label.meirei[k]).addr;
    int rel = ((int)addr1 - (int)addr2)/4;

    char s2[25]={'\0'};
    cpy24bit(rel,s2);
    strcat(ans[k],s1);
    strcat(ans[k],s2);
    strcat(ans[k],"0");
    strcat(ans[k],"0");
  } 
  else{
    if((label.meirei[k]).name[0]!='\0'){
    printf("%sがアセンブリに変換されていません\n",(label.meirei[k]).name);
    }
  }
  }
}

void c_int_bit(char *s,int len,unsigned char codelist[4]){
  unsigned char t1=0;
  unsigned char t2=0;
  unsigned char t3=0;
  unsigned char t4=0;
  for(int k = 0;k<8;k++){
    if(s[k]=='1'){
      t1+=pow2(2,7-k);
    }
    if(s[k+8]=='1'){
      t2+=pow2(2,7-k);
    }
    if(s[k+16]=='1'){
      t3+=pow2(2,7-k);
    }
    if(s[k+24]=='1'){
      t4+=pow2(2,7-k);
    }
  }
  codelist[0]=t1;
  codelist[1]=t2;
  codelist[2]=t3;
  codelist[3]=t4;
}
    
    

void yomikomi(label labellist[100],int labelnum,int insnum,int j,char buf[256],unsigned int addr){
  if(j==0){
    strcpy((labellist[labelnum].meirei)[insnum].name,buf);
  }
  else if(j==1){
    strcpy((labellist[labelnum].meirei)[insnum].arg1,buf);
  }
  else if(j==2){
    strcpy((labellist[labelnum].meirei)[insnum].arg2,buf);
  }
  else if(j==3){
    strcpy((labellist[labelnum].meirei)[insnum].arg3,buf);
  }
  (labellist[labelnum].meirei)[insnum].addr = addr;
}





int main(int argc,char *argv[]){
  label labellist[100];
  int labelnum=-1;
  int insnum=0;/*命令の数*/
  unsigned int addr=4;
  FILE *fp;
  char buf[256];
  int i=0;
  int j=0;/*j=0 命令を読む、j=1 第1引数を読む、j=2 第2,j=3 第3*/

  char ch;
  int state = 0;/*初期状態*/
  char start[256];

  fp = fopen(argv[1],"r");
  while((ch=fgetc(fp)) != EOF){
    if(ch == '.'){
      state = 1;
    }
    else if((state==1)&&(ch == 'g')){
      state=2;
    }
    else if((state==2)&&(ch == 'l')){
      state=3;
    }
    else if((state==3)&&(ch == 'o')){
      state=4;
    }
    else if((state==4)&&(ch == 'b')){
      state=5;
    }
    else if((state==5)&&(ch == 'l')){
      state=7;
    }
    else if((state==6)&&(ch == 'l')){
      state=7;
    }
    else if(state==7){
      if(ch == '\n'){
        strcpy(start,buf);
        clean(buf);
        state=0;
      }
      else if((ch != ' ')&&(ch != '\t')){
        buf[i] = ch;
        i+=1;
      }
    }
    else{
      state=0;
    }
  }
  clean(buf);
  i=0;
  state=0;
  rewind(fp);
  int addrc;

 
  while((ch = fgetc(fp)) != EOF){
    if((state==0) && (ch == '\n')){
      clean(buf);
      i=0;
    }
    else if((state==0)&&((ch =='\t')||(ch==' '))){
    }
    else if(ch == ':'){
      labelnum+=1;
      strcpy(labellist[labelnum].name,buf);
      labellist[labelnum].addr = addr;
      state = 1;
      if(strcmp(buf,start)==0){
        addrc = addr;
      }
      clean(buf);
      i=0;
      insnum=0;
    }
    else if(state==0){
      buf[i]=ch;
      i+=1;
    }
    else if((state==1)&&(ch == '\n')){
      clean(buf);
      i=0;
      state=4;
    }
    else if(state==1){
    }
    else if((state==4)&&((ch=='\t')||(ch==' '))){
    }
    else if((state==4)&&(ch=='#')){
      state=3;
    }
    else if(state==4){
      state=5;
      buf[i]=ch;
      i+=1;
    }
    else if((state==5)&&((ch =='\t')||(ch==' '))){
      yomikomi(labellist,labelnum,insnum,j,buf,addr);
      j+=1;
      clean(buf);
      i=0;
      state=2;
    }
    else if((state==5)&&(ch=='\n')){
      yomikomi(labellist,labelnum,insnum,j,buf,addr);
      j=0;
      i=0;
      insnum+=1;
      addr = addr + (unsigned int) 4;
      state=4;
      clean(buf);
    }
    else if((state==5)&&(ch=='#')){
      state=3;
    }
    else if(state==5){
      buf[i]=ch;
      i+=1;
    }
    else if((state==2)&&(ch == '\n')){
      yomikomi(labellist,labelnum,insnum,j,buf,addr);
      clean(buf);
      i=0;
      j=0;
      insnum+=1;
      addr = addr + (unsigned int) 4;
      state=4;
    }
    else if((state==2)&&((ch == '\t')||(ch==' '))){
    }
    else if((state==2)&&(ch == ',')){
      yomikomi(labellist,labelnum,insnum,j,buf,addr);
      j+=1;
      clean(buf);
      i=0;
    }
    else if((state==2)&&(ch == '#')){
      state=3;
    }
    else if(state==2){
      buf[i]=ch;
      i+=1;
    }
    else if((state==3)&&(ch == '\n')){
      state=4;
    }
    else if(state==3){
    }
    else{
    }
  }

  // 出力ファイルがアセンブリファイルの名前と一致するように書き換えました。by BOBO
  char* output_file = malloc((strlen(argv[1]) - 2) * sizeof(char));
  memcpy(output_file, argv[1], (strlen(argv[1]) - 2) * sizeof(char));
  printf("assembling %s to %s ...\n", argv[1]);
  FILE *fp2;
  fp2 = fopen(output_file,"wb");
  
  char code[7] = "010010";
  char code2[25];
  cpy24bit(addrc/4,code2);
  printf("%d\n",addrc);
  char codeall[33];
  strcat(codeall,code);
  strcat(codeall,code2);
  codeall[30]='0';
  codeall[31]='0';
  //printf("codeall%s\n",codeall);
  unsigned char listx[4];
  c_int_bit(codeall,32,listx);
  //printf("%d %d %d %d\n",listx[0],listx[1],listx[2],listx[3]);
  //printf("%s\n",codeall);
  fwrite(listx,sizeof(listx[0]),sizeof(listx),fp2);
  for(int k=0;k<labelnum+1;k++){
    char code[N][33];
    changeb(labellist,code,labellist[k]);
    for(int h=0;h<N;h++){
      if(k==0){
        //printf("%s\n",code[0]);
      }
      unsigned char codelist[4];
      if(code[h][0]!='\0'){
      c_int_bit(code[h],32,codelist);
      //printf("%d %d %d %d\n",codelist[0],codelist[1],codelist[2],codelist[3]);
      fwrite(codelist,sizeof(codelist[0]),sizeof(codelist),fp2);
      }
    }
    clean2(code);
  }
  fclose(fp2);
  return 0;
}
    
    
      



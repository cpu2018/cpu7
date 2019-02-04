#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define N 1500
#define NAME 100
#define MEIREI 1500
#define LABELNUM 10000
#define FDATANUM 500

typedef struct data{
  char name[NAME];
  char num[NAME];
  unsigned int addr;
} fdata;

typedef struct llabel{
  char name[NAME];
  unsigned int addr;
  int num;
} label;

void clean_buf(char *buf){
  int len = strlen(buf);
  for(int i=0;i<len;i++){
    buf[i]='\0';
  }
}

void clean_buf_2(char buf[N][33]){
  for(int i=0;i<N;i++){
    memset(buf[i],'\0',33);
  }
}

/*int型のpowでnのm乗*/
int pow22(int n,int m){
  int ans = 1;
  for(int i=1;i<m+1;i++){
    ans*=n;
  }
  return ans;
}


int b_to_i(char *s,int b,int e){
  int ans=0;
  for(int i=b;i<e+1;i++){
    if(s[i] == '1'){
      ans += pow22(2,e-i);
    }
  }
  return ans;
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

/*void i_to_b(char *g,int i_g,int b){
  for(int i=0;i<b;i++){
    int r = i_g % 2;
    g[b-i-1] = r + 48;
    i_g = i_g / 2;
  }
  }*/

long pow_int(int k,int i){
  long l=1;
  for(int j=0;j<i;j++){
    l*=k;
  }
  return l;
}

long c_to_l(char *c){
  long l=atol(c);
  return l;
}


void change_num2(char s[33],unsigned int l){
  if(l>0){
    for(int j=0;j<32;j++){
      int x1 = l >> j;
      int x2 = (l >> (j+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      s[(32-1)-j]=n;
    }
  }
  else if(l==0){
    for(int j=0;j<32;j++){
      s[(32-1)-j]='0';
    }
  }
  else{
    int l2 = ~l;
    for(int j=0;j<32;j++){
      int x1 = l2 >> j;
      int x2 = (l2 >> (j+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      if(n=='0'){
        s[(32-1)-j]='1';
      }
      else{
        s[(32-1)-j] = '0';
      }
    }
  }
}

void change_num(char s[33],long l){
  if(l>0){
    for(int j=0;j<32;j++){
      int x1 = l >> j;
      int x2 = (l >> (j+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      s[(32-1)-j]=n;
    }
  }
  else if(l==0){
    for(int j=0;j<32;j++){
      s[(32-1)-j]='0';
    }
  }
  else{
    int l2 = ~l;
    for(int j=0;j<32;j++){
      int x1 = l2 >> j;
      int x2 = (l2 >> (j+1)) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      if(n=='0'){
        s[(32-1)-j]='1';
      }
      else{
        s[(32-1)-j] = '0';
      }
    }
  }
}
  

unsigned char pow2(unsigned char d,int p){
  int t=1;
  for(int i=0;i<p;i++){
    t*=d;
  }
  return t;
}

int ctoi(char c){
  return 'c' - '0';
}

void change_ibit(unsigned int l,char *s,int i){
  int l1 = (int) (l >> (i-1));
  char k = '0' + l1;
  s[0] = k;
  for(int j=0;j<(i-1);j++){
    int x = (int) (l>>j) - (int) ((l>>(j+1)) << 1);
    char n = '0' + x;
    s[(i-1)-j] = n;
  }
}

void change_ibit_f(int l,char *s,int i){
  if(l>0){
    for(int j=0;j<i;j++){
      int x1 = l >> j;
      int x2 = (x1 >> 1) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      s[(i-1)-j]=n;
    }
  }
  else if(l==0){
    for(int j=0;j<i;j++){
      s[(i-1)-j]='0';
    }
  }
  else{
    int l2 = ~l;
    for(int j=0;j<i;j++){
      int x1 = l2 >> j;
      int x2 = (x1 >> 1) << 1;
      int x = x1 - x2;
      char n = '0' + x;
      if(n=='0'){
        s[(i-1)-j]='1';
      }
      else{
        s[(i-1)-j] = '0';
      }
    }
  }
}


unsigned int search(label labellist[LABELNUM],char *s){
  for(int i=0;i<LABELNUM;i++){
    if(strcmp(labellist[i].name,s)==0){
      return labellist[i].addr;
    }
  }
  return (unsigned int) 0;
}

void change_bit_char(char *rc,char *x,int i){
  *x=0;
  for(int i=0;i<8;i++){
    if(rc[i]=='1'){
      *x+=pow_int(2,7-i);
    }
  }
}

void change_bit_char_list(char code[33],char code2[5]){
  for(int i=0;i<4;i++){
    char rc[9]={'\0'};
    strncpy(rc,code+i*8,8);
    char x;
    change_bit_char(rc,&x,8);
    code2[i]=x;
  }
}





    

void write_start(label *list,int num,char *start,FILE *fp){
  char code[33]={'\0'};
  char code1[7]="010010";
  char code2[25]={'\0'};
  unsigned int addr = search(list,start);
  int rel = (int) addr/4;
  change_ibit_f(rel,code2,24);
  strcat(code,code1);
  strcat(code,code2);
  strcat(code,"00");
  char ncode[5]={'\0'};
  change_bit_char_list(code,ncode);
  fwrite(ncode,sizeof(ncode[0]),sizeof(ncode)-1,fp);
}




  
/*void write_data(fdata *list,int num,FILE *fp){
  char data[33]={'\0'};
  for(int i=0;i<(num);i++){
    strcpy(data,list[i].num);
    char ndata[5]={'\0'};
    change_bit_char_list(data,ndata);
    fwrite(ndata,sizeof(ndata[0]),sizeof(ndata)-1,fp);
  }
  }*/

void search_data(char *code,fdata *flist,int fnum,char *label){
  for(int i=0;i<fnum;i++){
    if(strcmp((flist[i]).name,label)==0){
      strcpy(code,(flist[i]).num);
    }
  }
}

void search_label(char *code,label *list,int lnum,char *label){
  for(int i=0;i<lnum;i++){
    if(strcmp((list[i]).name,label)==0){
      char num2[33]={'\0'};
      long l2 = (long) (list[i].addr);
      change_num(num2,l2);
      strcpy(code,num2);
    }
  }
}

void change_arg_lo(char *arg,char *x,label *list,fdata *flist,int lnum,int fnum){
  int len = strlen(arg);
  char label[33]={'\0'};
  strncpy(label,arg+5,len-6);
  char code[33]={'\0'};
  search_data(code,flist,fnum,label);
  if(strcmp(code,"")==0){
    search_label(code,list,lnum,label);
  }
  for(int i=0;i<32;i++){
    x[i]='0';
  }
  for(int i=0;i<16;i++){
    x[i+16]=code[i+16];
  }
}

void change_arg_ha(char *arg,char *x,label *list,fdata *flist,int lnum,int fnum){
  int len = strlen(arg);
  char label[33]={'\0'};
  strncpy(label,arg+5,len-6);
  char code[33]={'\0'};
  search_data(code,flist,fnum,label);
  if(strcmp(code,"")==0){
    search_label(code,list,lnum,label);
  }
  for(int i=0;i<32;i++){
    x[i]='0';
  }
  for(int i=0;i<16;i++){
    x[i+16]=code[i];
  }
}


void change_arg_reg(char *arg,char *x){
  char code[4]={'\0'};
  strncpy(code,arg+1,2);
  int k = atoi(code);
  change_ibit_f(k,x,32);                   
}

void change_arg_cr(char *arg,char *x){
  char code[4]={'\0'};
  strncpy(code,arg+2,2);
  int k = atoi(code);
  change_ibit_f(k,x,32);
}

void change_arg_im(char *arg,char *x){
  int k = atoi(arg);
  change_ibit_f(k,x,32);
}

void change_arg_label(char *arg,char *x,label *list,int lnum,unsigned int addr){
  unsigned int addr1 = search(list,arg);
  unsigned int addr2 = addr;

  int rel = (int) addr1 - (int) addr2;

  change_ibit_f(rel/4,x,32);/*変更*/

}



void change_arg(char *arg,char *x,label *list,fdata *flist,int lnum,int fnum,unsigned int addr){
  if(strncmp("lo16",arg,4)==0){
    change_arg_lo(arg,x,list,flist,lnum,fnum);
  }
  else if(strncmp("ha16",arg,4)==0){
    change_arg_ha(arg,x,list,flist,lnum,fnum);
  }
  else if(((arg[0]=='r')||(arg[0]=='f'))&&('0'<=arg[1])&&(arg[1]<='9')){
    change_arg_reg(arg,x);
  }
  else if((strncmp("cr",arg,2)==0)&&('0'<=arg[2])&&(arg[2]<='9')){
    change_arg_cr(arg,x);
  }
  else if(arg[0]=='-'){
    change_arg_im(arg,x);
  }
  else if((arg[0]<='9')&&('0'<=arg[0])){
    change_arg_im(arg,x);
  }
  else{
    change_arg_label(arg,x,list,lnum,addr);
  }
}

void change_arg_reverse(char *arg,char *x){
  int k = atoi(arg) * (-1);
  change_ibit_f(k,x,32);
}

void clean_code(char code[33]){
  for(int i=0;i<33;i++){
    code[i]='\0';
  }
}

void change_arg_mem(char *arg,char *x){
  char c1[10]={'\0'};
  char c2[10]={'\0'};
  int j=0;
  int p=0;
  int len=strlen(arg);
  for(int i=0;i<len;i++){
    if(p==0){
      if(arg[i]=='('){
        p=1;
        j=0;
      }
      else{
        c2[j]=arg[i];
        j+=1;
      }
    }
    else if(p==1){
      if(arg[i]==')'){
        p=2;
      }
      else if(('0'<=arg[i])&&(arg[i]<='9')){
        c1[j]=arg[i];
        j+=1;
      }
    }
  }
  unsigned int k1 = (unsigned int) atoi(c1);
  int k2 = atoi(c2);
  char x1[17]={'\0'};
  char x2[17]={'\0'};
  change_ibit(k1,x1,16);
  change_ibit_f(k2,x2,16);
  strcat(x,x1);
  strcat(x,x2);
}

//void change_ibit_char_list(char *data,char *nans);

void write_data(char *data,unsigned int *a,FILE *fp){
  int addr = *a;
  char nans[5]={'\0'};
  change_bit_char_list(data,nans);
  fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
  *a+=4;
}


void write_ins(label *list,int lnum,fdata *flist,int fnum,FILE *fp,char *name,char *arg1,char *arg2,char *arg3,unsigned int *a){
  int addr = *a;
  char code[33]={'\0'};
  char ans[33]={'\0'};
  if(strcmp(name,"cmpwi")==0){
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      char s1[7] = "001011";
      char s2[4] = {'\0'};
      strncpy(s2,code+29,3);
      clean_code(code);
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      char s3[6] = {'\0'};
      strncpy(s3,code+27,5);
      clean_code(code);
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      char s4[17]={'\0'};
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      ans[9]='0';
      ans[10]='0';
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"slw")==0){
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      char s1[7]="011111";
      char s2[6]={'\0'};
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="0000011000";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"srw")==0){
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      char s1[7]="011111";
      char s2[6]={'\0'};
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="1000011000";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"cmpw")==0){
      char s1[7]="011111";
      char s2[4]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+29,3);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"00");
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"00000000000");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"bne")==0){
      char s1[7]="010000";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[15]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+18,14);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,"00100");
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"00");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"blt")==0){
      char s1[7]="010000";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[15]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+18,14);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,"00001");
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"00");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"beq")==0){
      char s1[7]="010000";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[15]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+18,14);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,"01000");
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"00");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"bgt")==0){
      char s1[7]="010000";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[15]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+18,14);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,"00010");
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"00");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"li")==0){
      char s1[7]="001110";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[17]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"00000");
      strcat(ans,s3);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"blr")==0){
      char s1[7]="010011";
      char s2[6]="10100";
      char s3[6]="00000";
      char s4[4]="000";
      char s5[3]="00";
      char s6[11]="0000010000";
      char s7[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,s7);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"subi")==0){
      char s1[7]="001110";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[17]={'\0'};
      change_arg_reverse(arg3,code);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"stfd")==0){
      char s1[7]="110110";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"stwx")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="0010010111";
      char s6[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    } 
    else if(strcmp(name,"stw")==0){
      char s1[7]="100100";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);/*-3(r3)など用*/
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"mflr")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[11]="0000001000";
      char s4[11]="0101010011";
      char s5[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"mr")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[11]="0110111100";
      char s5[2]="0";
      strcat(ans,s1);
      strcat(ans,s3);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"addi")==0){
      char s1[7]="001110";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[17]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"in")==0){
      char s1[7]="000010";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"000000000000000000000");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fin")==0){
      char s1[7]="000100";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"000000000000000000000");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"itof")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"0000001111111110");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"add")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[2]="0";
      char s6[10]="100001010";
      char s7[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,s7);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"sub")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[2]="0";
      char s6[10]="000101000";
      char s7[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s4);
      strcat(ans,s3);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,s7);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    
    else if(strcmp(name,"bl")==0){
      char s1[7]="010010";
      char s2[25]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+8,24);
      char s3[2]="0";
      char s4[2]="1";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"lwzx")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="0000010111";
      char s6[2]="0";/*なんでも良い*/
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }     
    else if(strcmp(name,"lwz")==0){
      char s1[7]="100000";
      char s2[6] ={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"mtctr")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[11]="0000001001";
      char s4[11]="0111010011";
      char s5[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }      
    else if(strcmp(name,"mtlr")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[11]="0000001000";
      char s4[11]="0111010011";
      char s5[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"stmw")==0){
      char s1[7]="101111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"stwu")==0){
      char s1[7]="100101";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"bctr")==0){
      char s1[7]="010011";
      char s2[6]="10100";/*20無条件*/
      char s3[6]="00000";/*cr0*/
      char s4[4]="000";/*なんでも良い*/
      char s5[3]="00";/*BH*/
      char s6[11]="1000010000";
      char s7[2]="0";/*LK*/
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,s7);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"bctrl")==0){
      char s1[7]="010011";
      char s2[6]="10100";/*20無条件*/
      char s3[6]="00000";/*cr0*/
      char s4[4]="000";/*なんでも良い*/
      char s5[3]="00";/*BH*/
      char s6[11]="1000010000";
      char s7[2]="1";/*LK*/
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,s7);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"bcl")==0){
      char s1[7]="010000";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[15]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+18,14);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"01");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"lmw")==0){
      char s1[7]="101110";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"read")==0){
      char s1[7]="000011";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"000000000000000000000");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"out")==0){
      char s1[7]="000001";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"000000000000000000000");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"b")==0){
      char s1[7]="010010";
      char s2[25]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+8,24);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"00");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fslwi")==0){
      char s1[7]="101010";
      char s2[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[6]="00000";
      char s6[6]={'\0'};
      for(int b=0;b<5;b++){
        if(s4[b]=='1'){
          s6[b]='0';
        }
        else{
          s6[b]='1';
        }
      }
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"slwi")==0){
      char s1[7]="010101";
      char s2[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[6]="00000";
      char s6[6]={'\0'};
      for(int b=0;b<5;b++){
        if(s4[b]=='1'){
          s6[b]='0';
        }
        else{
          s6[b]='1';
        }
      }
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"srwi")==0){
      char s1[7]="010101";
      char s2[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4_sub[6]={'\0'};
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4_sub,code+27,5);
      int x = b_to_i(s4_sub,0,4);
      int y = 32 - x;
      i_to_b(s4,y,5);

      
      clean_code(code);
      char s5[6]={'\0'};
      strcpy(s5,s4_sub);
      char s6[6]="11111";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }/*ここからシミュレータ未実装*/
    else if(strcmp(name,"addis")==0){
      char s1[7]="001111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[17]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"lis")==0){/*addis*/
      char s1[7]="001111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]="00000";
      char s4[17]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"stfdx")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="1011010111";
      char s6[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }        
    else if(strcmp(name,"lfdx")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="1001010111";
      char s6[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,s6);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }              
    else if(strcmp(name,"lfd")==0){
      char s1[7]="110010";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      char s4[17]={'\0'};
      change_arg_mem(arg2,code);
      strncpy(s3,code+11,5);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fmr")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]="00000";
      char s4[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s5[11]="0001001000";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s5);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fcmpu")==0){
      char s1[7]="111111";
      char s2[4]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+29,3);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,"00");
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"0000000001");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fneg")==0){/*p142*/
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]="00000";
      char s4[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      char s6[11]="0000000000";
      char s7[2]="0";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,s6);
      strcat(ans,s7);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fsqrt")==0){/*p146*/
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"00000");
      strcat(ans,"00000");
      strcat(ans,"10110");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"floor")==0){/*仕様はなぞ*/
      char s1[7]="111111";/*適当*/
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"0000001111111110");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fabs")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"000000");
      strcat(ans,"111111110");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fadd")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"0");
      strcat(ans,"000010101");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fsub")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"0");
      strcat(ans,"000010100");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fmul")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"0");
      strcat(ans,"000011001");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"fdiv")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,s4);
      strcat(ans,"0");
      strcat(ans,"000010010");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"ftoi")==0){
      char s1[7]="111111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"00000");
      strcat(ans,"01111");
      strcat(ans,"11100");
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"neg")==0){
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[10]="001101000";
      strcat(ans,s1);
      strcat(ans,s2);
      strcat(ans,s3);
      strcat(ans,"000000");
      strcat(ans,s4);
      strcat(ans,"0");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"ori")==0){/*p82*/
      char s1[7]="011000";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[17]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+16,16);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s3);
      strcat(ans,s2);
      strcat(ans,s4);
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else if(strcmp(name,"or")==0){/*p82*/
      char s1[7]="011111";
      char s2[6]={'\0'};
      change_arg(arg1,code,list,flist,lnum,fnum,addr);
      strncpy(s2,code+27,5);
      clean_code(code);
      char s3[6]={'\0'};
      change_arg(arg2,code,list,flist,lnum,fnum,addr);
      strncpy(s3,code+27,5);
      clean_code(code);
      char s4[6]={'\0'};
      change_arg(arg3,code,list,flist,lnum,fnum,addr);
      strncpy(s4,code+27,5);
      clean_code(code);
      strcat(ans,s1);
      strcat(ans,s3);
      strcat(ans,s2);
      strcat(ans,s4);
      strcat(ans,"01101111000");
      char nans[5]={'\0'};
      change_bit_char_list(ans,nans);
      fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
      *a+=4;
    }
    else{
      int q = strlen(name);
      if((strcmp(name,"")!=0)&&(name[q-1]!=':')){
        //printf("%s\n",name);
      }
    }
}

void write_data2(FILE *fp,int num){
  char x[33]={'\0'};
  i_to_b(x,num,32);
  char nans[5]={'\0'};
  change_bit_char_list(x,nans);
  fwrite(nans,sizeof(nans[0]),sizeof(nans)-1,fp);
}






    

int main(int argc,char **argv){
  char start_label[NAME]={'\0'};
  label label_list[LABELNUM];
  int labelnum=0;
  int insnum=0;
  unsigned int addr = 4;//0
  FILE *fp;
  char buf[256]={'\0'};
  int i=0;/*bufのいち*/
  int j=0;/*j=0 命令を読む。j=1 第一引数を読む。 j=2 第２*/

  char ch;
  int state = 0;/*初期*/
  fdata fdata_list[FDATANUM];
  int fdata_num = 0;
  int na = 0;

  char* output_file = malloc((strlen(argv[1]) - 2) * sizeof(char));
  memcpy(output_file, argv[1], (strlen(argv[1]) - 2) * sizeof(char));
  printf("assembling %s to %s ...\n", argv[1], output_file);
  FILE *fp2;
  fp2 = fopen(output_file,"wb");

  fp = fopen(argv[1],"r");

  fwrite("0000",sizeof(char),4,fp2);
  while((ch = fgetc(fp)) != EOF){
    if(ch == '.'){
      clean_buf(buf);
      i=0;
      state=1;/*セクションを読み込む状態*/
    }
    else if((state==1)&&(ch == 'd')){
      state=2;/*.dataの読み込み*/
    }
    else if((state==1)&&(ch == 'g')){
      state=6;/*.globlの読み込み*/
      na=addr;
    }
    else if((state==2)&&(ch=='\n')){
      state=3;/*セクションの読み込み終わり、ラベルの読み込み*/
      clean_buf(buf);
      i=0;
    }
    else if((state==3)&&(ch==':')){
      state=4;/*ラベルの読み込み終わり*/
      strcpy(fdata_list[fdata_num].name,buf);
      clean_buf(buf);
      fdata_list[fdata_num].addr=addr;
      i=0;
    }
    else if((state==3)&&((ch=='\t')||(ch==' '))){
    }
    else if(state==3){
      buf[i]=ch;
      i+=1;
    }
    else if((state==4)&&(ch=='\n')){
      state=5;/*dataを読む*/
      printf(" %d ",addr);
    }
    else if((state==5)&&((ch==' ')||(ch=='\t'))){
    }
    else if((state==5)&&(ch=='\n')){
      state=3;/*次のラベルを読む*/
      char num[33]={'\0'};
      long l = c_to_l(buf);
      change_num(num,l);
      char num2[33]={'\0'};
      long l2 = (long) addr;
      change_num(num2,l2);
      strcpy(fdata_list[fdata_num].num,num2);
      write_data(num,&addr,fp2);
      clean_buf(buf);
      i=0;
      fdata_num+=1;
    }
    else if(state==5){
      buf[i]=ch;
      i+=1;
    }
    else if((state==6)&&(ch==' ')){
      state=7;
    }
    else if((state==7)&&(ch=='\n')){
      strcpy(start_label,buf);
      //printf("%s\n",start_label);
      clean_buf(buf);
      i=0;
      state=8;/*命令ラベルを読み込む*/
    }
    else if(state==7){
      buf[i]=ch;
      i+=1;
    }
    else if((state==8)&&(ch==':')){
      strcpy(label_list[labelnum].name,buf);
      clean_buf(buf);
      i=0;
      label_list[labelnum].addr = addr;
      //printf("%d",addr);
    }
    else if((state==8)&&((ch==' ')&&(ch=='\t'))){
    }
    else if((state==8)&&(ch=='\n')){
      state=9;/*命令を読み込む*/
      insnum=0;
    }
    else if(state==8){
      buf[i]=ch;
      i+=1;
    }
    else if((state==9)&&(ch==':')){    
      labelnum+=1;
      strcpy(label_list[labelnum].name,buf);
      clean_buf(buf);
      i=0;
      label_list[labelnum].addr=addr;
      state=8;
      j=0;
    }     
    else if((state==9)&&((ch==' ')||(ch=='\t'))&&(j==0)){
    }
    else if((state==9)&&(j==0)){
      j=1;/*命令読み込み中*/
      clean_buf(buf);
      i=0;
      buf[i]=ch;
      i+=1;
    }
    else if((state==9)&&(j==1)&&((ch==' ')||(ch=='\t')||(ch==','))){
      j=2;/*命令読み込み終わり*/
      clean_buf(buf);
      i=0;
    }
    else if((state==9)&&(j==1)&&(ch=='\n')){
      clean_buf(buf);
      i=0;
      j=0;
      printf(" %d ",addr);
      addr+=4;
    }
    else if((state==9)&&(j==1)){
      buf[i]=ch;
      i+=1;
    }
    else if((state==9)&&(j==2)&&((ch==' ')||(ch=='\t')||(ch==','))){
    }
    else if((state==9)&&(j==2)){
      buf[i]=ch;
      i+=1;
      j=3;/*第一引数*/
    }
    else if((state==9)&&(j==3)&&((ch==' ')||(ch=='\t')||(ch==','))){
      j=4;/*第一引数終わり*/
      clean_buf(buf);
      i=0;
    }
    else if((state==9)&&(j==3)&&(ch=='\n')){
      clean_buf(buf);
      i=0;
      j=0;
      state=10;
      printf(" %d ",addr);
      addr+=4;
    }
    else if((state==9)&&(j==3)){
      buf[i]=ch;
      i+=1;
    }
    else if((state==9)&&(j==4)&&((ch==' ')||(ch=='\t')||(ch==','))){
    }
    else if((state==9)&&(j==4)){
      buf[i]=ch;
      i+=1;
      j=5;/*第２を始める*/
    }
    else if((state==9)&&(j==5)&&((ch==' ')||(ch=='\t')||(ch==','))){
      j=6;/*第２終わり*/
      clean_buf(buf);
      i=0;
    }
    else if((state==9)&&(j==5)&&(ch=='\n')){
      clean_buf(buf);
      i=0;
      j=0;
      state=10;
      printf(" %d ",addr);
      addr+=4;
    }
    else if((state==9)&&(j==5)){
      buf[i]=ch;
      i+=1;
    }
    else if((state==9)&&(j==6)&&((ch==' ')||(ch=='\t')||(ch==','))){
    }
    else if((state==9)&&(j==6)){
      buf[i]=ch;
      i+=1;
      j=7;/*第三引数を始める*/
    }
    else if((state==9)&&(j==7)&&((ch==' ')||(ch=='\t')||(ch==','))){
      j=8;/*終わり*/
      clean_buf(buf);
      i=0;
    }
    else if((state==9)&&(j==7)&&(ch=='\n')){
      clean_buf(buf);
      i=0;
      j=0;
      state=10;
      printf(" %d ",addr);
      addr+=4;
    }
    else if((state==9)&&(j==7)){
      buf[i]=ch;
      i+=1;
    }
    else if((state==9)&&(ch=='\n')){
      clean_buf(buf);
      i=0;
      j=0;
      state=10;/*次がラベルなのか、命令なのか判定*/
    }
    else if((state==10)&&((ch==' ')||(ch=='\t')||(ch==','))){
      insnum+=1;
      state=9;
    }
    else if(state==10){
      buf[i]=ch;
      i+=1;
      state=8;
      labelnum+=1;
    }
    printf("%c",ch);
  }
  labelnum+=1;
  rewind(fp);
  state=0;

  char m[100]={'\0'};
  char arg1[40]={'\0'};
  char arg2[40]={'\0'};
  char arg3[40]={'\0'};
  int m0=0;
  int i1=0;
  int i2=0;
  int i3=0;





  //write_start(label_list,labelnum,start_label,fp2);
  addr = na;
  
  while((ch=fgetc(fp))!=EOF){
    if((state==0)&&((ch==' ')||(ch=='\t'))){
    }
    else if((state==0)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==0){
      m[m0]=ch;
      m0+=1;
      state=1;/*命令読み中*/
    }
    else if((state==1)&&((ch==' ')||(ch=='\t'))){
      state=2;/*第1を探す*/
    }
    else if((state==1)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==1){
      m[m0]=ch;
      m0+=1;
    }
    else if((state==2)&&((ch==' ')||(ch=='\t'))){
    }
    else if((state==2)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==2){
      arg1[i1]=ch;
      i1+=1;
      state=3;
    }
    else if((state==3)&&((ch==' ')||(ch=='\t')||(ch==','))){
      state=4;/*第2を探す*/
    }
    else if((state==3)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==3){
      arg1[i1]=ch;
      i1+=1;
    }
    else if((state==4)&&((ch==' ')||(ch=='\t'))){
    }
    else if((state==4)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==4){
      arg2[i2]=ch;
      i2+=1;
      state=5;
    }
    else if((state==5)&&((ch==' ')||(ch=='\t')||(ch==','))){
      state=6;/*第3を探す*/
    }
    else if((state==5)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==5){
      arg2[i2]=ch;
      i2+=1;
    }
    else if((state==6)&&((ch==' ')||(ch=='\t'))){
    }
    else if((state==6)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==6){
      arg3[i3]=ch;
      i3+=1;
      state=7;
    }
    else if((state==7)&&((ch==' ')||(ch=='\t'))){
      state=8;/*第4?を探す*/
    }
    else if((state==7)&&(ch=='\n')){
      write_ins(label_list,labelnum,fdata_list,fdata_num,fp2,m,arg1,arg2,arg3,&addr);
      clean_buf(m);
      clean_buf(arg1);
      clean_buf(arg2);
      clean_buf(arg3);
      m0=0;
      i1=0;
      i2=0;
      i3=0;
      state=0;
    }
    else if(state==7){
      arg3[i3]=ch;
      i3+=1;
    }
  }
  rewind(fp2);
  write_start(label_list,labelnum,start_label,fp2);
  fclose(fp2);
  fclose(fp);
  return 0;
}
      

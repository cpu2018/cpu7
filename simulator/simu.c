#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#define R 32
/*レジスタは32bitにしてる。crはバイナリでは4倍された値となっているので4で割っている*/
typedef struct{
  char memory[100000][9];
  char reg[32][R+1];
  char lr[R+1];
  char cr[8][4];
  char cor[R+1];
  char s[33];
} CPU;

typedef struct llabel{
  char name[20];
  unsigned int addr;
} label;

int search(label labellist[15],char *name){
  for(int i=0;i<15;i++){
    if(strcmp(labellist[i].name,name)==0){
      return labellist[i].addr;
    }
  }
  return 0;
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

void r(unsigned char s,char memory[1000][9],int i){
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

void read_i_j(CPU *cpu,int addr,char *code,int i,int j){
  strcat(cpu->s,(cpu->memory)[addr]);
  strcat(cpu->s,(cpu->memory)[addr+1]);
  strcat(cpu->s,(cpu->memory)[addr+2]);
  strcat(cpu->s,(cpu->memory)[addr+3]);
  strncpy(code,cpu->s+i,j-i+1);
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
    //printf("%s\n",s);
    inc(s,len);
    //printf("%s\n",s);
    //printf("%d\n",v);
  }
  else{
    for(int k=0;k<len;k++){
      s[k] = '0';
    }
  }
}

void slw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_20[6];
  read_i_j(cpu,addr,code_16_20,16,20);

  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);
  //printf("slw %d %d %d\n",ra,rs,rb);

  unsigned int s = change_ibit(R,(cpu->reg)[rs]);
  unsigned int b = change_ibit(R,(cpu->reg)[rb]);

  unsigned int ns = s << b;

  change_int((cpu->reg)[ra],32,ns);
  *a+=4;
  printf("slwを実行\n");
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
  for(int i=0;i<n;i++){
    for(int j=0;j<32;j++){
      if(j==31){
        ans[j]='0';
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
  //printf("%d %d %d\n",change_ibit_f(R,(cpu->reg)[7]),change_ibit_f(R,(cpu->reg)[11]),change_ibit_f(R,(cpu->reg)[12]));
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int ra = change_ibit(5,code_6_10);

  int value = change_ibit_f(R,(cpu->reg)[ra]);
  printf("レジスタ%dをoutした %c\n",ra,value);
  //printf("%d\n",change_ibit_f(R,(cpu->reg)[2]));
  *a+=4;
}

void cmpi(CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4];
  read_i_j(cpu,addr,code_6_8,6,8);
  char code_10[2];
  read_i_j(cpu,addr,code_10,10,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17];
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
  printf("cmpi cr%d reg%d %dを実行\n",bf,ra,sim);
}

void cmp(CPU *cpu,int *a){
  int addr = *a;
  char code_6_8[4];
  read_i_j(cpu,addr,code_6_8,6,8);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_20[6];
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
  printf("cmp reg%d reg%dを実行\n",ra,rb);
}
  

void bne(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15];
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  cr = (cr - 2)/4;
  if(strcmp((cpu->cr)[cr],"0100")==0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
    printf("bne %d\n",j);
  }
  printf("bne cr%d を実行\n",cr);
}

void bgt(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15];
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  cr = cr/4;
  //cr = (cr - 2)/4;
  if(strcmp((cpu->cr)[cr],"0010")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  printf("bgt cr%dを実行\n",cr);
}

void beq(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15];
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  cr = cr/4;
  //cr = (cr - 2)/4;
  if(strcmp((cpu->cr)[cr],"0100")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  printf("beq cr%dを実行\n",cr);
}



void blt(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_29[15];
  read_i_j(cpu,addr,code_16_29,16,29);

  int cr = change_ibit(5,code_11_15);
  //printf("blt %d\n",cr);
  cr = cr/4;
  if(strcmp((cpu->cr)[cr],"0001")!=0){
    //printf("通過1\n");
    *a+=4;
  }
  else{
    //printf("通過2\n");
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
  printf("blt cr%dを実行\n",cr);
}


void addi(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17];
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
    //printf("add %d\n",y);
    change_int((cpu->reg)[rt],32,y);
    //printf("%s\n",(cpu->reg)[rt]);
  }
  *a+=4;
  printf("addiを実行 レジスタ%dにレジスタ%dと%dの和を代入\n",rt,ra,si);
}

void blr(CPU *cpu,int *addr){
  int x = change_ibit_f(R,(cpu->lr));
  if(x==-1){
    *addr+=4;
  }
  else{
    *addr = x;
  }
  printf("blrを実行\n");
}

void stw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17];
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

  /*for(int i=0;i<4;i++){
    printf("%d %s\n",addr2,(cpu->memory)[addr2+i]);
    }*/

  *a+=4;
  printf("stw reg%d %d(reg%d)を実行\n",rs,d,ra);
}

void mflr(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);

  int rd = change_ibit(5,code_6_10);
  //printf("a\n");
  strcpy((cpu->reg)[rd],cpu->lr);
  //printf("b\n");
  *a+=4;
  printf("mflr reg%dを実行\n",rd);
}

void mr(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  //printf("rs%d ra%d\n",rs,ra);
  strcpy((cpu->reg)[ra],(cpu->reg)[rs]);
  *a+=4;
  printf("mr reg%d reg%dを実行\n",rs,ra);
}

void add(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int rt = change_ibit(5,code_6_10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6];
  read_i_j(cpu,addr,code_16_20,16,20);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(R,(cpu->reg)[ra]);
  int y = change_ibit_f(R,(cpu->reg)[rb]);
  int z = x + y;

  change_int((cpu->reg)[rt],32,z);
  *a+=4;
  printf("add reg%d reg%d reg%dを実行\n",rt,ra,rb);
}

void subf(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  int rt = change_ibit(5,code_6_10);
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6];
  read_i_j(cpu,addr,code_16_20,16,20);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(R,(cpu->reg)[ra]);
  int y = change_ibit_f(R,(cpu->reg)[rb]);
  int z = y - x;

  change_int((cpu->reg)[rt],32,z);
  *a+=4;
  printf("subf reg%d reg%d reg%dを実行\n",rt,ra,rb);
}

void b(CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25];
  read_i_j(cpu,addr,code_6_29,6,29);
  int target = change_ibit_f(24,code_6_29) * 4;
  *a=target+*a;
  printf("bを実行\n");
}
void bl(CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25];
  read_i_j(cpu,addr,code_6_29,6,29);
  int target = change_ibit_f(24,code_6_29) * 4;
  change_int((cpu->lr),32,addr+4);
  *a=target+*a;
  printf("blを実行\n");
}

void lwz(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  char code_16_31[17];
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
  printf("lwz reg%d %d(reg%d)を実行\n",rt,d,ra);
}

void mtlr(CPU *cpu,int *addr){
  int a=*addr;
  char code_6_10[6];
  read_i_j(cpu,a,code_6_10,6,10);

  int rs = change_ibit(5,code_6_10);
  //printf("%s\n",(cpu->reg)[rs]);
  strcpy((cpu->lr),(cpu->reg)[rs]);
  //printf("b\n");
  *addr+=4;
  printf("mtlr reg%dを実行\n",rs);
}

void stmw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17];
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
  printf("stmw reg%d %d(reg%d)を実行\n",rs,d,ra);
}

void rlwinm(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_20[6];
  read_i_j(cpu,addr,code_16_20,16,20);
  int sh = change_ibit(5,code_16_20);

  char code_21_25[6];
  read_i_j(cpu,addr,code_21_25,21,25);
  int mb = change_ibit(5,code_21_25);

  char code_26_30[6];
  read_i_j(cpu,addr,code_26_30,26,30);
  int me = change_ibit(5,code_26_30);

  int n = sh;
  char rc[33]={'\0'};
  //printf("%s\n",(cpu->reg)[rs]);
  rot_l(rc,(cpu->reg)[rs],n);/*左にnだけ回転*/
  //printf("%s\n",rc);
  char mask[33]={'\0'};
  make_mask(mask,mb,me);
  char ra_c[33]={'\0'};
  and(ra_c,rc,mask);
  strcpy((cpu->reg)[ra],ra_c);
  *a+=4;
  printf("rlwinm r%d r%d %d %d %dを実行\n",ra,rs,sh,mb,me);
}
  

void stwu(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int rs = change_ibit(5,code_6_10);

  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17];
  read_i_j(cpu,addr,code_16_31,16,31);
  int d = change_ibit_f(16,code_16_31);

  int ea = change_ibit_f(R,(cpu->reg)[ra]) + d;
  strncpy((cpu->memory)[ea],(cpu->reg)[rs]/*+32*/,8);
  strncpy((cpu->memory)[ea+1],(cpu->reg)[rs]/*+40*/+8,8);
  strncpy((cpu->memory)[ea+2],(cpu->reg)[rs]/*+48*/+16,8);
  strncpy((cpu->memory)[ea+3],(cpu->reg)[rs]/*+56*/+24,8);

  change_int((cpu->reg)[ra],32,ea);
  *a+=4;
  printf("stwu reg%d %d(reg%d)を実行\n",rs,d,ra);
}

void lmw(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int rt = change_ibit(5,code_6_10);

  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);

  char code_16_31[17];
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
  printf("lmw reg%d %d(reg%d)を実行\n",rt,d,ra);
}

    

void exec(CPU *cpu,label labellist[15]){
  int addr = 0;
  int k;
  int state=1;
  int r=1;
  printf("ブレークポイントを入れるなら0入れないなら1:");
  scanf("%d",&k);
  char name[15];
  int stopaddr=0;
  if(k==0){
    printf("ラベル名:");
    scanf("%s",name);
    stopaddr = search(labellist,name);
  }
  while(1){
    //printf("%d\n",addr);
    if(k==0){
      if(addr==stopaddr){
        printf("1行ずつ実行するなら0しないなら1");
        scanf("%d",&state);
      }
    }
    if(state==0){
      printf("レジスタを表示するなら0しないなら1");
      scanf("%d",&r);
    }
    //printf("%d\n",addr);
    char code_0_5[7];
    read_i_j(cpu,addr,code_0_5,0,5);
    //printf("%s\n",code_0_5);
    if((strcmp(code_0_5,"011111"))==0){
      char code_22_30[10];
      read_i_j(cpu,addr,code_22_30,22,30);
      char code_21_30[11];
      read_i_j(cpu,addr,code_21_30,21,30);
      if(strcmp(code_22_30,"100001010")==0){
        add(cpu,&addr);/*addしてaddr+4*/
      }
      else if(strcmp(code_22_30,"000101000")==0){
        subf(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0101010011")==0){
        mflr(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0111010011")==0){
        mtlr(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0110111100")==0){
        mr(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0000000000")==0){
        cmp(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0000011000")==0){
        slw(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"001011")==0){
      cmpi(cpu,&addr);/*addr+=4*/
    }
    else if(strcmp(code_0_5,"010000")==0){
      char code_6_10[5];
      read_i_j(cpu,addr,code_6_10,6,10);
      char code_30[2];
      read_i_j(cpu,addr,code_30,30,30);
      char code_31[2];
      read_i_j(cpu,addr,code_31,31,31);
      if(code_30[0] == '0'){
        if(code_31[0] == '0'){
          if(strcmp(code_6_10,"00100")==0){
            bne(cpu,&addr);
          }
          else if(strcmp(code_6_10,"00010")==0){
            bgt(cpu,&addr);
          }
          else if(strcmp(code_6_10,"00001")==0){
            blt(cpu,&addr);
          }
          else if(strcmp(code_6_10,"00100")==0){
            beq(cpu,&addr);
          }
        }
      }
    }
    else if(strcmp(code_0_5,"001110")==0){
      addi(cpu,&addr);
    }
    else if(strcmp(code_0_5,"000001")==0){
      out(cpu,&addr);
    }
    else if(strcmp(code_0_5,"010011")==0){
      char code_21_30[11];
      read_i_j(cpu,addr,code_21_30,21,30);
      if(strcmp(code_21_30,"0000010000")==0){
        blr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"100100")==0){
      stw(cpu,&addr);
    }
    else if(strcmp(code_0_5,"011111")==0){
      char code_21_30[11];
      read_i_j(cpu,addr,code_21_30,21,30);
      if(strcmp(code_21_30,"0101010011")==0){
        mflr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"011111")==0){
      char code_21_30[11];
      read_i_j(cpu,addr,code_21_30,21,30);
      if(strcmp(code_21_30,"0110111100")==0){
        mr(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"010010")==0){
      char code_31[2];
      read_i_j(cpu,addr,code_31,31,31);
      if(code_31[0] == '1'){
        bl(cpu,&addr);
      }
      else{
        b(cpu,&addr);
      }
    }
    else if(strcmp(code_0_5,"011111")==0){
      char code_21_30[11];
      read_i_j(cpu,addr,code_21_30,21,30);
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
    else{
      break;
    }
    if(r==0){
      printreg(cpu);
    }
  }
}

int main(int argc,char **argv){
  FILE *file2;
  file2=fopen(argv[2],"r");
  int state=0;
  int z=0;
  int labelnum=-1;
  unsigned int addrx = 4;
  char bufx[256];
  char ch;
  label labellist[15];
  while((ch=fgetc(file2)) != EOF){
    if((state==0)&&(ch=='\n')){
      clean(bufx);
      z=0;
    }
    else if((state==0)&&((ch=='\t')||(ch==' '))){
    }
    else if(ch == ':'){
      labelnum+=1;
      strcpy(labellist[labelnum].name,bufx);
      state=1;
      labellist[labelnum].addr=addrx;
      clean(bufx);
      z=0;
    }
    else if(state==0){
      bufx[z]=ch;
      z+=1;
    }
    else if((state==1)&&(ch=='\n')){
      state=2;
    }
    else if(state==1){
    }
    else if(state==2){
      if((ch==' ')||(ch=='\t')){
        state=3;
      }
      else{
        state=0;
        bufx[z]=ch;
        z+=1;
      }
    }
    else if((state==3)&&((ch==' ')||(ch=='\t'))){
    }
    else if((state==3)&&(ch=='\n')){
      addrx+=4;
      state=2;
    }
    else if(state==3){
    }
    }
  fclose(file2);
  //printf("%s %d\n",labellist[1].name,labellist[0].addr);
    
  CPU cpu;

  FILE *file;
  file=fopen(argv[1],"rb");
  fseek(file,0,SEEK_END);
  const int size = ftell(file);
  rewind(file);

  unsigned char *memory = malloc(size*sizeof(unsigned char));

  fread(memory,sizeof(unsigned char),size,file);

  int k=0;
  int i=0;
  for(int l=0 ;l<100000;l++){
    for(int m=0;m<9;m++){
      cpu.memory[l][m]='\0';
    }
  }
  int h=0;
  while(h<500){
    if(k%4==3){
      r(memory[k],cpu.memory,i);
      i+=1;
      k+=1;
    }
    else{
      r(memory[k],cpu.memory,i);
      k+=1;
      i+=1;
    }
    h+=1;
  }
  fclose(file);

  for(int l=0;l<R;l++){
    (cpu.reg)[0][l]='0';
    (cpu.reg)[1][l]='0';
    (cpu.reg)[30][l]='0';
    (cpu.reg)[31][l]='0';
    (cpu.reg)[5][l]='0';
  }
  for(int l=0;l<R;l++){
    (cpu.lr)[l]='1';
  }
  (cpu.lr)[R]='\0';
  change_int((cpu.reg)[1],32,2000);
  change_int((cpu.reg)[3],32,5000);
  exec(&cpu,labellist);
  //printf("\n%d\n",change_ibit_f(R,(cpu.reg)[3]));
  return 0;
}

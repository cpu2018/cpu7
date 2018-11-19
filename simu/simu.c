#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct{
  char memory[100000][9];
  char reg[32][65];
  char lr[65];
  char cr[8][4];
  char cor[65];
  char s[33];
} CPU;

int p(int i,int j){
  int v = 1;
  for(int k = 0;k<j;k++){
    v *= i;
  }
  return v;
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
      int n = (v >> (len - k - 1)) - ((v >> (len - k)) << 1);
      if(n==1){
        s[k] = '1';
      }
      else{
        s[k] = '0';
      }
    }
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

  int ra = change_ibit(5,code_6_10);
  int rs = change_ibit(5,code_11_15);
  int rb = change_ibit(5,code_16_20);

  unsigned int s = change_ibit(64,(cpu->reg)[rs]);
  unsigned int b = change_ibit(64,(cpu->reg)[rs]);

  unsigned int ns = s << b;

  change_int((cpu->reg)[ra],64,ns);
  *a+=4;
}

  

void out(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  int ra = change_ibit(5,code_6_10);

  int value = change_ibit_f(64,(cpu->reg)[ra]);
  printf("c %c\n",value);
  //printf("d%d\n",value);
  printf("%d\n",change_ibit_f(64,(cpu->reg)[2]));
  //printf("%s\n",(cpu->cr)[7]);
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
  int value = change_ibit_f(64,(cpu->reg)[ra]);/*符号も考える*/
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

  int va = change_ibit_f(64,(cpu->reg)[ra]);
  int vb = change_ibit_f(64,(cpu->reg)[rb]);
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
  }
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
  cr = (cr - 2)/4;
  if(strcmp((cpu->cr)[cr],"0010")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
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
  cr = (cr - 2)/4;
  if(strcmp((cpu->cr)[cr],"0001")!=0){
    *a+=4;
  }
  else{
    int j = change_ibit_f(14,code_16_29);
    *a+=j*4;
  }
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
    change_int((cpu->reg)[rt],64,si);
  }
  else{
    int x = change_ibit_f(64,(cpu->reg)[ra]);
    int y = x + si;
    change_int((cpu->reg)[rt],64,y);
  }
  *a+=4;
}

void blr(CPU *cpu,int *addr){
  int x = change_ibit_f(64,(cpu->lr));
  if(x==-1){
    *addr+=4;
  }
  else{
    *addr = x;
  }
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
    b = change_ibit_f(64,(cpu->reg)[ra]);
  }
  int d = change_ibit_f(16,code_16_31);

  int addr2 = b+d;

  strncpy((cpu->memory)[addr2],(cpu->reg)[rs]+32,8);
  strncpy((cpu->memory)[addr2+1],(cpu->reg)[rs]+40,8);
  strncpy((cpu->memory)[addr2+2],(cpu->reg)[rs]+48,8);
  strncpy((cpu->memory)[addr2+3],(cpu->reg)[rs]+56,8);

  *a+=4;
}

void mflr(CPU *cpu,int *a){
  //printf("a\n");
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);

  int rd = change_ibit(5,code_6_10);
  strcpy((cpu->reg)[rd],cpu->lr);
  *a+=4;
}

void mr(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  read_i_j(cpu,addr,code_11_15,11,15);
  int rs = change_ibit(5,code_6_10);
  int ra = change_ibit(5,code_11_15);
  strcpy((cpu->reg)[ra],(cpu->reg)[rs]);
  //printf("mr2 %d\n",change_ibit(64,(cpu->reg)[2]));
  //printf("mr5 %d\n",change_ibit(64,(cpu->reg)[5]));
  *a+=4;
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

  int x = change_ibit_f(64,(cpu->reg)[ra]);
  int y = change_ibit_f(64,(cpu->reg)[rb]);
  int z = x + y;

  change_int((cpu->reg)[rt],64,z);
  *a+=4;
}

void subf(CPU *cpu,int *a){
  int addr = *a;
  char code_6_10[6];
  read_i_j(cpu,addr,code_6_10,6,10);
  char code_11_15[6];
  int rt = change_ibit(5,code_11_15);
  read_i_j(cpu,addr,code_11_15,11,15);
  int ra = change_ibit(5,code_11_15);
  char code_16_20[6];
  read_i_j(cpu,addr,code_16_20,16,20);
  int rb = change_ibit(5,code_16_20);

  int x = change_ibit_f(64,(cpu->reg)[ra]);
  int y = change_ibit_f(64,(cpu->reg)[rb]);
  int z = y - x;

  change_int((cpu->reg)[rt],64,z);
  *a+=4;
}

void b(CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25];
  read_i_j(cpu,addr,code_6_29,6,29);
  int target = change_ibit_f(24,code_6_29) * 4;
  *a=target+*a;
}
void bl(CPU *cpu,int *a){
  int addr = *a;
  char code_6_29[25];
  read_i_j(cpu,addr,code_6_29,6,29);
  int target = change_ibit_f(24,code_6_29) * 4;
  change_int((cpu->lr),64,addr+4);
  *a=target+*a;
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
    b = change_ibit_f(64,(cpu->reg)[ra]);
  }
  int ea = b + d;
  char s[65]="00000000000000000000000000000000";
  strcat(s,(cpu->memory)[ea]);
  strcat(s,(cpu->memory)[ea+1]);
  strcat(s,(cpu->memory)[ea+2]);
  strcat(s,(cpu->memory)[ea+3]);

  strcpy((cpu->reg)[rt],s);
  *a+=4;
}

void mtlr(CPU *cpu,int *addr){
  int a=*addr;
  char code_6_10[6];
  read_i_j(cpu,a,code_6_10,6,10);

  int rs = change_ibit(5,code_6_10);
  strcpy((cpu->lr),(cpu->reg)[rs]);
  *addr+=4;
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
    b = change_ibit(64,(cpu->reg)[ra]);
  }
  int ea = b + d;
  int r = rs;
  while(r <= 31){
    strncpy((cpu->memory)[ea],(cpu->reg)[r]+32,8);
    strncpy((cpu->memory)[ea+1],(cpu->reg)[r]+40,8);
    strncpy((cpu->memory)[ea+2],(cpu->reg)[r]+48,8);
    strncpy((cpu->memory)[ea+3],(cpu->reg)[r]+56,8);

    r+=1;
    ea+=4;
  }
  *a+=4;
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

  int ea = change_ibit_f(64,(cpu->reg)[ra]) + d;
  strncpy((cpu->memory)[ea],(cpu->reg)[rs]+32,8);
  strncpy((cpu->memory)[ea+1],(cpu->reg)[rs]+40,8);
  strncpy((cpu->memory)[ea+2],(cpu->reg)[rs]+48,8);
  strncpy((cpu->memory)[ea+3],(cpu->reg)[rs]+56,8);

  change_int((cpu->reg)[ra],64,ea);
  *a+=4;
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
    b=change_ibit_f(64,(cpu->reg)[ra]);
  }
  int ea = b + d;
  int r = rt;
  while(r <= 31){
    char s[65] = "00000000000000000000000000000000";
    strcat(s,(cpu->memory)[ea]);
    strcat(s,(cpu->memory)[ea+1]);
    strcat(s,(cpu->memory)[ea+2]);
    strcat(s,(cpu->memory)[ea+3]);
    ea += 4;
    strcpy((cpu->reg)[r],s);
    r+=1;
  }
  *a+=4;
}
    

void exec(CPU *cpu){
  int addr = 0;
  while(1){
    //printf("%d\n",change_ibit(64,(cpu->reg)[2]));
    char code_0_5[7];
    read_i_j(cpu,addr,code_0_5,0,5);
    //if(addr!=0)
      //printf("%d\n",addr);
    //printf("%s\n",code_0_5);
    if((strcmp(code_0_5,"011111"))==0){
      char code_22_30[10];
      read_i_j(cpu,addr,code_22_30,22,30);
      char code_21_30[11];
      read_i_j(cpu,addr,code_21_30,21,30);
      //printf("%s\n",code_21_30);
      if(strcmp(code_22_30,"100001010")==0){
        add(cpu,&addr);/*addしてaddr+4*/
      }
      else if(strcmp(code_22_30,"000101000")==0){
        subf(cpu,&addr);
      }
      else if(strcmp(code_21_30,"0101010011")==0){
        //printf("mflr\n");
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
    else{
      break;
    }
  }
}

int main(int argc,char **argv){
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

  for(int l=0;l<65;l++){
    (cpu.reg)[0][l]='0';
    (cpu.reg)[1][l]='0';
    (cpu.reg)[30][l]='0';
    (cpu.reg)[31][l]='0';
    (cpu.reg)[5][l]='0';
  }
  for(int l=0;l<64;l++){
    (cpu.lr)[l]='1';
  }
  (cpu.lr)[64]='\0';
  change_int((cpu.reg)[1],64,2000);
  change_int((cpu.reg)[3],64,5000);
  exec(&cpu);
  printf("\n%d\n",change_ibit_f(64,(cpu.reg)[3]));
  return 0;
}

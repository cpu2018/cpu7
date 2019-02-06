#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ins.h"
#include <errno.h>
#include <unistd.h>
#include <signal.h>
#define R 32
#define M 100000000

union IntAndFloat {
  int ival;
  float fval;
};

static int cpu_memory[M];

typedef struct cpu{
  int reg[32];
  int freg[32];
  int lr;
  char cr[8];
  int cor;
} CPU;

void init_cpu(CPU *cpu){
  for(int i=0;i<M;i++){
    (cpu_memory)[i]=0;
  }
  for(int i=0;i<32;i++){
    (cpu->reg)[i]=0;
  }
  for(int i=0;i<32;i++){
    (cpu->freg)[i]=0;
  }
  (cpu->lr)=0;
  for(int i=0;i<8;i++){
    (cpu->cr)[i]=0;
  }
  (cpu->cor)=0;
  (cpu->reg)[4]=100000;
  (cpu->reg)[3]=100000;
}

void read_memory(CPU *cpu,int *memory,int len){
  for(int i=0;i<len;i++){
    //printf("%d\n",i);
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
    (cpu_memory)[i]=x;
  }
  printf("b\n");
}

void slw(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int vs = (cpu->reg)[code_11_15];
  int vb = (cpu->reg)[code_16_20];
  unsigned int s = *(unsigned int *)&vs;
  unsigned int b = *(unsigned int *)&vb;
  unsigned int ns = s << b;
  (cpu->reg)[code_6_10]=*(int *)&ns;
  *a+=4;
}/*ok*/

void srw(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int vs = (cpu->reg)[code_11_15];
  int vb = (cpu->reg)[code_16_20];
  unsigned int s = *(unsigned int *)&vs;
  unsigned int b = *(unsigned int *)&vb;
  unsigned int ns = s >> b;
  (cpu->reg)[code_6_10]=*(int *)&ns;
  *a+=4;
}/*ok*/


int pow2(int n,int m){
  int ans = 1;
  for(int i=1;i<m+1;i++){
    ans*=n;
  }
  return ans;
}

int make_mask(int mb,int me){
  int t=0;
  for(int i=mb;i<me+1;i++){
    t+=pow2(2,31-i);
  }
  return t;
}

static int h=0;
void out(int code,CPU *cpu,int *a,FILE *file){
  int code_6_10 = (code >> 21) & 0x1F;/*ra*/
  int value = (cpu->reg)[code_6_10];
  char x = value;
  fwrite(&x,sizeof(x),1,file);
  *a+=4;
  h+=1;
  //printf("%d\n",h);
  //printf("out %c ---- %d\n",x,*a-4);
}

void cmpi(int code,CPU *cpu,int *a){
  int code_6_8 = (code >> 23) & 0x7;/*bf*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short usi = (unsigned short) code_16_31;
  short sis = *(short *)&usi;
  int si = (int) sis;
  int value = (cpu->reg)[code_11_15];
  if (value < si){
    (cpu->cr)[code_6_8]=1;/*"0001"*/
  }
  else if(value > si){
    (cpu->cr)[code_6_8]=2;/*"0010"*/;
  }
  else{
    (cpu->cr)[code_6_8]=4;/*"0100"*/;
  }
  *a += 4;
}/*ok*/

void fcmpu(int code,CPU *cpu,int *a){
  int code_6_8 = (code >> 23) & 0x7;/*bf*/
  //int code_10 = (code >> 21) & 0x1;
  int code_11_15 = (code >> 16) & 0x1F;/*fra*/
  int code_16_20 = (code >> 11) & 0x1F;/*frb*/
  int sva = (cpu->freg)[code_11_15];
  float va = *(float *)&sva;
  int svb = (cpu->freg)[code_16_20];
  float vb = *(float *)&svb;
  if (va < vb){
    (cpu->cr)[code_6_8]=1;/*"0001"*/
  }
  else if(va > vb){
    (cpu->cr)[code_6_8]=2;/*"0010"*/;
  }
  else{
    (cpu->cr)[code_6_8]=4;/*"0100"*/;
  }  
  *a+=4;
}/*ok*/

void cmp(int code,CPU *cpu,int *a){
  int code_6_8 = (code >> 23) & 0x7;/*bf*/
  //int code_10 = (code >> 21) & 0x1;
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int va = (cpu->reg)[code_11_15];
  int vb = (cpu->reg)[code_16_20];
  if (va < vb){
    (cpu->cr)[code_6_8]=1;/*"0001"*/
  }
  else if(va > vb){
    (cpu->cr)[code_6_8]=2;/*"0010"*/;
  }
  else{
    (cpu->cr)[code_6_8]=4;/*"0100"*/;
  }
  *a+=4;
}/*ok*/
  

void bne(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;/*cr*/
  int code_16_29 = (code >> 2) & 0x3FFF;
  short a1 = (short) code_16_29;
  short a2 = a1 << 2;
  int j1 = (int) a2;
  int j = j1 >> 2;
  if((cpu->cr)[code_11_15]==4){
    *a+=4;
  }
  else{
    *a+=j*4;
  }
}/*ok*/

void bgt(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;/*cr*/
  int code_16_29 = (code >> 2) & 0x3FFF;
  short a1 = (short) code_16_29;
  short a2 = a1 << 2;
  int j1 = (int) a2;
  int j = j1 >> 2;
  if((cpu->cr)[code_11_15]!=2){
    *a+=4;
  }
  else{
    *a+=j*4;
  }
}/*ok*/

void beq(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;/*cr*/
  int code_16_29 = (code >> 2) & 0x3FFF;
  short a1 = (short) code_16_29;
  short a2 = a1 << 2;
  int j1 = (int) a2;
  int j = j1 >> 2;
  if((cpu->cr)[code_11_15]!=4){
    *a+=4;
  }
  else{
    *a+=j*4;
  }
}/*ok*/



void blt(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;/*cr*/
  int code_16_29 = (code >> 2) & 0x3FFF;
  short a1 = (short) code_16_29;
  short a2 = a1 << 2;
  int j1 = (int) a2;
  int j = j1 >> 2;
  if((cpu->cr)[code_11_15]!=1){
    *a+=4;
  }
  else{
    *a+=j*4;
  }
}/*ok*/

/*1byteの読み込み*/
void in(int code,CPU *cpu,int *a,FILE *file){
  unsigned char x;
  fread(&x,sizeof(x),1,file);
  int y=(int) x;
  int code_6_10 = (code >> 21) & 0x1F;/*ra*/
  int k = (cpu->reg)[code_6_10];
  (cpu->reg)[code_6_10] = (k & 0xFFFFFF00)+y;
  *a+=4;
  printf("in %d %d\n",y,*a-4);
}

void fin(int code,CPU *cpu,int *a,FILE *file){
  unsigned char x;
  fread(&x,sizeof(x),1,file);
  int y=(int) x;
  int code_6_10 = (code >> 21) & 0x1F;/*ra*/
  int k = (cpu->freg)[code_6_10];
  (cpu->freg)[code_6_10] = (k & 0xFFFFFF00) + y;
  *a+=4;
  printf("fin %d %d\n",y,*a-4);
}

void addi(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = code_16_31;
  short k2 = *(short *)&k;
  int si = (int) k2;
  if(code_11_15==0){
    (cpu->reg)[code_6_10]=si;
  }
  else{
    int x = (cpu->reg)[code_11_15];
    int y = x + si;
    (cpu->reg)[code_6_10]=y;    
  }
  *a+=4;
}/*ok*/

void fabs2(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frd*/
  int code_11_15 = (code >> 16) & 0x1F;/*fra*/
  int x = (cpu->freg)[code_11_15];
  int y = x & 0x7FFFFFFF;
  (cpu->freg)[code_6_10]=y;
  *a+=4;
}/*ok*/

void neg(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rd*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int x = (cpu->reg)[code_11_15];
  int y = -x;
  (cpu->reg)[code_6_10]=y;
  *a+=4;
}/*ok*/

void fneg(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frd*/
  int code_16_20 = (code >> 11) & 0x1F;/*fra*/
  int x = (cpu->freg)[code_16_20];
  int y=0;
  if(x>0){
    y = x | 0x80000000;
  }
  else if(x < 0){
    y = x & 0x7FFFFFFF;
  }
  else{
    y=0;
  }
  (cpu->freg)[code_6_10]=y;
  *a+=4;
}/*ok*/

  

void lis(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int si = (int) k2;
  int ns = si << 16;
  (cpu->reg)[code_6_10]=ns;
  *a+=4;
}/*ok 論理シフト*/

void blr(int code,CPU *cpu,int *addr){
  int x = (cpu->lr);
  *addr = x;
}/*ok*/

void stfd(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b=(cpu->reg)[code_11_15];
  }
  int x=(cpu->freg)[code_6_10];
  int ea = b + d;
  if(ea/4>M){
    printf("%dが変\n",*a);
    exit(1);
  }
  (cpu_memory)[ea/4]=x;
  *a+=4;
}/*ok*/

void stfdx(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  b += (cpu->reg)[code_16_20];
  int x = (cpu->freg)[code_6_10];
  if(b/4>M){
    printf("%dが変\n",*a);
    exit(1);
  }
  (cpu_memory)[b/4]=x;
  *a+=4;
}/*ok*/

void stwx(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >>16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  b += (cpu->reg)[code_16_20];
  int x=(cpu->reg)[code_6_10];
  if(b/4>M){
    printf("%dが変\n",*a);
    exit(1);
  }
  (cpu_memory)[b/4]=x;
  *a+=4;
}/*ok*/

void stw(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b=(cpu->reg)[code_11_15];
  }
  int x=(cpu->reg)[code_6_10];
  int ea = b + d;
  if(ea/4>M){
    printf("%dが変\n",*a);
    exit(1);
  }
  (cpu_memory)[ea/4]=x;
  *a+=4;
}/*ok*/

void mflr(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*fd*/
  (cpu->reg)[code_6_10]=(cpu->lr);
  *a+=4;
}/*ok*/

void fmr(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_16_20 = (code >> 11) & 0x1F;/*ra*/
  (cpu->freg)[code_6_10]=(cpu->freg)[code_16_20];
  *a+=4;
}/*ok*/

void mr(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  (cpu->reg)[code_11_15]=(cpu->reg)[code_6_10];
  *a+=4;
}/*ok*/

void add(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int x = (cpu->reg)[code_11_15];
  int y = (cpu->reg)[code_16_20];
  int z = x + y;
  (cpu->reg)[code_6_10]=z;
  *a+=4;
}/*ok*/

void subf(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int x = (cpu->reg)[code_11_15];
  int y = (cpu->reg)[code_16_20];
  int z = y - x;
  (cpu->reg)[code_6_10]=z;
  *a+=4;
}/*ok*/

void b(int code,CPU *cpu,int *a){
  int code_6_29 = (code >> 2) & 0xFFFFFF;
  int x;
  if(code_6_29 >= 0x700000){
    x = code_6_29 - 0xFFFFFF - 1;
  }
  else{
    x=code_6_29;
  }
  int target = x * 4;
  *a=target+*a;
}/*ok*/

void bctr(int code,CPU *cpu,int *a){
  int addr = *a;
  int code_31 = code & 0x1;
  if(code_31==1){
    (cpu->lr)=addr+4;
  }
  int next = (cpu->cor);
  *a=next;
}/*ok*/


  

void bl(int code,CPU *cpu,int *a){
  int addr = *a;
  int code_6_29 = (code >> 2) & 0xFFFFFF;
  int x;
  if(code_6_29 >= 0x700000){
    x = code_6_29 - 0xFFFFFF - 1;
  }
  else{
    x=code_6_29;
  }  
  int target = x * 4;
  (cpu->lr) = addr + 4;
  *a=target+*a;
}/*ok*/

void lfd(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  int ea = b + d;
  int x = (cpu_memory)[ea/4];
  (cpu->freg)[code_6_10]=x;
  *a+=4;
}/*ok*/

void lfdx(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  b += (cpu->reg)[code_16_20];
  int x = (cpu_memory)[b/4];
  (cpu->freg)[code_6_10]=x;
  *a+=4;
}/*ok*/

void lwzx(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*rb*/
  int b;
  if(code_11_15==0){
    b=0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  b += (cpu->reg)[code_16_20];
  int x = (cpu_memory)[b/4];
  (cpu->reg)[code_6_10]=x;
  *a+=4;
}/*ok*/

void lwz(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b = 0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  int ea = b + d;
  int x = (cpu_memory)[ea/4];
  (cpu->reg)[code_6_10] = x;
  *a+=4;
}/*ok*/

void mtctr(int code,CPU *cpu,int *addr){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  (cpu->cor) = (cpu->reg)[code_6_10];
  *addr+=4;
}/*ok*/

void mtlr(int code,CPU *cpu,int *addr){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  (cpu->lr) = (cpu->reg)[code_6_10];
  *addr+=4;
}/*ok*/

void stmw(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b = 0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  int ea = b + d;
  int r = code_6_10;
  while(r <= 31){
    int x = (cpu->reg)[r];
    (cpu_memory)[ea/4]=x;
    r+=1;
    ea+=4;
  }
  *a+=4;
}/*ok*/

void fslwi(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;
  int code_16_20 = (code >> 11) & 0x1F;
  int n = code_16_20;
  int k=(cpu->freg)[code_6_10];
  int x = (cpu->freg)[code_6_10] << n;
  (cpu->freg)[code_11_15]=x;
  *a+=4;
}

void fslwi_sub(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*sh*/
  int code_21_25 = (code >> 6) & 0x1F;/*mb*/
  int code_26_30 = (code >> 1) & 0x1F;/*me*/
  int n = code_16_20;
  int x1 = (cpu->freg)[code_6_10] >> (32-n);
  int x2 = (cpu->freg)[code_6_10] << n;
  int rc = x1 + x2;
  int mask = make_mask(code_21_25,code_26_30);
  int ra_c = rc & mask;
  (cpu->freg)[code_11_15]=ra_c;
  *a+=4;
}/*ok*/

void rlwinm(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_20 = (code >> 11) & 0x1F;/*sh*/
  int code_21_25 = (code >> 6) & 0x1F;/*mb*/
  int code_26_30 = (code >> 1) & 0x1F;/*me*/
  int n = code_16_20;
  unsigned int x11 = ((unsigned) (cpu->reg)[code_6_10]) >> (32-n);
  int x1 = (int) x11;
  int x2 = (cpu->reg)[code_6_10] << n;
  int rc = x1 + x2;
  int mask = make_mask(code_21_25,code_26_30);
  //printf("mask %d %d\n",(cpu->reg)[code_6_10],rc);
  int ra_c = rc & mask;
  (cpu->reg)[code_11_15]=ra_c;
  *a+=4;
}/*ok*/
  

void stwu(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rs*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b = 0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  int ea = b + d;
  int x = (cpu->reg)[code_6_10];
  if(ea/4>M){
    printf("%dが変\n",*a);
    exit(1);
  }
  (cpu_memory)[ea/4]=x;
  (cpu->reg)[code_11_15]=ea;
  *a+=4;
}/*ok*/

void lmw(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*rt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int code_16_31 = code & 0xFFFF;
  unsigned short k = (unsigned short) code_16_31;
  short k2 = *(short *)&k;
  int d = (int) k2;
  int b;
  if(code_11_15==0){
    b = 0;
  }
  else{
    b = (cpu->reg)[code_11_15];
  }
  int ea = b + d;
  int r = code_6_10;
  while(r <= 31){
    int x = (cpu_memory)[ea/4];
    (cpu->reg)[r]=x;
    ea+=4;
    r+=1;
  }
  *a+=4;
}/*ok*/

/*itof rft ra*/
/*void itof(int code,CPU *cpu,int *a){
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

void itof(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*ra*/
  int x = (cpu->reg)[code_11_15];
  float f = (float) x;
  int f2 = *(int *)&f;
  (cpu->freg)[code_6_10]=f2;
  *a+=4;
}/*ok*/

/*ftoi rft ra*/
/*void ftoi(int code,CPU *cpu,int *a){
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

void ftoi(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;
  int f = (cpu->freg)[code_11_15];
  float ff = *(float *)&f;
  int x = roundf(ff);
  (cpu->reg)[code_6_10]=x;
  *a+=4;
}/*ok*/
/*本物
void ftoi(int code,CPU *cpu,int *a){
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
*/

/*floor fa fd*/
/*void floor2(int code,CPU *cpu,int *a){
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

void floor2(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;
  int f = (cpu->freg)[code_11_15];
  float ff = *(float *)&f;
  int x = floorf(ff);
  (cpu->freg)[code_6_10]=x;
  *a+=4;
}

void fadd(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*fra*/
  int code_16_20 = (code >> 11) & 0x1F;/*frb*/
  int f1 = (cpu->freg)[code_11_15];
  int f2 = (cpu->freg)[code_16_20];
  float ff1 = *(float *)&f1;
  float ff2 = *(float *)&f2;
  float ff3 = ff1 + ff2;
  int f3 = *(int *)&ff3;
  (cpu->freg)[code_6_10]=f3;
  *a+=4;
}/*ok*/

void fsub(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*fra*/
  int code_16_20 = (code >> 11) & 0x1F;/*frb*/
  int f1 = (cpu->freg)[code_11_15];
  int f2 = (cpu->freg)[code_16_20];
  float ff1 = *(float *)&f1;
  float ff2 = *(float *)&f2;
  float ff3 = ff1 - ff2;
  int f3 = *(int *)&ff3;
  (cpu->freg)[code_6_10]=f3;
  *a+=4;
}/*ok*/
/*
void fmul(int code,CPU *cpu,int *a){
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
  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  char f2[33]={'\0'};
  strcpy(f2,(cpu->freg)[frb]);
  int ff1 = change_ibit_f(32,f1);
  int ff2 = change_ibit_f(32,f2);
  float fff1 = *(float *)&ff1;
  float fff2 = *(float *)&ff2;
  float fff3 = fff1 * fff2;
  int ff3 = *(int *)&fff3;
  i_to_b((cpu->freg)[frt],ff3,32);
  *a+=4;
  printf("fmul f%d, f%d, f%d\n",frt,fra,frb);
  }*/
/*偽
void fdiv(int code,CPU *cpu,int *a){
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
  char f1[33]={'\0'};
  strcpy(f1,(cpu->freg)[fra]);
  char f2[33]={'\0'};
  strcpy(f2,(cpu->freg)[frb]);
  int ff1 = change_ibit_f(32,f1);
  int ff2 = change_ibit_f(32,f2);
  float fff1 = *(float *)&ff1;
  float fff2 = *(float *)&ff2;
  float fff3 = fff1 / fff2;
  int ff3 = *(int *)&fff3;
  i_to_b((cpu->freg)[frt],ff3,32);
  *a+=4;
  printf("fdiv f%d, f%d, f%d\n",frt,fra,frb);
  }*/
  
/*
void fadd(int code,CPU *cpu,int *a){
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

void fsub(int code,CPU *cpu,int *a){
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
  }*/

void fmul(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*fra*/
  int code_16_20 = (code >> 11) & 0x1F;/*frb*/
  int f1 = (cpu->freg)[code_11_15];
  int f2 = (cpu->freg)[code_16_20];
  float ff1 = *(float *)&f1;
  float ff2 = *(float *)&f2;
  float ff3 = ff1 * ff2;
  int f3 = *(int *)&ff3;
  (cpu->freg)[code_6_10]=f3;
  *a+=4;
}

void fdiv(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;/*frt*/
  int code_11_15 = (code >> 16) & 0x1F;/*fra*/
  int code_16_20 = (code >> 11) & 0x1F;/*frb*/
  int f1 = (cpu->freg)[code_11_15];
  int f2 = (cpu->freg)[code_16_20];
  float ff1 = *(float *)&f1;
  float ff2 = *(float *)&f2;
  float ff3 = ff1 / ff2;
  int f3 = *(int *)&ff3;
  (cpu->freg)[code_6_10]=f3;
  *a+=4;
}


void fsqrt(int code,CPU *cpu,int *a){
  int code_6_10 = (code >> 21) & 0x1F;
  int code_11_15 = (code >> 16) & 0x1F;
  int f = (cpu->freg)[code_11_15];
  float ff = *(float *)&f;
  float fff = sqrtf(ff);
  int x = *(int *)&fff;
  (cpu->freg)[code_6_10]=x;
  *a+=4;
}

void print_reg(CPU *cpu){
  for(int i=0;i<10;i++){
    int t = (cpu->reg)[i];
    int k = (cpu->freg)[i];
    float f = *(float *)&k;
    printf("r%d -> %d ::: f%d -> %f %d\n",i,t,i,f,k);
  }
  printf("lr %d\n",(cpu->lr));
  for(int i=0;i<4;i++){
    printf("cr%d -> %d cr%d -> %d\n",2*i,(cpu->cr)[2*i],2*i+1,(cpu->cr)[2*i+1]);
  }
}

/*
void print_reg(CPU *cpu){
  for (int i=0;i<9;i++){
    int t = (cpu->reg)[i];
    printf("r%d %d\n",i,t);
  }
  for(int i=0;i<32;i++){
    int t = (cpu->freg)[i];
    float f = *(float *)&t;
    printf("f%d %f %d\n",i,f,t);
  }
  printf("lr %d\n",(cpu->lr));
  for(int i=0;i<8;i++){
    printf("cr%d %d\n",i,(cpu->cr)[i]);
  }
  }*/

void print_memory(CPU *cpu){
  for(int i=0;i<M;i++){
    if(cpu_memory[i]!=0 && i < 100000){
      printf("%d		%d		%f \n",i*4,cpu_memory[i], *(float*)&(cpu_memory[i]));
    }
  }
  printf("reg3                %d\n",(cpu->reg)[3]);
  printf("reg4                %d\n",(cpu->reg)[4]);
}

void print_ins(int code,int addr){
  int code_0_5=0;
  int code_22_30=0;
  int code_21_30=0;
  int code_6_10=0;
  int code_30=0;
  int code_31=0;
  int code_26_30=0;
  int code_11_20=0;
  code_0_5 = code & 0xFC000000;
  code_22_30 = code & 0x3FE;
  code_21_30 = code & 0x7FE;
  code_6_10 = code & 0x3E00000;
  code_30 = code & 0x2;
  code_31 = code & 0x1;
  code_26_30 = code & 0x3E;
  code_11_20 = code & 0x1FF800;
  if(code_0_5 == 2080374784){
    if(code_22_30 == 532){
      printf("add --- %d\n",addr);
    }
    else if(code_22_30 == 1022){
      printf("itof --- %d\n",addr);
    }    
    else if(code_22_30 == 80){
      printf("subf --- %d\n",addr);
    }
    else if(code_21_30 == 888){
      printf("mr --- %d\n",addr);
    }
    else if(code_21_30 == 46){
      printf("lwzx --- %d\n",addr);
    }
    else if(code_21_30 == 302){
      printf("stwx --- %d\n",addr);
    }
    else if(code_21_30 == 1198){
      printf("lfdx --- %d\n",addr);
    }
    else if(code_21_30 == 1454){
      printf("stfdx --- %d\n",addr);
    }
    else if(code_21_30 == 678){
      printf("mflr --- %d\n",addr);
    }
    else if(code_21_30 == 934){
      if(code_11_20 == 16384){
        printf("mtlr --- %d\n",addr);
      }
      else if(code_11_20 == 18432){
        printf("mtctr --- %d\n",addr);
      }
    }
    else if(code_22_30 == 0){
      printf("cmp --- %d\n",addr);
    }
    else if(code_21_30 == 48){
      printf("slw --- %d\n",addr);
    }
    else if(code_21_30 == 1072){
      printf("srw --- %d\n",addr);
    }
    else if(code_11_20 == 212992){
      printf("neg --- %d\n",addr);
    }
  }
  else if(code_0_5 == 1006632960){
    printf("lis --- %d\n",addr);
  }   
  else if(code_0_5 == -939524096){
    printf("lfd --- %d\n",addr);
  }
  else if(code_0_5 == -671088640){
    printf("stfd --- %d\n",addr);
  }
  else if(code_0_5 == 738197504){
    printf("cmpi --- %d\n",addr);
  }
  else if(code_0_5 == 1073741824){
    if(code_30==0){
      if(code_6_10 == 8388608){
        printf("bne --- %d\n",addr);
      }
      else if(code_6_10 == 4194304){
        printf("bgt --- %d\n",addr);
      }
      else if(code_6_10 == 2097152){
        printf("blt --- %d\n",addr);
      }
      else if(code_6_10 == 16777216){
        printf("beq --- %d\n",addr);
      }
    }
  }
  else if(code_0_5 == 134217728){
    printf("in --- %d\n",addr);
  }
  else if(code_0_5 == 268435456){
    printf("fin --- %d\n",addr);
  }
  else if(code_0_5 == 939524096){
    printf("addi --- %d\n",addr);
  }
  else if(code_0_5 == 67108864){
    printf("out --- %d\n",addr);
  }
  else if(code_0_5 == 1275068416){
    if(code_21_30 == 32){
      printf("blr --- %d\n",addr);
    }
    else if(code_21_30 == 1056){
      printf("bctr --- %d\n",addr);
    }
  }
  else if(code_0_5 == -1879048192){
    printf("stw --- %d\n",addr);
  }
  else if(code_0_5 == 1207959552){
    if(code_31 == 1){
      printf("bl --- %d\n",addr);
    }
    else{
      printf("b --- %d\n",addr);
    }
  }
  else if(code_0_5 == -1811939328){
    printf("stwu --- %d\n",addr);
  }
  else if(code_0_5 == -1207959552){
    printf("lmw --- %d\n",addr);
  }
  else if(code_0_5 == -1140850688){
    printf("stmw --- %d\n",addr);
  }
  else if(code_0_5 == -2147483648){
    printf("lwz --- %d\n",addr);
  }
  else if(code_0_5 == 1409286144){
    printf("slwi か srwi --- %d \n",addr);
  }
  else if(code_0_5 == -1476395008){
    printf("fslwi --- %d\n",addr);
  }
  else if(code_0_5 == -67108864){
    if(code_26_30 == 42){
      printf("fadd --- %d\n",addr);
    }
    else if(code_26_30 == 40){
      printf("fsub --- %d\n",addr);
    }
    else if(code_26_30 == 50){
      printf("fmul --- %d\n",addr);
    }
    else if(code_26_30 == 36){
      printf("fdiv --- %d\n",addr);
    }
    else if(code_26_30 == 60){
      printf("fabs --- %d\n",addr);
    }
    else if(code_26_30 == 16){
      printf("fmr --- %d\n",addr);
    }
    else if(code_26_30 == 44){
      printf("fsqrt --- %d\n",addr);
    }
    else if(code_26_30 == 0){
      printf("fneg --- %d\n",addr);
    }
    else if(code_26_30 == 2){
      printf("fcmpu --- %d\n",addr);
    }
    else if(code_22_30 == 1016){
      printf("ftoi --- %d\n",addr);
    }
    else if(code_22_30 == 1022){
      printf("floor --- %d\n",addr);
    }
  }
}
void exec(CPU *cpu,FILE *file2,FILE *file3){
  int addr=0;
  int stopaddr = -1;
  int check=0;
  int x=0;
  int rc=0;
  int code=0;
  int code_0_5=0;
  int code_22_30=0;
  int code_21_30=0;
  int code_6_10=0;
  int code_30=0;
  int code_31=0;
  int code_26_30=0;
  int code_11_20=0;
  int flag = 0;
  int inflag =0;
  int pflag =0;
  int mflag = 0;
  int fggg=0;
  int yy=0;
  int flagj=2;
  printf(">>> 停止させたいアドレスを入力(最後まで実行するなら負の値): ");
  scanf("%d",&stopaddr);
  printf(">>> 命令を表示するならば1 しないならば0 : ");
  scanf("%d",&flag);
  printf("in finごとにscanfを挟むなら1 挟まないなら0 : ");
  scanf("%d",&inflag);
  int uu=0;
  int insnum=0;
  while(1){
    if((cpu->reg)[3]>(cpu->reg)[4]){
      printf("スタックがヒープに入る %d\n",addr);
      exit(1);
    }
    insnum+=1;
    if(flagj==1){
      //printf("入力 :");
      //scanf("%d",&stopaddr);
      flagj=0;
    }
    if(addr==36944){
      yy+=1;
      printf("%d\n",yy);
    }


    /*if((fggg==1)&&((cpu_memory)[8/4]==1065353216)){
      printf("adddddr %d\n",addr);
      int hhh=0;
      scanf("%d",&hhh);
    }
    printf("memory 8 %d\n",(cpu_memory)[8/4]);
    if((cpu_memory)[8/4]==50004){
      fggg=1;
    }*/
    if(addr==380){
      printf("ADDR 53096 MEMORY %d\n",(cpu_memory)[53096/4]);
    }
    if(addr == stopaddr){
      pflag=1;
      uu=1;
      printf("メモリを表示1 しない0 :");
      scanf("%d",&mflag);
    }
    if(uu==1){
      //printf("freggggggggggggg1 %d\n",(cpu->freg)[1]);
    }
    code=(cpu_memory)[addr/4];
    code_0_5 = code & 0xFC000000;
    code_22_30 = code & 0x3FE;
    code_21_30 = code & 0x7FE;
    code_6_10 = code & 0x3E00000;
    code_30 = code & 0x2;
    code_31 = code & 0x1;
    code_26_30 = code & 0x3E;
    code_11_20 = code & 0x1FF800;
    if(flag==1){
      print_ins(code,addr);
    }
    
    if(code_0_5 == 2080374784){
      if(code_22_30 == 532){
        add(code,cpu,&addr);
      }
      else if(code_22_30 == 1022){
        itof(code,cpu,&addr);
      }
      else if(code_22_30 == 80){
        subf(code,cpu,&addr);
      }
      else if(code_21_30 == 888){
        mr(code,cpu,&addr);
      }
      else if(code_21_30 == 46){
        lwzx(code,cpu,&addr);
      }
      else if(code_21_30 == 302){
        stwx(code,cpu,&addr);
      }
      else if(code_21_30 == 1198){
        lfdx(code,cpu,&addr);
      }
      else if(code_21_30 == 1454){
        stfdx(code,cpu,&addr);
      }
      else if(code_21_30 == 678){
        mflr(code,cpu,&addr);
      }
      else if(code_21_30 == 934){
        if(code_11_20 == 16384){
          mtlr(code,cpu,&addr);
        }
        else if(code_11_20 == 18432){
          mtctr(code,cpu,&addr);
        }
      }
      else if(code_22_30 == 0){
        cmp(code,cpu,&addr);
      }
      else if(code_21_30 == 48){
        slw(code,cpu,&addr);
      }
      else if(code_21_30 == 1072){
        srw(code,cpu,&addr);
      }
      else if(code_11_20 == 212992){
        neg(code,cpu,&addr);
      }
    }
    else if(code_0_5 == 1006632960){
      lis(code,cpu,&addr);
    }   
    else if(code_0_5 == -939524096){
      lfd(code,cpu,&addr);
    }
    else if(code_0_5 == -671088640){
      stfd(code,cpu,&addr);
    }
    else if(code_0_5 == 738197504){
      cmpi(code,cpu,&addr);
    }
    else if(code_0_5 == 1073741824){
      if(code_30==0){
        if(code_6_10 == 8388608){
          bne(code,cpu,&addr);
        }
        else if(code_6_10 == 4194304){
          bgt(code,cpu,&addr);
        }
        else if(code_6_10 == 2097152){
          blt(code,cpu,&addr);
        }
        else if(code_6_10 == 16777216){
          beq(code,cpu,&addr);
        }
      }
    }
    else if(code_0_5 == 134217728){
      in(code,cpu,&addr,file2);
      if(inflag==1){
        int y;
        printf("何か入力: ");
        scanf("%d",&y);
      }
    }
    else if(code_0_5 == 268435456){
      fin(code,cpu,&addr,file2);
      if(inflag==1){
        int y;
        printf("何か入力: ");
        scanf("%d",&y);
      }
    }
    else if(code_0_5 == 939524096){
      addi(code,cpu,&addr);
    }
    else if(code_0_5 == 67108864){
      out(code,cpu,&addr,file3);
    }
    else if(code_0_5 == 1275068416){
      if(code_21_30 == 32){
        blr(code,cpu,&addr);
      }
      else if(code_21_30 == 1056){
        bctr(code,cpu,&addr);
      }
    }
    else if(code_0_5 == -1879048192){
      stw(code,cpu,&addr);
    }
    else if(code_0_5 == 1207959552){
      if(code_31 == 1){
        bl(code,cpu,&addr);
      }
      else{
        b(code,cpu,&addr);
      }
    }
    else if(code_0_5 == -1811939328){
      stwu(code,cpu,&addr);
    }
    else if(code_0_5 == -1207959552){
      lmw(code,cpu,&addr);
    }
    else if(code_0_5 == -1140850688){
      stmw(code,cpu,&addr);
    }
    else if(code_0_5 == -2147483648){
      lwz(code,cpu,&addr);
    }
    else if(code_0_5 == 1409286144){
      rlwinm(code,cpu,&addr);
    }
    else if(code_0_5 == -1476395008){
      fslwi(code,cpu,&addr);
    }
    else if(code_0_5 == -67108864){
      if(code_26_30 == 42){
        fadd(code,cpu,&addr);
      }
      else if(code_26_30 == 40){
        fsub(code,cpu,&addr);
      }
      else if(code_26_30 == 50){
        fmul(code,cpu,&addr);
      }
      else if(code_26_30 == 36){
        fdiv(code,cpu,&addr);
      }
      else if(code_26_30 == 60){
        fabs2(code,cpu,&addr);
      }
      else if(code_26_30 == 16){
        fmr(code,cpu,&addr);
      }
      else if(code_26_30 == 44){
        fsqrt(code,cpu,&addr);
      }
      else if(code_26_30 == 0){
        fneg(code,cpu,&addr);
      }
      else if(code_26_30 == 2){
        fcmpu(code,cpu,&addr);
      }
      else if(code_22_30 == 1016){
        ftoi(code,cpu,&addr);
      }
      else if(code_22_30 == 1022){
        floor2(code,cpu,&addr);
      }
    }
    else{
      break;
    }
    if(uu==1){
      //printf("freggggggggggggg1 %d\n",(cpu->freg)[1]);
    }
    if(mflag==1){
      print_memory(cpu);
      mflag=0;
    }
    if(pflag==1){     
      print_reg(cpu);
      pflag=0;
      printf("次のストップアドレスを入力:");
      scanf("%d",&stopaddr);
      if(stopaddr==1){
        stopaddr=addr;
      }
    }
  }
  printf("%d回命令を実行\n",insnum);
}    

int main(int argc,char **argv){
  FILE *file;
  file=fopen(argv[1],"rb");
  fseek(file,0,SEEK_END);
  int size=ftell(file);
  printf("%d\n",size);
  rewind(file);
  int *memory_sub = (int *) malloc(size);
  fread(memory_sub,sizeof(int),size,file);
  fclose(file);

  CPU cpu;
  init_cpu(&cpu);

  char print_flag;
  printf(">>> 最後にメモリを表示するならy, しないならnを入力: ");
  scanf("%c", &print_flag);
  read_memory(&cpu,memory_sub,size);
  printf("a\n");
  
  FILE *file2;
  FILE *file3;
  file2 = fopen(argv[2],"rb");
  file3 = fopen(argv[3],"w");


  exec(&cpu,file2,file3);
  if (print_flag == 'y') {
    print_memory(&cpu);
  }

  fclose(file2);
  fclose(file3);
  printf("%d\n",h);
  return 0;
}

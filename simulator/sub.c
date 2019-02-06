#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "ins.h"
#include <errno.h>
#include <unistd.h>
#include <signal.h>
#define R 32
#define M 10000000
static int memory[M];
typedef struct cpu{
  int reg[32];
} CPU;

int main(int argc,char **argv){
  CPU cpu;
  memory[M-2]=0;
  printf("%d\n",memory[M-2]);
  return 0;
}
  

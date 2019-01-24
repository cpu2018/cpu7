CC = gcc
CPP = g++
CFLAGS = -Wall -std=c99 -O2
CONV_SOURCE = sld_converter.cpp
AS_SOURCE = as.c
SIMU_SOURCE = simu.c
ML_TESTS = \
float2
ASM_TESTS = 
MIN_CAML = min-caml # シミュレータでfloatの実装が完成したら、min-camlにすると、float関係のライブラリが読み込まれます

.PHONY: all clean rm_binary

all: converter assembler simulator do_casm do_asm

converter: $(CONV_SOURCE)
	$(CPP) $(CFLAGS) -o $@ $^

assembler: $(AS_SOURCE)
	$(CC) $(CFLAGS) -o $@ $^

simulator: $(SIMU_SOURCE)
	$(CC) $(CFLAGS) -o $@ $^

do_casm: $(ML_TESTS:%.ml=%)

.PRECIOUS: %.s

%.s: %.ml
	-./$(MIN_CAML) $*

%: %.s
	-./assembler $^

do_asm: $(ASM_TESTS:%.s=%)

%: %.s
	-./assembler $^

rm_binary:
	-rm -f $(ML_TESTS) $(ASM_TESTS)

clean:
	-rm -f assembler simulator $(ML_TESTS) $(ML_TESTS:%=%.s) $(ASM_TESTS)

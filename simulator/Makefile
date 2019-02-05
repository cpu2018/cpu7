CC = gcc
CPP = g++
CFLAGS = -Wall -O2
CONV_SOURCE = sld_converter.cpp
AS_SOURCE = as.c
SIMU_SOURCE = simu.c finv1.c finv2.c fsqrt_table.c fsqrtinv_table.c
ML_TESTS = \
minrt
ASM_TESTS =
MIN_CAML = min-caml # シミュレータでfloatの実装が完成したら、min-camlにすると、float関係のライブラリが読み込まれます

.PHONY: all clean rma rmb

all: converter assembler simulator do_casm do_asm

converter: $(CONV_SOURCE)
	$(CPP) $(CFLAGS) -o $@ $^

assembler: $(AS_SOURCE)
	$(CC) $(CFLAGS) -o $@ $^

simulator: $(SIMU_SOURCE)
	$(CC) $(CFLAGS) -o $@ $^ -lm

do_casm: $(ML_TESTS:%.ml=%)

.PRECIOUS: %.s

%.s: %.ml
	-./$(MIN_CAML) -iter 0 $*

%: %.s
	-./assembler $^

do_asm: $(ASM_TESTS:%.s=%)

%: %.s
	-./assembler $^

rma:
	-rm -f $(ML_TESTS:%=%.s) $(ASM_TESTS:%=%.s)

rmb:
	-rm -f $(ML_TESTS) $(ASM_TESTS)

clean:
	-rm -f assembler simulator $(ML_TESTS) $(ML_TESTS:%=%.s) $(ASM_TESTS)

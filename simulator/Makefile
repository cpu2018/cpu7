CC = gcc
CPP = g++
CFLAGS = -Wall -O2
CONV_SOURCE = sld_converter.cpp
AS_SOURCE = as.c
SIMU_SOURCE = simu.c
ML_TESTS = \
minrt
ASM_TESTS =
MIN_CAML = min-caml # シミュレータでfloatの実装が完成したら、min-camlにすると、float関係のライブラリが読み込まれます

.PHONY: all clean rma rmb rm

all: converter assembler simulator do_casm do_asm

converter: $(CONV_SOURCE)
	$(CPP) $(CFLAGS) -o $@ $^

assembler: $(AS_SOURCE)
	$(CC) $(CFLAGS) -o $@ $^

simulator: $(SIMU_SOURCE)
	$(CC) $(CFLAGS) -o $@ $^ -lm

do_casm: $(ML_TESTS:%.ml=%)

.PRECIOUS: %.s %.txt

%.s: %.ml
	-./$(MIN_CAML) -inline_size 100 $*

%: %.s
	-./assembler $^

do_asm: $(ASM_TESTS:%.s=%)

%: %.s
	-./assembler $^

rm:
	-rm -f $(ML_TESTS:%=%.s) $(ML_TESTS:%=%.txt) $(ASM_TESTS:%=%.s) $(ML_TESTS) $(ASM_TESTS)

rma:
	-rm -f $(ML_TESTS:%=%.s) $(ASM_TESTS:%=%.s)

rmb:
	-rm -f $(ML_TESTS) $(ASM_TESTS)

clean:
	-rm -f assembler simulator $(ML_TESTS) $(ML_TESTS:%=%.s) $(ML_TESTS:%=%.txt) $(ASM_TESTS)

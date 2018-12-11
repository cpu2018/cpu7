CC = gcc
CFLAGS = -Wall -O2
AS_SOURCE = as.c
SIMU_SOURCE = simu.c
ML_TESTS = \
print_int \
print_char \
array \
fib
ASM_TESTS = \
print_int1
MIN_CAML = min-caml-int # シミュレータでfloatの実装が完成したら、min-camlにすると、float関係のライブラリが読み込まれます

.PHONY: all clean rm_binary

all: assembler simulator do_casm do_asm

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

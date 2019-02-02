CPP = g++
CFLAGS = -Wall -O2
CONV_SOURCE =
AS_SOURCE = 
SIMU_SOURCE = simulator.cpp
ML_TESTS =
ASM_TESTS =
MIN_CAML = min-caml # シミュレータでfloatの実装が完成したら、min-camlにすると、float関係のライブラリが読み込まれます

.PHONY: all clean rm_binary rm_assembly

all: simulator do_casm do_asm

converter: $(CONV_SOURCE)
	$(CPP) $(CFLAGS) -o $@ $^

assembler: $(AS_SOURCE)
	$(CPP) $(CFLAGS) -o $@ $^

simulator: $(SIMU_SOURCE)
	$(CPP) $(CFLAGS) -o $@ $^ -lm

do_casm: $(ML_TESTS:%.ml=%)

.PRECIOUS: %.s

%.s: %.ml
	-./$(MIN_CAML) $*

%: %.s
	-./assembler $^

do_asm: $(ASM_TESTS:%.s=%)

%: %.s
	-./assembler $^

rm_assembly:
	-rm -f $(ML_TESTS:%=%.s) $(ASM_TESTS)

rm_binary:
	-rm -f $(ML_TESTS) $(ASM_TESTS)

clean:
	-rm -f assembler simulator $(ML_TESTS) $(ML_TESTS:%=%.s) $(ASM_TESTS)

CC = gcc
CFLAGS = -Wall -O2
AS = as.c
SIMU = simu.c
TESTS = out print_5 print_int print_int1 test test10 bobo_test float
MIN_CAML = min_caml

.PHONY: all rm_binary clean

all: assembler simulator do_cpl do_asm do_simu

assembler: $(AS)
	$(CC) $(CFALGS) -o $@ $^

simulator: $(SIMU)
	$(CC) $(CFALGS) -o $@ $^

do_cpl: $(TESTS:%=./%.s)

./%.s: $(MIN_CAML) ./%.ml
	./$(MIN_CAML) $*

do_asm:

do_simu:

rm_binary:
	-rm binary $(TESTS)

clean:
	-rm assembler simulator binary $(TESTS)
	echo "make clean が正常に終了しました。\n"

CC = gcc
CFLAGS = -Wall -O2
AS = as.c
SIMU = simu.c
TESTS = out print_5 print_int
MIN_CAML = min_caml

.PHONY: all rm_binary clean

all: assembler simulator do_asm

assembler: $(AS)
	$(CC) $(CFALGS) -o $@ $^

simulator: $(SIMU)
	$(CC) $(CFALGS) -o $@ $^

do_asm: $(TESTS:%=./%.s)

./%.s: $(MIN_CAML) ./%.ml
	./$(MIN_CAML) $*

rm_binary:
	-rm binary $(TESTS)

clean:
	-rm assembler simulator binary $(TESTS)

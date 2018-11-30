CC = gcc
CFLAGS = -Wall
AS = as.c
SIMU = simu.c
TARGETS = 
TARGETB = binary

.PHONY: all cb clean

all: assembler simulator

assembler: $(AS)
	$(CC) $(CFALGS) -o $@ $^

simulator: $(SIMU)
	$(CC) $(CFALGS) -o $@ $^

cb:
	-rm binary

clean:
	-rm assembler simulator binary

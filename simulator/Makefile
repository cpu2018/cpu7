CC = gcc
CFLAGS = -Wall
AS = as.c
SIMU = simu.c
TARGETS = 
TARGETB = binary

.PHONY: all clean

all: assembler simulator

assembler: $(AS)
	$(CC) $(CFALGS) -o $@ $^

simulator: $(SIMU)
	$(CC) $(CFALGS) -o $@ $^

clean:
	-rm assembler simulator binary

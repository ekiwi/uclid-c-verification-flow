CFLAGS += -g
CFLAGS += -mno-red-zone
CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
CFLAGS += -I../../example

KLEE = ../../klee/build/bin/klee

%.ll: %.c
	clang $(CFLAGS) -o $@ -c -S -emit-llvm -O2 $<

%.smt: 1d_world.harness.ll
	$(KLEE) -entry-point=$*_h $<
	mkdir -p $@

all: init.smt

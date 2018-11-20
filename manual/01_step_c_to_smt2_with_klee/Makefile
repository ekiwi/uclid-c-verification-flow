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
	mv klee-last/*.smt2 $@/

all: init.smt left.smt right.smt

remove_klee:
	rm -rf klee-*

clean: remove-klee
	rm -rf *.smt


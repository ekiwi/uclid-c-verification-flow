CFLAGS += -g
CFLAGS += -mno-red-zone
CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx

%.ll: %.c
	clang $(CFLAGS) -o $@ -c -S -emit-llvm -O2 $<

all: 1d_world.ll

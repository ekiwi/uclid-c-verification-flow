# UCLID C Verification Flow

This repository is used to develop a methodology that
allows us to verify "OS-style" C programs in the
[uclid](https://github.com/uclid-org/uclid/) model checker.

Our approach is similar to the methodology explored
in the [Hyperkernel paper](https://unsat.cs.washington.edu/projects/hyperkernel/).
However, instead of using Python to describe the abstract state
transition model, we use the uclid model checker.
In order to ensure that the C implementation that we want to verify
is a valid refinement of the high-level uclid mode, we use
the [klee](https://klee.github.io/) symbolic execution engine
(whereas Hyperkernel uses their custom LLVM translator and Python scripts).


## Example

As an example, we will verify a 1D world which we can explore by stepping
`left` or `right`. We assume that the `init` function is called before any
other functions are called.

The complete C program looks like this:

```.c
#include <stdint.h>
#include <stdbool.h>

int32_t pos;

void init() {
	pos = 0;
}

bool left() {
	if(pos <= -100) { return false; }
	pos -= 1;
	return true;
}

bool right() {
	if(pos >= 100) { return false; }
	pos += 1;
	return true;
}
```


### uclid model

We can implement the sam efunctions in uclid:

```.ucl
module main {
	var pos : bv32;

	init {
		pos = 0bv32;
	}

	procedure left()
		returns (r : boolean)
		modifies pos;
	{
		if ( pos <= -100bv32 ) { r = false; }
		else { pos = pos - 1bv32; r = true; }
	}

	procedure right()
		returns (r : boolean)
		modifies pos;
	{
		if ( pos >= 100bv32 ) { r = false; }
		else { pos = pos + 1bv32; r = true; }
	}
}
```

Our first goal is to verify that our uclid implementations are
equivalent to the corresponding C functions.

## Compiling Klee

In order to translate C programs into SMT formulas
we use the klee symbolic execution engine with a
small custom extension that allows us to dump
the (symbolic) value and path condition of expressions
using the `klee_dump_expr` function.

Our fork of klee is included as a submodule and
can be compiled like this:

```.sh
git submodule update --init
cd klee
mkdir build
cd build
cmake ..
make -j4
```

This will result in a binary in `klee/build/bin/klee`

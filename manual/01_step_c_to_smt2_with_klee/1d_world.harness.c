#include "1d_world.c"

void init_h() {
	klee_make_symbolic(&pos, sizeof(pos), "pos");
	init();
	klee_dump_expr("pos_n", pos);
}

void left_h() {
	klee_make_symbolic(&pos, sizeof(pos), "pos");
	bool success = left();
	klee_dump_expr("success_n", success);
	klee_dump_expr("pos_n", pos);
}

void right_h() {
	klee_make_symbolic(&pos, sizeof(pos), "pos_in");
	bool success = right();
	klee_dump_expr("success_n", success);
	klee_dump_expr("pos_n", pos);
}


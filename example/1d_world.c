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

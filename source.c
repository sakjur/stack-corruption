#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
	
	int x = 0xADA5F00D;
	char buf[32];
	int y = 0xADA5F00D;
	scanf("%32s",buf);
	printf("%s %x %x\n", buf, x, y);
	return 0;
}


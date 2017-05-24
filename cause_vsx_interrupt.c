#include <stdio.h>
#include<altivec.h>
#include <unistd.h>

int main(){
	int i = 1024; 
	vector signed int foo = {0, 0, 0, 0};

	while (i--) {
		foo = vec_add ((vector signed int){1, 1, 1, 1}, foo);
		usleep(1000);
	}

	printf("%d %d %d %d\n", foo[0], foo[1] , foo[2], foo[3]);


	return 0;
}

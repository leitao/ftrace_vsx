#include <stdio.h>
#include<altivec.h>
#include <unistd.h>

int main(){
	int i = 1024; 
	vector signed int foo = {1, 3, 5, 7};
	vector signed int bar = {2, 4, 6, 8};

	while (i--) {
		bar = vec_add ((vector signed int){1, 2, 3, 4}, foo);
		foo = vec_add (foo, (vector signed int) {2, 2, 2, 2});
		usleep(1000);
	}

	printf("%d %d %d %d\n", foo[0], foo[1] , foo[2], foo[3]);


	return 0;
}

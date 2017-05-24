all:
	gcc -O0 -mvsx -o vsx cause_vsx_interrupt.c
clean:
	rm -fr vsx output_all.txt output_vsx.txt

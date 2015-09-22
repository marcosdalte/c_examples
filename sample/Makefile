all:
	gcc -o estatica estatica.c -I ../include/ -L ../src/ -lc_examples_static
	gcc -g -L ../src/ compartilhada.c -I ../include/ -o compartilhada -lc_examples_shared
clean:
	rm -rf compartilhada estatica

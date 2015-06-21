OBJ:
	gcc -c ../src/cpf.c ../src/cpf.c -I ../include/
	ar rcs ../src/libcpf.a ../src/cpf.o
	gcc -c -fPIC ../src/cnpj.c -I ../include/
	gcc -shared -olibcnpj.so cnpj.o -I ../include/

all: $(OBJ)

clean:
	rm -f $(TARGETS) *.o *~ core core.* *.core *.a *.so

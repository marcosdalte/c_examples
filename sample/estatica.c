#include <stdio.h>
#include <cpf.h>
#include <cnpj.h>

int main(){
	printf("%s\n",format_cpf("03076765957"));
	printf("%s\n",format_cnpj("12345698531458"));
	return 0;
}

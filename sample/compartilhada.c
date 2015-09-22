#include <stdio.h>
#include <cnpj.h>
#include <cpf.h>

int main(){
	printf("%s\n",format_cnpj("020604478000138"));
	printf("%s\n",format_cpf("01545785957"));
	return 0;
}

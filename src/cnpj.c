#include "cnpj.h"

char* format_cnpj(char* number) {
	int i, pos;
	int size = strlen(number);
	int total = size+3;
	int aux = ((size-6)/3);
	if (aux > 0) {
		total += aux-1;
	}
	if ((size-6)%3 > 0) {
		total += 1;
	} 
	char *result = malloc(total);
	pos=total-2;
	for (i=0; i<size; i++) {
		if (i==2) {
			result[pos--] = '-';
		} else if (i==6) {
			result[pos--] = '/';
		} else if (i > 6 && i%3 == 0) {
			result[pos--] = '.';
		}
		result[pos--] = number[size-i-1];
	}
	result[total-1] = '\0';
	return result;
}



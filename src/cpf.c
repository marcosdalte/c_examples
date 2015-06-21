#include "cpf.h"

char* format_cpf(char* number) {
	int i, pos;
	char *result = malloc(15); 
	for (i=0, pos=0; i<strlen(number); i++) {
		if (i == 3 || i == 6) {
			result[pos++] = '.';
		} else if (i == 9) {
			result[pos++] = '-';
		}

		result[pos++] = number[i];
	} 
	result[14] = '\0';
	return result;
}



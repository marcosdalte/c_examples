# c_examples
Evita o conflito caso exista um arquivo com o mesmo de nome alguma regra do Makefile
.PHONY: clean

#Comandos Make
$@    Nome da regra. 
$<    Nome da primeira dependência 
$^     Lista de dependências
$?     Lista de dependências mais recentes que a regra.
$*     Nome do arquivo sem sufixo
@echo Imprimir um valor na tela
@	evitar que seja impresso na tela

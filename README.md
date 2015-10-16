# rpm_and_libs
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

#Compile
make

make sample

make install

#Create a package RPM
make rpm
To alter directory of the instalation modify PATH INSTALL_DIR in defines.mk
INSTALL_DIR=/home/$(USER)/t_exam

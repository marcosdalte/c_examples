import os
from ctypes import *

lib = cdll.LoadLibrary('../src/libc_examples_shared.so')

cnpj = lib.format_cnpj
cnpj.restype = c_char_p
cnpj.argtypes = [c_char_p]
pj = cnpj('020604478000138')
print pj

cpf = lib.format_cpf
cpf.restype = c_char_p
cpf.argtypes = [c_char_p]
pf = cpf("01545785957")
print pf


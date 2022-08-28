extern __deldma
use16
align 2

section .text
    global _deldma
_deldma:
    jmp __deldma

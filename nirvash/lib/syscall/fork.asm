extern __fork
use16
align 2

section .text
    global _fork
_fork:
    jmp __fork

extern __fstat
use16
align 2

section .text
    global _fstat
_fstat:
    jmp __fstat

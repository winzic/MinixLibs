extern __getdents
use16
align 2

section .text
    global _getdents
_getdents:
    jmp __getdents

extern __sbrk
use16
align 2

section .text
    global _sbrk
_sbrk:
    jmp __sbrk

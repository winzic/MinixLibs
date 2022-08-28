extern __setsid
use16
align 2

section .text
    global _setsid
_setsid:
    jmp __setsid

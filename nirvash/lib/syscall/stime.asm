extern __stime
use16
align 2

section .text
    global _stime
_stime:
    jmp __stime

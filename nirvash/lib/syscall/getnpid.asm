extern __getnpid
use16
align 2

section .text
    global _getnpid
_getnpid:
    jmp __getnpid

extern __uname
use16
align 2

section .text
    global _uname
_uname:
    jmp __uname

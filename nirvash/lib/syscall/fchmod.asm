extern __fchmod
use16
align 2

section .text
    global _fchmod
_fchmod:
    jmp __fchmod

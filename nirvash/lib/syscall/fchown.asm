extern __fchown
use16
align 2

section .text
    global _fchown
_fchown:
    jmp __fchown

extern __dup
use16
align 2

section .text
    global _dup
_dup:
    jmp __dup

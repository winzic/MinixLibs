extern __dup2
use16
align 2

section .text
    global _dup2
_dup2:
    jmp __dup2

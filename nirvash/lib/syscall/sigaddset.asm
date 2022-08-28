extern __sigaddset
use16
align 2

section .text
    global _sigaddset
_sigaddset:
    jmp __sigaddset

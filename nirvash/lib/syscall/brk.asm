extern __brk
use16
align 2

section .text
    global _brk
_brk:
    jmp __brk

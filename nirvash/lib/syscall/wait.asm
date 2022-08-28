extern __wait
use16
align 2

section .text
    global _wait
_wait:
    jmp __wait

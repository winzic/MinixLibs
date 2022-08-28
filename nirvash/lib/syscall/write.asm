extern __write
use16
align 2

section .text
    global _write
_write:
    jmp __write

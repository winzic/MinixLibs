extern __read
use16
align 2

section .text
    global _read
_read:
    jmp __read

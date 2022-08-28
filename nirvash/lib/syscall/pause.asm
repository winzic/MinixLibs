extern __pause
use16
align 2

section .text
    global _pause
_pause:
    jmp __pause

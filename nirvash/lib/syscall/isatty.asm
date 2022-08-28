extern __isatty
use16
align 2

section .text
    global _isatty
_isatty:
    jmp __isatty

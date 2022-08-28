extern __getitimer
use16
align 2

section .text
    global _getitimer
_getitimer:
    jmp __getitimer

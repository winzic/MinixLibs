extern __setitimer
use16
align 2

section .text
    global _setitimer
_setitimer:
    jmp __setitimer

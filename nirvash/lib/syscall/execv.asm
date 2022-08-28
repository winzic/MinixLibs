extern __execv
use16
align 2

section .text
    global _execv
_execv:
    jmp __execv

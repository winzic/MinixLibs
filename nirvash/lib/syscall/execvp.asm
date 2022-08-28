extern __execvp
use16
align 2

section .text
    global _execvp
_execvp:
    jmp __execvp

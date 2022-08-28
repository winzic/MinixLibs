extern __execve
use16
align 2

section .text
    global _execve
_execve:
    jmp __execve

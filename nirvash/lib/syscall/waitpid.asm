extern __waitpid
use16
align 2

section .text
    global _waitpid
_waitpid:
    jmp __waitpid

extern __umask
use16
align 2

section .text
    global _umask
_umask:
    jmp __umask

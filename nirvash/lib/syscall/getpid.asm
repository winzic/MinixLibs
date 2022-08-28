extern __getpid
use16
align 2

section .text
    global _getpid
_getpid:
    jmp __getpid

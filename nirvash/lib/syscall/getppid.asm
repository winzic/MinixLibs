extern __getppid
use16
align 2

section .text
    global _getppid
_getppid:
    jmp __getppid

extern __getgid
use16
align 2

section .text
    global _getgid
_getgid:
    jmp __getgid


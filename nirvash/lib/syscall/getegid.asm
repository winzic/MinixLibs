extern __getegid
use16
align 2

section .text
    global _getegid
_getegid:
    jmp __getegid

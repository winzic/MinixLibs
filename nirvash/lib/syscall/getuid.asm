extern __getuid
use16
align 2

section .text
    global _getuid
_getuid:
    jmp _getuid

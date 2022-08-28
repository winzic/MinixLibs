extern __getnuid
use16
align 2

section .text
    global _getnuid
_getnuid:
    jmp __getnuid

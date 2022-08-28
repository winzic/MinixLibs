extern __getsigset
use16
align 2

section .text
    global _getsigset
_getsigset:
    jmp __getsigset

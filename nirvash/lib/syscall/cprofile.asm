extern __cprofile
use16
align 2

section .text
    global _cprofile
_cprofile:
    jmp __cprofile

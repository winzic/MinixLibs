extern __svrctl
use16
align 2

section .text
    global _svrctl
_svrctl:
    jmp __svrctl

extern __setgroups
use16
align 2

section .text
    global _setgroups
_setgroups:
    jmp __setgroups

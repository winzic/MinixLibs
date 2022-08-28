extern __getgroups
use16
align 2

section .text
    global _getgroups
_getgroups:
    jmp __getgroups

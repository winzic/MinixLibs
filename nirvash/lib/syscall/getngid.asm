extern __getngid
use16
align 2

section .text
    global _getngid
_getngid:
    jmp __getngid

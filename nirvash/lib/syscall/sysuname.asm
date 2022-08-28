extern __sysuname
use16
align 2

section .text
    global _sysuname
_sysuname:
    jmp __sysuname

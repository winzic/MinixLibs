extern __fstatfs
use16
align 2

section .text
    global _fstatfs
_fstatfs:
    jmp __fstatfs

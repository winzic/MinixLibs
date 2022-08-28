extern __lstat
use16
align 2

section .text
    global _lstat
_lstat:
    jmp __lstat

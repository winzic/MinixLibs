extern __stat
use16
align 2

section .text
    global _stat
_stat:
    jmp __stat

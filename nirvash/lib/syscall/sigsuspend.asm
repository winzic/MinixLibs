extern __sigsuspend
use16
align 2

section .text
    global _sigsuspend
_sigsuspend:
    jmp __sigsuspend

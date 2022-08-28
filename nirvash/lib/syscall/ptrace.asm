extern __ptrace
use16
align 2

section .text
    global _ptrace
_ptrace:
    jmp __ptrace

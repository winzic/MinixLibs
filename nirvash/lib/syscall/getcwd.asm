extern __getcwd
use16
align 2

section .text
    global _getcwd
_getcwd:
    jmp __getcwd

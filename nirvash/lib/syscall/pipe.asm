extern __pipe
use16
align 2

section .text
    global _pipe
_pipe:
    jmp __pipe

extern __sigaction
use16
align 2

section .text
    global _sigaction
_sigaction:
    jmp __sigaction

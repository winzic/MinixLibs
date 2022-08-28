extern __sigpending
use16
align 2

section .text
    global _sigpending
_sigpending:
    jmp __sigpending

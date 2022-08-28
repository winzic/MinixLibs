extern __sigreturn
use16
align 2

section .text
    global _sigreturn
_sigreturn:
    jmp __sigreturn

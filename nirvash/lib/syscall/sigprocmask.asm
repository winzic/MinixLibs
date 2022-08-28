extern __sigprocmask
use16
align 2

section .text
    global _sigprocmask
_sigprocmask:
    jmp __sigprocmask

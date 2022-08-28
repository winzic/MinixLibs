extern __execlp
use16
align 2

section .text
    global _execlp
_execlp:
    jmp __execlp

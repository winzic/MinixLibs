extern __tcsetattr
use16
align 2

section .text
    global _tcsetattr
_tcsetattr:
    jmp __tcsetattr

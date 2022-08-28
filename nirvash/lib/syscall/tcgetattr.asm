extern __tcgetattr
use16
align 2

section .text
    global _tcgetattr
_tcgetattr:
    jmp __tcgetattr

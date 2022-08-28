extern __lseek64
use16
align 2

section .text
    global _lseek64
_lseek64:
    jmp __lseek64

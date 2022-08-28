extern __utime
use16
align 2

section .text
    global _utime
_utime:
    jmp __utime

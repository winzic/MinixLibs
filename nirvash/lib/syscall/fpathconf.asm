extern __fpathconf
use16
align 2

section .text
    global _fpathconf
_fpathconf:
    jmp __fpathconf

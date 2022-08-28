extern __sleep
use16
align 2

section .text
    global _sleep
_sleep:
    jmp __sleep

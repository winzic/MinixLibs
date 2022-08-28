extern __nanosleep
use16
align 2

section .text
    global _nanosleep
_nanosleep:
    jmp __nanosleep

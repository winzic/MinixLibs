extern __link
use16
align 2

section .text
    global _link
_link:
    jmp __link

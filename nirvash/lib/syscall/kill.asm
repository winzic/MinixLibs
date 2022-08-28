extern __kill
use16
align 2

section .text
    global _kill
_kill:
    jmp __kills

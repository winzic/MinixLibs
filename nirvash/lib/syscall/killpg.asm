extern __killpg
use16
align 2

section .text
    global _killpg
_killpg:
    jmp __killpg

extern __pathconf
use16
align 2

section .text
    global _pathconf
_pathconf:
    jmp __pathconf

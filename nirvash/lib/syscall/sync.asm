extern __sync
use16
align 2

section .text
    global _sync
_sync:
    jmp __sync

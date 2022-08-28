extern __getdma
use16
align 2

section .text
    global _getdma
_getdma:
    jmp __getdma

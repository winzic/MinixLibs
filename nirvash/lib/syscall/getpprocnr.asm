extern __getpprocnr
use16
align 2

section .text
    global _getpprocnr
_getpprocnr:
    jmp __getpprocnr

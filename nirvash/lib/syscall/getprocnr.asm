extern __getprocnr
use16
align 2

section .text
    global _getprocnr
_getprocnr:
    jmp __getprocnr

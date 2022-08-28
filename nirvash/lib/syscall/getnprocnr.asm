extern __getnprocnr
use16
align 2

section .text
    global _getnprocnr
_getnprocnr:
    jmp __getnprocnr

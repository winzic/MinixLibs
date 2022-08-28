extern __geteuid
use16
align 2

section .text
    global _geteuid
_geteuid:
    jmp __geteuid

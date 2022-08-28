extern __setuid
extern __seteuid
use16
align 2

section .text
    global _setuid
    global _seteuid
_setuid:
    jmp __setuid
_seteuid:
    jmp __seteuid

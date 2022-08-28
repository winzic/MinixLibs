extern __setgid
extern __setegid
use16
align 2

section .text
    global _setgid
    global _setegid
_setgid:
    jmp __setgid
_setegid:
    jmp __setegid

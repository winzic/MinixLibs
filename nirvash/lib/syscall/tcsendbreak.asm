extern __tcsendbreak
use16
align 2

section .text
    global _tcsendbreak
_tcsendbreak:
    jmp __tcsendbreak

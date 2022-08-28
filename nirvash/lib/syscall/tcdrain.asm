extern __tcdrain
use16
align 2

section .text
    global _tcdrain
_tcdrain:
    jmp __tcdrain

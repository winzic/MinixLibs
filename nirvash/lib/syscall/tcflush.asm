extern __tcflush
use16
align 2

section .text
    global _tcflush
_tcflush:
    jmp __tcflush

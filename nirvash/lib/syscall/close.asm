extern __close
use16
align 2

section .text
    global _close
_close:
    jmp __close

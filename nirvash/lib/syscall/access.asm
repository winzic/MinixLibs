; access.asm
extern __access
use16
align 2

section .text
      global _access
_access:
    jmp __access

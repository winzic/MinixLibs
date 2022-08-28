extern __truncate
extern __ftruncate
use16
align 2

global _truncate
global _ftruncate

section .text
_truncate:
    jmp __truncate
_ftruncate:
    jmp __ftruncate

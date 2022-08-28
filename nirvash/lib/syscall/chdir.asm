extern __chdir
extern __fchdir
use16

align 2

section .text
    global _chdir
    global _fchdir
_chdir:
    jmp __chdir
_fchdir:
    jmp __fchdir

extern __readdir
use16
align 2

section .text
    global _readdir
_readdir:
    jmp __readdir

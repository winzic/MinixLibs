extern __readlink
use16
align 2

section .text
    global _readlink
_readlink:
    jmp __readlink

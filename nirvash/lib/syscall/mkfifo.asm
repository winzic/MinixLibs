extern __mkfifo
use16
align 2

section .text
    global _mkfifo
_mkfifo:
    jmp __mkfifo

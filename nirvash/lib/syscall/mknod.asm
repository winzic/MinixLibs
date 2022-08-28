extern __mknod
use16
align 2

section .text
    global _mknod
_mknod:
    jmp __mknod

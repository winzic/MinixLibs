extern __umount
use16
align 2

section .text
    global _umount
_umount:
    jmp __umount

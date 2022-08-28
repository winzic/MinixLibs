extern __chroot
use16
align 2

section .text
    global _chroot
_chroot:
    jmp __chroot

extern __ioctl
use16
align 2

section .text
    global _ioctl
_ioctl:
    jmp __ioctl

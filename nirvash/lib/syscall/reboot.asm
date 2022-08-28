extern __reboot
use16
align 2

section .text
    global _reboot
_reboot:
    jmp __reboot

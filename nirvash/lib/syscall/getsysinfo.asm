extern __getsysinfo
extern __getsysinfo_up

use16
align 2


section .text
    global _getsysinfo
_getsysinfo:
    jmp __getsysinfo
_getsysinfo_up:
    jmp __getsysinfo_up

extern __vm_getphys
use16
align 2

section .text
    global _vm_getphys
_vm_getphys:
    jmp __vm_getphys

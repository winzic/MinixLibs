extern __vm_adddma
extern __vm_deldma
extern __vm_getdma
use16
align 2

section .text
    global _vm_adddma
    global _vm_deldma
    global _vm_getdma
_vm_adddma:
    jmp __vm_adddma
_vm_deldma:
    jmp __vm_deldma
_vm_getdma:
    jmp __vm_getdma





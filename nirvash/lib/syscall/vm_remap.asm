extern __vm_remap
use16
align 2

section .text
    global _vm_remap
_vm_remap:
    jmp __vm_remap

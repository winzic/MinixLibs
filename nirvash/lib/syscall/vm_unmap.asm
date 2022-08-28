extern __vm_unmap
use16
align 2

section .text
    global _vm_unmap
_vm_unmap:
    jmp __vm_unmap

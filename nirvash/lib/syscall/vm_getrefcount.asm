extern __vm_getrefcount
use16
align 2

section .text
    global _vm_getrefcount
_vm_getrefcount:
    jmp __vm_getrefcount

extern __vm_set_priv
use16
align 2

section .text
    global _vm_set_priv
_vm_set_priv:
    jmp __vm_set_priv

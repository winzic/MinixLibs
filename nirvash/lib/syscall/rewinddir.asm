extern __rewinddir
use16
align 2

section .text
    global _rewinddir
_rewinddir:
    jmp __rewinddir

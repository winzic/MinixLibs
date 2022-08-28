extern __getpgrp
use16
align 2

section .text
    global _getpgrp
_getpgrp:
    jmp __getpgrp

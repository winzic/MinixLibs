extern __alarm
use16

align 2

section .text
    global _alarm
_alarm:
    jmp __alarm

extern __mmap
extern __munmap
extern __munmap_text

align 2

section .text
    global _mmap
_mmap:
    jmp __mmap
_munmap:
    jmp __munmap
_munmap_text:
    jmp __munmap_text

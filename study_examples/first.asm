section .text
    global _start

_start:
    mov rax, 60
    mov rdi, 1 ; rdi - первый аргумент для rax
    syscall

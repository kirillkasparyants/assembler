section .data
    msg db 'Hello World', 10 ; объявляем массив байтов в msg, в конце ставим байт переноса строки (10 - 0x0A - \n)
    len equ $ - msg ; вычисляем длину (текущий указатель $ минус указатель на начало строки msg
    msg1 db 'Hello from NASM!', 10
    len1 equ $ - msg1

section .text
    global _start

_start:
    mov rax, 1 ; операция write
    mov rdi, 1 ; stdout
    mov rsi, msg ; само сообщение
    mov rdx, len ; длина
    syscall

    mov rax, 1
    mov rdi, 1
    mov rsi, msg1
    mov rdx, len1
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

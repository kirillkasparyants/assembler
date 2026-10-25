section .data
    msg_st db 'Введите ваше имя: ', 0
    len_st equ $ - msg_st
    msg_l db 'Ваше имя короткое!', 10
    len_l equ $ - msg_l
    msg_e db 'Ваше имя средней длины!', 10
    len_e equ $ - msg_e
    msg_g db 'Ваше имя длинное!', 10
    len_g equ $ - msg_g

section .bss
    name resb 64

section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_st
    mov rdx, len_st
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 64
    syscall
    mov rbx, rax

    mov rax, 1
    mov rdi, 1

    cmp rbx, 10
    jl less_lbl

    cmp rbx, 14
    jg great_lbl

    jmp equal_lbl

less_lbl:
    mov rsi, msg_l
    mov rdx, len_l
    jmp end

great_lbl:
    mov rsi, msg_g
    mov rdx, len_g
    jmp end

equal_lbl:
    mov rsi, msg_e
    mov rdx, len_e

end:
    syscall

    mov rax, 60
    xor rdi, rdi
    syscall

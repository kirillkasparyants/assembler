extern strcmp
section .bss
    line resb 32
section .data
    vpravo db "Вправо", 0
    vlevo db "Влево", 0
    vpered db "Вперед", 0
    nazad db "Назад", 0
    exit db "Выход", 0
    msgvpravo db "Вы пошли вправо!", 10
    msgvpravol equ $ - msgvpravo
    msgvlevo db "Вы пошли влево!", 10
    msgvlevol equ $ - msgvlevo
    msgvpered db "Вы пошли вперед!", 10
    msgvperedl equ $ - msgvpered
    msgnazad db "Вы пошли назад!", 10
    msgnazadl equ $ - msgnazad
    msgexit db "До свидания!", 10
    msgexitl equ $ - msgexit
    ques1 db "Куда идем (Влево|Вправо|Вперед|Назад|Выход)?", 10
    ques1l equ $ - ques1
    incor db "Я не знаю такого направления!", 10
    incorl equ $ - incor
    welc db "Добро пожаловать в шагометр!", 10
    welcl equ $ - welc
section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, welc
    mov rdx, welcl
    syscall

loop:
    mov rax, 1
    mov rdi, 1
    mov rsi, ques1
    mov rdx, ques1l
    syscall

    mov rax, 0
    mov rdi, 0
    mov rsi, line
    mov rdx, 32
    syscall
    dec rax 
    mov byte [line + rax], 0
    ; для чего dec rax?
    ; чтобы [line + rax] указывало на перенос строки

    mov rdi, vpravo
    mov rsi, line
    call strcmp
    cmp rax, 0
    je vpravo_lbl

    mov rdi, vlevo
    mov rsi, line
    call strcmp
    cmp rax, 0
    je vlevo_lbl

    mov rdi, vpered
    mov rsi, line
    call strcmp
    cmp rax, 0
    je vpered_lbl

    mov rdi, nazad
    mov rsi, line
    call strcmp
    cmp rax, 0
    je nazad_lbl

    mov rdi, exit
    mov rsi, line
    call strcmp
    cmp rax, 0
    je exit_lbl

    jmp incor_lbl

vpravo_lbl:
    mov rax, 1
    mov rdi, 1
    mov rsi, msgvpravo
    mov rdx, msgvpravol
    syscall
    jmp loop

vlevo_lbl:
    mov rax, 1
    mov rdi, 1
    mov rsi, msgvlevo
    mov rdx, msgvlevol
    syscall
    jmp loop

vpered_lbl:
    mov rax, 1
    mov rdi, 1
    mov rsi, msgvpered
    mov rdx, msgvperedl
    syscall
    jmp loop

nazad_lbl:
    mov rax, 1
    mov rdi, 1
    mov rsi, msgnazad
    mov rdx, msgnazadl
    syscall
    jmp loop

incor_lbl:
    mov rax, 1
    mov rdi, 1
    mov rsi, incor
    mov rdx, incorl
    syscall
    jmp loop

exit_lbl:
    mov rax, 1
    mov rdi, 1
    mov rsi, msgexit
    mov rdx, msgexitl
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
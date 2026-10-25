section .bss
    buffer resb 64; выделяем 64 байта памяти и записываем в них нули

section .data
    prompt db 'Enter your name: ', 0; наша строка приглашение + нуль-символ
    prompt_len equ $ - prompt; длина строки
    greeting db 'Hello, '; строка для приветствия
    greeting_len equ $ - greeting; длина строки
    newline db 10; перенос строки
    newline_len equ $ - newline; длина переноса строки

section .text
    global _start

_start:
    ; Выводим приглашение
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt
    mov rdx, prompt_len
    syscall

    ; Читаем ввод
    mov rax, 0; read
    mov rdi, 0; stdin
    mov rsi, buffer;  наш буффер
    mov rdx, 64; длина буффера
    syscall

    ; Сохраняем количество прочитанных байт
    mov r8, rax; в r8 закидываем значение, вернутое функцией

    ; Выводим "Hello, "
    mov rax, 1
    mov rdi, 1
    mov rsi, greeting
    mov rdx, greeting_len
    syscall

    ; Выводим введённое имя (без последнего символа переноса строки)
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, r8
    sub rdx, 1; rdx = rdx - 1, так как длина хранится с переносом строки
    syscall

    ; Выводим перенос строки
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, newline_len
    syscall

    ; Выход
    mov rax, 60
    xor rdi, rdi
    syscall

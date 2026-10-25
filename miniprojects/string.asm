section .text
    global strcmp

strcmp:
    push rbx
    push rcx
    mov rcx, 0

.loop:
    mov al, [rdi + rcx]
    mov bl, [rsi + rcx]
    cmp al, bl
    jne ret_one

    cmp al, 0
    je ret_zero

    inc rcx
    jmp .loop

ret_zero:
    pop rcx
    pop rbx
    mov rax, 0
    ret

ret_one:
    pop rcx
    pop rbx
    mov rax, 1
    ret

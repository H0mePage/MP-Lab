section .data
    hw_msg db "Hello world! from PCCOER, Ravet", 0ah    ;db, dw, dd, dq
    hw_msg_len equ $ - hw_msg                           ;equ: Equate (Contant)
    
    in_msg db 0ah, "Please enter 64-bit Hex Number:: "
    in_msg_len equ $ - in_msg
    
    out_msg db 0ah, "Entered 64-bit Hex Number:: "
    out_msg_len equ $ - out_msg
section .bss
    in_buff1 resb 17                  ;resb, resw, resd, resq
    in_buff2 resb 17                  ;resb, resw, resd, resq
    in_buff3 resb 17                  ;resb, resw, resd, resq
    in_buff4 resb 17                  ;resb, resw, resd, resq
    in_buff5 resb 17                  ;resb, resw, resd, resq
    
section .text
    global _start

_start:
    mov rax, 1                  ;system call number write()
    mov rdi, 1                  ;file descriptor STD_OUT = 1
    mov rsi, hw_msg             ;Buffer address (ASCII)
    mov rdx, hw_msg_len         ;count
    syscall

    mov rax, 1                  ;system call number write()
    mov rdi, 1                  ;file descriptor STD_OUT = 1
    mov rsi, in_msg             ;Buffer address (ASCII)
    mov rdx, in_msg_len         ;count
    syscall

    mov rax, 0                  ;read()
    mov rdi, 0                  ;File descriptor for STD_IN = 0
    mov rsi, in_buff1            ;Buffer address
    mov rdx, 17                 ;Count
    syscall

    mov rax, 0                  ;read()
    mov rdi, 0                  ;File descriptor for STD_IN = 0
    mov rsi, in_buff2            ;Buffer address
    mov rdx, 17                 ;Count
    syscall
    
    mov rax, 0                  ;read()
    mov rdi, 0                  ;File descriptor for STD_IN = 0
    mov rsi, in_buff3            ;Buffer address
    mov rdx, 17                 ;Count
    syscall
    
    mov rax, 0                  ;read()
    mov rdi, 0                  ;File descriptor for STD_IN = 0
    mov rsi, in_buff4            ;Buffer address
    mov rdx, 17                 ;Count
    syscall

    mov rax, 0                  ;read()
    mov rdi, 0                  ;File descriptor for STD_IN = 0
    mov rsi, in_buff5            ;Buffer address
    mov rdx, 17                 ;Count
    syscall
    
    mov rax, 1                  ;system call number write()
    mov rdi, 1                  ;file descriptor STD_OUT = 1
    mov rsi, out_msg             ;Buffer address (ASCII)
    mov rdx, out_msg_len         ;count
    syscall

    mov rax, 1                  ;system call number write()
    mov rdi, 1                  ;file descriptor STD_OUT = 1
    mov rsi, in_buff1           ;Buffer address (ASCII)
    mov rdx, 85                 ;count
    syscall

    mov rax, 60                 ;exit() 
    mov rdi, 0                  ;return code
    syscall
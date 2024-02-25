global _start

section .data
message:
    db 'hello, world!',10

section .text
_start:
    mov rax, 1          ; syscall para o print
    mov rdi, 1          ; descritor de saida
    mov rsi, message    ; string a ser escrita
    mov rdx, 14         ; quantos bytes a serem escritos
    syscall

    mov rax, 60          ; exit
    xor rdi,rdi          ; return code
    syscall
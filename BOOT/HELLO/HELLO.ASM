    org 0x0100

start:
    mov ax,0x0002
    int 0x10
    mov ax,0xB800
    mov es,ax

    cld
    xor di,di
    mov ax,0x1a48
    stosw
    mov ax,0x1b45
    stosw
    mov ax,0x1c4c
    stosw
    mov ax,0x1d4c
    stosw
    mov ax,0x1e4f
    stosw

    int 0x20

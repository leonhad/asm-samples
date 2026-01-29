    org 0x7c00
start:
    push cs     ; Assumes CS contains 0x0000
    pop ds
    mov bx,string
repeat:
    mov al,[bx]
    test al,al
    je end
    push bx
    mov ah,0x0e
    mov bx,0x000f
    int 0x10
    pop bx
    inc bx
    jmp repeat

end:
    jmp $       ; jump over itself ($ gives current address)

string:
    db "Hello, world",0

    times 510-($-$$) db 0 ; Fills boot sector (510 bytes)

    db 0x55,0xaa    ; Signature so BIOS detects it as bootable.

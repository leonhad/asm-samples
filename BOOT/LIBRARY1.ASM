    ; Display letter contained in AL (ASCII code)
display_letter:
    push ax
    push bx
    push cx
    push dx
    push si
    push di

    mov ah,0x0E         ; Load AH with code for terminal output
    mov bx,0x000F       ; Load BH page zero and BL color (graphic mode)
    int 0x10            ; Call the BIOS for displaying one letter

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret                 ; Return to the caller

    ; Read keyboard into AL (ASCII code)
read_keyboard:
    push bx
    push cx
    push dx
    push si
    push di
    
    mov ah,0x00         ; Load AH with code for keyboard read
    int 0x16            ; Call the BIOS for reading keyboard

    pop di
    pop si
    pop dx
    pop cx
    pop bx
    ret                 ; Return to the caller

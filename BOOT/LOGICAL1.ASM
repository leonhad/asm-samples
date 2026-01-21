    org 0x0100
start:
    mov al,0x32     ; Load register AL with 0x32 (50 decimal)
    and al,0x0F     ; Logical AND AL with 0x0F
    ; and, or, xor
    ; not is a single register
    ; neg AL is AL = -AL

    add al,0x30     ; Convert to ASCII digit
    call display_letter

    int 0x20

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

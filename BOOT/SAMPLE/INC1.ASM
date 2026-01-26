    org 0x0100
start:
    mov al,0x30
count1:
    call display_letter
    inc al
    cmp al,0x39
    jne count1
count2:
    call display_letter
    dec al
    cmp al,0x30
    jne count2

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
    
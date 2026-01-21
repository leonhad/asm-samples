    org 0x0100

    in al,(0x40)        ; Read the timer counter chip
    and al,0x07         ; Mask bits so the value becomes 0-7
    add al,0x30         ; Convert into ASCII digit
    mov cl,al           ; Save AL into CL
game_loop:
    mov al,'?'          ; AL now is question mark sign
    call display_letter ; Display
    call read_keyboard  ; Read keyboard
    cmp al,cl           ; AL equals CL?
    jne game_loop       ; No, jumps (Jump if Not Equal)
    call display_letter ; Display number
    mov al,':'          ; Display happy face
    call display_letter
    mov al,')'
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

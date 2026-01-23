    ;
    ; Tic-Tac-Toe
    ; by Oscar Toledo G.
    ; Creation date: Jun/21/2019
    ;
    org 0x0100

board: equ 0x0300

start:
    mov bx,board        ; Put address of game board in BX
    mov cx,9            ; Count 9 squares
    mov al,'1'          ; Setup AL to contain 0x31 (ASCII code for 1)

b09:
    mov [bx],al         ; Save it into the square (one byte)
    inc al              ; Increase AL, this gives us next digit
    inc bx              ; Increase direction
    loop b09

b10:
    call show_board

    call get_movement
    mov byte [bx],'X'   ; Get movement

    call show_board     ; Show the board
    
    call get_movement   ; Get movement
    mov byte [bx],'0'   ; Put 0 into square

    jmp b10

get_movement:
    call read_keyboard
    cmp al,0x1b         ; ESC key pressed?
    je do_exit          ; Yes, exit
    sub al,0x31         ; Subtract code for ASCII digit 1
    jc get_movement     ; Is it less than? Wait for another key
    cmp al,0x09         ; Compaarison with 9
    jnc get_movement    ; Is it greater then or equal to? Wait
    cbw                 ; Expand AL to 16 bits using AH
    mov bx,board        ; BX points to board
    add bx,ax           ; Add the key entered
    mov al,[bx]         ; Get square content
    cmp al,0x40         ; Comparison with 0x40
    jnc get_movement    ; Is it greater than or equal to? Wait
    call show_crlf      ; Line change
    ret                 ; Return, now BX points to square

do_exit:
    int 0x20            ; Exit to command-line

show_board:
    mov bx,board
    call show_row
    call show_div
    mov bx,board+3
    call show_row
    call show_div
    mov bx,board+6
    jmp show_row

show_row:
    call show_square
    mov al,0x7c
    call display_letter
    call show_square
    mov al,0x7c
    call display_letter
    call show_square

show_crlf:
    mov al,0x0d
    call display_letter
    mov al,0x0a
    jmp display_letter

show_div:
    mov al,0x2d
    call display_letter
    mov al,0x2b
    call display_letter
    mov al,0x2d
    call display_letter
    mov al,0x2b
    call display_letter
    mov al,0x2d
    call display_letter
    jmp show_crlf

show_square:
    mov al,[bx]
    inc bx
    jmp display_letter

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

display_number:
    mov dx,0            ; Makes DX = 0
    mov cx,10           ; Makes CX = 10
    div cx              ; AX = DX:AX / CX
    push dx
    cmp ax,0            ; If AX is zero...
    je display_number_1 ; ...jump
    call display_number ; else calls itself

display_number_1:
    pop ax
    add al,'0'          ; Convert remainder to ASCII digit
    call display_letter ; Display in the screen.
    ret

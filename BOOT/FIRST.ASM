    ;
    ; The incredible Hello, World program
    ;
    org 0x0100    ; Start point of program for a COM file
start:
    mov bx,string ; Load register BX with address of 'string'
repeat:
    mov al,[bx]   ; Load a byte in AL from address pointed by BX
    test al,al    ; Test AL for zero
    je end        ; jump if equal to 'end' label (jump if zero)
    push bx       ; Save BX register in stack
    mov ah,0x0e   ; Load AH with code for terminal output
    mov bx,0x000f ; BH is page zero, BL is color (graphic mode)
    int 0x10      ; Call the BIOS for displaying one letter
    pop bx        ; Restore BX register from stack
    inc bx        ; Increase BX register by 1 (next letter)
    jmp repeat    ; Jump to 'repeat' label

end:
    int 0x20      ; Exit to command-line.

string:
    db "Hello, world",0

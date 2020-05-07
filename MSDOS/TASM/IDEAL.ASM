DATA SEGMENT        ; start in MASM mode.
abc LABEL BYTE      ; abc addresses xyz as a byte.
xyz DW 0            ; define a word at label xyz.
DATA ENDS           ; end of data segment.

    IDEAL           ; switch to Ideal mode.
SEGMENT CODE        ; segment keyword now comes first.
PROC MyProc         ; proc keyword comes first, too.
                    ; Ideal mode programming goes here.
ENDP MyProc         ; repeating MyProc label is optional.
ENDS                ; repeating segment name not required.

    MASM            ; switch back to MASM mode.
CODE SEGMENT        ; name now required before segment keyword.
start PROC          ; name now comes before proc keyword, too.
                    ; MASM-mode programming goes here.

    IDEAL           ; switch to Ideal mode again!

    MASM            ; back to MASM mode.
    mov ah, 4ch
    int 21h
start ENDP          ; name again required before keyword.
CODE ENDS           ; name again required here

END


DoRandomByte1:
	mov al,cl			;Get 1st seed
DoRandomByte1b:
	ror al,1			;Rotate Right
	ror al,1
	xor al,cl			;Xor 1st Seed
	ror al,1
	ror al,1			;Rotate Right
	xor al,ch			;Xor 2nd Seed
	ror al,1			;Rotate Right
 	xor al,10011101b	;Xor Constant
	xor al,cl			;Xor 1st seed
	ret

DoRandomByte2:
	mov bx,OFFSET Randoms1	
	mov ah,0
	mov al,ch		
	xor al,00001011b
	and al,00001111b	;Convert 2nd seed low nibble to Lookup
	
	mov si,ax
	mov dh,[es:bx+si]		;Get Byte from LUT 1
	
	call DoRandomByte1	
	and al,00001111b		;Convert random number from 1st 
	
	mov bx,OFFSET Randoms2	;geneerator to Lookup
	mov si,ax
	mov al,[es:bx+si]		;Get Byte from LUT2
	
	xor al,dh				;Xor 1st lookup
	ret
	
	
DoRandom:			;RND outputs to A (no input)
	push bx
	push cx
	push dx
		mov cx,word PTR [ds:RandomSeed]    ;Get and update
		inc cx							  	  ;Random Seed
		mov word PTR [ds:RandomSeed],cx
		call DoRandomWord
		mov al,dl
		xor al,dh
	pop dx
	pop cx
	pop bx
	ret
	
DoRandomWord:		;Return Random pair in HL from Seed BC
	call DoRandomByte1		;Get 1st byte
	mov dh,al
	push dx
	push cx
	push bx
		call DoRandomByte2	;Get 2nd byte
	pop bx
	pop cx
	pop dx
	mov dl,al
	inc cx
	ret	
	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DoRangedRandom: 		;Return a value between B and C
	call DoRandom
	cmp AL,BH
	jc DoRangedRandom
	cmp AL,BL
	jnc DoRangedRandom
	ret
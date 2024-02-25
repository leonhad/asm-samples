.386
.model flat,c
.code 

; Reverser(DESC, SRC, SIZE)
Reverser PROC
	; Routine prolog.
	push ebp
	mov ebp,esp
	push esi
	push edi

	; Routine code.
	xor eax, eax		; EAX = 0
	mov edi, [ebp+8]	; EDI = Destination array
	mov esi, [ebp+12]	; ESI = Source array
	mov ecx, [ebp+16]	; ECX = Size
	test ecx, ecx

	lea esi, [esi+ecx*4-4] ; Load the efective address (end of source address - word).
	pushfd				; Stores the direction flags
	std					; Sets direction to downwards

@@:
	lodsd				; Load String of source downwards.
	mov [edi], eax		; Store wor in destination array.
	add edi, 4			; Increments destination array address.
	dec ecx				; Decrements copy size.
	jnz @B				; Jump non zero to @ before

	popfd				; Restores direction flag.
	mov eax,1

	; Routine epilog.
	pop edi
	pop esi
	pop ebp

	ret

Reverser ENDP

END

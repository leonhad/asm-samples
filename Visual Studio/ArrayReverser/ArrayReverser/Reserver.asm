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

	lea esi, [esi+ecx*4-4] ; Load the efective address
	pushfd				; Stores the direction flags
	std

@@:
	lodsd
	mov [edi], eax
	add edi, 4
	dec ecx
	jnz @B				; Jump non zero to @ before

	popfd
	mov eax,1

	; epilog
	pop edi
	pop esi
	pop ebp

	ret

Reverser ENDP

END

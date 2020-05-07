.686
.model flat, c

.code
CountChar proc
	push ebp
	mov ebp, esp
	push esi

	mov esi, [ebp+8]		; esi = s
	mov cx, [ebp+12]		; cx = c

	xor edx,  edx

@@:
	lodsw					; load next char into ax. Use lodsb for normal char
	or ax, ax				; test for end of string
	jz @F					; jump forward to next @@ label if end of string

	cmp ax, cx				; test current char
	jne @B					; jump backward to the next @@ label if no match
	inc edx					; updates match count
	jmp @B

@@:
	mov eax, edx			; eax = character count

	pop esi
	pop ebp
	ret
CountChar endp
	end

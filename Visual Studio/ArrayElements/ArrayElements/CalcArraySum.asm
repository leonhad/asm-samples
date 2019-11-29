.686
.model flat,c

.code

CalcArraySumAsm proc
	push ebp
	mov ebp, esp

	mov edx, [ebp+8]		; edx = x
	mov ecx, [ebp+12]		; ecx = n
	xor eax, eax			; eax = 0 (sum)

	cmp ecx, 0
	jle InvalidCount		; Negative values

@@:
	add eax, [edx]			; add next element to sum
	add edx, 4				; set pointer to next element
	dec ecx					; adjust counter
	jne @B					; jump back to the next @@ label if not equal

InvalidCount:
	pop ebp
	ret
CalcArraySumAsm endp

end

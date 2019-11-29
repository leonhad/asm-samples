.686
.model flat,c

.code

CalcArraySquaresAsm proc
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	; Load arguments
	mov edi, [ebp+8]		; edi = y
	mov esi, [ebp+12]		; esi = x
	mov ecx, [ebp+16]		; ecx = n

	xor eax, eax			; eax = 0 (sum of y array)
	cmp ecx, 0
	jle	EmptyArray			; if n == 0 or less
	shl ecx, 2				; ecx = size of array in bytes (size * 4)
	xor ebx, ebx			; ebx = array element offset

@@:
	mov edx, [esi+ebx]		; load next x[i]
	imul edx, edx			; edx = edx * edx
	mov [edi+ebx], edx		; save result to y[i]
	add eax, edx			; update runing sum
	add ebx, 4				; update array element offset
	cmp ebx, ecx
	jl @B					; jump if not finished

EmptyArray:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
CalcArraySquaresAsm endp

end
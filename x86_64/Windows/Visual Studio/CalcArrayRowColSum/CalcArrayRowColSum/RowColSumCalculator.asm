.686
.model flat,c

.code
CalcArrayRowColSum proc
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	xor eax, eax
	cmp dword ptr [ebp+12], 0	; [ebp+12] = nrows
	jle InvalidArg

	mov ecx, [ebp+16]			; ecx = ncols
	cmp ecx, 0
	jle InvalidArg

	mov edi, [ebp+24]			; edi = col_sums
	xor eax, eax
	rep stosd					; fill array with zeros

	mov ebx, [ebp+8]			; ebx = x
	xor esi, esi				; i = 0

	; outer loop
Lp1:
	mov edi, [ebp+20]
	mov dword ptr [edi+esi*4], 0; row_sums[i] = 0
	xor edi, edi				; j = 0
	mov edx, esi				; edx = i
	imul edx, [ebp+16]			; edx = i * ncols

	; inner loop
Lp2:
	mov ecx, edx				; ecx = i * ncols
	add ecx, edi				; ecx = i * ncols + j
	mov eax, [ebx+ecx*4]		; eax = x[i*ncols + j]
	mov ecx, [ebp+20]			; ecx = row_sums
	add [ecx+esi*4], eax		; row_sums[i] += eax
	mov ecx, [ebp+24]			; ecx = col_sums
	add [ecx+edi*4], eax		; col_sums[j] += eax

	inc edi						; j++
	cmp edi, [ebp+16]			; compare j and ncols
	jl Lp2						; jump if j < ncols

	inc esi						; i++
	cmp esi, [ebp+12]
	jl Lp1						; jump if i < nrows
	mov eax, 1

InvalidArg:
	pop edi
	pop esi
	pop ebx
	pop ebp
	ret
CalcArrayRowColSum endp

end
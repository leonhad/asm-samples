	.686
	.model flat, c
	.const
r4_MinFloat	dword 0ff7fffffh
r4_MaxFloat	dword 7f7fffffh

	.code
CalcMinMax proc
	push ebp
	mov ebp, esp

	xor eax, eax
	mov edx, [ebp+8]		; edx = a
	mov ecx, [ebp+12]		; ecx = n
	test ecx, ecx
	jle Done				; jump to Done if n <= 0

	fld [r4_MinFloat]		; initial min value
	fld [r4_MaxFloat]		; initial max value

@@:
	fld real4 ptr [edx]		; load *a
	fld st(0)				; duplicate *a on stack

	fcomi st(0), st(2)		; compare *a with min
	fcmovnb st(0), st(2)	; st(0) = smaller val
	fstp st(2)				; save new min value
	
	fcomi st(0), st(2)		; compare *a with max
	fcmovb st(0), st(2)		; st(0) = larager val
	fstp st(2)				; save new max value

	add edx, 4				; point to next a[i]
	dec ecx
	jnz @B

	mov eax, [ebp+16]
	fstp real4 ptr[eax]		; save final min
	mov eax, [ebp+20]
	fstp real4 ptr[eax]		; save final max
	mov eax, 1

Done:
	pop ebp
	ret
CalcMinMax endp
	end

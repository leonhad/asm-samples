	.MODEL flat, c
	.CONST

	public LsEpsilon
LsEpsilon	real8 1.0e-12

	.CODE
CalcLeastSquaresASM PROC
	push ebp
	mov ebp, esp
	sub esp, 8

	xor eax, eax
	mov ecx, [ebp+16]		; ecx = n
	test ecx, ecx
	jle Done				; Done if n <= 0

	mov eax, [ebp+8]		; eax = *x
	mov edx, [ebp+12]		; edx = *y

	; stack: sum_x, sum_y, sum_xy, sum_xx
	fldz					; sum_xx
	fldz					; sum_xy
	fldz					; sum_y
	fldz					; sum_x

@@:
	; stack: y, x, x, x, sum_x, sum_y, sum_xy, sum_xx
	fld real8 ptr[eax]
	fld st(0)
	fld st(0)
	fld real8 ptr[edx]

	fadd st(5), st(0)		; sum_y += y
	; stack: x, x, x, sum_x, sum_y, sum_xy, sum_xx
	fmulp

	; stack: x, x, sum_x, sum_y, sum_xy, sum_xx
	faddp st(5), st(0)		; sum_xy + xy 

	; stack: xx, sum_x, sum_y, sum_xy, sum_xx
	fadd st(2), st(0)
	fmulp

	; stack: sum_x, sum_y, sum_xy, sum_xx
	faddp st(4), st(0)

	add eax, 8
	add edx, 8
	dec ecx
	jnz @B

	; double denom = n * sum_xx - sum_x * sum_x
	fild dword ptr[ebp+16]
	fmul st(0), st(4)		; n * sum_xx

	; stack: sum_x, sum_x, n * sum_xx, sum_x, sum_y, sum_xy, sum_xx
	fld st(1)
	fld st(0)

	; stack: denom, sum_y, sum_xy, sum_xx
	fmulp
	fsubp
	fst real8 ptr[ebp-8]

	fabs					; fabs(denom)
	fld real8 ptr[LsEpsilon]
	fcomip st(0), st(1)		; compare Epsilon and fabs(denom)
	fstp st(0)
	jae InvalidDenom		; jump if Epsilon >= fabs(denom)

	; slope = (n * sum_xy - sum_x * sum_y) / denom;
	fild dword ptr[ebp+16]

	fmul st(0), st(3)		; n * sum_xy
	fld st(2)				; sum_y
	fld st(2)				; sum_x
	fmulp					; sum_x* sum_y
	fsubp					; n * sum_xy - sum_x * sum_y
	fdiv real8 ptr[ebp-8]
	mov eax, [ebp+20]
	fstp real8 ptr[eax]

	; intercept = (sum_xx * sum_y - sum_x * sum_xy) / denom;
	fxch st(3)
	fmulp
	fxch st(2)
	fmulp
	fsubp

	fdiv real8 ptr[ebp-8]
	mov eax, [ebp+24]
	fstp real8 ptr[eax]
	mov eax, 1

Done:
	mov esp, ebp
	pop ebp
	ret

InvalidDenom:
	fstp st(0)
	fstp st(0)
	fstp st(0)
	fstp st(0)
	
	xor eax, eax			; sets the error return code to false

	mov esp, ebp
	pop ebp
	ret
CalcLeastSquaresASM ENDP
	END

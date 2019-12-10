	.MODEL flat,c
	.CONST

DegToRad	real8	0.017453229252
RadToDeg	real8	57.2957795131

	.CODE
; Rectangular to Polar notation converter
RectToPolar PROC
	push ebp
	mov ebp, esp

	fld real8 ptr[ebp+16]		; load y
	fld real8 ptr[ebp+8]		; load x
	fpatan						; calc atan2(y/x)
	fmul [RadToDeg]
	mov eax, [ebp+28]			; load *a
	fstp real8 ptr[eax]		; a = atan2(y/x) * RadToDeg

	fld real8 ptr[ebp+8]		; load x
	fmul st(0), st(0)			; x *= x

	fld real8 ptr[ebp+16]		; load y
	fmul st(0), st(0)			; y *= y

	faddp						; st(0) = x*x + y*y

	fsqrt						; sqrt(x*x + y*y)

	mov eax, [ebp+24]			; eax = *r
	fstp real8 ptr[eax]			; r =  sqrt(x*x + y*y)

	pop ebp
	ret
RectToPolar ENDP

; Polar to Rectangular notation converter
PolarToRect PROC
	push ebp
	mov ebp, esp

	fld real8 ptr[ebp+16]		; load angle in degrees (r)
	fmul [DegToRad]				; r*= DegToRad (convert angle to radians)

	fsincos						; calc st(1)=sin(st(0)) and st(0)=cos(st(0))
	fmul real8 ptr[ebp+8]		; y = r * cos(a)
	mov eax, [ebp+24]
	fstp real8 ptr[eax]			; save x

	fmul real8 ptr[ebp+8]		; y = r * sin(a)
	mov eax, [ebp+28]
	fstp real8 ptr[eax]			; save y

	pop ebp
	ret
PolarToRect ENDP
	END
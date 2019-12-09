	.MODEL flat, c
	.CONST
AbsMask qword 7fffffffffffffffh, 7fffffffffffffffh

	.CODE
AVX_fp_Arith PROC
	push ebp
	mov ebp, esp

	; Load arguments
	mov eax, [ebp+24]				; eax = pointer to result array
	vmovsd xmm0, real8 ptr[ebp+8]	; xmm0 - a
	vmovsd xmm1, real8 ptr[ebp+16]	; xmm1 = b
	
	; addition
	vaddsd xmm2, xmm0, xmm1			; xmm2 = a + b

	; subtraction
	vsubsd xmm3, xmm0, xmm1			; xmm3 = a - b

	; multiplication
	vmulsd xmm4, xmm0, xmm1			; xmm4 = a * b

	; division
	vdivsd xmm5, xmm0, xmm1			; xmm5 = a / b

	vmovsd real8 ptr[eax+0], xmm2	; save a + b
	vmovsd real8 ptr[eax+8], xmm3	; save a - b
	vmovsd real8 ptr[eax+16], xmm4	; save a * b
	vmovsd real8 ptr[eax+24], xmm5	; save a / b

	; min(a, b)
	vminsd xmm2, xmm0, xmm1			; xmm2 = min(a, b)

	; max(a, b)
	vmaxsd xmm3, xmm0, xmm1			; xmm3 = max(a, b)

	; sqrt(a)
	vsqrtsd xmm4, xmm0, xmm0		; xmm4 = sqrt(a)

	; fabs(b)
	vandpd xmm5, xmm1, xmmword ptr[AbsMask] ; xmm5 = fabs(b)

	; save results
	vmovsd real8 ptr[eax+32], xmm2
	vmovsd real8 ptr[eax+40], xmm3
	vmovsd real8 ptr[eax+48], xmm4
	vmovsd real8 ptr[eax+56], xmm5

	pop ebp
	ret
AVX_fp_Arith ENDP

	END

	.model flat, c
	.const
r8_pi		real8 3.14159265358979323846
r8_four		real8 4.0
r8_three	real8 3.0
r8_neg_one	real8 -1.0

	.code
SseSphereCalculator proc
	push ebp
	mov ebp, esp

	movsd xmm0, real8 ptr[ebp+8]		; xmms = r
	mov ecx, [ebp+16]					; ecx = *sa
	mov edx, [ebp+20]					; edx = *v

	xorpd xmm7, xmm7					; xmm7 = 0.0
	comisd xmm0, xmm7					; compare r with 0.0
	jp BadRadius
	jb BadRadius

	; Surface area
	movsd xmm1, xmm0					; xmm1 = r
	mulsd xmm1, xmm1					; xmm1 = r^2
	mulsd xmm1, [r8_four]				; xmm1 = 4 * r^2
	mulsd xmm1, [r8_pi]					; xmm1 = 4 * pi * r^2
	movsd real8 ptr[ecx], xmm1			; sa = 4 * pi * r^2

	; Volume
	mulsd xmm1, xmm0					; xmm1 = 4 * pi * r^3
	divsd xmm1, [r8_three]				; xmm1 = 4 * pi * r^3 / 3
	movsd real8 ptr[edx], xmm1			; save volume
	
	mov eax, 1

	pop ebp
	ret

BadRadius:
	movsd xmm0, [r8_neg_one]
	movsd real8 ptr[ecx], xmm0			; sa = -1
	movsd real8 ptr[edx], xmm0			; v = -1

	xor eax, eax

	pop ebp
	ret
SseSphereCalculator endp
	end
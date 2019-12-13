	.model flat, c

	.code
SsePackedInt16_Add proc
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]			; eax = *a
	mov ecx, [ebp+12]			; ecx = *b
	mov edx, [ebp+16]			; edx = *c

	movdqa xmm0, [eax]			; xmm0 = a
	movdqa xmm1, xmm0			; xmm1 = a
	movdqa xmm2, [ecx]			; xmm2 = b

	; Addition
	paddw xmm0, xmm2			; packed add - wraparound
	paddsw xmm1, xmm2			; packed add - saturated

	; save result
	movdqa [edx], xmm0			; save wraparound at c[0]
	movdqa [edx+16], xmm1		; save saturated at c[1]

	pop ebp
	ret
SsePackedInt16_Add endp

SsePackedInt32_Sub proc
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]			; eax = *a
	mov ecx, [ebp+12]			; ecx = *b
	mov edx, [ebp+16]			; edx = *c

	; Subtraction
	movdqa xmm0, [eax]			; xmm0 = a
	psubd xmm0, [ecx]			; xmm0 = a-b

	; Save
	movdqu [edx], xmm0

	pop ebp
	ret
SsePackedInt32_Sub endp

SsePackedInt32_Mul proc
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]			; eax = *a
	mov ecx, [ebp+12]			; ecx = *b
	mov edx, [ebp+16]			; edx = *c

	; Load parameters
	movdqa xmm0, [eax]
	movdqa xmm1, [ecx]

	movdqa xmm2, xmm0
	pmulld xmm0, xmm1			; signed dword mul - low result
	pmuldq xmm2, xmm1			; signed dword mul - qword result

	movdqa [edx], xmm0			; c[0] = pmulld result
	movdqa [edx+16], xmm2		; c[1] = pmullq result

	pop ebp
	ret
SsePackedInt32_Mul endp
	end

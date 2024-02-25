	.MODEL flat, c

	.CODE
AVXPackedInt_16 PROC
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]			; eax = *a
	mov	ecx, [ebp+12]			; ecx = *b
	mov edx, [ebp+16]			; edx = *c

	vmovdqa ymm0, ymmword ptr[eax]	; ymm0 = a
	vmovdqa ymm1, ymmword ptr[ecx]	; ymm1 = b

	vpaddw ymm2, ymm0, ymm1		; ymm2 = ymm0 + ymm1
	vpaddsw ymm3, ymm0, ymm1	; ymm3 = ymm0 + ymm1, signed saturation

	vpsubw ymm4, ymm0, ymm1
	vpsubsw ymm5, ymm0, ymm1

	vpminsw ymm6, ymm0, ymm1	; signed minimum
	vpmaxsw ymm7, ymm0, ymm1	; signed maximum

	; save results
	vmovdqa ymmword ptr[edx], ymm2
	vmovdqa ymmword ptr[edx+32], ymm3
	vmovdqa ymmword ptr[edx+64], ymm4
	vmovdqa ymmword ptr[edx+96], ymm5
	vmovdqa ymmword ptr[edx+128], ymm6
	vmovdqa ymmword ptr[edx+160], ymm7

	vzeroupper					; avoid performance penalties

	pop ebp
	ret
AVXPackedInt_16 ENDP

AVXPackedInt_32 PROC
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]			; eax = *a
	mov	ecx, [ebp+12]			; ecx = *b
	mov edx, [ebp+16]			; edx = *c

	vmovdqa ymm0, ymmword ptr[eax]	; ymm0 = a
	vmovdqa ymm1, ymmword ptr[ecx]	; ymm1 = b

	vphaddd ymm2, ymm0, ymm1	; horizontal add
	vphsubd ymm3, ymm0, ymm1	; horizontal sub
	vpmulld ymm4, ymm0, ymm1	; signed mul
	vpsllvd ymm5, ymm0, ymm1	; logical shift left
	vpsravd ymm6, ymm0, ymm1	; arimethic shift right

	; save results
	vmovdqa ymmword ptr[edx], ymm2
	vmovdqa ymmword ptr[edx+32], ymm3
	vmovdqa ymmword ptr[edx+64], ymm4
	vmovdqa ymmword ptr[edx+96], ymm5
	vmovdqa ymmword ptr[edx+128], ymm6

	vzeroupper					; avoid performance penalties

	pop ebp
	ret
AVXPackedInt_32 ENDP
	END
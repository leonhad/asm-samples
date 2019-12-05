.686
.model flat,c

.const

r8_SfFtoC	real8	0.5555555556	; 5/9
r8_SfCtoF	real8	1.8				; 9/5
i4_32		dword	32

.code
; Deduct 32, then multiply by 5 and then divide by 9.
FtoC proc
	push ebp
	mov ebp, esp

	fld [r8_SfFtoC]			; Load float point value to FPU stack
	fld real8 ptr[ebp+8]	; load f value
	fild [i4_32]			; load a integer value to FPU stack

	fsubp					; st(0) = f - 32
	fmulp					; st(0) = (f - 32) * 5/9

	pop ebp
	ret
FtoC endp

; Multiply by 9, then divide by 5 and then add 32.
CtoF proc
	push ebp
	mov ebp, esp

	fld real8 ptr[ebp+8]	; load c
	fmul [r8_SfCtoF]		; st(0) = c * 9/5
	fiadd [i4_32]			; st(0) = c * 9/5 + 32

	pop ebp
	ret
CtoF endp
	end
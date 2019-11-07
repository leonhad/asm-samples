.386
.model flat, c

.code

; Return: 0 Error (Division by zero)
;       : 1 Success
; Computation *prod = a * b
;             *quo = a / b
;             *rem = a % b

IntegerMulDiv proc
	push ebp
	mov ebp, esp
	push ebx

	xor eax, eax		; eax = 0
	
	mov ecx, [ebp+8]	; ecx = a
	mov edx, [ebp+12]	; edx = b

	or edx, edx			; updates the zero flags
	jz InvalidDivisor
	imul edx, ecx		; edx = a * b (signed)

	mov ebx, [ebp+16]	; ebx = prod
	mov [ebx], edx		; *prod = a * b

	mov eax, ecx		; eax = a
	cdq					; edx:eax contains dividend

	idiv dword ptr [ebp + 12]
	mov ebx, [ebp + 20]
	mov [ebx], eax
	mov ebx, [ebp + 24]
	mov [ebx], edx
	mov eax, 1 

InvalidDivisor:
	pop ebx
	pop ebp
	ret

IntegerMulDiv endp

end
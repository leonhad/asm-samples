.386
.model flat,c

.code
AdderASM proc
	push ebp
	mov ebp, esp

	mov eax, [ebp+8]	; EAX = a
	mov ecx, [ebp+12]	; ECX = b
	mov edx, [ebp+16]	; EDX = c

	add eax, ecx		; EAX = a + b
	add eax, edx		; EAX = a + b + c

	pop ebp
	ret

AdderASM endp

end
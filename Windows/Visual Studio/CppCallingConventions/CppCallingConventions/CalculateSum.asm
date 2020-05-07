.386
.model flat, c
.code

CalculateSum proc
	; Function prolog
	push ebp
	mov ebp, esp
	sub esp, 12 ; Allocate local storage space
	push ebx
	push esi
	push edi

	; Load arguments.
	mov eax, [ebp+8]		; eax = a
	mov ebx, [ebp+12]		; ebx = b
	mov ecx, [ebp+16]		; ecx = c
	mov edx, [ebp+20]		; edx = s1
	mov esi, [ebp+24]		; esi = s2
	mov edi, [ebp+28]		; edi = s3

	; Compute s1 = a + b + c
	mov [ebp-12], eax		; temp1 = a
	add [ebp-12], ebx		; temp += b
	add [ebp-12], ecx		; temp += c

	; Compute s2 = a * a + b * b + c * c
	imul eax, eax
	imul ebx, ebx
	imul ecx, ecx
	mov [ebp-8], eax		; temp2 = a * a
	add [ebp-8], ebx		; temp2 += b * b
	add [ebp-8], ecx		; temp2 += c * c

	; Compute s3 = a * a * a + b * b * b + c * c * c
	imul eax, [ebp+8]		; eax = a * a * a
	imul ebx, [ebp+12]		; ebx = b * b * b
	imul ecx, [ebp+16]		; ecx = c * c * c
	mov [ebp-4], eax		; temp3 = a * a
	add [ebp-4], ebx		; temp3 += b * b
	add [ebp-4], cx			; temp3 += c * c

	; Save s1, s2 and s3
	mov eax, [ebp-12]		; eax = temp1
	mov [edx], eax			; s1 = eax

	mov eax, [ebp-8]		; eax = temp2
	mov [esi], eax			; s2 = eax

	mov eax, [ebp-4]		; eax = temp3
	mov [edi], eax			; s3 = eax

	; Function epilog
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret

CalculateSum endp

end

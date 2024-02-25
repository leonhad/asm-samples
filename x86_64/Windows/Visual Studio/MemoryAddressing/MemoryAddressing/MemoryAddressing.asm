.386
.model flat, c

.const

; int FibVals[] =  {0,1,1,2,3,5,8,13,21,34,55,89,144,233,377,610};
FibVals		dword 0,1,1,2,3,5,8,13,21
			dword 34,55,89,144,233,377,610

; NumbFibVals = sizeof(FibVals)/sizeof dword
NumFibVals dword($-FibVals)/sizeof dword
			; Makes NumFibVals public
			public NumFibVals

.code
MemoryAddressing PROC
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi

	xor eax, eax
	mov ecx, [ebp+8]		; ecx = i
	cmp ecx, 0
	jl	InvalidIndex
	cmp ecx, [NumFibVals]
	jge InvalidIndex

; Example 1: base register
	mov ebx, offset FibVals	; ebx = FibVals
	mov esi, [ebp+8]		; esi = i
	shl esi, 2				; esi = i * 4
	add ebx, esi			; ebx = FibVals + i * 4
	mov eax, [ebx]			; load table value
	mov edi, [ebp+12]		; edi = &v1
	mov [edi], eax			; &v1 = table value

; Example 2: base register + displacement
	mov esi, [ebp+8]		; esi = i
	shl esi, 2				; esi = i * 4
	mov eax, [esi+FibVals]	; eax = FibVals + i * 4 (table value)
	mov edi, [ebp+16]		; edi = &v2
	mov [edi], eax			; &v2 = table value

; Example 3: base register + index register
	mov ebx, offset FibVals
	mov esi, [ebp+8]
	shl esi, 2
	mov eax, [ebx+esi]
	mov edi, [ebp+20]
	mov [edi], eax			; &v3 = table value

; Example 4: base register + index register * scale factor
	mov ebx, offset FibVals
	mov esi, [ebp+8]
	mov eax, [ebx+esi*4]
	mov edi, [ebp+24]
	mov [edi], eax
	mov eax, 1

InvalidIndex:
	pop edi
	pop esi
	pop ebx
	pop ebp

	ret
MemoryAddressing ENDP
	END

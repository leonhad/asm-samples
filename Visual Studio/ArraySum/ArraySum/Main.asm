.386
.model flat

.data
intArray DWORD 10000h, 20000h, 30000h, 40000h

.code
start PROC
	mov edi, OFFSET intArray
	mov ecx, LENGTHOF intArray
	xor eax, eax

LP:
	add eax, [edi]
	add edi, TYPE intArray
	loop LP

	ret
start ENDP

end

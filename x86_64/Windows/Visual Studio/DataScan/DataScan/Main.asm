.386
.model flat

.data
intArray SWORD 0,0,0,0,14,3,0,-34,-56,7,8

.code
main PROC
	mov ebx, offset intArray
	mov ecx, lengthof intArray

L1:
	cmp WORD PTR [ebx], 0
	jnz found
	add ebx, 2
	loop L1
	jmp notFound

found:
	movsx eax, WORD PTR[ebx]
	jmp quit

notFound:
	mov eax, 999999

quit:
	ret

main ENDP
end

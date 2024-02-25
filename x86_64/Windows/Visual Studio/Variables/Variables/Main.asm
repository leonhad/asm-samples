; Adds and subtracts a 32-bit integers.
.386
.model flat,stdcall
.stack 4096

.data
num1 dword 11111111h ; First number
num2 dword 10101010h ; Seconf number
ans  dword 0 ; Result

.code
main PROC
	mov eax, num1
	add eax, num2
	mov ans, eax

	ret
main ENDP
END main
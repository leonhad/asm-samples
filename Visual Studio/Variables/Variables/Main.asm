; Adds and subtracts a 32-bit integers.
.386
.model flat,stdcall
.stack 4096
.code
main PROC
	mov eax, 10000h ; EAX = 10000h
	add eax, 40000h ; EAX = 50000h
	sub eax, 20000h ; EAX = 30000h
	ret
main ENDP
END main
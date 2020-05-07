.386
.model flat

.data
quote	byte "Machines do feel", 0
; DUP(0) byte to initialize. In this case, with all zeros
message byte sizeof quote DUP(0), 0

.code
start proc
	mov esi, 0
	mov ecx, sizeof quote

LP:
	mov al, quote[esi]		; get a character from quote
	mov message[esi], al	; store in the message
	inc esi
	loop LP

	xor eax, eax
	ret
start endp

end
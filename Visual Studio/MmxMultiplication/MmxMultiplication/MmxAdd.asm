	.MODEL flat, c

	.CODE
MmxAdd PROC
	push ebp
	mov ebp, esp

	mov eax, [ebp+24]			; loads add_op
	cmp eax, AddOpTableCount	; compare to table count
	jae BadAddOp				; jump if add_op is invalid

	movq mm0, [ebp+8]			; load a
	movq mm1, [ebp+16]			; load b
	jmp [AddOpTable+eax*4]		; jump to specified add_op

MmxPaddb:
	paddb mm0, mm1				; packed byte addition using wraparound
	jmp SaveResult

MmxPaddsb:
	paddsb mm0, mm1				; packed byte addition using signed saturation
	jmp SaveResult

MmxPaddusb:
	paddusb mm0, mm1				; packed byte addition using unsigned saturation
	jmp SaveResult

MmxPaddw:
	paddw mm0, mm1				; packed word addition using wraparound
	jmp SaveResult

MmxPaddsw:
	paddsw mm0, mm1				; packed word addition using signed saturation
	jmp SaveResult

MmxPaddusw:
	paddusw mm0, mm1				; packed word addition using unsigned wraparound
	jmp SaveResult

MmxPaddd:
	paddd mm0, mm1				; packed dword addition using unsigned saturation
	jmp SaveResult

BadAddOp:
	pxor mm0, mm0				; mm0 = 0

SaveResult:
	movd eax, mm0				; eax = low dword of mm0
	pshufw mm2, mm0, 01001110b	; swap high 7 low dwords
	movd edx, mm2				; edx:eax = final result
	emms						; clear mmx stat

	pop ebp
	ret

	ALIGN 4
AddOpTable:
	dword MmxPaddb, MmxPaddsb, MmxPaddusb
	dword MmxPaddw, MmxPaddsw, MmxPaddusw, MmxPaddd
AddOpTableCount equ ($-AddOpTable) / sizeof dword

MmxAdd ENDP
	END

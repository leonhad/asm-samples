.686
.model flat,c

; Surface area of a sphere: 4pi^r
; Volume of a sphere: 4pir^3/3 = (4pir^2)r/3

.const
r8_4p0	real8	4.0
r8_3p0	real8	3.0

.code

CalcSphereAeraVolume proc
	push ebp
	mov ebp, esp

	xor eax, eax
	fld real8 ptr[esp+8]	; st(0) = r
	fldz					; st(0) = 0.0, st(1) = r

	; compares float point values and stores in EFLAGS
	fcomip st(0), st(1)		; compares 0.0 to r
	fstp st(0)				; stores value and pop the stack

	jp Done					; jump if unordered operands
	ja Done					; jump if r < 0.0

	fld real8 ptr[ebp+8]	; st(0) = r
	fld st(0)				; st(0) = r, st(1) = r

	fmul st(0), st(0)		; st(0) = r * r, st(1) = r
	fldpi					; st(0) = pi

	fmul [r8_4p0]			; st(0) = 4 * pi
	fmulp					; st(0) = 4 * pi * r * r

	mov edx, [ebp+16]		; edx = *sa
	fst real8 ptr [edx]		; sa = 4 * pi * r * r

	fmulp					; st(0) = pi * 4 * r * r * r
	fdiv [r8_3p0]			; st(0) = pi * 4 * r * r * r / 3

	mov edx, [ebp+20]		; edx = *v
	fstp real8 ptr[edx]		; v = pi * 4 * r * r * r / 3

	mov eax, 1

Done:
	pop ebp
	ret
CalcSphereAeraVolume endp
	end
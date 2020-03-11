; (A + 8B + 7C - 27) / 4
; Let A = 25, B = 19, C = 99

	AREA myCode, CODE, READONLY
	ENTRY
	EXPORT __main

__main
	MOV		R0, #25		; A
	MOV		R1, #19		; B
	
	; R0 = R0 + R1 << 3
	ADD		R0, R0, R1, LSL #3

	MOV		R1, #99		; C
	MOV		R2, #7
	
	; R0 = R1 * R2 + R0
	MLA		R0, R1, R2, R0
	
	SUB		R0, R0, #27
	
	; R0 = R0 >> 2
	MOV		R0, R0, ASR #2
	
Stop
	B		Stop

	END

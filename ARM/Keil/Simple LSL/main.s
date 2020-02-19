
	AREA myCode, CODE, READONLY
	ENTRY
	EXPORT __main

__main
	; Move 17
	MOV		R0, #0x11
	
	; Shift one bit left = 34
	LSL		R1, R0, #1
	
	; Shift one bit left = 68
	LSL		R2, R1, #1

Stop
	B		Stop

	END
; P= Q + R + S
; let Q=2, R=4, S=5

	AREA SimpleAdd, DATA, READONLY

; Reserve 4 bytes of memory
P		SPACE	4

; Create variable Q with initial value 2
Q		DCD		2

; Create variable Q with initial value 4
R		DCD		4

; Create variable Q with initial value 5
S		DCD		5

	AREA SimpleAddCode, CODE, READONLY
	ENTRY
	EXPORT __main
__main
	LDR		R1, Q
	LDR		R2, R
	LDR		R3, S
	
	ADD		R0, R1, R2
	ADD		R0, R0, R3

Stop
	B		Stop
	ALIGN

	END

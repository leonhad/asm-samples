
	AREA myCode, CODE, READONLY
	ENTRY
	EXPORT __main

__main
	LDR		R1, =1000000000
	LDR		R2, =2000000000
	LDR		R3, =3000000000
	LDR		R4, =4000000000
	LDR		R5, =4100000000
	
	; R8 = 0 for saving the lower word
	MOV		R8, #0
	
	; R9 = 0 for accumulating the carries.
	MOV		R9, #0
	
	; R8 = R8 + R1
	ADDS	R8, R8, R1
	
	; R9 = R9 + 0 + Carry
	ADC		R9, R9, #0
	
	; R8 = R8 + R2
	ADDS	R8, R8, R2
	
	; R9 = R9 + 0 + Carry
	ADC		R9, R9, #0
	
	; R8 = R8 + R3
	ADDS	R8, R8, R3
	
	; R9 = R9 + 0 + Carry
	ADC		R9, R9, #0

	; R8 = R8 + R4
	ADDS	R8, R8, R4
	
	; R9 = R9 + 0 + Carry
	ADC		R9, R9, #0

	; R8 = R8 + R5
	ADDS	R8, R8, R5
	
	; R9 = R9 + 0 + Carry
	ADC		R9, R9, #0

Stop
	B		Stop
	
	END
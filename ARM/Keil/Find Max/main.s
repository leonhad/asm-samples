; Rename registers
COUNT		RN		R0
MAX			RN		R1
POINTER		RN		R2
NEXT		RN		R3

		AREA	myData, DATA, READONLY

MYDATA	DCD	69, 87, 86, 45, 75

		AREA	myCode, CODE, READONLY
		ENTRY
		EXPORT __main

__main
		MOV		COUNT, #5
		MOV		MAX, #0
		LDR		POINTER, =MYDATA

AGAIN
		LDR		NEXT, [POINTER]
		CMP		MAX, NEXT
		
		; Branch is bigger
		BHS		CTNU
		MOV		MAX, NEXT

CTNU
		ADD		POINTER, POINTER, #4
		SUBS	COUNT, COUNT, #1
		
		; Branch if not zero
		BNE		AGAIN

Stop
		B		Stop
	
		END
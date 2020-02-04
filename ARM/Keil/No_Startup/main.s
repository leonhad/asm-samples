; Define stack size of 256 bytes
Stack		EQU		0x00000100
	
	AREA	STACK, NOINIT, READWRITE, ALIGN=3

StackMem	SPACE	Stack
	
	AREA	RESET, DATA, READONLY
	EXPORT __Vectors
	
__Vectors
	DCD StackMem +Stack
	DCD Reset_Handler
	ALIGN
	
	AREA SimpleProject, CODE, READONLY, ALIGN=2
	ENTRY
	EXPORT Reset_Handler

Reset_Handler
	MOV R5, #0x1234
	MOV R3, #0x1234
	
	ADD R6, R5, R3
	
STOP
	B STOP

	END
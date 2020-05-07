ORG &8000

	; Option 0 - Add, 1 - Sub
	LD A, (&9000)
	LD BC, (&9001)

	CP 0
	JR z, MathAdd
	CP 1
	JR z, MathSub
	CP 2
	JR z, MathMult
	CP 3
	JR z, MathDiv

	XOR A
SaveResult:
	LD (&9003), A
	RET

MathSub:
	LD A, C
	SUB B
	JR SaveResult

MathAdd:
	LD A, C
	ADD B
	JR SaveResult

MathMult:
	LD A, B
	CP 0
	JR z, SaveResult
	LD A, 0

MathMultAgain:
	ADD C
	; Decrement B and jump
	DJNZ MathMultAgain

	JR SaveResult

MathDiv:
	LD A, C
	CP 0
	JR z, SaveResult
	LD D, 0

MathDivAgain:
	SUB B
	INC D
	JR nc, MathDivAgain
	DEC D
	LD A, D

	JR SaveResult
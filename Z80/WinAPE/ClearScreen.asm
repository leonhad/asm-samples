screensize equ &4000

ORG &8100
	LD A, %00001111

FillAgain:	
	LD HL, &C000		; Data origin
	LD DE, &C000+1		; Screen menu destination
	LD BC, screensize-1	; Copy one address to another
	LD (HL), A
	LDIR

	DEC A
	CP 255
	JP NZ, FillAgain

	ret
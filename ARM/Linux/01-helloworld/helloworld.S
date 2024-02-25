.global _start
_start:
	mov X0, #1 		// 1 = stdout
	ldr X1, =helloworld	// string to print
	mov X2, #13		// string length
	mov X8, #64		// Linux output string
	svc 0			// syscall to output the string

	// Setup to exit
	mov X0, #0		// return code
	mov X8, #93		// Service code 93 - teminate
	svc 0			// Call Linux to terminate

.data
helloworld:
	.ascii "Hello World!\n"


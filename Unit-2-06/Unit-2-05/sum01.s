/* -- sum01.s */
.global main
.func main

main:
	mov r1, #-7  // r1 <- -7
	mov r2, #-6  // r2 <- -6
	add r0, r1, r2  // r0 <- r1 + r2
	bx lr

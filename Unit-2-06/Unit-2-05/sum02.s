/* -- sum02.s */
.global _start

_start:
	mov r0, #7  // r0 <-7
	mov r1, #6  // r1 <-6
	add r0, r0, r1  // r0 <- r0 + r1
	mov r7, #1
	SWI 0

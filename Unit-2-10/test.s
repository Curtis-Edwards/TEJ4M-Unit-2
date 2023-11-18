/* -- test.s */

.text
.global main

main:
        mov r0, #3 // r0 <- 3
	mov r0, r0, lsl #2 // r1 <- (r1 * 2^2)
	mov r0, r0, lsl #3 // r1 <- (r1 * 2^3)
	mov r0, r0, lsr #4 // r1 <- (r1 * 1/2^4)
	mov r0, r0, lsl #1 // r1 <- (r1 * 2^1)
        bx lr

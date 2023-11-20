/* -- array01.s */
.data
a: .skip 400
b: .skip 8
.text
.global main
main:
	ldr r1, =a // r1 <- &a
	mov r2, #0 // r2 <- 0
Loop:
	cmp r2, #100 // Have we reached 100 yet?
	beq end // If so, leave the loop
	ldr r2, [r1, #+12]! // r1 <- r1 + 12 then r2 <- *r1
	add r2, r2, r2  // r2 <- r2 + r2
	str r2, [r1] // *r1 <- r2 : r1 now = address of a[3]
	add r2, r2, #1 // r2 <- r2 + 1
	b Loop // Goto beginning of the Loop
end:
	bx lr

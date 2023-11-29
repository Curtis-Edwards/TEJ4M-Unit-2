/* -- printf02.s */
.data

.balign 4 @ First message
message1: .asciz "Hey, type a number: "
.balign 4 @ Second message
message2: .asciz "%d times 5 is %d\n"
.balign 4 @ Format pattern for scanf
scan_pattern: .asciz "%d"
.balign 4 @ Where scanf will store the number read
number_read: .word 0
.balign 4
return: .word 0
.balign 4
return2: .word 0

.text

/* mult_by_5 function */
mult_by_5:
ldr r1, =return2 @ r1 <- &return2
str lr, [r1] @ *r1 <- lr

add r0, r0, r0, LSL #2 @ r0 <- r0 + 4*r0

ldr lr, =return2 @ lr <- &return2
ldr lr, [lr] @ lr <- *lr
bx lr @ return to main using lr

.global main
main:
  ldr r1, =return @ r1 <- &return
  str lr, [r1] @ *r1 <- lr
  
  ldr r0, =message1 @ r0 <- &message1
  bl printf @ call to printf
  
  ldr r0, =scan_pattern @ r0 <- &scan_pattern
  ldr r1, =number_read @ r1 <- &number_read
  bl scanf @ call to scanf
  
  ldr r0, =number_read @ r0 <- &number_read
  ldr r0, [r0] @ r0 <- *r0
  bl mult_by_5
  
  mov r2, r0 @ r2 <- r0
  ldr r1, =number_read @ r1 <- &number_read
  ldr r1, [r1] @ r1 <- *r1
  ldr r0, =message2 @ r0 <- &message2
  bl printf @ call to printf
  
  ldr lr, =return @ lr <- &return
  ldr lr, [lr] @ lr <- *lr
  bx lr @ return from main using lr

/* External */
.global printf
.global scanf

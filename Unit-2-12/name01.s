/* -- name01.s */
.data

/* First message */
.balign 4
message1: .asciz "Enter your name: "

/* Second message */
.balign 4
message2: .asciz "Thats a cool name, %d\n"

/* Format pattern for scanf */
.balign 4
scan_pattern : .asciz "%d"

/* Where scanf will store the number read */
.balign 4
number_read: .word 0

.balign 4
return: .word 0

.text

.global main
main:
  ldr r1, =return // r1 <- &return
  str lr, [r1] // *r1 <- lr ; save return address
  
  ldr r0, =message1 // r0 <- &message1
  bl printf // call to printf
  
  ldr r0, =scan_pattern // r0 <- &scan_pattern
  ldr r1, =number_read // r1 <- &number_read
  bl scanf // call to scanf
  
  ldr r0, =message2 // r0 <- &message2
  ldr r1, =number_read // r1 <- &number_read
  ldr r1, [r1] // r1 <- *r1
  bl printf // call to printf
  
  ldr r0, =number_read // r0 <- &number_read
  ldr r0, [r0] // r0 <- *r0
  
  ldr lr, =return // lr <- &return
  ldr lr, [lr] // lr <- *lr
  bx lr // return from main using lr

/* External */
.global printf
.global scanf

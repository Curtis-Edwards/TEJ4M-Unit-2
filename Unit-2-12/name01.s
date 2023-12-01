/* -- name01.s */
.data

/* First message */
.balign 4
message1: .asciz "Enter your name: "

/* Second message */
.balign 4
message2: .asciz "That's a cool name, %s\n"

/* Buffer to store the entered string */
.balign 4
buffer: .space 100

.balign 4
return: .word 0

.text

.global main
main:
  ldr r1, =return // r1 <- &return
  str lr, [r1] // *r1 <- lr ; save return address
  
  ldr r0, =message1 // r0 <- &message1
  bl printf // call to printf
  
  ldr r0, =buffer // r0 <- &buffer
  bl gets // call to gets to read a string
  
  ldr r0, =message2 // r0 <- &message2
  ldr r1, =buffer // r1 <- &buffer
  bl printf // call to printf
  
  ldr lr, =return // lr <- &return
  ldr lr, [lr] // lr <- *lr
  bx lr // return from main using lr

/* External */
.global printf
.global scanf

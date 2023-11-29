/* -- hello01.s */
.data

greeting:
.asciz "Hello world"

.balign 4
return: .word 0

.text

.global main
main:
ldr r1, =return // r1 <- &return
str lr, [r1] // *r1 <- lr

ldr r0, =greeting // r0 <- &greeting
// First parameter of puts

bl puts // Call to puts
// lr <- address of next instruction

ldr r1, =return // r1 <- &return
ldr lr, [r1] // lr <- *r1
bx lr // return from main

/* External */
.global puts // The C function puts

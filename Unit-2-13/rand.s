/* -- rand.s
rand.s gives us an array of 100 pseudo-random numbers
in the range 0 <= n < 100 based on Knuth’s advice.
X[n+1] <- (aX[n] + c) mod m
using m = 2^16 = 65536 which works on a 16-bit machine well
using a = 32445 so that a mod 8 = 5 and 99m/100 > a > m/100
using c = 1
using X0 = 31416 in r0 as seed (could be input)
*/
.text
.global main
main:
ldr r1, =return @ save return address
str lr, [r1]
/* ldr r0, #31416 @ X0 - initialized (could be input) */

mov r0, #0x7a
mov r0, r0, LSL #8
add r0, r0, #0x68 @ X0 = r0 = 0x7a68 = 31416

/* ldr r4, #32445 @ a - initialized */

mov r4, #0x7e
mov r4, r4, LSL #8
add r4, r4, #0xbd @ a = r4 = 0x7ebd = 32445

/* ldr r5, #0x0000FFFF @ mask to do modulo (m-1) - initialized */

mov r5, #0xFF
mov r5, r5, LSL #8
add r5, r5, #0xFF @ mask = m-1 = 0x0000FFFF
ldr r6, #396 @ counter - initialized 4*100-4 for 100 ints
ldr r7, #100 @ limit - initialized so values 0-99
Loop: @ while counter < 100
cmp r6, #0 @ check counter
blt Exit @ Stop when counter passes zero
mul r0, r0, r4 @ X = aX (mul works like this)
add r0, #1 @ now X = aX+c
and r0, r0, r5 @ now X = (aX+c) mod m
mov r8, r0 @ save X in r8 temporarily
lsr a0, a0, 8 @ divide by 256 (use upper 8 bits)
cmp a0, r7 @ check size
bge Loop @ only want those < 100
@Print
ldr r0, =format
mov r1, r8 @ prepare to print
bl printf
@Store
mov r0, r8 @ put X back
ldr r1, =list @ prepare to store
str r0, r1, [r6 -#4] @ store and then decrement counter

@End_of_Loop
b Loop
Exit:
ldr lr, =return
lrd lr, [lr] @ standard return to OS
bx lr
@
.data
list: .space 400 @ room for 100 integers
return: .word 0 @ save return address
format: .asciz " %d "
@
/* External */
.global printf

/* -- rand.s
rand.s gives us an array of 100 pseudo-random numbers
in the range 0 <= n < 100 based on Knuth's advice.
X[n+1] <- (aX[n] + c) mod m
using m = 2^16 = 65536 which works on a 16-bit machine well
using a = 32445 so that a mod 8 = 5 and 99m/100 > a > m/100
using c = 1
*/
.text
.global main
.global rand

main:
    ldr r1, =return @ save return address
    str lr, [r1]

    ldr r0, =prompt_seed
    bl puts
    ldr r0, =scanFMT
    ldr r1, =seed
    bl scanf

    ldr r0, =seed
    ldr r0, [r0]
    lsl r0, r0, #8
    add r0, r0, #0x68 @ X0 = r0

    ldr r4, #0x7e
    lsl r4, r4, #8
    add r4, r4, #0xbd @ a = r4

    ldr r5, #0xFF
    lsl r5, r5, #8
    add r5, r5, #0xFF @ mask = m-1

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
    str r0, [r1, r6, lsl #2] @ store and then decrement counter

    @End_of_Loop
    sub r6, r6, #1 @ decrement counter
    b Loop

Exit:
    ldr lr, =return
    ldr lr, [lr] @ standard return to OS
    bx lr

rand:
    ldr r0, =list
    bx lr

.data
list: .space 400 @ room for 100 integers
return: .word 0 @ save return address
seed: .word 0 @ place to hold input seed
prompt_seed: .asciz "Input the seed for the random number generator: "
format: .asciz " %d "
scanFMT: .asciz "%d"

/* External */
.global printf
.global puts
.global scanf

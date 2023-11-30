/* -- addNumbers.s */
.global main
.syntax unified

.text
main:
    push {r4, lr}

    /* Test addition */
    ldr r0, =5
    ldr r1, =7
    bl addNumbers
    bl printResult

    /* Exit */
    pop {r4, pc}

addNumbers:
    /* Adds two numbers and returns the result in r0 */
    add r0, r0, r1
    bx lr

printResult:
    /* Prints the result in r0 as an integer */
    mov r7, #1      /* syscall: write */
    mov r0, #1      /* file descriptor: STDOUT */
    ldr r2, =intBuffer
    mov r3, #4      /* buffer size: 4 (to print an integer) */
    mov r4, #0      /* format specifier: 0 for integer */
    svc 0

    bx lr

.data
intBuffer: .space 4

/* -- loop02.s */
.text
.global main
main:
        mov r1, #0 // r1 <- 0
        mov r2, #1 // r2 <- 1
        b check_loop // unconditionally jump to end of loop
loop:
        add r1, r1, r2 // r1 <- r1 + r2
        add r2, r2, #1 // r2 <- r2 + 1
        check_loop:
        cmp r2, #22 // compare r2 and 22
        ble loop // if r2 <= 22 goto beginning of loop
end:
        mov r0, r1 // r0 <- r1
        bx lr

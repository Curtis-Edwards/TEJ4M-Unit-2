/* -- first.s */
/* This is a comment */
.global main	/* entry point must be global */
.func main	/* 'main' is a funtion */

main:		/* This is main */
    mov r0, #1  /* Put a 1 into register r0 */
    bx lr       /* Return from main */

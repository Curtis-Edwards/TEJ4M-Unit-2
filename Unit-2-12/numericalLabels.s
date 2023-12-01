/* -- numericalLabels.s */
.global main /* entry point must be global */
.syntax unified /* modern syntax (UAL=Unified Assembler Language) */
.text
main: /* This is main */
  push {r4, lr}
  ldr r0, =message1
  bl puts
  b 1f /* Goto the first label 1 forward */
  b 2f /* Goto the first label 2 forward */
1:
  ldr r0, =message2
  bl puts
1:
  mov r0, 43 /* The # is optional in UAL */
  pop {r4, pc} /* Return from main */
2:
  ldr r0, =errmessage
  bl puts
  b 1b /* Goto the first label 1 backward */

.data
message1: .asciz "Numerical Label Test\n"
message2: .asciz "Success\n"
errmessage: .asciz "Failure!\n"

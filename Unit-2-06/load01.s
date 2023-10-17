/*-- load01.s */

/* Data section */
.data

/* Ensure variable is 4-byte aligned */
.balign 4
/* Define storage for myvar1 */
myvar1:
	/* Contents of myvar1 is 4 bytes containing the value 3 */
	.word 3

/* Ensure variable is 4-byte aligned */
.balign 4
/* Define storage for myvar1 */
myvar2:
	/* Contents of myvar2 is 4 bytes containing the value 4 */
	.word 4

/* -- Code section */

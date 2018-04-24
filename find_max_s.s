main:
	mov sp, #128
	add sp, sp, sp /* 256 */
	add sp, sp, sp /* 512 */
	add sp, sp, sp /* 1024 */

	sub sp, sp, #4
	mov r0, #3
	str r0, [sp]

	sub sp, sp, #4
	mov r0, #6
	str r0, [sp]

	sub sp, sp, #4
	mov r0, #4
	str r0, [sp]

	sub sp, sp, #4
	mov r0, #7
	str r0, [sp]

	sub sp, sp, #4
	mov r0, #1
	str r0, [sp]

	mov r0, sp
	mov r1, #5
	bl find_max_s
halt:
	b halt

find_max_s:
	ldr r2, [r0] // r2 == array[0]
	mov r3, #1 // r3 == 1
loop:
	cmp r3, r1 // r3 == r1
	bgt loop_end // if true end iteration
	ldr r12, [r0] // load r0 to r12
	cmp r12, r2 // cmp max with new value
	movgt r2, r12 // if r12 > r2 then r2 = r12
	add r0, r0, #4 // Go to next value in array
	add r3, r3, #1 // i++
	b loop
loop_end:
	mov r0, r2 // set max value to r0 
	bx lr

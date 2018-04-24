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
end:
	b end

find_max_s:
	ldr r2, [r0]
	mov r3, #1
loop:
	cmp r3, r1
	bgt loop_end
	ldr r12, [r0]
	cmp r12, r2
	movgt r2, r12
	add r0, r0, #4
	add r3, r3, #1
	b loop
loop_end:
	mov r0, r2
	bx lr

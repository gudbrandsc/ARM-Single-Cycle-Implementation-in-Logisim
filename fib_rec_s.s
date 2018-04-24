main:

	mov r0, #12
	mov sp, #128
	add sp, sp, sp
	add sp, sp, sp
	add sp, sp, sp
	bl fib_rec_s
halt:
	b halt

fib_rec_s:
	sub sp, sp, #16
	str lr, [sp]
	cmp r0, #0
	bne l1
	mov r0, #0
	b end
l1:
	cmp r0, #1
	bne rec
	mov r0, #1
	b end
rec:
	str r0, [sp, #4]
	sub r0, r0, #1
	bl fib_rec_s
	mov r1, r0
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	sub r0, r0, #2
	bl fib_rec_s
	ldr r1, [sp, #8]
	add r0, r1, r0
end:
	ldr lr, [sp]
	add sp, sp, #16
	bx lr

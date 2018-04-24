main:

	mov r0, #19
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
	cmp r0, #0 // if n == 0
	bne l1
	mov r0, #0
	b end
l1:
	cmp r0, #1 // if n == 1
	bne rec // if not do recursive call
	mov r0, #1 // set r0 == 1
	b end // end execution 
rec:
	str r0, [sp, #4] //Store R0 in sp
	sub r0, r0, #1 // n-1
	bl fib_rec_s // Call fib_rec_s(n-1)
	mov r1, r0
	str r1, [sp, #8]
	ldr r0, [sp, #4]
	sub r0, r0, #2 // n-2
	bl fib_rec_s // call fib_rec_s(n-2)
	ldr r1, [sp, #8]
	add r0, r1, r0 // add fib(n-1) + fib(n-2)
end:
	ldr lr, [sp]
	add sp, sp, #16
	bx lr 

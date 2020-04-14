	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"item.c"
	.text
	.align	2
	.global	initItem
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItem, %function
initItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	lr, #128
	mov	r7, #0
	mov	r6, #60
	mov	r5, #1
	mov	r4, #9
	ldr	ip, .L4
	ldr	r3, [ip]
	lsl	r2, r2, #4
	ldr	ip, [ip, #4]
	str	r2, [r0, #8]
	sub	r3, r2, r3
	lsl	r1, r1, #4
	ldr	r2, .L4+4
	sub	ip, r1, ip
	str	ip, [r0, #4]
	and	ip, r2, ip, asr #4
	ldr	r2, .L4+8
	str	r3, [r0]
	str	r2, [r0, #36]
	asr	r3, r3, #4
	ldr	r2, .L4+12
	and	r3, r3, #255
	str	r7, [r0, #24]
	str	r6, [r0, #28]
	str	r5, [r0, #32]
	str	lr, [r0, #16]
	str	lr, [r0, #20]
	str	r1, [r0, #12]
	strh	r4, [r2, #12]	@ movhi
	strh	r3, [r2, #8]	@ movhi
	strh	ip, [r2, #10]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	camera
	.word	511
	.word	58409488
	.word	shadowOAM
	.size	initItem, .-initItem
	.align	2
	.global	updateItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItem, %function
updateItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	add	r3, r3, r3, lsr #31
	cmp	r2, r3, asr #1
	push	{r4, r5, r6, r7, r8, lr}
	asr	r3, r3, #1
	mov	r4, r0
	ble	.L7
	mov	r1, #16
	ldr	r6, .L11
	mov	r0, #27
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	mov	r5, r0
	asr	r3, r3, #1
	mov	r1, #16
	mov	r0, #27
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r6
	ldr	r3, .L11+4
	orr	r5, r5, r0, lsl #5
	strh	r5, [r3, #8]	@ movhi
.L8:
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	movgt	r3, #0
	strgt	r3, [r4, #24]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	ldr	r7, .L11
	mov	r1, #27
	mov	r0, #16
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	mov	r5, r0
	mov	r1, #27
	ldr	r2, [r4, #24]
	asr	r3, r3, #1
	mov	r0, #16
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	mov	r6, r0
	ldr	r2, [r4, #24]
	asr	r3, r3, #1
	mov	r1, #0
	mov	r0, #16
	mov	lr, pc
	bx	r7
	lsl	r3, r0, #10
	ldr	r2, .L11+4
	orr	r3, r3, r6, lsl #5
	orr	r0, r3, r5
	strh	r0, [r2, #8]	@ movhi
	b	.L8
.L12:
	.align	2
.L11:
	.word	lerp
	.word	83886592
	.size	updateItem, .-updateItem
	.align	2
	.global	showItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	showItem, %function
showItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L23
	ldr	r3, [r0, #8]
	ldr	r2, [ip]
	sub	r3, r3, r2
	cmp	r3, #2544
	movle	r1, #0
	movgt	r1, #1
	ldr	r2, [r0, #20]
	rsb	r2, r2, #0
	cmp	r3, r2
	orrlt	r1, r1, #1
	ldr	ip, [ip, #4]
	ldr	r2, [r0, #12]
	sub	r2, r2, ip
	cmp	r1, #0
	lsl	ip, r2, #19
	lsr	r1, r3, #4
	str	r3, [r0]
	str	lr, [sp, #-4]!
	str	r2, [r0, #4]
	and	r3, r1, #255
	lsr	ip, ip, #23
	beq	.L22
	mov	lr, #1
	mov	r2, #256
	ldr	r1, .L23+4
	str	lr, [r0, #32]
	strh	r2, [r1, #12]	@ movhi
	strh	ip, [r1, #10]	@ movhi
.L16:
	orr	r3, r3, #512
	strh	r3, [r1, #8]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L22:
	cmp	r2, #3824
	movle	r1, #0
	movgt	r1, #1
	ldr	lr, [r0, #16]
	rsb	lr, lr, #0
	cmp	r2, lr
	movge	r2, r1
	orrlt	r2, r1, #1
	mov	lr, #256
	ldr	r1, .L23+4
	cmp	r2, #0
	str	r2, [r0, #32]
	strh	lr, [r1, #12]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	ip, [r1, #10]	@ movhi
	bne	.L16
	ldr	lr, [sp], #4
	bx	lr
.L24:
	.align	2
.L23:
	.word	camera
	.word	shadowOAM
	.size	showItem, .-showItem
	.comm	boots,40,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

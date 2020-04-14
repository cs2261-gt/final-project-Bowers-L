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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	mov	r7, #1
	mov	r6, #128
	mov	r8, #60
	mov	ip, r5
	ldr	lr, .L6
	strb	r3, [r0, #44]
	ldm	lr, {r3, r4}
	lsl	r1, r1, #4
	lsl	r2, r2, #4
	sub	r4, r1, r4
	str	r2, [r0, #8]
	str	r1, [r0, #12]
	sub	r2, r2, r3
	ldr	r1, .L6+4
	ldr	r3, .L6+8
	str	r3, [r0, #40]
	ldr	r3, [r1]
	add	lr, r3, r7
	ldr	r3, .L6+12
	str	lr, [r1]
	str	r4, [r0, #4]
	str	r8, [r0, #28]
	str	r7, [r0, #32]
	str	r6, [r0, #16]
	str	lr, [r0, #48]
	str	r2, [r0]
	str	r6, [r0, #20]
	str	r5, [r0, #24]
	str	r5, [r0, #36]
	add	r1, r3, #10
.L2:
	strb	ip, [r3, #1]!
	cmp	r3, r1
	bne	.L2
	mov	ip, #9
	ldr	r0, .L6+16
	ldr	r1, .L6+20
	asr	r2, r2, #4
	add	r3, r0, lr, lsl #3
	lsl	r5, lr, #3
	and	r1, r1, r4, asr #4
	and	r2, r2, #255
	strh	r2, [r0, r5]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	camera
	.word	.LANCHOR0
	.word	58409488
	.word	acquiredItems-1
	.word	shadowOAM
	.word	511
	.size	initItem, .-initItem
	.align	2
	.global	checkCollisionPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionPlayer, %function
checkCollisionPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r1, r0, #16
	add	r2, r0, #8
	ldm	r1, {r1, lr}
	ldm	r2, {r2, r3}
	sub	sp, sp, #16
	ldr	ip, .L10
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L10+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	player
	.word	collision
	.size	checkCollisionPlayer, .-checkCollisionPlayer
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
	ldr	ip, .L22
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
	beq	.L21
	mov	lr, #1
	mov	r2, #256
	ldr	r1, .L22+4
	str	lr, [r0, #32]
	strh	r2, [r1, #12]	@ movhi
	strh	ip, [r1, #10]	@ movhi
.L15:
	orr	r3, r3, #512
	strh	r3, [r1, #8]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L21:
	cmp	r2, #3824
	movle	r1, #0
	movgt	r1, #1
	ldr	lr, [r0, #16]
	rsb	lr, lr, #0
	cmp	r2, lr
	movge	r2, r1
	orrlt	r2, r1, #1
	mov	lr, #256
	ldr	r1, .L22+4
	cmp	r2, #0
	str	r2, [r0, #32]
	strh	lr, [r1, #12]	@ movhi
	strh	r3, [r1, #8]	@ movhi
	strh	ip, [r1, #10]	@ movhi
	bne	.L15
	ldr	lr, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	camera
	.word	shadowOAM
	.size	showItem, .-showItem
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
	.align	2
	.global	equipItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipItem, %function
equipItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	lr, #1
	ldr	r1, .L32
	ldr	ip, .L32+4
	ldrh	r2, [r1, #8]
	ldrb	r3, [ip]	@ zero_extendqisi2
	orr	r2, r2, #512
	cmp	r3, #0
	str	lr, [r0, #36]
	str	lr, [r0, #32]
	strh	r2, [r1, #8]	@ movhi
	bne	.L28
	add	r2, ip, lr
.L26:
	ldrb	r1, [r2], #1	@ zero_extendqisi2
	cmp	r1, #0
	add	r3, r3, #1
	beq	.L26
.L25:
	ldrb	r2, [r0, #44]	@ zero_extendqisi2
	cmp	r2, #1
	strb	r2, [ip, r3]
	bne	.L24
	mov	r2, #1024
	ldr	r5, .L32+8
	ldr	r4, [r5, #88]
	mov	r0, #2048
	mul	r1, r4, r4
	ldr	r3, .L32+12
	str	r2, [r5, #84]
	mov	lr, pc
	bx	r3
	mul	r4, r0, r4
	str	r0, [r5, #96]
	str	r4, [r5, #92]
.L24:
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	mov	r3, #0
	b	.L25
.L33:
	.align	2
.L32:
	.word	shadowOAM
	.word	acquiredItems
	.word	player
	.word	__aeabi_idiv
	.size	equipItem, .-equipItem
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
	ble	.L35
	mov	r1, #16
	ldr	r6, .L46
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
	ldr	r3, .L46+4
	orr	r5, r5, r0, lsl #5
	strh	r5, [r3, #8]	@ movhi
.L36:
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	movgt	r3, #0
	strgt	r3, [r4, #24]
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L45
.L34:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	ldr	r7, .L46
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
	ldr	r2, .L46+4
	orr	r3, r3, r6, lsl #5
	orr	r0, r3, r5
	strh	r0, [r2, #8]	@ movhi
	b	.L36
.L45:
	mov	r0, r4
	bl	checkCollisionPlayer
	cmp	r0, #0
	beq	.L34
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	equipItem
.L47:
	.align	2
.L46:
	.word	lerp
	.word	83886592
	.size	updateItem, .-updateItem
	.comm	acquiredItems,10,4
	.global	itemCount
	.comm	boots,52,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	itemCount, %object
	.size	itemCount, 4
itemCount:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

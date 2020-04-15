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
	.file	"laser.c"
	.text
	.align	2
	.global	initLaser
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLaser, %function
initLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	ip, #1
	mov	r5, #0
	mov	r4, #60
	str	r3, [r0, #40]
	ldr	r7, .L6
	cmp	r3, r5
	add	r3, r3, ip
	lsl	r3, r3, #7
	str	r3, [r0, #20]
	ldr	lr, .L6+4
	ldr	r3, [r7, #4]
	lsl	r1, r1, #4
	str	r1, [r0, #12]
	mov	r6, #128
	sub	r1, r1, r3
	ldr	r3, [lr]
	str	r4, [r0, #28]
	add	r4, r3, ip
	str	r4, [lr]
	mov	lr, #2
	ldr	r8, [r7]
	lsl	r2, r2, #4
	str	r2, [r0, #8]
	add	r3, r3, #11
	sub	r2, r2, r8
	str	r2, [r0]
	str	r1, [r0, #4]
	str	r6, [r0, #16]
	str	r5, [r0, #24]
	str	r3, [r0, #44]
	str	ip, [r0, #32]
	str	ip, [r0, #36]
	asr	r2, r2, #4
	ldr	ip, .L6+8
	ldr	r0, .L6+12
	and	r2, r2, #255
	lsl	r4, r3, #3
	orrne	r2, r2, #32768
	add	r3, ip, r3, lsl #3
	and	r1, r0, r1, asr #4
	strh	r2, [ip, r4]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	camera
	.word	.LANCHOR0
	.word	shadowOAM
	.word	511
	.size	initLaser, .-initLaser
	.align	2
	.global	initAllLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAllLasers, %function
initAllLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r3, .L14
	add	r2, r3, #1440
.L9:
	str	r1, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r2
	bne	.L9
	mov	r3, #1
	mov	r2, #704
	mov	r1, #376
	ldr	r0, .L14
	bl	initLaser
	mov	r3, #1
	mov	r2, #688
	mov	r1, #376
	ldr	r0, .L14+4
	bl	initLaser
	mov	r3, #1
	mov	r2, #672
	mov	r1, #376
	ldr	r0, .L14+8
	bl	initLaser
	mov	r3, #1
	mov	r2, #656
	mov	r1, #376
	ldr	r0, .L14+12
	bl	initLaser
	mov	r4, #704
	ldr	r5, .L14+16
.L10:
	mov	r2, r4
	sub	r0, r5, #384
	mov	r3, #1
	mov	r1, #64
	bl	initLaser
	mov	r2, r4
	mov	r0, r5
	mov	r3, #1
	mov	r1, #80
	sub	r4, r4, #16
	bl	initLaser
	cmp	r4, #576
	add	r5, r5, #48
	bne	.L10
	pop	{r4, r5, r6, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	lasers
	.word	lasers+48
	.word	lasers+96
	.word	lasers+144
	.word	lasers+576
	.size	initAllLasers, .-initAllLasers
	.align	2
	.global	checkCollisionPlayerLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionPlayerLaser, %function
checkCollisionPlayerLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r1, r0, #16
	add	r2, r0, #8
	ldm	r1, {r1, lr}
	ldm	r2, {r2, r3}
	sub	sp, sp, #16
	ldr	ip, .L18
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L18+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	player
	.word	collision
	.size	checkCollisionPlayerLaser, .-checkCollisionPlayerLaser
	.align	2
	.global	updateLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLaser, %function
updateLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	add	r3, r3, #1
	cmp	r3, r2
	push	{r4, r5, r6, lr}
	str	r3, [r0, #24]
	movge	r3, #0
	ldr	r5, [r0, #32]
	strge	r3, [r0, #24]
	cmp	r5, #0
	mov	r4, r0
	beq	.L29
.L20:
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	bl	checkCollisionPlayerLaser
	cmp	r0, #0
	beq	.L20
	ldr	r6, .L30
	ldr	r2, [r4, #12]
	ldr	r0, [r6, #12]
	ldr	r3, .L30+4
	sub	r0, r0, r2
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #12]
	add	r3, r3, r0, lsl #7
	str	r5, [r6, #20]
	str	r3, [r6, #12]
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	player
	.word	signOf
	.size	updateLaser, .-updateLaser
	.align	2
	.global	updateAllLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAllLasers, %function
updateAllLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L41
	add	r5, r4, #1440
	b	.L34
.L33:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L40
.L34:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L33
	mov	r0, r4
	add	r4, r4, #48
	bl	updateLaser
	cmp	r4, r5
	bne	.L34
.L40:
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	lasers
	.size	updateAllLasers, .-updateAllLasers
	.global	__aeabi_idiv
	.align	2
	.global	showLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	showLaser, %function
showLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L54
	ldr	r2, [r0, #8]
	ldr	r3, [ip]
	sub	r3, r2, r3
	cmp	r3, #2544
	movle	r1, #0
	movgt	r1, #1
	ldr	r2, [r0, #20]
	rsb	r2, r2, #0
	cmp	r3, r2
	orrlt	r1, r1, #1
	ldr	r2, [ip, #4]
	ldr	ip, [r0, #12]
	cmp	r1, #0
	sub	r2, ip, r2
	push	{r4, r5, r6, r7, r8, lr}
	movne	r5, #1
	str	r3, [r0]
	str	r2, [r0, #4]
	beq	.L53
.L44:
	ldr	r1, [r0, #40]
	asr	r3, r3, #4
	cmp	r1, #0
	andne	r3, r3, #255
	mvnne	r3, r3, lsl #17
	mvnne	r3, r3, lsr #17
	ldr	r4, [r0, #44]
	ldr	r1, [r0, #28]
	ldrne	r6, .L54+4
	ldreq	r6, .L54+4
	lslne	r4, r4, #3
	lsleq	r4, r4, #3
	andeq	r3, r3, #255
	str	r5, [r0, #32]
	cmp	r1, #0
	strh	r3, [r6, r4]	@ movhi
	add	r3, r1, #3
	movlt	r1, r3
	ldr	r3, .L54+8
	add	r7, r6, r4
	and	r2, r3, r2, asr #4
	ldr	r0, [r0, #24]
	ldr	r3, .L54+12
	strh	r2, [r7, #2]	@ movhi
	asr	r1, r1, #2
	mov	lr, pc
	bx	r3
	lsl	r0, r0, #6
	add	r0, r0, #2
	strh	r0, [r7, #4]	@ movhi
	cmp	r5, #0
	ldrhne	r3, [r6, r4]
	orrne	r3, r3, #512
	strhne	r3, [r6, r4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L53:
	cmp	r2, #3824
	movle	r5, #0
	movgt	r5, #1
	ldr	r1, [r0, #16]
	rsb	r1, r1, #0
	cmp	r2, r1
	orrlt	r5, r5, #1
	b	.L44
.L55:
	.align	2
.L54:
	.word	camera
	.word	shadowOAM
	.word	511
	.word	__aeabi_idiv
	.size	showLaser, .-showLaser
	.align	2
	.global	showAllLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	showAllLasers, %function
showAllLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L65
	add	r5, r4, #1440
	b	.L58
.L57:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L64
.L58:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L57
	mov	r0, r4
	add	r4, r4, #48
	bl	showLaser
	cmp	r4, r5
	bne	.L58
.L64:
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	lasers
	.size	showAllLasers, .-showAllLasers
	.comm	lasers,1440,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	laserCount.4300, %object
	.size	laserCount.4300, 4
laserCount.4300:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	.file	"player.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipCurrentItem.part.0, %function
equipCurrentItem.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L3
	ldr	r3, [r3, #108]
	ldr	r2, .L3+4
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	strh	r2, [r3, #12]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	player
	.word	429
	.size	equipCurrentItem.part.0, .-equipCurrentItem.part.0
	.global	__aeabi_idiv
	.global	__aeabi_idivmod
	.align	2
	.global	showPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	showPlayer, %function
showPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r4, .L15
	ldr	r8, [r4, #120]
	ldr	r6, .L15+4
	add	r2, r8, #90
	smull	r1, r3, r6, r2
	asr	r1, r2, #31
	add	r3, r3, r2
	rsb	r3, r1, r3, asr #8
	ldr	r1, .L15+8
	add	r3, r3, r3, lsl #1
	ldm	r1, {r0, r1}
	ldr	lr, [r4, #8]
	ldr	r7, [r4, #12]
	ldr	r10, [r4, #112]
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	ldr	r9, .L15+12
	lsl	r5, r3, #1
	sub	lr, lr, r0
	sub	r7, r7, r1
	cmp	r10, #0
	ldrsh	fp, [r9, r5]
	str	lr, [r4]
	str	r7, [r4, #4]
	ldr	r2, [r4, #28]
	sub	sp, sp, #12
	beq	.L13
.L6:
	rsb	r2, r2, #0
	cmp	lr, #2544
	cmple	r2, lr
	movgt	ip, #1
	ble	.L14
.L7:
	ldr	r3, [r4, #36]
	ldr	r1, [r4, #44]
	mov	r0, r3
	stm	sp, {r1, r3}
	ldr	r2, .L15+16
	str	ip, [r4, #52]
	lsr	r6, lr, #4
	mov	lr, pc
	bx	r2
	lsl	r7, r7, #19
	lsl	r0, r0, #16
	cmp	r10, #0
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	ldm	sp, {r1, r3}
	and	r6, r6, #255
	lsr	r7, r7, #23
	lsr	r0, r0, #16
	beq	.L8
	ldr	ip, .L15+20
	add	r2, r2, #5
	add	r2, r2, r0, lsl #5
	orr	r6, r6, #1024
	strh	r2, [ip, #4]	@ movhi
	strh	r6, [ip]	@ movhi
	strh	r7, [ip, #2]	@ movhi
.L9:
	ldr	r0, .L15+4
	smull	r2, r0, r8, r0
	ldr	ip, .L15+24
	add	r0, r0, r8
	asr	r2, r8, #31
	rsb	r2, r2, r0, asr #8
	add	r2, r2, r2, lsl #1
	ldr	r0, [ip]
	rsb	r2, r2, r2, lsl #4
	strh	fp, [r0, #6]	@ movhi
	sub	r2, r8, r2, lsl #3
	lsl	r2, r2, #1
	ldrsh	ip, [r9, r2]
	rsb	ip, ip, #0
	strh	ip, [r0, #14]	@ movhi
	ldrsh	r2, [r9, r2]
	strh	r2, [r0, #22]	@ movhi
	ldr	ip, [r4, #48]
	ldrsh	r2, [r9, r5]
	cmp	ip, #0
	strh	r2, [r0, #30]	@ movhi
	bne	.L5
	ldr	r2, [r4, #40]
	add	r0, r3, #1
	mul	r1, r2, r1
	ldr	r3, .L15+28
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L5:
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L8:
	ldr	ip, .L15+20
	orr	r6, r6, #34560
	add	r2, r2, r0, lsl #6
	strh	r6, [ip]	@ movhi
	strh	r7, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	b	.L9
.L13:
	add	r2, r2, r2, lsr #31
	ldr	r5, .L15+32
	asr	r2, r2, #1
	mov	r0, fp
	mul	fp, r2, fp
	mov	lr, pc
	bx	r5
	mul	r0, fp, r0
	cmp	r0, #0
	add	fp, r0, #255
	movge	fp, r0
	ldr	r2, [r4, #120]
	smull	r3, r1, r6, r2
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #8
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	ldr	r0, [r4, #24]
	lsl	r3, r3, #1
	ldrsh	r2, [r9, r3]
	ldr	r3, [r4]
	add	r7, r0, r0, lsr #31
	sub	fp, r3, fp, asr #8
	mov	r0, r2
	asr	r7, r7, #1
	mul	r7, r2, r7
	str	fp, [r4]
	mov	lr, pc
	bx	r5
	mul	r0, r7, r0
	cmp	r0, #0
	add	r3, r0, #255
	movlt	r0, r3
	ldr	r3, [r4, #120]
	add	r3, r3, #90
	smull	r2, r1, r6, r3
	asr	r2, r3, #31
	add	r1, r1, r3
	rsb	r2, r2, r1, asr #8
	add	r2, r2, r2, lsl #1
	rsb	r2, r2, r2, lsl #4
	sub	r3, r3, r2, lsl #3
	lsl	r2, r3, #1
	ldr	r3, [r4, #24]
	ldrsh	ip, [r9, r2]
	ldr	r1, [r4]
	add	r3, r3, r3, lsr #31
	sub	r2, r1, r0, asr #8
	asr	r7, r3, #1
	mov	r0, ip
	mul	r7, ip, r7
	str	r2, [r4]
	mov	lr, pc
	bx	r5
	mul	r0, r7, r0
	add	r3, r0, #255
	cmp	r0, #0
	movlt	r0, r3
	ldr	r2, [r4, #120]
	smull	r3, r1, r6, r2
	asr	r3, r2, #31
	add	r1, r1, r2
	rsb	r3, r3, r1, asr #8
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	lsl	r2, r3, #1
	ldr	r3, [r4, #28]
	ldrsh	ip, [r9, r2]
	ldr	r1, [r4, #4]
	add	r3, r3, r3, lsr #31
	sub	r2, r1, r0, asr #8
	asr	r7, r3, #1
	mov	r0, ip
	mul	r7, ip, r7
	str	r2, [r4, #4]
	mov	lr, pc
	bx	r5
	mul	r7, r0, r7
	add	r0, r7, #255
	cmp	r7, #0
	movlt	r7, r0
	ldr	r8, [r4, #120]
	add	r2, r8, #90
	smull	r3, r6, r2, r6
	asr	r3, r2, #31
	add	r6, r6, r2
	rsb	r3, r3, r6, asr #8
	add	r3, r3, r3, lsl #1
	ldr	r0, [r4, #4]
	rsb	r3, r3, r3, lsl #4
	sub	r3, r2, r3, lsl #3
	sub	r7, r0, r7, asr #8
	lsl	r5, r3, #1
	str	r7, [r4, #4]
	ldrsh	fp, [r9, r5]
	ldr	lr, [r4]
	ldr	r2, [r4, #28]
	ldr	r10, [r4, #112]
	b	.L6
.L14:
	ldr	ip, [r4, #24]
	rsb	ip, ip, #0
	cmp	r7, #3824
	cmple	ip, r7
	movgt	ip, #1
	movle	ip, #0
	b	.L7
.L16:
	.align	2
.L15:
	.word	player
	.word	-1240768329
	.word	camera
	.word	sinLut
	.word	__aeabi_idiv
	.word	shadowOAM
	.word	shadowOAMAffine
	.word	__aeabi_idivmod
	.word	signOf
	.size	showPlayer, .-showPlayer
	.align	2
	.global	collisionLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionLeft, %function
collisionLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L22
	ldr	r3, [r1, #12]
	cmp	r3, #0
	blt	.L20
	ldr	r2, [r1, #8]
	rsb	r0, r0, r3, asr #4
	asr	r3, r2, #4
	ldr	ip, .L22+4
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L21
.L20:
	mov	r0, #1
	bx	lr
.L21:
	ldr	r3, [r1, #28]
	add	r2, r2, r3
	asr	r2, r2, #4
	sub	r2, r2, #1
	add	r0, r0, r2, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L23:
	.align	2
.L22:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionLeft, .-collisionLeft
	.align	2
	.global	collisionRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionRight, %function
collisionRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L29
	ldr	r3, [r2, #12]
	ldr	r1, [r2, #24]
	add	r3, r3, r1
	cmp	r3, #16384
	bge	.L27
	ldr	r1, [r2, #8]
	add	r0, r0, r3, asr #4
	asr	r3, r1, #4
	ldr	ip, .L29+4
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L28
.L27:
	mov	r0, #1
	bx	lr
.L28:
	ldr	r3, [r2, #28]
	add	r1, r1, r3
	asr	r1, r1, #4
	sub	r1, r1, #1
	add	r0, r0, r1, lsl #10
	lsl	r0, r0, #1
	ldrh	r0, [ip, r0]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionRight, .-collisionRight
	.align	2
	.global	collisionAbove
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionAbove, %function
collisionAbove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L34
	ldr	r3, [ip, #8]
	ldr	r1, [ip, #12]
	rsb	r0, r0, r3, asr #4
	asr	r3, r1, #4
	add	r3, r3, r0, lsl #10
	ldr	r2, .L34+4
	lsl	r3, r3, #1
	ldrh	r3, [r2, r3]
	cmp	r3, #0
	lsl	r0, r0, #10
	bne	.L33
	ldr	r3, [ip, #24]
	add	r1, r1, r3
	add	r0, r0, r1, asr #4
	add	r0, r2, r0, lsl #1
	ldrh	r0, [r0, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L33:
	mov	r0, #1
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionAbove, .-collisionAbove
	.align	2
	.global	collisionBelow
	.syntax unified
	.arm
	.fpu softvfp
	.type	collisionBelow, %function
collisionBelow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L41
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #28]
	add	r3, r3, r1
	cmp	r3, #16384
	bge	.L39
	ldr	ip, [r2, #12]
	asr	r3, r3, #4
	sub	r3, r3, #1
	add	r0, r3, r0
	asr	r3, ip, #4
	add	r3, r3, r0, lsl #10
	ldr	r1, .L41+4
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	lsl	r0, r0, #10
	beq	.L40
.L39:
	mov	r0, #1
	bx	lr
.L40:
	ldr	r3, [r2, #24]
	add	ip, ip, r3
	add	r0, r0, ip, asr #4
	add	r0, r1, r0, lsl #1
	ldrh	r0, [r0, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L42:
	.align	2
.L41:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionBelow, .-collisionBelow
	.align	2
	.global	touchingGround
	.syntax unified
	.arm
	.fpu softvfp
	.type	touchingGround, %function
touchingGround:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L51
	ldr	r3, [r1, #100]
	cmp	r3, #0
	ldrgt	ip, [r1, #28]
	ldr	r3, [r1, #8]
	ldr	r0, [r1, #12]
	addgt	r3, r3, ip
	asrle	r3, r3, #4
	asrgt	r3, r3, #4
	suble	r3, r3, #1
	asr	r2, r0, #4
	add	r2, r2, r3, lsl #10
	ldr	ip, .L51+4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #10
	bne	.L47
	ldr	r2, [r1, #24]
	add	r0, r0, r2
	add	r3, r3, r0, asr #4
	add	r3, ip, r3, lsl #1
	ldrh	r0, [r3, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L47:
	mov	r0, #1
	bx	lr
.L52:
	.align	2
.L51:
	.word	player
	.word	mapCollisionBitmap
	.size	touchingGround, .-touchingGround
	.align	2
	.global	handlePlayerInput
	.syntax unified
	.arm
	.fpu softvfp
	.type	handlePlayerInput, %function
handlePlayerInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L125
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L54
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L119
.L54:
	ldr	r3, .L125
	ldrh	r3, [r3, #48]
	ands	r3, r3, #32
	bne	.L59
	mvn	r2, #0
	ldr	r4, .L125+4
	ldr	r1, [r4, #12]
	cmp	r1, #0
	str	r2, [r4, #104]
	ble	.L60
	ldr	r2, [r4, #72]
	ldr	r1, [r4, #20]
	rsb	r2, r2, #0
	cmp	r1, r2
	ldrgt	r3, [r4, #64]
	rsbgt	r3, r3, #0
	str	r3, [r4, #60]
.L60:
	bl	touchingGround
	cmp	r0, #0
	beq	.L59
	mov	r3, #0
	ldr	r2, [r4, #20]
	cmn	r2, #32
	str	r3, [r4, #48]
	movlt	r3, #4
	movge	r3, #2
	strb	r3, [r4, #32]
.L59:
	ldr	r3, .L125
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	bne	.L57
	mov	r1, #1
	ldr	r4, .L125+4
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #12]
	rsb	r2, r2, #16384
	cmp	r0, r2
	str	r1, [r4, #104]
	bge	.L65
	ldr	r1, [r4, #20]
	ldr	r2, [r4, #72]
	cmp	r1, r2
	ldrlt	r3, [r4, #64]
	str	r3, [r4, #60]
.L65:
	bl	touchingGround
	cmp	r0, #0
	beq	.L57
	mov	r3, #0
	ldr	r2, [r4, #20]
	cmp	r2, #32
	str	r3, [r4, #48]
	movgt	r3, #3
	movle	r3, #1
	strb	r3, [r4, #32]
.L57:
	ldr	r6, .L125+8
	ldrh	r5, [r6]
	tst	r5, #1
	beq	.L69
	ldr	r3, .L125+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L69
	bl	touchingGround
	cmp	r0, #0
	ldr	r4, .L125+4
	bne	.L70
	ldr	r3, [r4, #116]
	cmp	r3, #0
	beq	.L69
	mov	r0, #2
	bl	collisionLeft
	cmp	r0, #0
	beq	.L120
.L70:
	mov	r2, #1
	mov	r1, #0
	ldr	r3, .L125
	ldrh	r3, [r3, #48]
	tst	r3, #1
	ldr	r3, [r4, #96]
	rsb	r3, r3, #0
	str	r3, [r4, #16]
	str	r2, [r4, #84]
	str	r2, [r4, #48]
	str	r1, [r4, #36]
	bne	.L71
.L72:
	tst	r5, #2
	beq	.L74
	ldr	r3, .L125+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L121
.L74:
	tst	r5, #512
	beq	.L75
	ldr	r3, .L125+12
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L122
.L75:
	tst	r5, #256
	beq	.L53
	ldr	r3, .L125+12
	ldrh	r3, [r3]
	tst	r3, #256
	bne	.L53
	ldr	r2, .L125+4
	ldr	r3, [r2, #108]
	cmp	r3, #4
	bgt	.L53
	ldr	r1, .L125+16
	add	r3, r3, #1
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	cmp	r1, #0
	bne	.L123
.L53:
	pop	{r4, r5, r6, lr}
	bx	lr
.L120:
	mov	r0, #2
	bl	collisionRight
	cmp	r0, #0
	bne	.L70
.L69:
	ldr	r3, .L125
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L72
	ldr	r4, .L125+4
	ldr	r3, [r4, #84]
	cmp	r3, #0
	beq	.L72
.L71:
	mov	r3, #0
	str	r3, [r4, #16]
	str	r3, [r4, #84]
	b	.L72
.L122:
	ldr	r2, .L125+4
	ldr	r3, [r2, #108]
	cmp	r3, #0
	ble	.L75
	ldr	r1, .L125+16
	sub	r3, r3, #1
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	cmp	r1, #0
	beq	.L75
	ldr	r1, .L125+20
	str	r3, [r2, #108]
	mov	lr, pc
	bx	r1
	ldrh	r5, [r6]
	b	.L75
.L121:
	ldr	r3, .L125+4
	ldr	r1, .L125+16
	ldr	r2, [r3, #108]
	ldr	r3, .L125+24
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	mov	lr, pc
	bx	r3
	ldrh	r5, [r6]
	b	.L74
.L119:
	ldr	r4, .L125+4
	ldr	r6, .L125+28
	ldr	r0, [r4, #104]
	mov	lr, pc
	bx	r6
	mov	r5, r0
	ldr	r0, [r4, #20]
	mov	lr, pc
	bx	r6
	cmp	r5, r0
	movne	r3, #0
	strne	r3, [r4, #20]
	strne	r3, [r4, #60]
	beq	.L124
.L56:
	mov	r3, #0
	strb	r3, [r4, #32]
	b	.L57
.L123:
	ldr	r1, .L125+20
	str	r3, [r2, #108]
	mov	lr, pc
	bx	r1
	b	.L53
.L124:
	ldr	r0, [r4, #104]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L56
.L126:
	.align	2
.L125:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	playerInventory
	.word	showSelectorOnItem
	.word	useItem
	.word	signOf
	.size	handlePlayerInput, .-handlePlayerInput
	.align	2
	.global	resolveCollisions
	.syntax unified
	.arm
	.fpu softvfp
	.type	resolveCollisions, %function
resolveCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r0, #0
	bl	collisionLeft
	ldr	r5, .L153
	subs	r6, r0, #0
	ldr	r4, [r5, #12]
	beq	.L128
	mov	r6, #0
	add	r4, r4, #2
.L129:
	mov	r0, #0
	str	r4, [r5, #12]
	bl	collisionLeft
	cmp	r0, #0
	mov	r3, r4
	add	r6, r6, #1
	add	r4, r4, #2
	bne	.L129
	sub	r3, r3, r6, lsl #1
	mov	r7, #1
	str	r3, [r5, #12]
	lsl	r8, r6, #1
	b	.L130
.L131:
	sub	r4, r4, #2
	str	r4, [r5, #12]
	add	r6, r6, #1
.L128:
	mov	r0, #0
	bl	collisionRight
	subs	r7, r0, #0
	bne	.L131
	add	r4, r4, r6, lsl #1
	str	r4, [r5, #12]
	lsl	r8, r6, #1
.L130:
	mov	r0, #0
	bl	collisionAbove
	subs	r9, r0, #0
	ldr	r4, [r5, #8]
	beq	.L132
	mov	r9, #0
	add	r4, r4, #2
.L133:
	mov	r0, #0
	str	r4, [r5, #8]
	bl	collisionAbove
	cmp	r0, #0
	mov	r3, r4
	add	r9, r9, #1
	add	r4, r4, #2
	bne	.L133
	sub	r3, r3, r9, lsl #1
	cmp	r6, r9
	str	r3, [r5, #8]
	lsl	r9, r9, #1
	ble	.L134
	add	r9, r3, r9
	str	r0, [r5, #16]
	str	r9, [r5, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L136:
	sub	r4, r4, #2
	str	r4, [r5, #8]
	add	r9, r9, #1
.L132:
	mov	r0, #0
	bl	collisionBelow
	cmp	r0, #0
	bne	.L136
	add	r4, r4, r9, lsl #1
	cmp	r6, r9
	str	r4, [r5, #8]
	lsl	r3, r9, #1
	bgt	.L137
.L134:
	cmp	r6, #0
	movne	r3, #0
	ldr	r0, [r5, #12]
	strne	r3, [r5, #20]
	cmp	r7, #0
	addne	r0, r0, r8
	subeq	r0, r0, r8
	mov	r1, #16
	ldr	r3, .L153+4
	str	r0, [r5, #12]
	mov	lr, pc
	bx	r3
	str	r0, [r5, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L137:
	cmp	r9, #0
	movne	r9, r3
	sub	r4, r4, r9
	strne	r0, [r5, #16]
	str	r4, [r5, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L154:
	.align	2
.L153:
	.word	player
	.word	roundbase
	.size	resolveCollisions, .-resolveCollisions
	.align	2
	.global	equipBoots
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipBoots, %function
equipBoots:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L159
	ldr	r3, [r4, #88]
	cmp	r3, #1024
	bne	.L156
	mov	r0, #512
	mov	r2, #16
	str	r0, [r4, #88]
	str	r2, [r4, #92]
	mov	r1, #0
	mov	r2, #64
	mov	r0, #4
	ldr	r3, [r4, #108]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	strh	r1, [r3, #12]	@ movhi
	str	r0, [r4, #100]
	str	r2, [r4, #96]
	pop	{r4, r5, r6, lr}
	bx	lr
.L156:
	mov	r2, #1024
	mov	r3, #20
	str	r2, [r4, #88]
	str	r3, [r4, #92]
	bl	equipCurrentItem.part.0
	add	r0, r4, #88
	ldm	r0, {r0, r5}
	ldr	r3, .L159+4
	mul	r1, r5, r5
	lsl	r0, r0, #1
	mov	lr, pc
	bx	r3
	mul	r2, r0, r5
	str	r0, [r4, #100]
	str	r2, [r4, #96]
	pop	{r4, r5, r6, lr}
	bx	lr
.L160:
	.align	2
.L159:
	.word	player
	.word	__aeabi_idiv
	.size	equipBoots, .-equipBoots
	.align	2
	.global	shrinkPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	shrinkPlayer, %function
shrinkPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L165
	ldr	r3, [r4, #112]
	cmp	r3, #0
	beq	.L162
	mov	r0, #8
	bl	collisionAbove
	cmp	r0, #0
	bne	.L161
	mov	r1, #256
	ldr	r3, [r4, #108]
	ldr	r2, [r4, #8]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	sub	r2, r2, #128
	str	r0, [r4, #112]
	str	r2, [r4, #8]
	str	r1, [r4, #28]
	strh	r0, [r3, #12]	@ movhi
.L161:
	pop	{r4, lr}
	bx	lr
.L162:
	mov	r2, #1
	mov	r3, #128
	str	r2, [r4, #112]
	str	r3, [r4, #28]
	pop	{r4, lr}
	b	equipCurrentItem.part.0
.L166:
	.align	2
.L165:
	.word	player
	.size	shrinkPlayer, .-shrinkPlayer
	.align	2
	.global	equipLegs
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipLegs, %function
equipLegs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L170
	ldr	r3, [r2, #72]
	cmp	r3, #16
	beq	.L169
	mov	r0, #16
	mov	r1, #0
	ldr	r3, [r2, #108]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	str	r0, [r2, #72]
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L169:
	mov	r3, #64
	str	r3, [r2, #72]
	b	equipCurrentItem.part.0
.L171:
	.align	2
.L170:
	.word	player
	.size	equipLegs, .-equipLegs
	.align	2
	.global	equipGloves
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipGloves, %function
equipGloves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L176
	ldr	r3, [r2, #116]
	cmp	r3, #0
	beq	.L173
	mov	r1, #0
	ldr	r3, [r2, #108]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	str	r1, [r2, #116]
	strh	r1, [r3, #12]	@ movhi
	bx	lr
.L173:
	mov	r3, #1
	str	r3, [r2, #116]
	b	equipCurrentItem.part.0
.L177:
	.align	2
.L176:
	.word	player
	.size	equipGloves, .-equipGloves
	.align	2
	.global	startLaserSling
	.syntax unified
	.arm
	.fpu softvfp
	.type	startLaserSling, %function
startLaserSling:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L184
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L184+4
	cmp	r0, #0
	str	r0, [r3]
	beq	.L178
	mov	r2, #0
	ldr	r3, .L184+8
	ldr	r1, .L184+12
	ldr	r0, .L184+16
	mov	lr, pc
	bx	r3
	mov	r2, #2
	ldr	r3, .L184+20
	strb	r2, [r3, #124]
.L178:
	pop	{r4, lr}
	bx	lr
.L185:
	.align	2
.L184:
	.word	findCloseLaser
	.word	nearestLaser
	.word	playSoundB
	.word	5200
	.word	snd_Ding
	.word	player
	.size	startLaserSling, .-startLaserSling
	.align	2
	.global	finishLaserSling
	.syntax unified
	.arm
	.fpu softvfp
	.type	finishLaserSling, %function
finishLaserSling:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r0, .L190
	ldr	r3, .L190+4
	push	{r4, lr}
	ldr	r1, .L190+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L190+12
	ldr	r0, [r3]
	ldr	r3, [r0]
	ldr	r3, [r3, #40]
	ldr	r2, [r0, #4]
	cmp	r3, #1
	add	r3, r2, #3
	ble	.L187
	cmp	r2, #0
	movge	r3, r2
	ldr	r1, .L190+16
	ldr	ip, [r1, #8]
	asr	r3, r3, #2
	add	r2, ip, r2, lsl #1
	str	r3, [r1, #16]
	str	r2, [r1, #8]
.L188:
	ldr	r3, .L190+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L187:
	cmp	r2, #0
	movge	r3, r2
	ldr	r1, .L190+16
	ldr	ip, [r1, #12]
	asr	r3, r3, #2
	add	r2, ip, r2, lsl #1
	str	r3, [r1, #20]
	str	r2, [r1, #12]
	b	.L188
.L191:
	.align	2
.L190:
	.word	snd_Zap
	.word	playSoundB
	.word	6061
	.word	nearestLaser
	.word	player
	.word	free
	.size	finishLaserSling, .-finishLaserSling
	.align	2
	.global	reverseGravity
	.syntax unified
	.arm
	.fpu softvfp
	.type	reverseGravity, %function
reverseGravity:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L193
	ldr	r2, [r1, #120]
	ldr	r0, .L193+4
	add	r2, r2, #180
	smull	r3, r0, r2, r0
	asr	r3, r2, #31
	add	r0, r0, r2
	rsb	r3, r3, r0, asr #8
	add	r0, r1, #96
	ldm	r0, {r0, ip}
	add	r3, r3, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	rsb	ip, ip, #0
	rsb	r0, r0, #0
	sub	r3, r2, r3, lsl #3
	str	ip, [r1, #100]
	str	r0, [r1, #96]
	str	r3, [r1, #120]
	bx	lr
.L194:
	.align	2
.L193:
	.word	player
	.word	-1240768329
	.size	reverseGravity, .-reverseGravity
	.align	2
	.global	equipCurrentItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipCurrentItem, %function
equipCurrentItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #0
	bne	equipCurrentItem.part.0
.L196:
	ldr	r3, .L197
	ldr	r3, [r3, #108]
	lsl	r3, r3, #1
	add	r3, r3, #83886080
	strh	r0, [r3, #12]	@ movhi
	bx	lr
.L198:
	.align	2
.L197:
	.word	player
	.size	equipCurrentItem, .-equipCurrentItem
	.align	2
	.global	setTransform
	.syntax unified
	.arm
	.fpu softvfp
	.type	setTransform, %function
setTransform:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, r3
	mov	r3, r0
	ldr	fp, .L201
	add	r0, r5, #90
	smull	lr, ip, fp, r0
	asr	r4, r0, #31
	add	ip, ip, r0
	rsb	r4, r4, ip, asr #8
	add	r4, r4, r4, lsl #1
	ldr	ip, .L201+4
	rsb	r4, r4, r4, lsl #4
	ldr	r8, .L201+8
	sub	r4, r0, r4, lsl #3
	ldr	r6, [ip]
	lsl	r4, r4, #1
	ldrsh	r0, [r8, r4]
	ldr	r7, .L201+12
	add	r6, r6, r3, lsl #5
	mov	r9, r2
	mov	r10, r1
	mov	lr, pc
	bx	r7
	smull	r3, fp, r5, fp
	asr	ip, r5, #31
	add	fp, fp, r5
	rsb	ip, ip, fp, asr #8
	add	ip, ip, ip, lsl #1
	rsb	ip, ip, ip, lsl #4
	sub	ip, r5, ip, lsl #3
	strh	r0, [r6, #6]	@ movhi
	lsl	r5, ip, #1
	ldrsh	r0, [r8, r5]
	mov	r1, r10
	rsb	r0, r0, #0
	mov	lr, pc
	bx	r7
	strh	r0, [r6, #14]	@ movhi
	mov	r1, r9
	ldrsh	r0, [r8, r5]
	mov	lr, pc
	bx	r7
	strh	r0, [r6, #22]	@ movhi
	mov	r1, r9
	ldrsh	r0, [r8, r4]
	mov	lr, pc
	bx	r7
	strh	r0, [r6, #30]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L202:
	.align	2
.L201:
	.word	-1240768329
	.word	shadowOAMAffine
	.word	sinLut
	.word	__aeabi_idiv
	.size	setTransform, .-setTransform
	.global	__aeabi_dmul
	.global	__aeabi_d2iz
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.align	2
	.global	generateSinLut
	.syntax unified
	.arm
	.fpu softvfp
	.type	generateSinLut, %function
generateSinLut:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r7, r1, #0
	beq	.L203
	mov	r4, r0
	sub	r4, r4, #2
	mov	r0, #0
	mov	r1, #0
	mov	r5, #0
	ldr	r6, .L211+8
	ldr	r8, .L211+12
	ldr	fp, .L211+16
	ldr	r10, .L211+20
	ldr	r9, .L211+24
	add	r7, r4, r7, lsl #1
	b	.L205
.L210:
	mov	r0, r5
	mov	lr, pc
	bx	fp
	adr	r3, .L211
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r2, #0
	ldr	r3, .L211+28
	mov	lr, pc
	bx	r10
	mov	lr, pc
	bx	r9
.L205:
	mov	r2, #0
	ldr	r3, .L211+32
	mov	lr, pc
	bx	r6
	mov	lr, pc
	bx	r8
	strh	r0, [r4, #2]!	@ movhi
	cmp	r4, r7
	add	r5, r5, #1
	bne	.L210
.L203:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L212:
	.align	3
.L211:
	.word	1405670641
	.word	1074340347
	.word	__aeabi_dmul
	.word	__aeabi_d2iz
	.word	__aeabi_i2d
	.word	__aeabi_ddiv
	.word	sin
	.word	1080459264
	.word	1081081856
	.size	generateSinLut, .-generateSinLut
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r10, #480
	mov	fp, #15872
	ldr	r3, .L215
	ldr	r1, [r3, #4]
	ldr	lr, [r3]
	ldr	r3, .L215+4
	sub	r1, r10, r1
	stmib	r3, {r1, fp}
	mov	r1, #90
	mov	r2, #0
	mov	r0, #4
	mov	r6, #128
	mov	ip, #1
	mov	r5, #16
	mov	r4, #64
	mov	r9, #256
	mov	r8, #8
	mov	r7, #512
	str	r1, [r3, #120]
	mov	r1, #15
	sub	lr, fp, lr
	str	lr, [r3]
	str	r10, [r3, #12]
	str	r9, [r3, #28]
	str	r8, [r3, #68]
	str	r7, [r3, #88]
	str	r1, [r3, #44]
	str	r6, [r3, #24]
	str	r6, [r3, #76]
	str	r0, [r3, #64]
	str	r0, [r3, #100]
	str	r0, [r3, #40]
	str	r5, [r3, #72]
	str	r5, [r3, #92]
	str	r4, [r3, #80]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #84]
	str	r2, [r3, #104]
	str	r2, [r3, #108]
	str	r2, [r3, #112]
	str	r2, [r3, #116]
	strb	r2, [r3, #32]
	str	r2, [r3, #36]
	str	ip, [r3, #52]
	str	r4, [r3, #96]
	strb	ip, [r3, #124]
	mov	r1, #360
	ldr	r0, .L215+8
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	str	ip, [r3, #48]
	b	generateSinLut
.L216:
	.align	2
.L215:
	.word	camera
	.word	player
	.word	sinLut
	.size	initPlayer, .-initPlayer
	.align	2
	.global	getUpAnimation
	.syntax unified
	.arm
	.fpu softvfp
	.type	getUpAnimation, %function
getUpAnimation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L221
	ldr	r3, [r2]
	cmp	r3, #120
	ble	.L218
	ldr	r0, .L221+4
	ldr	r1, [r0, #120]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r0, #120]
.L218:
	cmp	r3, #239
	add	r3, r3, #1
	moveq	r3, #0
	ldreq	r1, .L221+4
	strne	r3, [r2]
	streq	r3, [r2]
	strbeq	r3, [r1, #124]
	bx	lr
.L222:
	.align	2
.L221:
	.word	.LANCHOR0
	.word	player
	.size	getUpAnimation, .-getUpAnimation
	.align	2
	.global	laserSlingAnimation
	.syntax unified
	.arm
	.fpu softvfp
	.type	laserSlingAnimation, %function
laserSlingAnimation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r3, #0
	ldr	r2, .L229
	ldr	r0, [r2]
	ldr	r1, [r0]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, [r1, #40]
	ldr	r6, .L229+4
	cmp	r2, ip
	ldr	r2, [r6, #4]
	ldr	r4, .L229+8
	add	r2, r2, ip
	ldr	r0, [r0, #4]
	str	r2, [r6, #4]
	str	r3, [r4, #56]
	str	r3, [r4, #60]
	str	r3, [r4, #16]
	str	r3, [r4, #20]
	str	ip, [r4, #48]
	ble	.L224
	ldr	r3, .L229+12
	ldr	r5, [r1]
	mov	lr, pc
	bx	r3
	asr	r5, r5, #4
	lsl	r5, r5, #16
	ldr	r2, [r4, #4]
	ldr	r3, .L229+16
	lsr	r5, r5, #16
	ldr	r7, .L229+20
	sub	r5, r5, r0, lsl #2
	and	r5, r5, #255
	and	r3, r3, r2, asr #4
	strh	r5, [r7]	@ movhi
	strh	r3, [r7, #2]	@ movhi
.L225:
	ldr	r2, [r6, #4]
	ldr	r3, .L229+24
	smull	r1, r3, r2, r3
	asr	r0, r2, #31
	add	r3, r3, r2
	rsb	r0, r0, r3, asr #2
	mov	r1, #3
	ldr	r3, .L229+28
	mov	lr, pc
	bx	r3
	ldr	r2, [r6, #4]
	ldr	r3, .L229+32
	lsl	r0, r0, #5
	add	r0, r0, #13
	cmp	r2, #60
	strh	r0, [r3]	@ movhi
	bgt	.L228
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L224:
	ldr	r3, [r4]
	ldr	r7, .L229+20
	asr	r3, r3, #4
	and	r3, r3, #255
	ldr	r5, [r1, #4]
	ldr	r2, .L229+12
	strh	r3, [r7]	@ movhi
	mov	lr, pc
	bx	r2
	asr	r5, r5, #4
	lsl	r5, r5, #16
	lsr	r5, r5, #16
	sub	r5, r5, r0, lsl #2
	lsl	r5, r5, #23
	lsr	r5, r5, #23
	strh	r5, [r7, #2]	@ movhi
	b	.L225
.L228:
	mov	r3, #0
	mov	r2, #512
	str	r3, [r6, #4]
	strb	r3, [r4, #124]
	strh	r2, [r7]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	b	finishLaserSling
.L230:
	.align	2
.L229:
	.word	nearestLaser
	.word	.LANCHOR0
	.word	player
	.word	signOf
	.word	511
	.word	shadowOAM+576
	.word	-1840700269
	.word	min
	.word	shadowOAM+580
	.size	laserSlingAnimation, .-laserSlingAnimation
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L250
	ldrb	r5, [r4, #124]	@ zero_extendqisi2
	cmp	r5, #0
	beq	.L232
	cmp	r5, #1
	beq	.L233
	cmp	r5, #2
	beq	.L234
.L247:
	ldr	r5, [r4, #56]
.L235:
	ldr	r1, [r4, #76]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #80]
	rsb	r1, r1, #0
	add	r0, r5, r0
	ldr	r5, .L250+4
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r2, [r4, #76]
	ldr	r1, [r4, #60]
	ldr	r0, [r4, #20]
	add	r0, r0, r1
	rsb	r1, r2, #0
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #12]
	mov	r1, #0
	add	r0, r3, r0
	rsb	r2, r2, #16384
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	rsb	r2, r2, #16384
	add	r0, r0, r1
	mvn	r1, #63
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r5
	str	r0, [r4, #8]
	pop	{r4, r5, r6, lr}
	b	resolveCollisions
.L234:
	bl	laserSlingAnimation
	b	.L247
.L233:
	ldr	r2, .L250+8
	ldr	r3, [r2]
	cmp	r3, #120
	ble	.L236
	ldr	r1, [r4, #120]
	cmp	r1, #0
	subgt	r1, r1, #1
	strgt	r1, [r4, #120]
.L236:
	add	r3, r3, #1
	cmp	r3, #240
	str	r3, [r2]
	moveq	r3, #0
	ldr	r5, [r4, #56]
	streq	r3, [r2]
	strbeq	r3, [r4, #124]
	b	.L235
.L232:
	bl	handlePlayerInput
	bl	touchingGround
	cmp	r0, #0
	bne	.L248
	ldr	r3, [r4, #116]
	cmp	r3, #0
	beq	.L238
	mov	r0, #2
	bl	collisionRight
	cmp	r0, #0
	beq	.L249
.L239:
	ldr	r5, [r4, #100]
	add	r5, r5, r5, lsr #31
	asr	r5, r5, #1
	str	r5, [r4, #56]
	b	.L235
.L249:
	mov	r0, #2
	bl	collisionLeft
	cmp	r0, #0
	bne	.L239
.L238:
	ldr	r5, [r4, #100]
.L248:
	str	r5, [r4, #56]
	b	.L235
.L251:
	.align	2
.L250:
	.word	player
	.word	clamp
	.word	.LANCHOR0
	.size	updatePlayer, .-updatePlayer
	.comm	nearestLaser,4,4
	.comm	sinLut,720,4
	.comm	player,128,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	curFrame.5407, %object
	.size	curFrame.5407, 4
curFrame.5407:
	.space	4
	.type	curFrame.5411, %object
	.size	curFrame.5411, 4
curFrame.5411:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

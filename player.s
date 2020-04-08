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
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #4
	mov	r10, #240
	mov	r2, #0
	mov	r4, #16
	mov	lr, #64
	mov	r9, #128
	mov	r8, #256
	mov	r7, #8
	mov	r6, #512
	ldr	r3, .L4
	ldr	r0, .L4+4
	ldr	r1, [r3]
	ldr	ip, .L4+8
	ldr	r3, .L4+12
	sub	r1, r0, r1
	str	r1, [r3]
	orr	ip, ip, r1, asr r5
	ldr	r1, .L4+16
	ldr	r1, [r1]
	str	r0, [r3, #8]
	ldr	r0, .L4+20
	sub	r1, r10, r1
	str	r10, [r3, #12]
	strh	ip, [r0]	@ movhi
	str	r1, [r3, #4]
	asr	r1, r1, r5
	str	r9, [r3, #24]
	str	r8, [r3, #28]
	str	r7, [r3, #68]
	str	r6, [r3, #84]
	strh	r1, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #80]
	str	r2, [r3, #100]
	str	r5, [r3, #64]
	str	r5, [r3, #96]
	str	r4, [r3, #72]
	str	r4, [r3, #88]
	str	lr, [r3, #76]
	str	lr, [r3, #92]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	7200
	.word	-32768
	.word	player
	.word	hOff
	.word	shadowOAM
	.size	initPlayer, .-initPlayer
	.align	2
	.global	showPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	showPlayer, %function
showPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L16
	ldr	r2, .L16+4
	ldr	r1, [r3, #8]
	ldr	r2, [r2]
	sub	r1, r1, r2
	cmp	r1, #2544
	movle	ip, #0
	movgt	ip, #1
	ldr	r2, [r3, #28]
	rsb	r2, r2, #0
	cmp	r1, r2
	orrlt	ip, ip, #1
	ldr	r2, .L16+8
	ldr	r0, [r3, #12]
	ldr	r2, [r2]
	sub	r0, r0, r2
	asr	r2, r1, #4
	push	{r4, lr}
	and	r2, r2, #255
	lsl	lr, r0, #19
	cmp	ip, #0
	str	r1, [r3]
	str	r0, [r3, #4]
	orr	r2, r2, #32768
	lsr	lr, lr, #23
	beq	.L15
	mov	ip, #1
	mov	r0, #0
	ldr	r1, .L16+12
	str	ip, [r3, #52]
	strh	r0, [r1, #4]	@ movhi
	strh	lr, [r1, #2]	@ movhi
.L9:
	orr	r2, r2, #512
	strh	r2, [r1]	@ movhi
	pop	{r4, lr}
	bx	lr
.L15:
	cmp	r0, #3824
	movle	r1, #0
	movgt	r1, #1
	ldr	r4, [r3, #24]
	rsb	r4, r4, #0
	cmp	r0, r4
	movge	r0, r1
	orrlt	r0, r1, #1
	ldr	r1, .L16+12
	cmp	r0, #0
	str	r0, [r3, #52]
	strh	r2, [r1]	@ movhi
	strh	lr, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	bne	.L9
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM
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
	ldr	r0, .L23
	ldr	r3, [r0, #12]
	cmp	r3, #0
	blt	.L21
	ldr	r1, [r0, #8]
	asr	r2, r1, #4
	lsl	r2, r2, #9
	add	r2, r2, r3, asr #4
	ldr	ip, .L23+4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	asr	r3, r3, #4
	beq	.L22
.L21:
	mov	r0, #1
	bx	lr
.L22:
	ldr	r2, [r0, #28]
	add	r1, r1, r2
	sub	r1, r1, #1
	asr	r1, r1, #4
	add	r3, r3, r1, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [ip, r3]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L24:
	.align	2
.L23:
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
	ldr	r1, .L30
	ldr	r3, [r1, #12]
	ldr	r2, [r1, #24]
	add	r3, r3, r2
	cmp	r3, #8192
	bge	.L28
	ldr	r0, [r1, #8]
	asr	r2, r0, #4
	sub	r3, r3, #1
	lsl	r2, r2, #9
	add	r2, r2, r3, asr #4
	ldr	ip, .L30+4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	asr	r3, r3, #4
	beq	.L29
.L28:
	mov	r0, #1
	bx	lr
.L29:
	ldr	r2, [r1, #28]
	add	r0, r0, r2
	sub	r0, r0, #1
	asr	r0, r0, #4
	add	r3, r3, r0, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [ip, r3]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	r1, .L37
	ldr	r3, [r1, #8]
	cmp	r3, #0
	blt	.L35
	ldr	r0, [r1, #12]
	asr	r3, r3, #4
	asr	r2, r0, #4
	add	r2, r2, r3, lsl #9
	ldr	ip, .L37+4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #9
	beq	.L36
.L35:
	mov	r0, #1
	bx	lr
.L36:
	ldr	r2, [r1, #24]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r3, r3, r0, asr #4
	lsl	r3, r3, #1
	ldrh	r0, [ip, r3]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L38:
	.align	2
.L37:
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
	ldr	r2, .L44
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #28]
	add	r3, r3, r1
	cmp	r3, #8192
	bge	.L42
	ldr	r0, [r2, #12]
	sub	r3, r3, #1
	asr	r3, r3, #4
	asr	r1, r0, #4
	add	r1, r1, r3, lsl #9
	ldr	ip, .L44+4
	lsl	r1, r1, #1
	ldrh	r1, [ip, r1]
	cmp	r1, #0
	lsl	r3, r3, #9
	beq	.L43
.L42:
	mov	r0, #1
	bx	lr
.L43:
	ldr	r2, [r2, #24]
	add	r0, r0, r2
	sub	r0, r0, #1
	add	r3, r3, r0, asr #4
	lsl	r3, r3, #1
	ldrh	r0, [ip, r3]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.word	mapCollisionBitmap
	.size	collisionBelow, .-collisionBelow
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
	ldr	r3, .L77
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L47
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L75
.L47:
	ldr	r3, .L77
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L51
	mvn	r2, #0
	ldr	r3, .L77+4
	ldr	r1, [r3, #12]
	cmp	r1, #0
	str	r2, [r3, #100]
	ldrgt	r2, [r3, #64]
	rsbgt	r2, r2, #0
	strgt	r2, [r3, #60]
.L51:
	ldr	r3, .L77
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L76
.L49:
	ldr	r3, .L77+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L55
	ldr	r3, .L77+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L55
	bl	collisionBelow
	cmp	r0, #0
	beq	.L55
	mov	r1, #1
	ldr	r3, .L77+4
	ldr	r0, .L77
	ldr	r2, [r3, #92]
	ldrh	r0, [r0, #48]
	rsb	r2, r2, #0
	tst	r0, #1
	str	r1, [r3, #80]
	str	r2, [r3, #16]
	beq	.L46
.L56:
	mov	r2, #0
	str	r2, [r3, #16]
	str	r2, [r3, #80]
.L46:
	pop	{r4, r5, r6, lr}
	bx	lr
.L55:
	ldr	r3, .L77
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L46
	ldr	r3, .L77+4
	ldr	r2, [r3, #80]
	cmp	r2, #0
	bne	.L56
	pop	{r4, r5, r6, lr}
	bx	lr
.L76:
	mov	r1, #1
	ldr	r3, .L77+4
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #12]
	rsb	r2, r2, #8192
	cmp	r0, r2
	ldrlt	r2, [r3, #64]
	str	r1, [r3, #100]
	strlt	r2, [r3, #60]
	b	.L49
.L75:
	ldr	r4, .L77+4
	ldr	r6, .L77+16
	ldr	r0, [r4, #100]
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
	bne	.L49
	ldr	r0, [r4, #100]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L49
.L78:
	.align	2
.L77:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	signOf
	.size	handlePlayerInput, .-handlePlayerInput
	.align	2
	.global	resolveCollisionX
	.syntax unified
	.arm
	.fpu softvfp
	.type	resolveCollisionX, %function
resolveCollisionX:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r4, .L85
	b	.L80
.L81:
	ldr	r3, [r4, #12]
	add	r3, r3, #1
	str	r5, [r4, #20]
	str	r3, [r4, #12]
.L80:
	bl	collisionLeft
	cmp	r0, #0
	bne	.L81
	mov	r4, r0
	ldr	r5, .L85
	b	.L82
.L83:
	ldr	r3, [r5, #12]
	sub	r3, r3, #1
	str	r4, [r5, #20]
	str	r3, [r5, #12]
.L82:
	bl	collisionRight
	cmp	r0, #0
	bne	.L83
	pop	{r4, r5, r6, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	player
	.size	resolveCollisionX, .-resolveCollisionX
	.align	2
	.global	resolveCollisionY
	.syntax unified
	.arm
	.fpu softvfp
	.type	resolveCollisionY, %function
resolveCollisionY:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #0
	ldr	r4, .L93
	b	.L88
.L89:
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r5, [r4, #16]
	str	r3, [r4, #8]
.L88:
	bl	collisionAbove
	cmp	r0, #0
	bne	.L89
	mov	r4, r0
	ldr	r5, .L93
	b	.L90
.L91:
	ldr	r3, [r5, #8]
	sub	r3, r3, #1
	str	r4, [r5, #16]
	str	r3, [r5, #8]
.L90:
	bl	collisionBelow
	cmp	r0, #0
	bne	.L91
	pop	{r4, r5, r6, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	player
	.size	resolveCollisionY, .-resolveCollisionY
	.align	2
	.global	adjusthOff
	.syntax unified
	.arm
	.fpu softvfp
	.type	adjusthOff, %function
adjusthOff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L101
	ldr	r2, [r3, #20]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L99
	beq	.L95
	ldr	r4, .L101+4
	ldr	r1, .L101+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L95
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1920
	bgt	.L100
.L95:
	pop	{r4, lr}
	bx	lr
.L99:
	ldr	r4, .L101+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L95
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1920
	bge	.L95
	mov	r1, #0
	ldr	r3, .L101+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L95
.L100:
	mov	r1, #4352
	ldr	r3, .L101+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L95
.L102:
	.align	2
.L101:
	.word	player
	.word	hOff
	.word	4367
	.word	max
	.word	min
	.size	adjusthOff, .-adjusthOff
	.align	2
	.global	adjustvOff
	.syntax unified
	.arm
	.fpu softvfp
	.type	adjustvOff, %function
adjustvOff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L109
	ldr	r2, [r3, #16]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L107
	beq	.L103
	ldr	r4, .L109+4
	ldr	r1, .L109+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L103
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1280
	bgt	.L108
.L103:
	pop	{r4, lr}
	bx	lr
.L107:
	ldr	r4, .L109+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L103
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1280
	bge	.L103
	mov	r1, #0
	ldr	r3, .L109+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L103
.L108:
	mov	r1, #5632
	ldr	r3, .L109+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L103
.L110:
	.align	2
.L109:
	.word	player
	.word	vOff
	.word	5647
	.word	max
	.word	min
	.size	adjustvOff, .-adjustvOff
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
	bl	handlePlayerInput
	bl	collisionBelow
	cmp	r0, #0
	movne	r3, #0
	ldreq	r4, .L115
	ldrne	r4, .L115
	ldreq	r3, [r4, #96]
	ldr	r1, [r4, #92]
	ldr	r0, [r4, #16]
	ldr	r5, .L115+4
	ldr	r2, [r4, #76]
	rsb	r1, r1, #0
	add	r0, r3, r0
	str	r3, [r4, #56]
	mov	lr, pc
	bx	r5
	mov	r3, r0
	ldr	r2, [r4, #72]
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
	rsb	r2, r2, #8192
	str	r3, [r4, #20]
	mov	lr, pc
	bx	r5
	str	r0, [r4, #12]
	bl	resolveCollisionX
	bl	adjusthOff
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	mov	r1, #0
	rsb	r2, r2, #8192
	add	r0, r0, r3
	mov	lr, pc
	bx	r5
	str	r0, [r4, #8]
	bl	resolveCollisionY
	bl	adjustvOff
	pop	{r4, r5, r6, lr}
	b	showPlayer
.L116:
	.align	2
.L115:
	.word	player
	.word	clamp
	.size	updatePlayer, .-updatePlayer
	.comm	player,104,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

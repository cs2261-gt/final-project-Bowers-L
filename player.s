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
	mov	r1, #240
	mov	r0, #128
	mov	ip, #256
	push	{r4, r5, r6, r7, lr}
	mov	r5, #4
	mov	r7, #8
	mov	r2, #0
	mov	r4, #16
	mov	lr, #64
	mov	r6, #512
	ldr	r3, .L4
	str	r1, [r3, #12]
	str	r0, [r3, #24]
	ldr	r1, [r3, #28]
	ldr	r0, .L4+4
	rsb	r1, r1, #7936
	ldr	r0, [r0]
	add	r1, r1, #32
	str	r1, [r3, #8]
	sub	r0, r1, r0
	ldr	r1, .L4+8
	str	ip, [r3, #28]
	ldr	r1, [r1]
	sub	ip, ip, #33024
	str	r0, [r3]
	orr	ip, ip, r0, asr r5
	ldr	r0, .L4+12
	rsb	r1, r1, #240
	str	r7, [r3, #68]
	strh	ip, [r0]	@ movhi
	str	r1, [r3, #4]
	asr	r1, r1, r5
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
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	vOff
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
	ldr	r0, .L49
	ldr	r2, [r0, #28]
	ldr	r3, [r0, #8]
	ldr	r1, [r0, #12]
	add	r3, r3, r2
	add	r3, r3, #15
	asr	r3, r3, #4
	asr	r2, r1, #4
	add	r2, r2, r3, lsl #9
	ldr	ip, .L49+4
	lsl	r2, r2, #1
	ldrh	r2, [ip, r2]
	cmp	r2, #0
	lsl	r3, r3, #9
	bne	.L48
	ldr	r2, [r0, #24]
	add	r1, r1, r2
	sub	r1, r1, #1
	add	r3, r3, r1, asr #4
	lsl	r3, r3, #1
	ldrh	r0, [ip, r3]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L48:
	mov	r0, #1
	bx	lr
.L50:
	.align	2
.L49:
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
	ldr	r3, .L82
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L52
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L80
.L52:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L56
	mvn	r2, #0
	ldr	r3, .L82+4
	ldr	r1, [r3, #12]
	cmp	r1, #0
	str	r2, [r3, #100]
	ldrgt	r2, [r3, #64]
	rsbgt	r2, r2, #0
	strgt	r2, [r3, #60]
.L56:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L81
.L54:
	ldr	r3, .L82+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L60
	ldr	r3, .L82+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L60
	bl	touchingGround
	cmp	r0, #0
	beq	.L60
	mov	r1, #1
	ldr	r3, .L82+4
	ldr	r0, .L82
	ldr	r2, [r3, #92]
	ldrh	r0, [r0, #48]
	rsb	r2, r2, #0
	tst	r0, #1
	str	r1, [r3, #80]
	str	r2, [r3, #16]
	beq	.L51
.L61:
	mov	r2, #0
	str	r2, [r3, #16]
	str	r2, [r3, #80]
.L51:
	pop	{r4, r5, r6, lr}
	bx	lr
.L60:
	ldr	r3, .L82
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L51
	ldr	r3, .L82+4
	ldr	r2, [r3, #80]
	cmp	r2, #0
	bne	.L61
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	mov	r1, #1
	ldr	r3, .L82+4
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #12]
	rsb	r2, r2, #8192
	cmp	r0, r2
	ldrlt	r2, [r3, #64]
	str	r1, [r3, #100]
	strlt	r2, [r3, #60]
	b	.L54
.L80:
	ldr	r4, .L82+4
	ldr	r6, .L82+16
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
	bne	.L54
	ldr	r0, [r4, #100]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L54
.L83:
	.align	2
.L82:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
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
	bl	collisionLeft
	ldr	r4, .L105
	subs	r6, r0, #0
	moveq	r8, r6
	ldr	r5, [r4, #12]
	beq	.L86
	mov	r6, #0
	mov	r7, r6
	add	r5, r5, #2
.L87:
	str	r5, [r4, #12]
	str	r7, [r4, #20]
	bl	collisionLeft
	cmp	r0, #0
	mov	r3, r5
	add	r6, r6, #1
	add	r5, r5, #2
	bne	.L87
	sub	r3, r3, r6, lsl #1
	mov	r7, #1
	str	r3, [r4, #12]
	lsl	r9, r6, #1
	b	.L88
.L89:
	str	r8, [r4, #20]
	str	r5, [r4, #12]
	add	r6, r6, #1
.L86:
	bl	collisionRight
	subs	r7, r0, #0
	mov	r3, r5
	sub	r5, r5, #2
	bne	.L89
	add	r3, r3, r6, lsl #1
	str	r3, [r4, #12]
	lsl	r9, r6, #1
.L88:
	bl	collisionAbove
	subs	r8, r0, #0
	moveq	r10, r8
	ldr	r5, [r4, #8]
	beq	.L90
	mov	r8, #0
	mov	r10, r8
	add	r5, r5, #2
.L91:
	str	r5, [r4, #8]
	str	r10, [r4, #16]
	bl	collisionAbove
	cmp	r0, #0
	mov	r3, r5
	add	r8, r8, #1
	add	r5, r5, #2
	bne	.L91
	cmp	r6, r8
	bgt	.L92
	sub	r8, r3, r8, lsl #1
	str	r8, [r4, #8]
.L97:
	ldr	r3, [r4, #12]
	cmp	r7, #0
	addne	r9, r3, r9
	strne	r9, [r4, #12]
	beq	.L104
.L92:
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L95:
	sub	r5, r5, #2
	str	r5, [r4, #8]
	str	r10, [r4, #16]
	add	r8, r8, #1
.L90:
	bl	collisionBelow
	cmp	r0, #0
	bne	.L95
	cmp	r6, r8
	addle	r5, r5, r8, lsl #1
	strle	r5, [r4, #8]
	ble	.L97
	str	r5, [r4, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L104:
	sub	r9, r3, r9
	str	r9, [r4, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L106:
	.align	2
.L105:
	.word	player
	.size	resolveCollisions, .-resolveCollisions
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
	@ link register save eliminated.
	bx	lr
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
	ldr	r3, .L114
	ldr	r2, [r3, #20]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L112
	beq	.L108
	ldr	r4, .L114+4
	ldr	r1, .L114+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L108
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1920
	bgt	.L113
.L108:
	pop	{r4, lr}
	bx	lr
.L112:
	ldr	r4, .L114+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L108
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1920
	bge	.L108
	mov	r1, #0
	ldr	r3, .L114+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L108
.L113:
	mov	r1, #4352
	ldr	r3, .L114+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L108
.L115:
	.align	2
.L114:
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
	ldr	r3, .L122
	ldr	r2, [r3, #16]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L120
	beq	.L116
	ldr	r4, .L122+4
	ldr	r1, .L122+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L116
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1280
	bgt	.L121
.L116:
	pop	{r4, lr}
	bx	lr
.L120:
	ldr	r4, .L122+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L116
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1280
	bge	.L116
	mov	r1, #0
	ldr	r3, .L122+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L116
.L121:
	mov	r1, #5632
	ldr	r3, .L122+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L116
.L123:
	.align	2
.L122:
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
	bl	touchingGround
	cmp	r0, #0
	movne	r3, #0
	ldreq	r4, .L128
	ldrne	r4, .L128
	ldreq	r3, [r4, #96]
	ldr	r1, [r4, #92]
	ldr	r0, [r4, #16]
	ldr	r5, .L128+4
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
	mov	r3, r0
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	rsb	r2, r2, #8192
	add	r0, r0, r1
	mov	r1, #0
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r5
	str	r0, [r4, #8]
	bl	resolveCollisions
	bl	adjusthOff
	bl	adjustvOff
	pop	{r4, r5, r6, lr}
	b	showPlayer
.L129:
	.align	2
.L128:
	.word	player
	.word	clamp
	.size	updatePlayer, .-updatePlayer
	.comm	player,104,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

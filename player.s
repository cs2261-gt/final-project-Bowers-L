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
	mov	r0, #480
	mov	r1, #128
	push	{r4, r5, r6, r7, lr}
	mov	r7, #256
	mov	r4, #4
	mov	r2, #0
	mov	lr, #16
	mov	r6, #8
	mov	r5, #512
	mov	ip, #64
	ldr	r3, .L4
	str	r0, [r3, #12]
	ldr	r0, .L4+4
	str	r1, [r3, #24]
	ldr	r1, [r3, #28]
	str	r7, [r3, #28]
	ldr	r7, [r0]
	rsb	r1, r1, #15488
	str	r1, [r3, #8]
	ldr	r0, [r0, #4]
	sub	r1, r1, r7
	ldr	r7, .L4+8
	str	r1, [r3]
	orr	r7, r7, r1, asr r4
	rsb	r0, r0, #480
	ldr	r1, .L4+12
	str	r0, [r3, #4]
	asr	r0, r0, r4
	strh	r7, [r1]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	str	r6, [r3, #68]
	str	r5, [r3, #84]
	strh	r2, [r1, #4]	@ movhi
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #80]
	str	r2, [r3, #100]
	str	r2, [r3, #104]
	str	r2, [r3, #108]
	str	r2, [r3, #112]
	str	r4, [r3, #64]
	str	r4, [r3, #96]
	str	lr, [r3, #72]
	str	lr, [r3, #88]
	str	ip, [r3, #76]
	str	ip, [r3, #92]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	camera
	.word	-32768
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
	@ link register save eliminated.
	ldr	r1, .L12
	ldr	ip, .L12+4
	ldr	r2, [r1, #8]
	ldr	r3, [ip]
	sub	r3, r2, r3
	cmp	r3, #2544
	movle	r0, #0
	movgt	r0, #1
	ldr	r2, [r1, #28]
	rsb	r2, r2, #0
	cmp	r3, r2
	orrlt	r0, r0, #1
	ldr	ip, [ip, #4]
	ldr	r2, [r1, #12]
	cmp	r0, #0
	sub	r2, r2, ip
	str	r3, [r1]
	movne	ip, #1
	str	r2, [r1, #4]
	beq	.L11
.L7:
	ldr	r0, [r1, #108]
	asr	r3, r3, #4
	cmp	r0, #0
	andeq	r3, r3, #255
	mvneq	r3, r3, lsl #17
	movne	r0, #1
	mvneq	r3, r3, lsr #17
	str	ip, [r1, #52]
	lsl	r2, r2, #19
	ldrne	r1, .L12+8
	ldreq	r1, .L12+8
	lsr	r2, r2, #23
	andne	r3, r3, #255
	strh	r3, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	bx	lr
.L11:
	cmp	r2, #3824
	movle	ip, #0
	movgt	ip, #1
	ldr	r0, [r1, #24]
	rsb	r0, r0, #0
	cmp	r2, r0
	orrlt	ip, ip, #1
	b	.L7
.L13:
	.align	2
.L12:
	.word	player
	.word	camera
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
	ldr	r1, .L19
	ldr	r3, [r1, #12]
	cmp	r3, #0
	blt	.L17
	ldr	r2, [r1, #8]
	rsb	r0, r0, r3, asr #4
	asr	r3, r2, #4
	ldr	ip, .L19+4
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L18
.L17:
	mov	r0, #1
	bx	lr
.L18:
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
.L20:
	.align	2
.L19:
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
	ldr	r2, .L26
	ldr	r3, [r2, #12]
	ldr	r1, [r2, #24]
	add	r3, r3, r1
	cmp	r3, #16384
	bge	.L24
	ldr	r1, [r2, #8]
	add	r0, r0, r3, asr #4
	asr	r3, r1, #4
	ldr	ip, .L26+4
	add	r3, r0, r3, lsl #10
	lsl	r3, r3, #1
	ldrh	r3, [ip, r3]
	cmp	r3, #0
	beq	.L25
.L24:
	mov	r0, #1
	bx	lr
.L25:
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
.L27:
	.align	2
.L26:
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
	ldr	r2, .L33
	ldr	r3, [r2, #8]
	cmp	r3, #0
	blt	.L31
	ldr	ip, [r2, #12]
	rsb	r0, r0, r3, asr #4
	asr	r3, ip, #4
	add	r3, r3, r0, lsl #10
	ldr	r1, .L33+4
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	lsl	r0, r0, #10
	beq	.L32
.L31:
	mov	r0, #1
	bx	lr
.L32:
	ldr	r3, [r2, #24]
	add	ip, ip, r3
	add	r0, r0, ip, asr #4
	add	r0, r1, r0, lsl #1
	ldrh	r0, [r0, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L34:
	.align	2
.L33:
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
	ldr	r2, .L40
	ldr	r3, [r2, #8]
	ldr	r1, [r2, #28]
	add	r3, r3, r1
	cmp	r3, #16384
	bge	.L38
	ldr	ip, [r2, #12]
	asr	r3, r3, #4
	sub	r3, r3, #1
	add	r0, r3, r0
	asr	r3, ip, #4
	add	r3, r3, r0, lsl #10
	ldr	r1, .L40+4
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	lsl	r0, r0, #10
	beq	.L39
.L38:
	mov	r0, #1
	bx	lr
.L39:
	ldr	r3, [r2, #24]
	add	ip, ip, r3
	add	r0, r0, ip, asr #4
	add	r0, r1, r0, lsl #1
	ldrh	r0, [r0, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L41:
	.align	2
.L40:
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
	ldr	r1, .L45
	ldr	r2, [r1, #28]
	ldr	r3, [r1, #8]
	ldr	ip, [r1, #12]
	add	r3, r3, r2
	asr	r3, r3, #4
	asr	r2, ip, #4
	add	r2, r2, r3, lsl #10
	ldr	r0, .L45+4
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	lsl	r3, r3, #10
	bne	.L44
	ldr	r2, [r1, #24]
	add	ip, ip, r2
	add	r3, r3, ip, asr #4
	add	r3, r0, r3, lsl #1
	ldrh	r0, [r3, #-2]
	subs	r0, r0, #0
	movne	r0, #1
	bx	lr
.L44:
	mov	r0, #1
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r3, .L105
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L48
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L100
.L48:
	ldr	r3, .L105
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L52
	mvn	r3, #0
	ldr	r4, .L105+4
	ldr	r2, [r4, #12]
	cmp	r2, #0
	str	r3, [r4, #100]
	ldrgt	r3, [r4, #64]
	rsbgt	r3, r3, #0
	strgt	r3, [r4, #60]
.L52:
	ldr	r3, .L105
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L101
.L50:
	ldr	r6, .L105+8
	ldrh	r5, [r6]
	tst	r5, #1
	beq	.L56
	ldr	r3, .L105+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L56
	bl	touchingGround
	cmp	r0, #0
	ldr	r4, .L105+4
	bne	.L57
	ldr	r3, [r4, #112]
	cmp	r3, #0
	beq	.L56
	mov	r0, #2
	bl	collisionLeft
	cmp	r0, #0
	beq	.L102
.L57:
	mov	r2, #1
	ldr	r3, .L105
	ldrh	r1, [r3, #48]
	ldr	r3, [r4, #92]
	tst	r1, #1
	rsb	r3, r3, #0
	str	r3, [r4, #16]
	str	r2, [r4, #80]
	bne	.L58
.L59:
	tst	r5, #2
	beq	.L61
	ldr	r3, .L105+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L103
.L61:
	tst	r5, #512
	beq	.L62
	ldr	r3, .L105+12
	ldrh	r3, [r3]
	tst	r3, #512
	beq	.L104
.L62:
	tst	r5, #256
	beq	.L47
	ldr	r3, .L105+12
	ldrh	r3, [r3]
	tst	r3, #256
	bne	.L47
	ldr	r2, .L105+4
	ldr	r3, [r2, #104]
	cmp	r3, #8
	bgt	.L47
	ldr	r1, .L105+16
	add	r3, r3, #1
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	cmp	r1, #0
	strne	r3, [r2, #104]
.L47:
	pop	{r4, r5, r6, lr}
	bx	lr
.L102:
	mov	r0, #2
	bl	collisionRight
	cmp	r0, #0
	bne	.L57
.L56:
	ldr	r3, .L105
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L59
	ldr	r4, .L105+4
	ldr	r3, [r4, #80]
	cmp	r3, #0
	beq	.L59
.L58:
	mov	r3, #0
	str	r3, [r4, #16]
	str	r3, [r4, #80]
	b	.L59
.L101:
	mov	r2, #1
	ldr	r4, .L105+4
	ldr	r3, [r4, #24]
	ldr	r1, [r4, #12]
	rsb	r3, r3, #16384
	cmp	r1, r3
	ldrlt	r3, [r4, #64]
	str	r2, [r4, #100]
	strlt	r3, [r4, #60]
	b	.L50
.L104:
	ldr	r2, .L105+4
	ldr	r3, [r2, #104]
	cmp	r3, #0
	ble	.L62
	ldr	r1, .L105+16
	sub	r3, r3, #1
	ldrb	r1, [r1, r3]	@ zero_extendqisi2
	cmp	r1, #0
	strne	r3, [r2, #104]
	b	.L62
.L103:
	ldr	r3, .L105+4
	ldr	r1, .L105+16
	ldr	r2, [r3, #104]
	ldr	r3, .L105+20
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	mov	lr, pc
	bx	r3
	ldrh	r5, [r6]
	b	.L61
.L100:
	ldr	r4, .L105+4
	ldr	r6, .L105+24
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
	bne	.L50
	ldr	r0, [r4, #100]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L50
.L106:
	.align	2
.L105:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	playerInventory
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
	ldr	r5, .L133
	subs	r6, r0, #0
	ldr	r4, [r5, #12]
	beq	.L108
	mov	r6, #0
	add	r4, r4, #2
.L109:
	mov	r0, #0
	str	r4, [r5, #12]
	bl	collisionLeft
	cmp	r0, #0
	mov	r3, r4
	add	r6, r6, #1
	add	r4, r4, #2
	bne	.L109
	sub	r3, r3, r6, lsl #1
	mov	r7, #1
	str	r3, [r5, #12]
	lsl	r8, r6, #1
	b	.L110
.L111:
	sub	r4, r4, #2
	str	r4, [r5, #12]
	add	r6, r6, #1
.L108:
	mov	r0, #0
	bl	collisionRight
	subs	r7, r0, #0
	bne	.L111
	add	r4, r4, r6, lsl #1
	str	r4, [r5, #12]
	lsl	r8, r6, #1
.L110:
	mov	r0, #0
	bl	collisionAbove
	subs	r9, r0, #0
	ldr	r4, [r5, #8]
	beq	.L112
	mov	r9, #0
	add	r4, r4, #2
.L113:
	mov	r0, #0
	str	r4, [r5, #8]
	bl	collisionAbove
	cmp	r0, #0
	mov	r3, r4
	add	r9, r9, #1
	add	r4, r4, #2
	bne	.L113
	sub	r3, r3, r9, lsl #1
	cmp	r6, r9
	str	r3, [r5, #8]
	lsl	r9, r9, #1
	ble	.L114
	add	r9, r3, r9
	str	r0, [r5, #16]
	str	r9, [r5, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L116:
	sub	r4, r4, #2
	str	r4, [r5, #8]
	add	r9, r9, #1
.L112:
	mov	r0, #0
	bl	collisionBelow
	cmp	r0, #0
	bne	.L116
	add	r4, r4, r9, lsl #1
	cmp	r6, r9
	str	r4, [r5, #8]
	lsl	r3, r9, #1
	bgt	.L117
.L114:
	cmp	r6, #0
	movne	r3, #0
	ldr	r0, [r5, #12]
	strne	r3, [r5, #20]
	cmp	r7, #0
	addne	r0, r0, r8
	subeq	r0, r0, r8
	mov	r1, #16
	ldr	r3, .L133+4
	str	r0, [r5, #12]
	mov	lr, pc
	bx	r3
	str	r0, [r5, #12]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L117:
	cmp	r9, #0
	movne	r9, r3
	sub	r4, r4, r9
	strne	r0, [r5, #16]
	str	r4, [r5, #8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L134:
	.align	2
.L133:
	.word	player
	.word	roundbase
	.size	resolveCollisions, .-resolveCollisions
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
	ldreq	r4, .L139
	ldrne	r4, .L139
	ldreq	r3, [r4, #96]
	ldr	r1, [r4, #92]
	ldr	r0, [r4, #16]
	ldr	r5, .L139+4
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
	mov	r1, #0
	str	r3, [r4, #12]
	mov	lr, pc
	bx	r5
	str	r0, [r4, #8]
	pop	{r4, r5, r6, lr}
	b	resolveCollisions
.L140:
	.align	2
.L139:
	.word	player
	.word	clamp
	.size	updatePlayer, .-updatePlayer
	.global	__aeabi_uidiv
	.global	__aeabi_idiv
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
	ldr	r4, .L145
	ldr	r0, [r4, #84]
	cmp	r0, #1024
	movne	r2, #1024
	moveq	r2, #512
	ldr	r5, [r4, #88]
	str	r2, [r4, #84]
	mul	r1, r5, r5
	movne	r0, #2048
	ldr	r3, .L145+4
	mov	lr, pc
	bx	r3
	mul	r5, r0, r5
	str	r0, [r4, #96]
	str	r5, [r4, #92]
	pop	{r4, r5, r6, lr}
	bx	lr
.L146:
	.align	2
.L145:
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
	ldr	r4, .L151
	ldr	r3, [r4, #108]
	cmp	r3, #0
	beq	.L148
	mov	r0, #8
	bl	collisionAbove
	cmp	r0, #0
	bne	.L147
	mov	r2, #256
	ldr	r3, [r4, #8]
	sub	r3, r3, #128
	str	r0, [r4, #108]
	str	r3, [r4, #8]
	str	r2, [r4, #28]
.L147:
	pop	{r4, lr}
	bx	lr
.L148:
	mov	r2, #1
	mov	r3, #128
	str	r2, [r4, #108]
	str	r3, [r4, #28]
	pop	{r4, lr}
	bx	lr
.L152:
	.align	2
.L151:
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
	ldr	r3, .L156
	ldr	r2, [r3, #72]
	cmp	r2, #16
	moveq	r2, #64
	movne	r2, #16
	str	r2, [r3, #72]
	bx	lr
.L157:
	.align	2
.L156:
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
	ldr	r2, .L159
	ldr	r3, [r2, #112]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	r3, [r2, #112]
	bx	lr
.L160:
	.align	2
.L159:
	.word	player
	.size	equipGloves, .-equipGloves
	.comm	player,116,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

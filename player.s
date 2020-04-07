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
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #4
	mov	fp, #128
	mov	ip, #16
	mov	lr, #72
	mov	r2, #0
	mov	r10, #256
	mov	r8, #8
	mov	r7, #64
	mov	r6, #1024
	mov	r5, #24
	mov	r4, #3
	ldr	r3, .L4
	ldr	r1, .L4+4
	ldr	r0, [r3]
	ldr	r3, .L4+8
	sub	r0, r1, r0
	str	r1, [r3, #8]
	ldr	r1, .L4+12
	str	r0, [r3]
	orr	r1, r1, r0, asr r9
	ldr	r0, .L4+16
	str	fp, [r3, #24]
	strh	r1, [r0]	@ movhi
	ldr	r1, .L4+20
	ldr	r1, [r1]
	sub	r1, ip, r1
	str	lr, [r3, #92]
	asr	lr, r1, r9
	str	r10, [r3, #28]
	str	r9, [r3, #64]
	str	r8, [r3, #68]
	str	r7, [r3, #76]
	str	r6, [r3, #84]
	str	r5, [r3, #88]
	str	r4, [r3, #96]
	str	r1, [r3, #4]
	strh	lr, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #80]
	str	r2, [r3, #100]
	str	ip, [r3, #12]
	str	ip, [r3, #72]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	7728
	.word	player
	.word	-32768
	.word	shadowOAM
	.word	hOff
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
	.global	noCollisionLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	noCollisionLeft, %function
noCollisionLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L26
	ldr	r3, [ip, #12]
	cmp	r3, #0
	ble	.L20
	ldr	r1, [ip, #8]
	asr	r2, r1, #4
	add	r3, r3, r0
	lsl	r2, r2, #9
	add	r2, r2, r3, asr #4
	str	lr, [sp, #-4]!
	ldr	lr, .L26+4
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	asr	r3, r3, #4
	beq	.L18
	ldr	r2, [ip, #28]
	add	r1, r1, r2
	sub	r1, r1, #1
	asr	r1, r1, #4
	add	r3, r3, r1, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L18:
	ldr	lr, [sp], #4
	bx	lr
.L20:
	mov	r0, #0
	bx	lr
.L27:
	.align	2
.L26:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionLeft, .-noCollisionLeft
	.align	2
	.global	noCollisionRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	noCollisionRight, %function
noCollisionRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L36
	ldr	r3, [r2, #12]
	ldr	r1, [r2, #24]
	add	r3, r3, r1
	cmp	r3, #8192
	bge	.L30
	ldr	ip, [r2, #8]
	ldr	r0, [r2, #20]
	sub	r3, r3, #1
	asr	r1, ip, #4
	add	r3, r3, r0
	lsl	r1, r1, #9
	add	r1, r1, r3, asr #4
	str	lr, [sp, #-4]!
	ldr	lr, .L36+4
	lsl	r1, r1, #1
	ldrh	r0, [lr, r1]
	cmp	r0, #0
	asr	r3, r3, #4
	beq	.L28
	ldr	r2, [r2, #28]
	add	ip, ip, r2
	sub	ip, ip, #1
	asr	ip, ip, #4
	add	r3, r3, ip, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L28:
	ldr	lr, [sp], #4
	bx	lr
.L30:
	mov	r0, #0
	bx	lr
.L37:
	.align	2
.L36:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionRight, .-noCollisionRight
	.align	2
	.global	noCollisionAbove
	.syntax unified
	.arm
	.fpu softvfp
	.type	noCollisionAbove, %function
noCollisionAbove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L46
	ldr	r3, [r1, #8]
	cmp	r3, #0
	ble	.L40
	ldr	ip, [r1, #12]
	add	r3, r3, r0
	asr	r3, r3, #4
	asr	r2, ip, #4
	add	r2, r2, r3, lsl #9
	str	lr, [sp, #-4]!
	ldr	lr, .L46+4
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	lsl	r3, r3, #9
	beq	.L38
	ldr	r2, [r1, #24]
	add	ip, ip, r2
	sub	ip, ip, #1
	add	r3, r3, ip, asr #4
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L38:
	ldr	lr, [sp], #4
	bx	lr
.L40:
	mov	r0, #0
	bx	lr
.L47:
	.align	2
.L46:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionAbove, .-noCollisionAbove
	.align	2
	.global	noCollisionBelow
	.syntax unified
	.arm
	.fpu softvfp
	.type	noCollisionBelow, %function
noCollisionBelow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L56
	ldr	r3, [r2, #8]
	cmp	r3, #8192
	bge	.L50
	ldr	r1, [r2, #28]
	add	r3, r3, r1
	ldr	ip, [r2, #12]
	sub	r3, r3, #1
	add	r3, r3, r0
	asr	r3, r3, #4
	asr	r1, ip, #4
	add	r1, r1, r3, lsl #9
	str	lr, [sp, #-4]!
	ldr	lr, .L56+4
	lsl	r1, r1, #1
	ldrh	r0, [lr, r1]
	cmp	r0, #0
	lsl	r3, r3, #9
	beq	.L48
	ldr	r2, [r2, #24]
	add	ip, ip, r2
	sub	ip, ip, #1
	add	r3, r3, ip, asr #4
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L48:
	ldr	lr, [sp], #4
	bx	lr
.L50:
	mov	r0, #0
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionBelow, .-noCollisionBelow
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
	ldr	r3, .L86
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L59
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L84
.L59:
	ldr	r3, .L86
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L63
	mvn	r2, #0
	ldr	r3, .L86+4
	ldr	r1, [r3, #12]
	cmp	r1, #0
	str	r2, [r3, #100]
	ldrgt	r2, [r3, #64]
	rsbgt	r2, r2, #0
	strgt	r2, [r3, #60]
.L63:
	ldr	r3, .L86
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L85
.L61:
	ldr	r3, .L86+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L67
	ldr	r3, .L86+12
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L67
	mov	r0, #1
	bl	noCollisionBelow
	cmp	r0, #0
	bne	.L67
	mov	r1, #1
	ldr	r3, .L86+4
	ldr	r0, .L86
	ldr	r2, [r3, #92]
	ldrh	r0, [r0, #48]
	rsb	r2, r2, #0
	tst	r0, #1
	str	r1, [r3, #80]
	str	r2, [r3, #16]
	beq	.L58
.L68:
	mov	r2, #0
	str	r2, [r3, #16]
	str	r2, [r3, #80]
.L58:
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	ldr	r3, .L86
	ldrh	r3, [r3, #48]
	tst	r3, #1
	beq	.L58
	ldr	r3, .L86+4
	ldr	r2, [r3, #80]
	cmp	r2, #0
	bne	.L68
	pop	{r4, r5, r6, lr}
	bx	lr
.L85:
	mov	r1, #1
	ldr	r3, .L86+4
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #12]
	rsb	r2, r2, #8192
	cmp	r0, r2
	ldrlt	r2, [r3, #64]
	str	r1, [r3, #100]
	strlt	r2, [r3, #60]
	b	.L61
.L84:
	ldr	r4, .L86+4
	ldr	r6, .L86+16
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
	bne	.L61
	ldr	r0, [r4, #100]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L61
.L87:
	.align	2
.L86:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	signOf
	.size	handlePlayerInput, .-handlePlayerInput
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
	ldr	r3, .L94
	ldr	r2, [r3, #20]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L92
	beq	.L88
	ldr	r4, .L94+4
	ldr	r1, .L94+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L88
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1920
	bgt	.L93
.L88:
	pop	{r4, lr}
	bx	lr
.L92:
	ldr	r4, .L94+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L88
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1920
	bge	.L88
	mov	r1, #0
	ldr	r3, .L94+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L88
.L93:
	mov	r1, #4352
	ldr	r3, .L94+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L88
.L95:
	.align	2
.L94:
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
	ldr	r3, .L102
	ldr	r2, [r3, #16]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L100
	beq	.L96
	ldr	r4, .L102+4
	ldr	r1, .L102+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L96
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1280
	bgt	.L101
.L96:
	pop	{r4, lr}
	bx	lr
.L100:
	ldr	r4, .L102+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L96
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #1280
	bge	.L96
	mov	r1, #0
	ldr	r3, .L102+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L96
.L101:
	mov	r1, #5632
	ldr	r3, .L102+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L96
.L103:
	.align	2
.L102:
	.word	player
	.word	vOff
	.word	5647
	.word	max
	.word	min
	.size	adjustvOff, .-adjustvOff
	.align	2
	.global	updatePlayerPosition
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerPosition, %function
updatePlayerPosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L143
	ldr	r5, [r4, #20]
	mov	r0, r5
	bl	noCollisionLeft
	cmp	r0, #0
	beq	.L105
	cmp	r5, #0
	blt	.L106
	mov	r0, r5
	bl	noCollisionRight
	cmp	r0, #0
	bne	.L134
.L112:
	cmp	r5, #0
	bgt	.L115
	b	.L116
.L117:
	ldr	r3, [r4, #12]
	add	r3, r3, #1
	str	r3, [r4, #12]
.L115:
	mov	r0, #1
	bl	noCollisionRight
	cmp	r0, #0
	bne	.L117
.L116:
	mov	r3, #0
	str	r3, [r4, #20]
	str	r3, [r4, #60]
	b	.L110
.L134:
	cmp	r5, #0
	beq	.L116
.L106:
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #12]
	mov	r1, #0
	ldr	r3, .L143+4
	rsb	r2, r2, #8192
	add	r0, r5, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4, #12]
	bl	adjusthOff
.L110:
	ldr	r5, [r4, #16]
	mov	r0, r5
	bl	noCollisionAbove
	cmp	r0, #0
	beq	.L118
	cmp	r5, #0
	blt	.L119
	mov	r0, r5
	bl	noCollisionBelow
	cmp	r0, #0
	bne	.L133
.L124:
	cmp	r5, #0
	bgt	.L129
	b	.L130
.L131:
	ldr	r3, [r4, #8]
	add	r3, r3, #1
	str	r3, [r4, #8]
.L129:
	mov	r0, #1
	bl	noCollisionBelow
	cmp	r0, #0
	bne	.L131
.L130:
	mov	r0, #0
	str	r0, [r4, #16]
	bl	noCollisionBelow
	cmp	r0, #0
	streq	r0, [r4, #56]
	ldrne	r3, [r4, #96]
	strne	r3, [r4, #56]
.L104:
	pop	{r4, r5, r6, lr}
	bx	lr
.L105:
	mov	r0, r5
	bl	noCollisionRight
	cmp	r0, #0
	beq	.L108
	cmp	r5, #0
	bgt	.L106
	beq	.L116
	mvn	r0, #0
	bl	noCollisionLeft
	cmp	r0, #0
	beq	.L116
.L114:
	ldr	r3, [r4, #12]
	sub	r3, r3, #1
	str	r3, [r4, #12]
.L113:
	mvn	r0, #0
	bl	noCollisionLeft
	cmp	r0, #0
	bne	.L114
	mov	r3, #0
	str	r3, [r4, #20]
	str	r3, [r4, #60]
	b	.L110
.L118:
	mov	r0, r5
	bl	noCollisionBelow
	cmp	r0, #0
	beq	.L121
	cmp	r5, #0
	bgt	.L119
	beq	.L130
	mvn	r0, #0
	bl	noCollisionAbove
	cmp	r0, #0
	beq	.L130
.L126:
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	str	r3, [r4, #8]
.L125:
	mvn	r0, #0
	bl	noCollisionAbove
	cmp	r0, #0
	bne	.L126
	b	.L130
.L133:
	cmp	r5, #0
	beq	.L130
.L119:
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	mov	r1, #0
	add	r0, r5, r0
	ldr	r3, .L143+4
	rsb	r2, r2, #8192
	mov	lr, pc
	bx	r3
	str	r0, [r4, #8]
	pop	{r4, r5, r6, lr}
	b	adjustvOff
.L108:
	cmp	r5, #0
	bge	.L112
	b	.L113
.L121:
	cmp	r5, #0
	bge	.L124
	b	.L125
.L144:
	.align	2
.L143:
	.word	player
	.word	clamp
	.size	updatePlayerPosition, .-updatePlayerPosition
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
	ldr	r4, .L151
	bl	handlePlayerInput
	ldr	r5, [r4, #16]
	mov	r0, r5
	bl	noCollisionBelow
	subs	r3, r0, #0
	ldrne	r3, [r4, #96]
	ldr	r1, [r4, #92]
	addne	r5, r5, r3
	ldr	r2, [r4, #76]
	mov	r0, r5
	rsb	r1, r1, #0
	ldr	r5, .L151+4
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
	str	r0, [r4, #20]
	bl	updatePlayerPosition
	pop	{r4, r5, r6, lr}
	b	showPlayer
.L152:
	.align	2
.L151:
	.word	player
	.word	clamp
	.size	updatePlayer, .-updatePlayer
	.comm	player,104,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

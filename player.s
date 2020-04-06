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
	mov	r0, #256
	push	{r4, r5, r6, r7, lr}
	mov	r7, #2048
	mov	r2, #0
	mov	r5, #64
	mov	r4, #128
	mov	r6, #4096
	ldr	r3, .L4
	ldr	lr, .L4+4
	ldr	ip, [r3]
	ldr	r3, .L4+8
	ldr	r1, .L4+12
	str	lr, [r3, #8]
	sub	ip, lr, ip
	ldr	lr, .L4+16
	ldr	r1, [r1]
	str	ip, [r3]
	orr	lr, lr, ip, asr #8
	ldr	ip, .L4+20
	sub	r1, r0, r1
	str	r7, [r3, #24]
	strh	lr, [ip]	@ movhi
	str	r1, [r3, #4]
	asr	r1, r1, #8
	str	r6, [r3, #28]
	strh	r1, [ip, #2]	@ movhi
	strh	r2, [ip, #4]	@ movhi
	str	r5, [r3, #64]
	str	r5, [r3, #96]
	str	r4, [r3, #68]
	str	r4, [r3, #88]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #76]
	str	r2, [r3, #80]
	str	r2, [r3, #100]
	str	r0, [r3, #12]
	str	r0, [r3, #72]
	str	r0, [r3, #84]
	str	r0, [r3, #92]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	120576
	.word	player
	.word	hOff
	.word	-32768
	.word	shadowOAM
	.size	initPlayer, .-initPlayer
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
	ldr	r1, .L14
	ldr	r3, [r1, #12]
	cmp	r3, #0
	ble	.L8
	ldr	ip, [r1, #8]
	ldr	r0, [r1, #20]
	asr	r2, ip, #8
	add	r3, r3, r0
	lsl	r2, r2, #9
	add	r2, r2, r3, asr #8
	str	lr, [sp, #-4]!
	ldr	lr, .L14+4
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	asr	r3, r3, #8
	beq	.L6
	ldr	r2, [r1, #28]
	add	ip, ip, r2
	sub	ip, ip, #1
	asr	ip, ip, #8
	add	r3, r3, ip, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L6:
	ldr	lr, [sp], #4
	bx	lr
.L8:
	mov	r0, #0
	bx	lr
.L15:
	.align	2
.L14:
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
	ldr	r2, .L24
	ldr	r3, [r2, #12]
	ldr	r1, [r2, #24]
	add	r0, r3, r1
	cmp	r0, #131072
	bge	.L18
	ldr	r0, [r2, #20]
	ldr	ip, [r2, #8]
	add	r3, r3, r0
	add	r3, r3, r1
	asr	r1, ip, #8
	sub	r3, r3, #1
	lsl	r1, r1, #9
	add	r1, r1, r3, asr #8
	str	lr, [sp, #-4]!
	ldr	lr, .L24+4
	lsl	r1, r1, #1
	ldrh	r0, [lr, r1]
	cmp	r0, #0
	asr	r3, r3, #8
	beq	.L16
	ldr	r2, [r2, #28]
	add	ip, ip, r2
	sub	ip, ip, #1
	asr	ip, ip, #8
	add	r3, r3, ip, lsl #9
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L16:
	ldr	lr, [sp], #4
	bx	lr
.L18:
	mov	r0, #0
	bx	lr
.L25:
	.align	2
.L24:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionRight, .-noCollisionRight
	.align	2
	.global	noCollisionUp
	.syntax unified
	.arm
	.fpu softvfp
	.type	noCollisionUp, %function
noCollisionUp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L34
	ldr	r3, [r1, #8]
	cmp	r3, #0
	ble	.L28
	ldr	r2, [r1, #16]
	ldr	ip, [r1, #12]
	add	r3, r3, r2
	asr	r3, r3, #8
	asr	r2, ip, #8
	add	r2, r2, r3, lsl #9
	str	lr, [sp, #-4]!
	ldr	lr, .L34+4
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	lsl	r3, r3, #9
	beq	.L26
	ldr	r2, [r1, #24]
	add	ip, ip, r2
	sub	ip, ip, #1
	add	r3, r3, ip, asr #8
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L26:
	ldr	lr, [sp], #4
	bx	lr
.L28:
	mov	r0, #0
	bx	lr
.L35:
	.align	2
.L34:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionUp, .-noCollisionUp
	.align	2
	.global	noCollisionDown
	.syntax unified
	.arm
	.fpu softvfp
	.type	noCollisionDown, %function
noCollisionDown:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L44
	ldr	r3, [r2, #8]
	cmp	r3, #131072
	bge	.L38
	ldr	r0, [r2, #16]
	ldr	r1, [r2, #28]
	add	r3, r3, r0
	add	r3, r3, r1
	ldr	ip, [r2, #12]
	sub	r3, r3, #1
	asr	r3, r3, #8
	asr	r1, ip, #8
	add	r1, r1, r3, lsl #9
	str	lr, [sp, #-4]!
	ldr	lr, .L44+4
	lsl	r1, r1, #1
	ldrh	r0, [lr, r1]
	cmp	r0, #0
	lsl	r3, r3, #9
	beq	.L36
	ldr	r2, [r2, #24]
	add	ip, ip, r2
	sub	ip, ip, #1
	add	r3, r3, ip, asr #8
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L36:
	ldr	lr, [sp], #4
	bx	lr
.L38:
	mov	r0, #0
	bx	lr
.L45:
	.align	2
.L44:
	.word	player
	.word	mapCollisionBitmap
	.size	noCollisionDown, .-noCollisionDown
	.align	2
	.global	onGround
	.syntax unified
	.arm
	.fpu softvfp
	.type	onGround, %function
onGround:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L50
	ldr	r2, [ip, #28]
	ldr	r3, [ip, #8]
	ldr	r1, [ip, #12]
	add	r3, r3, r2
	asr	r3, r3, #8
	asr	r2, r1, #8
	str	lr, [sp, #-4]!
	add	r2, r2, r3, lsl #9
	ldr	lr, .L50+4
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	beq	.L46
	ldr	r2, [ip, #24]
	add	r1, r1, r2
	lsl	r3, r3, #9
	sub	r1, r1, #1
	add	r3, r3, r1, asr #8
	lsl	r3, r3, #1
	ldrh	r0, [lr, r3]
	subs	r0, r0, #0
	movne	r0, #1
.L46:
	ldr	lr, [sp], #4
	bx	lr
.L51:
	.align	2
.L50:
	.word	player
	.word	mapCollisionBitmap
	.size	onGround, .-onGround
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
	ldr	r3, .L90
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L53
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L87
.L53:
	ldr	r3, .L90
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L57
	mvn	r2, #0
	ldr	r3, .L90+4
	ldr	r1, [r3, #12]
	cmp	r1, #0
	str	r2, [r3, #100]
	ldrgt	r2, [r3, #64]
	rsbgt	r2, r2, #0
	strgt	r2, [r3, #60]
.L57:
	ldr	r3, .L90
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L88
.L55:
	ldr	r3, .L90+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L61
	ldr	r3, .L90+12
	ldrh	r3, [r3]
	ands	r4, r3, #1
	bne	.L61
	bl	onGround
	cmp	r0, #0
	beq	.L61
	mov	r2, #1
	ldr	r3, .L90
	ldrh	r1, [r3, #48]
	ldr	r3, .L90+4
	tst	r1, #1
	str	r2, [r3, #76]
	str	r4, [r3, #80]
	bne	.L52
	ldr	r1, [r3, #88]
.L68:
	mov	r2, #1
	cmp	r1, #0
	str	r2, [r3, #76]
	ble	.L67
	mov	r2, #0
.L66:
	ldr	r1, [r3, #84]
	add	r2, r2, #1
	rsb	r1, r1, #0
	str	r2, [r3, #80]
	str	r1, [r3, #16]
.L52:
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	ldr	r3, .L90
	ldrh	r3, [r3, #48]
	tst	r3, #1
	bne	.L52
	ldr	r3, .L90+4
	ldr	r2, [r3, #80]
	cmp	r2, #0
	ldr	r1, [r3, #88]
	beq	.L68
	cmp	r2, r1
	blt	.L89
.L67:
	mov	r2, #0
	pop	{r4, r5, r6, lr}
	str	r2, [r3, #76]
	bx	lr
.L88:
	mov	r1, #1
	ldr	r3, .L90+4
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #12]
	rsb	r2, r2, #131072
	cmp	r0, r2
	ldrlt	r2, [r3, #64]
	str	r1, [r3, #100]
	strlt	r2, [r3, #60]
	b	.L55
.L87:
	ldr	r4, .L90+4
	ldr	r6, .L90+16
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
	bne	.L55
	ldr	r0, [r4, #100]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L55
.L89:
	ldr	r1, [r3, #76]
	cmp	r1, #0
	bne	.L66
	pop	{r4, r5, r6, lr}
	bx	lr
.L91:
	.align	2
.L90:
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
	ldr	r3, .L98
	ldr	r2, [r3, #20]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L96
	beq	.L92
	ldr	r4, .L98+4
	ldr	r1, .L98+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L92
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #30720
	bgt	.L97
.L92:
	pop	{r4, lr}
	bx	lr
.L96:
	ldr	r4, .L98+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L92
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #30720
	bge	.L92
	mov	r1, #0
	ldr	r3, .L98+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L92
.L97:
	mov	r1, #69632
	ldr	r3, .L98+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L92
.L99:
	.align	2
.L98:
	.word	player
	.word	hOff
	.word	69887
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
	@ link register save eliminated.
	ldr	r3, .L104
	ldr	r2, [r3, #16]
	cmp	r2, #0
	blt	.L103
	bxeq	lr
	ldr	r0, .L104+4
	ldr	r1, .L104+8
	ldr	ip, [r0]
	cmp	ip, r1
	bxgt	lr
	ldr	r1, [r3, #28]
	ldr	r3, [r3]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #20480
	addgt	r2, r2, ip
	strgt	r2, [r0]
	bx	lr
.L103:
	ldr	r2, .L104+4
	ldr	r2, [r2]
	cmp	r2, #0
	bxle	lr
	ldr	r2, [r3, #28]
	ldr	r1, [r3]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #20480
	ldrlt	r2, .L104+12
	ldrlt	r3, [r3, #20]
	ldrlt	r1, [r2]
	addlt	r3, r3, r1
	strlt	r3, [r2]
	bx	lr
.L105:
	.align	2
.L104:
	.word	player
	.word	vOff
	.word	69887
	.word	hOff
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
	ldr	r3, .L130
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L129
.L107:
	bl	onGround
	ldr	r4, .L130+4
	ldr	r3, [r4, #76]
	orrs	r3, r0, r3
	movne	r3, #0
	ldreq	r3, [r4, #96]
	ldr	r1, [r4, #84]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #92]
	ldr	r6, .L130+8
	rsb	r1, r1, #0
	add	r0, r3, r0
	str	r3, [r4, #56]
	mov	lr, pc
	bx	r6
	mov	r3, r0
	ldr	r2, [r4, #72]
	ldr	r1, [r4, #60]
	ldr	r0, [r4, #20]
	add	r0, r0, r1
	rsb	r1, r2, #0
	str	r3, [r4, #16]
	mov	lr, pc
	bx	r6
	mov	r5, r0
	str	r0, [r4, #20]
	bl	noCollisionLeft
	subs	r0, r0, #0
	movne	r0, #1
	ands	r3, r0, r5, lsr #31
	bne	.L109
	bl	noCollisionRight
	cmp	r0, #0
	cmpne	r5, #0
	movle	r0, #0
	movgt	r0, #1
	strle	r0, [r4, #20]
	strle	r0, [r4, #60]
	bgt	.L109
.L111:
	bl	noCollisionUp
	cmp	r0, #0
	beq	.L112
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L113
.L112:
	bl	noCollisionDown
	cmp	r0, #0
	beq	.L114
	ldr	r3, [r4, #16]
	cmp	r3, #0
	ble	.L114
.L113:
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	mov	r1, #0
	rsb	r2, r2, #131072
	add	r0, r3, r0
	mov	lr, pc
	bx	r6
	str	r0, [r4, #8]
	bl	adjustvOff
	ldr	r0, [r4, #16]
	b	.L115
.L114:
	mov	r5, #0
	str	r5, [r4, #16]
	bl	onGround
	cmp	r0, #0
	movne	r0, r5
	ldreq	r3, [r4, #96]
	strne	r5, [r4, #56]
	streq	r3, [r4, #56]
.L115:
	ldr	r3, [r4, #8]
	ldr	r2, [r4, #28]
	mov	r1, #0
	rsb	r2, r2, #131072
	add	r0, r0, r3
	mov	lr, pc
	bx	r6
	mov	ip, #0
	ldr	r3, .L130+12
	ldr	r2, .L130+16
	ldr	r1, [r3]
	ldr	lr, [r2]
	ldr	r3, .L130+20
	ldr	r2, [r4, #12]
	sub	r1, r0, r1
	sub	r2, r2, lr
	orr	r3, r3, r1, asr #8
	ldr	lr, [r4, #52]
	str	r0, [r4, #8]
	lsl	r3, r3, #16
	ldr	r0, .L130+24
	lsr	r3, r3, #16
	cmp	lr, ip
	str	r1, [r4]
	strh	r3, [r0]	@ movhi
	asr	r1, r2, #8
	orrne	r3, r3, #512
	str	r2, [r4, #4]
	strh	r1, [r0, #2]	@ movhi
	strh	ip, [r0, #4]	@ movhi
	strhne	r3, [r0]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #12]
	mov	r1, #0
	rsb	r2, r2, #131072
	add	r0, r5, r0
	mov	lr, pc
	bx	r6
	str	r0, [r4, #12]
	bl	adjusthOff
	b	.L111
.L129:
	bl	handlePlayerInput
	b	.L107
.L131:
	.align	2
.L130:
	.word	debug
	.word	player
	.word	clamp
	.word	vOff
	.word	hOff
	.word	-32768
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
	.comm	player,104,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

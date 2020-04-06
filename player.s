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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r8, #2048
	mov	r2, #0
	mov	lr, #128
	mov	r7, #4096
	mov	r6, #64
	mov	r5, #256
	mvn	r4, #4
	ldr	r3, .L4
	ldr	r0, .L4+4
	ldr	r1, [r3]
	ldr	ip, .L4+8
	ldr	r3, .L4+12
	sub	r1, r0, r1
	str	r1, [r3]
	orr	ip, ip, r1, asr #8
	ldr	r1, .L4+16
	ldr	r1, [r1]
	str	r0, [r3, #8]
	ldr	r0, .L4+20
	rsb	r1, r1, #0
	str	r8, [r3, #24]
	strh	ip, [r0]	@ movhi
	asr	ip, r1, #8
	str	r7, [r3, #28]
	str	r6, [r3, #64]
	str	r5, [r3, #72]
	str	r4, [r3, #80]
	str	r1, [r3, #4]
	strh	ip, [r0, #2]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	str	lr, [r3, #68]
	str	lr, [r3, #76]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #52]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	str	r2, [r3, #84]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	120576
	.word	-32768
	.word	player
	.word	hOff
	.word	shadowOAM
	.size	initPlayer, .-initPlayer
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
	ldr	r3, .L23
	ldrh	r2, [r3, #48]
	tst	r2, #32
	push	{r4, r5, r6, lr}
	beq	.L7
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L22
.L7:
	ldr	r3, .L23
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L10
	mvn	r2, #0
	ldr	r3, .L23+4
	ldr	r1, [r3, #12]
	cmp	r1, #0
	str	r2, [r3, #84]
	ldrgt	r2, [r3, #64]
	rsbgt	r2, r2, #0
	strgt	r2, [r3, #60]
.L10:
	ldr	r3, .L23
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L6
	mov	r1, #1
	ldr	r3, .L23+4
	ldr	r2, [r3, #24]
	ldr	r0, [r3, #12]
	rsb	r2, r2, #131072
	cmp	r0, r2
	ldrlt	r2, [r3, #64]
	str	r1, [r3, #84]
	strlt	r2, [r3, #60]
.L6:
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	ldr	r4, .L23+4
	ldr	r6, .L23+8
	ldr	r0, [r4, #84]
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
	bne	.L7
	ldr	r0, [r4, #84]
	mov	lr, pc
	bx	r6
	ldr	r2, [r4, #68]
	rsb	r3, r0, #0
	mul	r3, r2, r3
	str	r3, [r4, #60]
	b	.L7
.L24:
	.align	2
.L23:
	.word	67109120
	.word	player
	.word	signOf
	.size	handlePlayerInput, .-handlePlayerInput
	.align	2
	.global	playerInAir
	.syntax unified
	.arm
	.fpu softvfp
	.type	playerInAir, %function
playerInAir:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	playerInAir, .-playerInAir
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
	ldr	r1, .L34
	ldr	r3, [r1, #12]
	cmp	r3, #0
	ble	.L28
	ldr	ip, [r1, #8]
	ldr	r0, [r1, #20]
	asr	r2, ip, #8
	add	r3, r3, r0
	lsl	r2, r2, #9
	add	r2, r2, r3, asr #8
	str	lr, [sp, #-4]!
	ldr	lr, .L34+4
	lsl	r2, r2, #1
	ldrh	r0, [lr, r2]
	cmp	r0, #0
	asr	r3, r3, #8
	beq	.L26
	ldr	r2, [r1, #28]
	add	ip, ip, r2
	sub	ip, ip, #1
	asr	ip, ip, #8
	add	r3, r3, ip, lsl #9
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
	ldr	r2, .L44
	ldr	r3, [r2, #12]
	ldr	r1, [r2, #24]
	add	r0, r3, r1
	cmp	r0, #131072
	bge	.L38
	ldr	r0, [r2, #20]
	ldr	ip, [r2, #8]
	add	r3, r3, r0
	add	r3, r3, r1
	asr	r1, ip, #8
	sub	r3, r3, #1
	lsl	r1, r1, #9
	add	r1, r1, r3, asr #8
	str	lr, [sp, #-4]!
	ldr	lr, .L44+4
	lsl	r1, r1, #1
	ldrh	r0, [lr, r1]
	cmp	r0, #0
	asr	r3, r3, #8
	beq	.L36
	ldr	r2, [r2, #28]
	add	ip, ip, r2
	sub	ip, ip, #1
	asr	ip, ip, #8
	add	r3, r3, ip, lsl #9
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
	.size	noCollisionRight, .-noCollisionRight
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
	ldr	r3, .L52
	ldr	r2, [r3, #20]
	cmp	r2, #0
	push	{r4, lr}
	blt	.L50
	beq	.L46
	ldr	r4, .L52+4
	ldr	r1, .L52+8
	ldr	r0, [r4]
	cmp	r0, r1
	bgt	.L46
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #30720
	bgt	.L51
.L46:
	pop	{r4, lr}
	bx	lr
.L50:
	ldr	r4, .L52+4
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L46
	ldr	r1, [r3, #24]
	ldr	r3, [r3, #4]
	add	r1, r1, r1, lsr #31
	add	r1, r3, r1, asr #1
	cmp	r1, #30720
	bge	.L46
	mov	r1, #0
	ldr	r3, .L52+12
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L46
.L51:
	mov	r1, #69632
	ldr	r3, .L52+16
	add	r0, r2, r0
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L46
.L53:
	.align	2
.L52:
	.word	player
	.word	hOff
	.word	69887
	.word	max
	.word	min
	.size	adjusthOff, .-adjusthOff
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
	ldr	r3, .L65
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, r5, r6, lr}
	beq	.L64
.L55:
	ldr	r4, .L65+4
	ldr	r3, [r4, #56]
	ldr	r0, [r4, #16]
	ldr	r2, [r4, #76]
	ldr	r1, [r4, #80]
	ldr	r6, .L65+8
	add	r0, r0, r3
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
	cmp	r0, #0
	moveq	r0, #0
	lsrne	r0, r5, #31
	cmp	r0, #0
	bne	.L56
	bl	noCollisionRight
	cmp	r0, #0
	cmpne	r5, #0
	movle	r0, #0
	movgt	r0, #1
	strle	r0, [r4, #20]
	strle	r0, [r4, #60]
	bgt	.L56
.L58:
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #8]
	mov	r1, #0
	rsb	r2, r2, #131072
	add	r0, r0, r3
	mov	lr, pc
	bx	r6
	mov	ip, #0
	ldr	r3, .L65+12
	ldr	r2, .L65+16
	ldr	r1, [r3]
	ldr	lr, [r2]
	ldr	r3, .L65+20
	ldr	r2, [r4, #12]
	sub	r1, r0, r1
	sub	r2, r2, lr
	orr	r3, r3, r1, asr #8
	ldr	lr, [r4, #52]
	str	r0, [r4, #8]
	lsl	r3, r3, #16
	ldr	r0, .L65+24
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
.L56:
	ldr	r2, [r4, #24]
	ldr	r0, [r4, #12]
	mov	r1, #0
	rsb	r2, r2, #131072
	add	r0, r5, r0
	mov	lr, pc
	bx	r6
	str	r0, [r4, #12]
	bl	adjusthOff
	b	.L58
.L64:
	bl	handlePlayerInput
	b	.L55
.L66:
	.align	2
.L65:
	.word	debug
	.word	player
	.word	clamp
	.word	vOff
	.word	hOff
	.word	-32768
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
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
	ldr	r3, .L71
	ldr	r2, [r3, #16]
	cmp	r2, #0
	blt	.L70
	bxeq	lr
	ldr	r0, .L71+4
	ldr	r1, .L71+8
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
.L70:
	ldr	r2, .L71+4
	ldr	r2, [r2]
	cmp	r2, #0
	bxle	lr
	ldr	r2, [r3, #28]
	ldr	r1, [r3]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #20480
	ldrlt	r2, .L71+12
	ldrlt	r3, [r3, #20]
	ldrlt	r1, [r2]
	addlt	r3, r3, r1
	strlt	r3, [r2]
	bx	lr
.L72:
	.align	2
.L71:
	.word	player
	.word	vOff
	.word	69887
	.word	hOff
	.size	adjustvOff, .-adjustvOff
	.comm	player,88,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r5, #67108864
	mov	r0, #90112
	mov	r2, #56320
	ldr	r1, .L4
	ldr	lr, .L4+4
	strb	ip, [r1]
	ldr	ip, .L4+8
	str	r3, [lr]
	str	r3, [ip]
	ldrh	r3, [r5]
	ldr	r1, .L4+12
	orr	r3, r3, #256
	ldr	r4, .L4+16
	str	r0, [r1]
	strh	r3, [r5]	@ movhi
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #336
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+24
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	orr	r3, r3, #4096
	strh	r3, [r5]	@ movhi
	ldr	r3, .L4+36
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L4+48
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+56
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	gameState
	.word	hOff
	.word	debug
	.word	vOff
	.word	DMANow
	.word	mapTiles
	.word	100720640
	.word	mapMap
	.word	mapPal
	.word	hideSprites
	.word	100728832
	.word	SpritesheetTiles
	.word	83886592
	.word	SpritesheetPal
	.word	initPlayer
	.size	initGame, .-initGame
	.align	2
	.global	init
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #0
	mov	r4, #67108864
	strh	r3, [r4]	@ movhi
	bl	initGame
	mov	ip, #1
	ldrh	r1, [r4, #4]
	ldr	r3, .L8
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	r0, .L8+4
	strh	r1, [r4, #4]	@ movhi
	ldr	r1, .L8+8
	orr	r2, r2, ip
	strh	r2, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	pop	{r4, lr}
	str	r1, [r0, #4092]
	bx	lr
.L9:
	.align	2
.L8:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	init, .-init
	.align	2
	.global	updateStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStart, %function
updateStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateStart, .-updateStart
	.align	2
	.global	updatePause
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updatePause, .-updatePause
	.align	2
	.global	cameraDebug
	.syntax unified
	.arm
	.fpu softvfp
	.type	cameraDebug, %function
cameraDebug:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L22
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	push	{r4, lr}
	bne	.L13
	ldr	r4, .L22+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L18
.L13:
	ldr	r3, .L22
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L14
	ldr	r4, .L22+4
	ldr	r0, [r4]
	cmp	r0, #90112
	blt	.L19
.L14:
	ldr	r3, .L22
	ldrh	r1, [r3, #48]
	ands	r1, r1, #32
	bne	.L15
	ldr	r4, .L22+8
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L20
.L15:
	ldr	r3, .L22
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L12
	ldr	r4, .L22+8
	ldr	r0, [r4]
	cmp	r0, #69632
	blt	.L21
.L12:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r3, .L22+12
	sub	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L15
.L18:
	ldr	r3, .L22+12
	sub	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L13
.L19:
	mov	r1, #90112
	ldr	r3, .L22+16
	add	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L14
.L21:
	mov	r1, #69632
	ldr	r3, .L22+16
	add	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	pop	{r4, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	67109120
	.word	vOff
	.word	hOff
	.word	max
	.word	min
	.size	cameraDebug, .-cameraDebug
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L31
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	bne	.L30
.L25:
	ldr	r3, .L31+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L30:
	bl	cameraDebug
	b	.L25
.L32:
	.align	2
.L31:
	.word	debug
	.word	updatePlayer
	.size	updateGame, .-updateGame
	.align	2
	.global	update
	.syntax unified
	.arm
	.fpu softvfp
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L42
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L40
.L34:
	ldr	r3, .L42+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L40:
	ldr	r3, .L42+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L41
.L35:
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	b	.L34
.L41:
	bl	cameraDebug
	b	.L35
.L43:
	.align	2
.L42:
	.word	updateInput
	.word	gameState
	.word	waitForVBlank
	.word	debug
	.word	updatePlayer
	.size	update, .-update
	.align	2
	.global	handleVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleVBlank, %function
handleVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r3, .L46
	ldr	r3, [r3]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L46+4
	ldr	r3, [r3]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	ldr	r4, .L46+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L46+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	shadowOAM
	.size	handleVBlank, .-handleVBlank
	.align	2
	.global	interruptHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L55
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bne	.L54
.L49:
	mov	r1, #1
	ldr	r3, .L55
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L54:
	bl	handleVBlank
	b	.L49
.L56:
	.align	2
.L55:
	.word	67109376
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L59
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L59+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L59+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L60:
	.align	2
.L59:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.comm	debug,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	gameState,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"

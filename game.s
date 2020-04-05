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
	push	{r4, lr}
	mov	lr, #1
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #56320
	ldr	r0, .L4
	ldr	ip, .L4+4
	strb	lr, [r0]
	ldr	r0, .L4+8
	str	r2, [ip]
	str	r2, [r0]
	ldrh	r2, [r3]
	orr	r2, r2, #256
	ldr	r4, .L4+12
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #496
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	gameState
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	mapSBBTiles
	.word	100720640
	.word	mapSBBMap
	.word	mapSBBPal
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
	mov	r1, #67108864
	mov	ip, #0
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r0, [r1, #4]
	ldr	r3, .L8
	orr	r0, r0, #8
	ldrh	r2, [r3]
	strh	ip, [r1]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	ldr	ip, .L8+4
	ldr	r1, .L8+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	b	initGame
.L9:
	.align	2
.L8:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	init, .-init
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
	push	{r4, lr}
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r3, .L12+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	updateInput
	.word	hideSprites
	.size	update, .-update
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
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	updateGame, .-updateGame
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
	ldr	r3, .L18
	add	r1, r3, #8
	str	lr, [sp, #-4]!
	ldm	r1, {r1, r2, lr}
	ldr	ip, .L18+4
	ldr	r0, .L18+8
	add	r1, r1, lr
	ldr	lr, [r3, #20]
	ldr	ip, [ip]
	ldr	r0, [r0]
	add	r2, r2, lr
	sub	ip, r1, ip
	sub	r0, r2, r0
	str	r1, [r3, #8]
	str	ip, [r3]
	str	r2, [r3, #12]
	str	r0, [r3, #4]
	ldr	lr, [sp], #4
	bx	lr
.L19:
	.align	2
.L18:
	.word	player
	.word	vOff
	.word	hOff
	.size	updatePlayer, .-updatePlayer
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
	.global	handleVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleVBlank, %function
handleVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L33
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	push	{r4, r5, r6, lr}
	ldr	r4, .L33+4
	bne	.L22
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L29
.L22:
	ldr	r3, .L33
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L23
	ldr	r0, [r4]
	cmp	r0, #352
	blt	.L30
.L23:
	ldr	r3, .L33
	ldrh	r1, [r3, #48]
	ldr	r5, .L33+8
	ands	r1, r1, #32
	ldr	r0, [r5]
	bne	.L24
	cmp	r0, #0
	bgt	.L31
.L24:
	ldr	r3, .L33
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L25
	cmp	r0, #272
	blt	.L32
.L25:
	mov	r2, #67108864
	ldrh	r1, [r4]
	lsl	r0, r0, #16
	lsr	r0, r0, #16
	strh	r0, [r2, #16]	@ movhi
	ldr	r4, .L33+12
	strh	r1, [r2, #18]	@ movhi
	mov	r3, #128
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L33+16
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	ldr	r3, .L33+20
	sub	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r5]
	b	.L24
.L29:
	ldr	r3, .L33+20
	sub	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L22
.L30:
	mov	r1, #352
	ldr	r3, .L33+24
	add	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L23
.L32:
	mov	r1, #272
	ldr	r3, .L33+24
	add	r0, r0, #2
	mov	lr, pc
	bx	r3
	str	r0, [r5]
	b	.L25
.L34:
	.align	2
.L33:
	.word	67109120
	.word	vOff
	.word	hOff
	.word	DMANow
	.word	shadowOAM
	.word	max
	.word	min
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
	ldr	r3, .L39
	ldrh	r1, [r3, #2]
	cmp	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L38
.L36:
	mov	r1, #1
	ldr	r3, .L39
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L38:
	bl	handleVBlank
	b	.L36
.L40:
	.align	2
.L39:
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
	ldr	r3, .L43
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L43+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L43+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L44:
	.align	2
.L43:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.global	playerMaxSpeed
	.comm	player,56,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	gameState,1,1
	.section	.rodata
	.align	2
	.type	playerMaxSpeed, %object
	.size	playerMaxSpeed, 4
playerMaxSpeed:
	.word	2
	.ident	"GCC: (devkitARM release 53) 9.1.0"

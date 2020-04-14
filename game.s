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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleVBlank.part.0, %function
handleVBlank.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldr	r1, .L4
	ldr	r3, [r1, #4]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, [r1]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #22]	@ movhi
	ldr	r4, .L4+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	camera
	.word	DMANow
	.word	shadowOAM
	.size	handleVBlank.part.0, .-handleVBlank.part.0
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
	ldr	r3, .L13
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L7
	ldr	r3, .L13+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L12
.L7:
	mov	r1, #1
	ldr	r3, .L13
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L12:
	bl	handleVBlank.part.0
	b	.L7
.L14:
	.align	2
.L13:
	.word	67109376
	.word	gameState
	.size	interruptHandler, .-interruptHandler
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
	push	{r4, r5, r6, lr}
	mov	r4, #67108864
	mov	r5, #0
	ldr	r3, .L17
	strh	r5, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r3, .L17+4
	ldrh	r1, [r4, #4]
	ldrh	r2, [r3]
	orr	r1, r1, #8
	orr	r2, r2, ip
	strh	r1, [r4, #4]	@ movhi
	ldr	r0, .L17+8
	strh	r2, [r3]	@ movhi
	ldr	r1, .L17+12
	ldr	r2, .L17+16
	strh	ip, [r3, #8]	@ movhi
	str	r0, [r1, #4092]
	str	r5, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	initSplash
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.word	debug
	.size	init, .-init
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #2
	mov	r5, #67108864
	ldr	r2, .L21
	mov	r1, #5632
	mov	r0, #0
	ldr	r3, .L21+4
	strb	ip, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	ldr	r2, .L21+8
	bic	r3, r3, #256
	orr	r3, r3, #512
	ldr	r4, .L21+12
	strh	r3, [r5]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #1696
	mov	r0, #3
	ldr	r2, .L21+16
	ldr	r1, .L21+20
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L21+24
	ldr	r1, .L21+28
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L21+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	orr	r3, r3, #4096
	strh	r3, [r5]	@ movhi
	ldr	r3, .L21+36
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L21+40
	ldr	r1, .L21+44
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L21+48
	ldr	r1, .L21+52
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L21+56
	mov	lr, pc
	bx	r3
	mov	r2, #496
	ldr	r0, .L21+60
	mov	r1, r2
	ldr	r3, .L21+64
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	gameState
	.word	initCamera
	.word	-10236
	.word	DMANow
	.word	100679680
	.word	mapTiles
	.word	100712448
	.word	mapMap
	.word	mapPal
	.word	hideSprites
	.word	100728832
	.word	SpritesheetTiles
	.word	83886592
	.word	SpritesheetPal
	.word	initPlayer
	.word	boots
	.word	initItem
	.size	initGame, .-initGame
	.align	2
	.global	resumeGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	resumeGame, %function
resumeGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	mov	ip, #2
	mov	r0, #56320
	ldrh	r3, [r1]
	push	{r4, lr}
	ldr	r2, .L25
	orr	r3, r3, #4096
	strh	r3, [r1]	@ movhi
	ldr	r4, .L25+4
	strb	ip, [r2]
	mov	r3, #1696
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	mov	r3, #8192
	mov	r0, #3
	ldr	r2, .L25+12
	ldr	r1, .L25+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L25+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	gameState
	.word	DMANow
	.word	mapTiles
	.word	100720640
	.word	mapMap
	.word	mapPal
	.size	resumeGame, .-resumeGame
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L49
	ldrh	r3, [r5]
	tst	r3, #512
	bne	.L43
	ldr	r4, .L49+4
.L28:
	tst	r3, #256
	beq	.L30
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #256
	beq	.L47
.L30:
	tst	r3, #4
	beq	.L31
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
.L31:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L32
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
.L33:
	ldr	r3, .L49+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+20
	mov	lr, pc
	bx	r3
	ldr	r0, .L49+24
	ldr	r3, .L49+28
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	ands	r2, r2, #512
	ldr	r4, .L49+4
	bne	.L28
	ldr	r1, [r4]
	cmp	r1, #0
	movle	r2, #1
	str	r2, [r4]
	b	.L28
.L32:
	ldr	r3, .L49+32
	mov	lr, pc
	bx	r3
	ldr	r0, .L49+24
	ldr	r3, .L49+36
	mov	lr, pc
	bx	r3
	b	.L33
.L48:
	ldr	r3, .L49+40
	mov	lr, pc
	bx	r3
	b	.L31
.L47:
	ldr	r3, .L49+44
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L30
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	debug
	.word	buttons
	.word	cameraDebug
	.word	updateCamera
	.word	showPlayer
	.word	boots
	.word	showItem
	.word	updatePlayer
	.word	updateItem
	.word	initPause
	.word	initWin
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
	ldr	r3, .L60
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L52
.L54:
	.word	.L58
	.word	.L57
	.word	.L56
	.word	.L55
	.word	.L53
.L53:
	ldr	r3, .L60+8
	mov	lr, pc
	bx	r3
.L52:
	ldr	r3, .L60+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L58:
	ldr	r3, .L60+16
	mov	lr, pc
	bx	r3
	b	.L52
.L57:
	ldr	r3, .L60+20
	mov	lr, pc
	bx	r3
	b	.L52
.L56:
	bl	updateGame
	b	.L52
.L55:
	ldr	r3, .L60+24
	mov	lr, pc
	bx	r3
	b	.L52
.L61:
	.align	2
.L60:
	.word	updateInput
	.word	gameState
	.word	updateWin
	.word	waitForVBlank
	.word	updateSplash
	.word	updateInstructions
	.word	updatePause
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
	@ link register save eliminated.
	ldr	r3, .L64
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bxne	lr
	b	handleVBlank.part.0
.L65:
	.align	2
.L64:
	.word	gameState
	.size	handleVBlank, .-handleVBlank
	.align	2
	.global	setupDisplayInterrupt
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupDisplayInterrupt, %function
setupDisplayInterrupt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L68
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L68+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L68+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L69:
	.align	2
.L68:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupDisplayInterrupt, .-setupDisplayInterrupt
	.comm	debug,4,4
	.comm	menuState,1,1
	.comm	gameState,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"

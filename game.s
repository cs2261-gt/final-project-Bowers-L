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
	.global	init
	.arch armv4t
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
	ldr	r3, .L4
	strh	r5, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldr	r3, .L4+4
	ldrh	r1, [r4, #4]
	ldrh	r2, [r3]
	orr	r1, r1, #8
	orr	r2, r2, ip
	strh	r1, [r4, #4]	@ movhi
	ldr	r0, .L4+8
	strh	r2, [r3]	@ movhi
	ldr	r1, .L4+12
	ldr	r2, .L4+16
	strh	ip, [r3, #8]	@ movhi
	str	r0, [r1, #4092]
	str	r5, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	initSplash
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.word	debug
	.size	init, .-init
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
	mov	r0, #67108864
	push	{r4, lr}
	mov	lr, #2
	ldr	r2, .L8
	add	r1, r2, #8
	ldm	r1, {r1, r3}
	add	r3, r3, r1, lsl #1
	add	r3, r3, #22
	ldrh	r2, [r0]
	lsl	r3, r3, #24
	orr	r3, r3, #-1073741824
	ldr	ip, .L8+4
	orr	r3, r3, #262144
	bic	r2, r2, #256
	lsr	r1, r3, #16
	orr	r3, r2, #4608
	strh	r3, [r0]	@ movhi
	ldr	r4, .L8+8
	strb	lr, [ip]
	mov	r3, #16
	strh	r1, [r0, #10]	@ movhi
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	camera
	.word	gameState
	.word	DMANow
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
	ldr	r3, .L21
	ldr	r3, [r3, #8]
	cmp	r3, #0
	push	{r4, lr}
	blt	.L18
.L11:
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L12
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L19
.L12:
	ldr	r3, .L21+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L20
.L13:
	ldr	r3, .L21+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r3, .L21+40
	mov	lr, pc
	bx	r3
	b	.L13
.L18:
	ldr	r3, .L21+44
	mov	lr, pc
	bx	r3
	b	.L11
.L19:
	ldr	r3, .L21+48
	mov	lr, pc
	bx	r3
	b	.L12
.L22:
	.align	2
.L21:
	.word	player
	.word	oldButtons
	.word	buttons
	.word	debug
	.word	updateAllItems
	.word	updateAllLasers
	.word	updateCamera
	.word	showPlayer
	.word	showAllItems
	.word	showAllLasers
	.word	updatePlayer
	.word	initWin
	.word	initPause
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
	ldr	r3, .L32
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L24
.L26:
	.word	.L30
	.word	.L29
	.word	.L28
	.word	.L27
	.word	.L25
.L25:
	ldr	r3, .L32+8
	mov	lr, pc
	bx	r3
.L24:
	ldr	r3, .L32+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	b	.L24
.L29:
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	b	.L24
.L28:
	bl	updateGame
	b	.L24
.L27:
	ldr	r3, .L32+24
	mov	lr, pc
	bx	r3
	b	.L24
.L33:
	.align	2
.L32:
	.word	updateInput
	.word	gameState
	.word	updateWin
	.word	waitForVBlank
	.word	updateSplash
	.word	updateInstructions
	.word	updatePause
	.size	update, .-update
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #67108864
	push	{r4, lr}
	ldr	lr, .L36
	ldr	r2, [lr, #8]
	ldr	r0, [lr, #12]
	add	r3, r0, r2, lsl #1
	ldr	r4, [lr, #4]
	add	r3, r3, #22
	lsl	r1, r0, #8
	lsl	r3, r3, #24
	rsb	r1, r1, r4, asr #4
	orr	r3, r3, #-1073741824
	orr	r3, r3, #262144
	lsl	r1, r1, #16
	lsr	r3, r3, #16
	lsr	r1, r1, #16
	strh	r3, [ip, #10]	@ movhi
	strh	r1, [ip, #20]	@ movhi
	ldr	r1, [lr]
	lsl	r3, r2, #8
	rsb	r3, r3, r1, asr #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [ip, #22]	@ movhi
	ldr	r4, .L36+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L36+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	camera
	.word	DMANow
	.word	shadowOAM
	.size	drawGame, .-drawGame
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
	ldr	r3, .L45
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L39
	ldr	r3, .L45+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L44
.L39:
	mov	r1, #1
	ldr	r3, .L45
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L44:
	bl	drawGame
	b	.L39
.L46:
	.align	2
.L45:
	.word	67109376
	.word	gameState
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupMap, %function
setupMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	ldr	r2, .L49
	add	r0, r2, #8
	ldm	r0, {r0, r3}
	add	r3, r3, r0, lsl #1
	add	r3, r3, #22
	lsl	r3, r3, #24
	orr	r3, r3, #-1073741824
	push	{r4, r5, r6, lr}
	orr	r3, r3, #262144
	ldr	r5, .L49+4
	lsr	r3, r3, #16
	ldr	r4, .L49+8
	strh	r3, [r1, #10]	@ movhi
	mov	r0, #3
	mov	r1, r5
	mov	r3, #2048
	ldr	r2, .L49+12
	mov	lr, pc
	bx	r4
	add	r1, r5, #8192
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L49+16
	mov	lr, pc
	bx	r4
	add	r1, r5, #16384
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L49+20
	mov	lr, pc
	bx	r4
	add	r1, r5, #24576
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L49+24
	mov	lr, pc
	bx	r4
	add	r1, r5, #28672
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L49+28
	mov	lr, pc
	bx	r4
	mov	r3, #288
	mov	r0, #3
	ldr	r2, .L49+32
	ldr	r1, .L49+36
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L49+40
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	.align	2
.L49:
	.word	camera
	.word	mapMap
	.word	DMANow
	.word	100708352
	.word	100712448
	.word	100716544
	.word	100720640
	.word	100724736
	.word	100679680
	.word	mapTiles
	.word	mapPal
	.size	setupMap, .-setupMap
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
	mov	ip, #2
	ldr	r2, .L53
	push	{r4, lr}
	mov	r1, #13824
	mov	r0, #0
	ldr	r3, .L53+4
	strb	ip, [r2]
	mov	r4, #67108864
	mov	lr, pc
	bx	r3
	mov	r3, #512
	strh	r3, [r4]	@ movhi
	bl	setupMap
	ldrh	r3, [r4]
	orr	r3, r3, #4096
	strh	r3, [r4]	@ movhi
	ldr	r3, .L53+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L53+12
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L53+16
	ldr	r1, .L53+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L53+24
	ldr	r1, .L53+28
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	gameState
	.word	initCamera
	.word	hideSprites
	.word	DMANow
	.word	100728832
	.word	SpritesheetTiles
	.word	83886592
	.word	SpritesheetPal
	.word	initPlayer
	.word	initAllItems
	.word	initAllLasers
	.size	initGame, .-initGame
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
	ldr	r3, .L57
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L57+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L57+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L58:
	.align	2
.L57:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupDisplayInterrupt, .-setupDisplayInterrupt
	.comm	debug,4,4
	.comm	menuState,1,1
	.comm	gameState,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"

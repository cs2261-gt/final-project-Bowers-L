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
	ldr	r2, .L8+12
	mov	r0, #3
	ldr	r1, .L8+16
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
	.word	83886112
	.word	mapPal+32
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
	ldr	r5, .L32
	ldrh	r3, [r5]
	tst	r3, #512
	bne	.L25
	ldr	r4, .L32+4
.L11:
	tst	r3, #256
	beq	.L13
	ldr	r2, .L32+8
	ldrh	r2, [r2]
	tst	r2, #256
	beq	.L29
.L13:
	tst	r3, #4
	beq	.L14
	ldr	r3, .L32+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L30
.L14:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L31
.L15:
	ldr	r0, .L32+12
	ldr	r3, .L32+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L32+24
	mov	lr, pc
	bx	r3
	ldr	r0, .L32+12
	ldr	r3, .L32+28
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	ldr	r2, .L32+8
	ldrh	r2, [r2]
	ands	r2, r2, #512
	ldr	r4, .L32+4
	bne	.L11
	ldr	r1, [r4]
	cmp	r1, #0
	movle	r2, #1
	str	r2, [r4]
	b	.L11
.L31:
	ldr	r3, .L32+32
	mov	lr, pc
	bx	r3
	b	.L15
.L30:
	ldr	r3, .L32+36
	mov	lr, pc
	bx	r3
	b	.L14
.L29:
	ldr	r3, .L32+40
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L13
.L33:
	.align	2
.L32:
	.word	oldButtons
	.word	debug
	.word	buttons
	.word	boots
	.word	updateItem
	.word	updateCamera
	.word	showPlayer
	.word	showItem
	.word	updatePlayer
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
	ldr	r3, .L43
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L35
.L37:
	.word	.L41
	.word	.L40
	.word	.L39
	.word	.L38
	.word	.L36
.L36:
	ldr	r3, .L43+8
	mov	lr, pc
	bx	r3
.L35:
	ldr	r3, .L43+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L41:
	ldr	r3, .L43+16
	mov	lr, pc
	bx	r3
	b	.L35
.L40:
	ldr	r3, .L43+20
	mov	lr, pc
	bx	r3
	b	.L35
.L39:
	bl	updateGame
	b	.L35
.L38:
	ldr	r3, .L43+24
	mov	lr, pc
	bx	r3
	b	.L35
.L44:
	.align	2
.L43:
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
	ldr	lr, .L47
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
	ldr	r4, .L47+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L47+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
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
	ldr	r3, .L56
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L50
	ldr	r3, .L56+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L55
.L50:
	mov	r1, #1
	ldr	r3, .L56
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L55:
	bl	drawGame
	b	.L50
.L57:
	.align	2
.L56:
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
	ldr	r2, .L60
	add	r0, r2, #8
	ldm	r0, {r0, r3}
	add	r3, r3, r0, lsl #1
	add	r3, r3, #22
	lsl	r3, r3, #24
	orr	r3, r3, #-1073741824
	push	{r4, r5, r6, lr}
	orr	r3, r3, #262144
	ldr	r5, .L60+4
	lsr	r3, r3, #16
	ldr	r4, .L60+8
	strh	r3, [r1, #10]	@ movhi
	mov	r0, #3
	mov	r1, r5
	mov	r3, #2048
	ldr	r2, .L60+12
	mov	lr, pc
	bx	r4
	add	r1, r5, #8192
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L60+16
	mov	lr, pc
	bx	r4
	add	r1, r5, #16384
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L60+20
	mov	lr, pc
	bx	r4
	add	r1, r5, #24576
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L60+24
	mov	lr, pc
	bx	r4
	add	r1, r5, #28672
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L60+28
	mov	lr, pc
	bx	r4
	mov	r3, #1696
	mov	r0, #3
	ldr	r2, .L60+32
	ldr	r1, .L60+36
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L60+40
	ldr	r1, .L60+44
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	.align	2
.L60:
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
	.word	83886112
	.word	mapPal+32
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
	push	{r4, lr}
	mov	ip, #2
	mov	r4, #67108864
	ldr	r2, .L64
	mov	r1, #13824
	mov	r0, #0
	ldr	r3, .L64+4
	strb	ip, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	bic	r3, r3, #256
	orr	r3, r3, #512
	strh	r3, [r4]	@ movhi
	bl	setupMap
	ldrh	r3, [r4]
	orr	r3, r3, #4096
	strh	r3, [r4]	@ movhi
	ldr	r3, .L64+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L64+12
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L64+16
	ldr	r1, .L64+20
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L64+24
	ldr	r1, .L64+28
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L64+32
	mov	lr, pc
	bx	r3
	mov	r2, #496
	ldr	r0, .L64+36
	mov	r1, r2
	ldr	r3, .L64+40
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	gameState
	.word	initCamera
	.word	hideSprites
	.word	DMANow
	.word	100728832
	.word	SpritesheetTiles
	.word	83886592
	.word	SpritesheetPal
	.word	initPlayer
	.word	boots
	.word	initItem
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

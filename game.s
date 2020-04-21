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
	mov	r5, #67108864
	mov	r4, #0
	ldr	r3, .L4
	strh	r4, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	mov	ip, #1
	ldrh	r1, [r5, #4]
	ldr	r3, .L4+4
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	r0, .L4+8
	strh	r1, [r5, #4]	@ movhi
	ldr	r1, .L4+12
	orr	r2, r2, ip
	strh	r2, [r3]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	ldr	r3, .L4+16
	str	r0, [r1, #4092]
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+20
	ldr	r3, .L4+24
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	initSplash
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.word	setupSounds
	.word	debug
	.word	fadeIn
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
	push	{r4, r5, r6, lr}
	mov	r0, #2
	mov	r4, #67108864
	mov	r1, #5888
	ldr	r2, .L8
	ldr	r5, .L8+4
	strb	r0, [r2]
	mov	r3, #128
	strh	r1, [r4]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r5
	mov	r0, #5376
	ldr	r2, .L8+20
	add	r1, r2, #8
	ldm	r1, {r1, r3}
	add	r3, r3, r1, lsl #1
	add	r3, r3, #22
	lsl	r3, r3, #24
	orr	r3, r3, #-1073741824
	ldr	r1, .L8+24
	orr	r3, r3, #262144
	lsr	r2, r3, #16
	strh	r0, [r4, #8]	@ movhi
	mov	r3, #256
	strh	r2, [r4, #10]	@ movhi
	mov	r0, #3
	strh	r1, [r4, #12]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L8+28
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	gameState
	.word	DMANow
	.word	GameOverlayTiles
	.word	100706304
	.word	GameOverlayMap
	.word	camera
	.word	5128
	.word	gameBackgroundPal
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
	ldr	r3, .L27
	ldr	r3, [r3, #8]
	cmp	r3, #0
	push	{r4, lr}
	blt	.L24
.L11:
	ldr	r3, .L27+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L12
	ldr	r3, .L27+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L25
.L12:
	ldr	r3, .L27+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L26
.L13:
	ldr	r3, .L27+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+36
	mov	lr, pc
	bx	r3
	ldr	r2, .L27+40
	ldr	r3, [r2]
	cmp	r3, #0
	beq	.L10
	ldr	r1, .L27+44
	ldr	r3, [r1]
	cmp	r3, #17
	movgt	r0, #0
	movgt	r3, #1
	movle	r0, #67108864
	rsble	r2, r3, #17
	lslle	r2, r2, #16
	lsrle	r2, r2, #16
	addle	r3, r3, #1
	strhle	r2, [r0, #84]	@ movhi
	strgt	r0, [r2]
	str	r3, [r1]
.L10:
	pop	{r4, lr}
	bx	lr
.L26:
	ldr	r3, .L27+48
	mov	lr, pc
	bx	r3
	b	.L13
.L24:
	ldr	r3, .L27+52
	mov	lr, pc
	bx	r3
	b	.L11
.L25:
	ldr	r3, .L27+56
	mov	lr, pc
	bx	r3
	b	.L12
.L28:
	.align	2
.L27:
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
	.word	fadeIn
	.word	.LANCHOR0
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
	ldr	r3, .L38
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L38+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L30
.L32:
	.word	.L36
	.word	.L35
	.word	.L34
	.word	.L33
	.word	.L31
.L31:
	ldr	r3, .L38+8
	mov	lr, pc
	bx	r3
.L30:
	ldr	r3, .L38+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L36:
	ldr	r3, .L38+16
	mov	lr, pc
	bx	r3
	b	.L30
.L35:
	ldr	r3, .L38+20
	mov	lr, pc
	bx	r3
	b	.L30
.L34:
	bl	updateGame
	b	.L30
.L33:
	ldr	r3, .L38+24
	mov	lr, pc
	bx	r3
	b	.L30
.L39:
	.align	2
.L38:
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
	ldr	lr, .L42
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
	ldr	r4, .L42+4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L42+8
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	ldr	r3, .L52
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L45
	ldr	r3, .L52+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L51
.L46:
	ldr	r3, .L52+8
	mov	lr, pc
	bx	r3
.L45:
	mov	r1, #1
	ldr	r3, .L52
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L51:
	bl	drawGame
	b	.L46
.L53:
	.align	2
.L52:
	.word	67109376
	.word	gameState
	.word	handleSoundVBlank
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	fade
	.syntax unified
	.arm
	.fpu softvfp
	.type	fade, %function
fade:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L57
	ldr	r3, [r2]
	cmp	r3, #17
	movgt	r0, #0
	movgt	r3, #1
	movle	r0, #67108864
	rsble	r1, r3, #17
	lslle	r1, r1, #16
	ldrgt	r1, .L57+4
	lsrle	r1, r1, #16
	addle	r3, r3, #1
	strhle	r1, [r0, #84]	@ movhi
	strgt	r0, [r1]
	str	r3, [r2]
	bx	lr
.L58:
	.align	2
.L57:
	.word	.LANCHOR0
	.word	fadeIn
	.size	fade, .-fade
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
	ldr	r2, .L61
	add	r0, r2, #8
	ldm	r0, {r0, r3}
	add	r3, r3, r0, lsl #1
	add	r3, r3, #22
	lsl	r3, r3, #24
	orr	r3, r3, #-1073741824
	push	{r4, r5, r6, lr}
	orr	r3, r3, #262144
	ldr	r5, .L61+4
	lsr	r3, r3, #16
	ldr	r4, .L61+8
	strh	r3, [r1, #10]	@ movhi
	mov	r0, #3
	mov	r1, r5
	mov	r3, #2048
	ldr	r2, .L61+12
	mov	lr, pc
	bx	r4
	add	r1, r5, #8192
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L61+16
	mov	lr, pc
	bx	r4
	add	r1, r5, #16384
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L61+20
	mov	lr, pc
	bx	r4
	add	r1, r5, #24576
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L61+24
	mov	lr, pc
	bx	r4
	add	r1, r5, #28672
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L61+28
	mov	lr, pc
	bx	r4
	mov	r3, #192
	mov	r0, #3
	ldr	r2, .L61+32
	ldr	r1, .L61+36
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	.align	2
.L61:
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
	push	{r4, r5, r6, lr}
	mov	r2, #1
	ldr	r1, .L65
	ldr	r0, .L65+4
	ldr	r3, .L65+8
	mov	lr, pc
	bx	r3
	mov	ip, #2
	ldr	r2, .L65+12
	mov	r1, #13824
	mov	r0, #0
	ldr	r3, .L65+16
	strb	ip, [r2]
	mov	r5, #67108864
	mov	lr, pc
	bx	r3
	mov	r2, #5888
	ldr	r4, .L65+20
	strh	r2, [r5]	@ movhi
	mov	r3, #128
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L65+28
	ldr	r1, .L65+32
	mov	lr, pc
	bx	r4
	mov	r2, #5376
	mov	r3, #32
	strh	r2, [r5, #8]	@ movhi
	mov	r0, #3
	ldr	r2, .L65+36
	ldr	r1, .L65+40
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L65+44
	ldr	r1, .L65+48
	mov	lr, pc
	bx	r4
	ldr	r2, .L65+52
	mov	r0, #3
	ldr	r1, .L65+56
	mov	r3, #16
	strh	r2, [r5, #12]	@ movhi
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	bl	setupMap
	ldr	r3, .L65+60
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L65+64
	ldr	r1, .L65+68
	mov	lr, pc
	bx	r4
	ldr	r1, .L65+72
	mov	r0, #3
	mov	r3, #256
	ldr	r2, .L65+76
	mov	lr, pc
	bx	r4
	mov	r2, #17
	mov	r3, #215
	strh	r3, [r5, #80]	@ movhi
	strh	r2, [r5, #84]	@ movhi
	ldr	r3, .L65+80
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+84
	mov	lr, pc
	bx	r3
	ldr	r3, .L65+88
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L65+92
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	1749550
	.word	mus_game1
	.word	playSoundA
	.word	gameState
	.word	initCamera
	.word	DMANow
	.word	GameOverlayTiles
	.word	100706304
	.word	GameOverlayMap
	.word	100696064
	.word	gameBackgroundTiles
	.word	100704256
	.word	gameBackgroundMap
	.word	5128
	.word	gameBackgroundPal
	.word	hideSprites
	.word	100728832
	.word	SpritesheetTiles
	.word	SpritesheetPal
	.word	83886592
	.word	initPlayer
	.word	initAllItems
	.word	initAllLasers
	.word	fadeIn
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
	ldr	r3, .L69
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L69+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L69+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L70:
	.align	2
.L69:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupDisplayInterrupt, .-setupDisplayInterrupt
	.comm	fadeIn,4,4
	.comm	debug,4,4
	.comm	menuState,1,1
	.comm	gameState,1,1
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	count.5340, %object
	.size	count.5340, 4
count.5340:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

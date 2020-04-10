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
	ldr	r3, .L4
	ldr	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	strh	r3, [r2, #16]	@ movhi
	ldr	r3, .L4+4
	ldr	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #18]	@ movhi
	ldr	r4, .L4+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	vOff
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
	ldr	r3, .L14
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	beq	.L7
	ldr	r3, .L14+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	movne	r3, #67108864
	strhne	r2, [r3, #16]	@ movhi
	strhne	r2, [r3, #18]	@ movhi
	beq	.L13
.L7:
	mov	r1, #1
	ldr	r3, .L14
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L13:
	bl	handleVBlank.part.0
	b	.L7
.L15:
	.align	2
.L14:
	.word	67109376
	.word	gameState
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	initSplash
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSplash, %function
initSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #67108864
	mov	r1, #7168
	push	{r4, lr}
	ldr	r0, .L18
	ldr	lr, .L18+4
	strb	r3, [r0]
	strb	r3, [lr]
	ldr	ip, .L18+8
	ldr	r0, .L18+12
	str	r3, [ip]
	str	r3, [r0]
	ldrh	r3, [r2]
	orr	r3, r3, #256
	ldr	r4, .L18+16
	strh	r3, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L18+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+24
	ldr	r1, .L18+28
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	gameState
	.word	menuState
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	SplashScreen_StartTiles
	.word	100720640
	.word	SplashScreen_StartMap
	.word	SplashScreenPal
	.size	initSplash, .-initSplash
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInstructions.part.0, %function
updateInstructions.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L22
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	initSplash
.L23:
	.align	2
.L22:
	.word	buttons
	.size	updateInstructions.part.0, .-updateInstructions.part.0
	.set	updateWin.part.0,updateInstructions.part.0
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
	strh	r5, [r4]	@ movhi
	bl	initSplash
	mov	ip, #1
	ldr	r3, .L26
	ldrh	r1, [r4, #4]
	ldrh	r2, [r3]
	orr	r1, r1, #8
	orr	r2, r2, ip
	strh	r1, [r4, #4]	@ movhi
	ldr	r0, .L26+4
	strh	r2, [r3]	@ movhi
	ldr	r1, .L26+8
	ldr	r2, .L26+12
	strh	ip, [r3, #8]	@ movhi
	str	r0, [r1, #4092]
	str	r5, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.word	debug
	.size	init, .-init
	.align	2
	.global	initInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInstructions, %function
initInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	lr, #1
	ldr	ip, .L30
	ldr	r4, .L30+4
	mov	r3, #1776
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L30+8
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L30+12
	ldr	r1, .L30+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	gameState
	.word	DMANow
	.word	InstructionsScreenTiles
	.word	100720640
	.word	InstructionsScreenMap
	.size	initInstructions, .-initInstructions
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
	mov	lr, #2
	mov	ip, #0
	mov	r5, #67108864
	mov	r1, #5632
	mov	r2, #56320
	ldr	r3, .L34
	ldr	r0, .L34+4
	strb	lr, [r3]
	ldr	r3, .L34+8
	str	ip, [r0]
	ldr	r4, .L34+12
	str	r1, [r3]
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #160
	mov	r2, #100663296
	ldr	r1, .L34+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L34+20
	ldr	r1, .L34+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L34+28
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	orr	r3, r3, #4096
	strh	r3, [r5]	@ movhi
	ldr	r3, .L34+32
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L34+36
	ldr	r1, .L34+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L34+44
	ldr	r1, .L34+48
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+52
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	gameState
	.word	hOff
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
	ldr	r2, .L38
	orr	r3, r3, #4096
	strh	r3, [r1]	@ movhi
	ldr	r4, .L38+4
	strb	ip, [r2]
	mov	r3, #160
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L38+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L38+12
	ldr	r1, .L38+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L38+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	gameState
	.word	DMANow
	.word	mapTiles
	.word	100720640
	.word	mapMap
	.word	mapPal
	.size	resumeGame, .-resumeGame
	.align	2
	.global	initPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r0, #2
	mov	r4, #3
	mov	r3, #67108864
	mov	r1, #7168
	ldr	ip, .L42
	ldr	r2, .L42+4
	strb	r4, [ip]
	strb	r0, [r2]
	ldrh	r2, [r3]
	bic	r2, r2, #4096
	ldr	r5, .L42+8
	mov	r0, r4
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #848
	ldr	r1, .L42+12
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L42+16
	ldr	r1, .L42+20
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L42+24
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L43:
	.align	2
.L42:
	.word	gameState
	.word	menuState
	.word	DMANow
	.word	PauseScreen_ResumeTiles
	.word	100720640
	.word	PauseScreen_ResumeMap
	.word	PauseScreen_ResumePal
	.size	initPause, .-initPause
	.align	2
	.global	initWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWin, %function
initWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #4
	mov	r3, #67108864
	mov	r1, #7168
	ldr	r2, .L46
	push	{r4, lr}
	strb	r0, [r2]
	ldrh	r2, [r3]
	bic	r2, r2, #4096
	ldr	r4, .L46+4
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #1232
	mov	r0, #3
	ldr	r1, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L46+12
	ldr	r1, .L46+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L46+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	gameState
	.word	DMANow
	.word	WinScreenTiles
	.word	100720640
	.word	WinScreenMap
	.word	WinScreenPal
	.size	initWin, .-initWin
	.align	2
	.global	updateSplash
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L66
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L49
	ldr	r2, .L66+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L64
.L49:
	tst	r3, #64
	beq	.L50
	ldr	r2, .L66+4
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L65
.L50:
	tst	r3, #1
	beq	.L48
	ldr	r3, .L66+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L48
	ldr	r3, .L66+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L52
	cmp	r3, #1
	beq	.L53
.L48:
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	ldr	lr, .L66+8
	ldrb	r2, [lr]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L50
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+12
	ldr	r5, .L66+16
	strb	ip, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+20
	ldr	r1, .L66+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L50
.L64:
	ldr	ip, .L66+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L49
	mov	lr, #1
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L66+28
	ldr	r5, .L66+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L66+20
	ldr	r1, .L66+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L49
.L53:
	pop	{r4, r5, r6, lr}
	b	initInstructions
.L52:
	pop	{r4, r5, r6, lr}
	b	initGame
.L67:
	.align	2
.L66:
	.word	oldButtons
	.word	buttons
	.word	menuState
	.word	SplashScreen_StartTiles
	.word	DMANow
	.word	100720640
	.word	SplashScreen_StartMap
	.word	SplashScreen_InstructionsTiles
	.word	SplashScreen_InstructionsMap
	.size	updateSplash, .-updateSplash
	.align	2
	.global	updateInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L70
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	b	updateInstructions.part.0
.L71:
	.align	2
.L70:
	.word	oldButtons
	.size	updateInstructions, .-updateInstructions
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L90
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L73
	ldr	r2, .L90+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L88
.L73:
	tst	r3, #64
	beq	.L74
	ldr	r2, .L90+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L89
.L74:
	tst	r3, #1
	beq	.L72
	ldr	r3, .L90+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L72
	ldr	r3, .L90+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L76
	cmp	r3, #3
	beq	.L77
.L72:
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	ldr	ip, .L90+8
	ldrb	r5, [ip]	@ zero_extendqisi2
	cmp	r5, #3
	bne	.L74
	mov	lr, #2
	mov	r3, #848
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L90+12
	ldr	r6, .L90+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L90+20
	ldr	r1, .L90+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L74
.L88:
	ldr	ip, .L90+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L73
	mov	r5, #3
	mov	r3, #848
	mov	r0, r5
	mov	r2, #100663296
	ldr	r1, .L90+28
	ldr	r6, .L90+16
	strb	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L90+20
	ldr	r1, .L90+32
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L73
.L77:
	pop	{r4, r5, r6, lr}
	b	initSplash
.L76:
	pop	{r4, r5, r6, lr}
	b	resumeGame
.L91:
	.align	2
.L90:
	.word	oldButtons
	.word	buttons
	.word	menuState
	.word	PauseScreen_ResumeTiles
	.word	DMANow
	.word	100720640
	.word	PauseScreen_ResumeMap
	.word	PauseScreen_QuitTiles
	.word	PauseScreen_QuitMap
	.size	updatePause, .-updatePause
	.align	2
	.global	updateWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updateInstructions
	.size	updateWin, .-updateWin
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
	ldr	r3, .L103
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	push	{r4, lr}
	bne	.L94
	ldr	r4, .L103+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L99
.L94:
	ldr	r3, .L103
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L95
	ldr	r4, .L103+4
	ldr	r0, [r4]
	cmp	r0, #5632
	blt	.L100
.L95:
	ldr	r3, .L103
	ldrh	r1, [r3, #48]
	ands	r1, r1, #32
	bne	.L96
	ldr	r4, .L103+8
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L101
.L96:
	ldr	r3, .L103
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L93
	ldr	r4, .L103+8
	ldr	r0, [r4]
	cmp	r0, #4352
	blt	.L102
.L93:
	pop	{r4, lr}
	bx	lr
.L101:
	ldr	r3, .L103+12
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L96
.L99:
	ldr	r3, .L103+12
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L94
.L100:
	mov	r1, #5632
	ldr	r3, .L103+16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L95
.L102:
	mov	r1, #4352
	ldr	r3, .L103+16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	pop	{r4, lr}
	bx	lr
.L104:
	.align	2
.L103:
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
	push	{r4, r5, r6, lr}
	ldr	r5, .L127
	ldrh	r3, [r5]
	tst	r3, #512
	bne	.L121
	ldr	r4, .L127+4
.L106:
	tst	r3, #256
	beq	.L108
	ldr	r2, .L127+8
	ldrh	r2, [r2]
	tst	r2, #256
	beq	.L125
.L108:
	tst	r3, #4
	beq	.L109
	ldr	r3, .L127+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L126
.L109:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L110
	bl	cameraDebug
	ldr	r3, .L127+12
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L121:
	ldr	r2, .L127+8
	ldrh	r2, [r2]
	ands	r2, r2, #512
	ldr	r4, .L127+4
	bne	.L106
	ldr	r1, [r4]
	cmp	r1, #0
	movle	r2, #1
	str	r2, [r4]
	b	.L106
.L110:
	ldr	r3, .L127+16
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L126:
	bl	initPause
	b	.L109
.L125:
	bl	initWin
	ldrh	r3, [r5]
	b	.L108
.L128:
	.align	2
.L127:
	.word	oldButtons
	.word	debug
	.word	buttons
	.word	showPlayer
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
	ldr	r3, .L144
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L144+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L130
.L132:
	.word	.L136
	.word	.L135
	.word	.L134
	.word	.L133
	.word	.L131
.L135:
	ldr	r3, .L144+8
	ldrh	r3, [r3]
	tst	r3, #4
	blne	updateInstructions.part.0
.L130:
	ldr	r3, .L144+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L131:
	ldr	r3, .L144+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L130
	bl	updateWin.part.0
	b	.L130
.L136:
	bl	updateSplash
	b	.L130
.L134:
	bl	updateGame
	b	.L130
.L133:
	bl	updatePause
	b	.L130
.L145:
	.align	2
.L144:
	.word	updateInput
	.word	gameState
	.word	oldButtons
	.word	waitForVBlank
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
	ldr	r3, .L149
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L148
	mov	r3, #67108864
	mov	r2, #0
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L148:
	b	handleVBlank.part.0
.L150:
	.align	2
.L149:
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
	ldr	r3, .L153
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L153+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L153+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L154:
	.align	2
.L153:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupDisplayInterrupt, .-setupDisplayInterrupt
	.comm	debug,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	menuState,1,1
	.comm	gameState,1,1
	.ident	"GCC: (devkitARM release 53) 9.1.0"

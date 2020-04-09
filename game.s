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
	mov	r2, #0
	mov	r3, #67108864
	mov	r1, #7168
	push	{r4, lr}
	ldr	lr, .L18
	ldr	ip, .L18+4
	strb	r2, [lr]
	ldr	r0, .L18+8
	str	r2, [ip]
	str	r2, [r0]
	ldrh	r2, [r3]
	orr	r2, r2, #256
	ldr	r4, .L18+12
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #1696
	mov	r0, #3
	ldr	r1, .L18+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L18+20
	ldr	r1, .L18+24
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L18+28
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	gameState
	.word	hOff
	.word	vOff
	.word	DMANow
	.word	SplashScreen_StartTiles
	.word	100720640
	.word	SplashScreen_StartMap
	.word	SplashScreenPal
	.size	initSplash, .-initSplash
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
	ldr	r3, .L22
	ldrh	r1, [r4, #4]
	ldrh	r2, [r3]
	orr	r1, r1, #8
	orr	r2, r2, ip
	strh	r1, [r4, #4]	@ movhi
	ldr	r0, .L22+4
	strh	r2, [r3]	@ movhi
	ldr	r1, .L22+8
	ldr	r2, .L22+12
	strh	ip, [r3, #8]	@ movhi
	str	r0, [r1, #4092]
	str	r5, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	@ link register save eliminated.
	bx	lr
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
	ldr	r3, .L27
	ldr	r0, .L27+4
	strb	lr, [r3]
	ldr	r3, .L27+8
	str	ip, [r0]
	ldr	r4, .L27+12
	str	r1, [r3]
	mov	r0, #3
	strh	r2, [r5, #8]	@ movhi
	mov	r3, #160
	mov	r2, #100663296
	ldr	r1, .L27+16
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L27+20
	ldr	r1, .L27+24
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L27+28
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	orr	r3, r3, #4096
	strh	r3, [r5]	@ movhi
	ldr	r3, .L27+32
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L27+36
	ldr	r1, .L27+40
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L27+44
	ldr	r1, .L27+48
	mov	lr, pc
	bx	r4
	ldr	r3, .L27+52
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
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
	ldr	r2, .L31
	orr	r3, r3, #4096
	strh	r3, [r1]	@ movhi
	ldr	r4, .L31+4
	strb	ip, [r2]
	mov	r3, #160
	strh	r0, [r1, #8]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L31+8
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L31+12
	ldr	r1, .L31+16
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L31+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L32:
	.align	2
.L31:
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
	mov	r4, #3
	mov	r3, #67108864
	mov	r1, #7168
	ldr	r2, .L35
	strb	r4, [r2]
	ldrh	r2, [r3]
	bic	r2, r2, #4096
	ldr	r5, .L35+4
	mov	r0, r4
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #848
	ldr	r1, .L35+8
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L35+12
	ldr	r1, .L35+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L35+20
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	gameState
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
	@ link register save eliminated.
	bx	lr
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
	ldr	r4, .L55
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L39
	ldr	r2, .L55+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L52
.L39:
	tst	r3, #64
	beq	.L40
	ldr	r2, .L55+4
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L53
.L40:
	tst	r3, #1
	beq	.L38
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L38
	ldr	r3, .L55+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L54
.L38:
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	ldr	lr, .L55+8
	ldr	r2, [lr]
	cmp	r2, #1
	bne	.L40
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L55+12
	ldr	r5, .L55+16
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L55+20
	ldr	r1, .L55+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L40
.L52:
	ldr	ip, .L55+8
	ldr	r2, [ip]
	cmp	r2, #0
	bne	.L39
	mov	lr, #1
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L55+28
	ldr	r5, .L55+16
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L55+20
	ldr	r1, .L55+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L39
.L54:
	pop	{r4, r5, r6, lr}
	b	initGame
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR0
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
	ldr	r3, .L62
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L62+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	initSplash
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	buttons
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
	ldr	r4, .L82
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L65
	ldr	r2, .L82+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L80
.L65:
	tst	r3, #64
	beq	.L66
	ldr	r2, .L82+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L81
.L66:
	tst	r3, #1
	beq	.L64
	ldr	r3, .L82+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L64
	ldr	r3, .L82+8
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L68
	cmp	r3, #3
	beq	.L69
.L64:
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	ldr	ip, .L82+8
	ldr	r5, [ip]
	cmp	r5, #3
	bne	.L66
	mov	lr, #2
	mov	r3, #848
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L82+12
	ldr	r6, .L82+16
	str	lr, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L82+20
	ldr	r1, .L82+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L66
.L80:
	ldr	ip, .L82+8
	ldr	r2, [ip]
	cmp	r2, #2
	bne	.L65
	mov	r5, #3
	mov	r3, #848
	mov	r0, r5
	mov	r2, #100663296
	ldr	r1, .L82+28
	ldr	r6, .L82+16
	str	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L82+20
	ldr	r1, .L82+32
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L65
.L69:
	pop	{r4, r5, r6, lr}
	b	initSplash
.L68:
	pop	{r4, r5, r6, lr}
	b	resumeGame
.L83:
	.align	2
.L82:
	.word	oldButtons
	.word	buttons
	.word	.LANCHOR1
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
	bx	lr
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
	ldr	r3, .L95
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	push	{r4, lr}
	bne	.L86
	ldr	r4, .L95+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L91
.L86:
	ldr	r3, .L95
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L87
	ldr	r4, .L95+4
	ldr	r0, [r4]
	cmp	r0, #5632
	blt	.L92
.L87:
	ldr	r3, .L95
	ldrh	r1, [r3, #48]
	ands	r1, r1, #32
	bne	.L88
	ldr	r4, .L95+8
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L93
.L88:
	ldr	r3, .L95
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L85
	ldr	r4, .L95+8
	ldr	r0, [r4]
	cmp	r0, #4352
	blt	.L94
.L85:
	pop	{r4, lr}
	bx	lr
.L93:
	ldr	r3, .L95+12
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L88
.L91:
	ldr	r3, .L95+12
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L86
.L92:
	mov	r1, #5632
	ldr	r3, .L95+16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L87
.L94:
	mov	r1, #4352
	ldr	r3, .L95+16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	pop	{r4, lr}
	bx	lr
.L96:
	.align	2
.L95:
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
	ldr	r3, .L111
	ldrh	r3, [r3]
	tst	r3, #512
	push	{r4, lr}
	and	r3, r3, #4
	beq	.L98
	ldr	r2, .L111+4
	ldrh	r2, [r2]
	ands	r1, r2, #512
	bne	.L98
	ldr	r4, .L111+8
	ldr	r0, [r4]
	cmp	r0, #0
	ble	.L99
	cmp	r3, #0
	str	r1, [r4]
	bne	.L100
	b	.L101
.L98:
	cmp	r3, #0
	bne	.L103
	ldr	r4, .L111+8
.L104:
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L106
.L101:
	ldr	r3, .L111+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L103:
	ldr	r3, .L111+4
	ldr	r4, .L111+8
	ldrh	r2, [r3]
.L100:
	tst	r2, #4
	bne	.L104
	bl	initPause
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L101
.L106:
	bl	cameraDebug
	ldr	r3, .L111+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L99:
	mov	r1, #1
	cmp	r3, #0
	str	r1, [r4]
	bne	.L100
	b	.L106
.L112:
	.align	2
.L111:
	.word	oldButtons
	.word	buttons
	.word	debug
	.word	updatePlayer
	.word	showPlayer
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
	ldr	r3, .L124
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L124+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L114
.L116:
	.word	.L119
	.word	.L118
	.word	.L117
	.word	.L115
.L119:
	bl	updateSplash
.L114:
	ldr	r3, .L124+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L115:
	bl	updatePause
	b	.L114
.L117:
	bl	updateGame
	b	.L114
.L118:
	ldr	r3, .L124+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L114
	ldr	r3, .L124+16
	ldrh	r3, [r3]
	tst	r3, #4
	bne	.L114
	bl	initSplash
	b	.L114
.L125:
	.align	2
.L124:
	.word	updateInput
	.word	gameState
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
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
	ldr	r3, .L129
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L128
	mov	r3, #67108864
	mov	r2, #0
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L128:
	b	handleVBlank.part.0
.L130:
	.align	2
.L129:
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
	ldr	r3, .L133
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L133+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L133+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L134:
	.align	2
.L133:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupDisplayInterrupt, .-setupDisplayInterrupt
	.comm	debug,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	gameState,1,1
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	menuState.4224, %object
	.size	menuState.4224, 4
menuState.4224:
	.word	2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	menuState.4212, %object
	.size	menuState.4212, 4
menuState.4212:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

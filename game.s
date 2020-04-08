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
	.global	initSplash
	.arch armv4t
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
	mov	r1, #56320
	push	{r4, lr}
	ldr	lr, .L4
	ldr	ip, .L4+4
	strb	r2, [lr]
	ldr	r0, .L4+8
	str	r2, [ip]
	str	r2, [r0]
	ldrh	r2, [r3]
	orr	r2, r2, #256
	ldr	r4, .L4+12
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	mov	r2, #100663296
	mov	r3, #1696
	mov	r0, #3
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #1024
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
	ldr	r3, .L8
	ldrh	r1, [r4, #4]
	ldrh	r2, [r3]
	orr	r1, r1, #8
	orr	r2, r2, ip
	strh	r1, [r4, #4]	@ movhi
	ldr	r0, .L8+4
	strh	r2, [r3]	@ movhi
	ldr	r1, .L8+8
	ldr	r2, .L8+12
	strh	ip, [r3, #8]	@ movhi
	str	r0, [r1, #4092]
	str	r5, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L9:
	.align	2
.L8:
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
	mov	r5, #67108864
	mov	r2, #5632
	mov	r0, #0
	ldr	ip, .L13
	ldr	r3, .L13+4
	strb	lr, [ip]
	str	r2, [r3]
	ldrh	r3, [r5]
	ldr	r1, .L13+8
	ldr	r2, .L13+12
	bic	r3, r3, #256
	orr	r3, r3, #512
	ldr	r4, .L13+16
	str	r0, [r1]
	strh	r3, [r5]	@ movhi
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #160
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L13+20
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	mov	r0, #3
	ldr	r2, .L13+24
	ldr	r1, .L13+28
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L13+32
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	orr	r3, r3, #4096
	strh	r3, [r5]	@ movhi
	ldr	r3, .L13+36
	mov	lr, pc
	bx	r3
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L13+40
	ldr	r1, .L13+44
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r0, #3
	ldr	r2, .L13+48
	ldr	r1, .L13+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+56
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	gameState
	.word	vOff
	.word	hOff
	.word	-9212
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
	@ link register save eliminated.
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	ldr	r4, .L35
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L19
	ldr	r2, .L35+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L32
.L19:
	tst	r3, #64
	beq	.L20
	ldr	r2, .L35+4
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L33
.L20:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L35+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L18
	ldr	r3, .L35+8
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L34
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	ldr	lr, .L35+8
	ldr	r2, [lr]
	cmp	r2, #1
	bne	.L20
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L35+12
	ldr	r5, .L35+16
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L35+20
	ldr	r1, .L35+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L20
.L32:
	ldr	ip, .L35+8
	ldr	r2, [ip]
	cmp	r2, #0
	bne	.L19
	mov	lr, #1
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L35+28
	ldr	r5, .L35+16
	str	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L35+20
	ldr	r1, .L35+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L19
.L34:
	pop	{r4, r5, r6, lr}
	b	initGame
.L36:
	.align	2
.L35:
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
	bx	lr
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
	@ link register save eliminated.
	bx	lr
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
	ldr	r3, .L50
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	push	{r4, lr}
	bne	.L41
	ldr	r4, .L50+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L46
.L41:
	ldr	r3, .L50
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L42
	ldr	r4, .L50+4
	ldr	r0, [r4]
	cmp	r0, #5632
	blt	.L47
.L42:
	ldr	r3, .L50
	ldrh	r1, [r3, #48]
	ands	r1, r1, #32
	bne	.L43
	ldr	r4, .L50+8
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L48
.L43:
	ldr	r3, .L50
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L40
	ldr	r4, .L50+8
	ldr	r0, [r4]
	cmp	r0, #4352
	blt	.L49
.L40:
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r3, .L50+12
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L43
.L46:
	ldr	r3, .L50+12
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L41
.L47:
	mov	r1, #5632
	ldr	r3, .L50+16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L42
.L49:
	mov	r1, #4352
	ldr	r3, .L50+16
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	pop	{r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r3, .L65
	ldrh	r2, [r3]
	ldr	r3, .L65+4
	tst	r2, #512
	push	{r4, lr}
	ldr	r1, [r3]
	beq	.L53
	ldr	r2, .L65+8
	ldrh	r2, [r2]
	ands	r2, r2, #512
	bne	.L53
	cmp	r1, #0
	movle	r2, #1
	strgt	r2, [r3]
	strle	r2, [r3]
	ble	.L56
.L55:
	ldr	r3, .L65+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L53:
	cmp	r1, #0
	beq	.L55
.L56:
	bl	cameraDebug
	ldr	r3, .L65+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	oldButtons
	.word	debug
	.word	buttons
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
	ldr	r3, .L72
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L72+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L68
	cmp	r3, #2
	bleq	updateGame
.L70:
	ldr	r3, .L72+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L68:
	bl	updateSplash
	b	.L70
.L73:
	.align	2
.L72:
	.word	updateInput
	.word	gameState
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
	mov	r2, #67108864
	ldr	r3, .L76
	ldr	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	push	{r4, lr}
	strh	r3, [r2, #20]	@ movhi
	ldr	r3, .L76+4
	ldr	r3, [r3]
	asr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r2, #22]	@ movhi
	ldr	r4, .L76+8
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L76+12
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L77:
	.align	2
.L76:
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
	ldr	r3, .L85
	ldrh	r1, [r3, #2]
	tst	r1, #1
	push	{r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bne	.L84
.L79:
	mov	r1, #1
	ldr	r3, .L85
	ldrh	r2, [r3, #2]
	strh	r1, [r3, #8]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L84:
	bl	handleVBlank
	b	.L79
.L86:
	.align	2
.L85:
	.word	67109376
	.size	interruptHandler, .-interruptHandler
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
	ldr	r3, .L89
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L89+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L89+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L90:
	.align	2
.L89:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupDisplayInterrupt, .-setupDisplayInterrupt
	.comm	debug,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	gameState,1,1
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	menuState.4205, %object
	.size	menuState.4205, 4
menuState.4205:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

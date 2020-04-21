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
	.file	"stateMachine.c"
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
	push	{r4, lr}
	mov	r2, #1
	ldr	r1, .L4
	ldr	r0, .L4+4
	ldr	r3, .L4+8
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r2, #67108864
	mov	r0, #256
	mov	r1, #5376
	ldr	lr, .L4+12
	ldr	ip, .L4+16
	strb	r3, [lr]
	strb	r3, [ip]
	ldr	r4, .L4+20
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	816943
	.word	mus_start
	.word	playSoundA
	.word	gameState
	.word	menuState
	.word	DMANow
	.word	SplashScreen_StartTiles
	.word	100706304
	.word	SplashScreen_StartMap
	.word	SplashScreenPal
	.size	initSplash, .-initSplash
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
	ldr	ip, .L8
	ldr	r4, .L8+4
	mov	r3, #2176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+8
	strb	lr, [ip]
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	gameState
	.word	DMANow
	.word	InstructionsScreenTiles
	.word	100706304
	.word	InstructionsScreenMap
	.size	initInstructions, .-initInstructions
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
	mov	lr, #2
	ldr	r1, .L12
	ldr	ip, .L12+4
	mov	r0, r4
	strb	r4, [r1]
	ldr	r5, .L12+8
	mov	r3, #848
	mov	r2, #100663296
	ldr	r1, .L12+12
	strb	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	lr, pc
	bx	r5
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	gameState
	.word	menuState
	.word	DMANow
	.word	PauseScreen_ResumeTiles
	.word	100706304
	.word	PauseScreen_ResumeMap
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
	mov	ip, #4
	mov	r2, #67108864
	mov	r0, #256
	mov	r1, #5376
	push	{r4, lr}
	ldr	r3, .L16
	ldr	r4, .L16+4
	strb	ip, [r3]
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #1232
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+12
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	gameState
	.word	DMANow
	.word	WinScreenTiles
	.word	100706304
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
	ldr	r4, .L36
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L19
	ldr	r2, .L36+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L34
.L19:
	tst	r3, #64
	beq	.L20
	ldr	r2, .L36+4
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L35
.L20:
	tst	r3, #1
	beq	.L18
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L18
	ldr	r3, .L36+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L22
	cmp	r3, #1
	beq	.L23
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L35:
	ldr	lr, .L36+8
	ldrb	r2, [lr]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L20
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L36+12
	ldr	r5, .L36+16
	strb	ip, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L36+20
	ldr	r1, .L36+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L20
.L34:
	ldr	ip, .L36+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L19
	mov	lr, #1
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L36+28
	ldr	r5, .L36+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L36+20
	ldr	r1, .L36+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L19
.L23:
	pop	{r4, r5, r6, lr}
	b	initInstructions
.L22:
	ldr	r3, .L36+36
	mov	lr, pc
	bx	r3
	b	.L18
.L37:
	.align	2
.L36:
	.word	oldButtons
	.word	buttons
	.word	menuState
	.word	SplashScreen_StartTiles
	.word	DMANow
	.word	100706304
	.word	SplashScreen_StartMap
	.word	SplashScreen_InstructionsTiles
	.word	SplashScreen_InstructionsMap
	.word	initGame
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
	ldr	r3, .L43
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L43+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	initSplash
.L44:
	.align	2
.L43:
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
	ldr	r4, .L63
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L46
	ldr	r2, .L63+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L61
.L46:
	tst	r3, #64
	beq	.L47
	ldr	r2, .L63+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L62
.L47:
	tst	r3, #1
	beq	.L45
	ldr	r3, .L63+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L45
	ldr	r3, .L63+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L49
	cmp	r3, #3
	beq	.L50
.L45:
	pop	{r4, r5, r6, lr}
	bx	lr
.L62:
	ldr	ip, .L63+8
	ldrb	r5, [ip]	@ zero_extendqisi2
	cmp	r5, #3
	bne	.L47
	mov	lr, #2
	mov	r3, #848
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L63+12
	ldr	r6, .L63+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L63+20
	ldr	r1, .L63+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L47
.L61:
	ldr	ip, .L63+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L46
	mov	r5, #3
	mov	r3, #848
	mov	r0, r5
	mov	r2, #100663296
	ldr	r1, .L63+28
	ldr	r6, .L63+16
	strb	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L63+20
	ldr	r1, .L63+32
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L46
.L50:
	pop	{r4, r5, r6, lr}
	b	initSplash
.L49:
	ldr	r3, .L63+36
	mov	lr, pc
	bx	r3
	b	.L45
.L64:
	.align	2
.L63:
	.word	oldButtons
	.word	buttons
	.word	menuState
	.word	PauseScreen_ResumeTiles
	.word	DMANow
	.word	100706304
	.word	PauseScreen_ResumeMap
	.word	PauseScreen_QuitTiles
	.word	PauseScreen_QuitMap
	.word	resumeGame
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
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

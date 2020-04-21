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
	mov	r3, #0
	mov	ip, #5376
	mov	r2, #67108864
	mov	r0, #1280
	ldr	r1, .L4
	push	{r4, lr}
	ldr	lr, .L4+4
	strb	r3, [r1]
	ldr	r1, .L4+8
	strb	r3, [lr]
	ldr	r4, .L4+12
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #12]	@ movhi
	mov	r3, #1696
	mov	r2, #100663296
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
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+28
	mov	lr, pc
	bx	r4
	mov	r3, #1696
	mov	r0, #3
	ldr	r2, .L4+32
	ldr	r1, .L4+36
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r0, #3
	ldr	r2, .L4+48
	ldr	r1, .L4+52
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	gameState
	.word	menuState
	.word	5128
	.word	DMANow
	.word	SplashScreen_StartTiles
	.word	100706304
	.word	SplashScreen_StartMap
	.word	SplashScreenPal
	.word	100696064
	.word	SplashBackTiles
	.word	100704256
	.word	SplashBackMap
	.word	83886112
	.word	SplashBackPal+32
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
	mov	ip, #1
	mov	r1, #67108864
	mov	r0, #256
	push	{r4, lr}
	ldr	r2, .L8
	ldr	r4, .L8+4
	strb	ip, [r2]
	mov	r3, #2176
	strh	r0, [r1]	@ movhi
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+8
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
	mov	r0, #2
	mov	r4, #3
	mov	r3, #67108864
	mov	r2, #1792
	ldr	ip, .L12
	ldr	r1, .L12+4
	strb	r4, [ip]
	strb	r0, [r1]
	ldr	r5, .L12+8
	mov	r0, r4
	strh	r2, [r3]	@ movhi
	ldr	r1, .L12+12
	mov	r3, #848
	mov	r2, #100663296
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
	push	{r4, lr}
	mov	lr, #4
	ldr	ip, .L16
	mov	r2, #1
	ldr	r1, .L16+4
	ldr	r0, .L16+8
	ldr	r3, .L16+12
	strb	lr, [ip]
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	mov	r1, #1792
	mov	r2, #5376
	ldr	r4, .L16+16
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	mov	r0, #3
	mov	r3, #1232
	mov	r2, #100663296
	ldr	r1, .L16+20
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L16+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	gameState
	.word	2733395
	.word	mus_win
	.word	playSoundA
	.word	DMANow
	.word	WinScreenTiles
	.word	100706304
	.word	WinScreenMap
	.word	WinScreenPal
	.size	initWin, .-initWin
	.align	2
	.global	glitchEffect
	.syntax unified
	.arm
	.fpu softvfp
	.type	glitchEffect, %function
glitchEffect:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L26
	mov	lr, pc
	bx	r5
	ldr	r3, .L26+4
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #4
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	cmp	r3, #1
	ldr	r4, .L26+8
	beq	.L23
.L19:
	ldr	r3, [r4]
	cmp	r3, #0
	moveq	r3, #67108864
	moveq	r2, #5376
	strheq	r2, [r3, #8]	@ movhi
	bne	.L25
	pop	{r4, r5, r6, lr}
	bx	lr
.L25:
	mov	r3, #5440
	mov	r6, #67108864
	strh	r3, [r6, #8]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r2, .L26+12
	smull	r3, r2, r0, r2
	asr	r3, r0, #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #3
	rsb	r3, r3, r3, lsl #4
	ldr	r2, [r4]
	ldr	r1, [r4, #4]
	sub	r0, r0, r3
	lsl	r0, r0, #16
	add	r3, r2, #1
	cmp	r3, r1
	lsr	r0, r0, #16
	strh	r0, [r6, #76]	@ movhi
	str	r3, [r4]
	movge	r3, #0
	strge	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L26+16
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	str	r0, [r4, #4]
	b	.L19
.L27:
	.align	2
.L26:
	.word	rand
	.word	1374389535
	.word	.LANCHOR0
	.word	-2004318071
	.word	1717986919
	.size	glitchEffect, .-glitchEffect
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
	ldr	r4, .L46
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L29
	ldr	r2, .L46+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L44
.L29:
	tst	r3, #64
	beq	.L30
	ldr	r2, .L46+4
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L45
.L30:
	tst	r3, #1
	beq	.L31
	ldr	r3, .L46+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L31
	ldr	r3, .L46+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L32
	cmp	r3, #1
	beq	.L33
.L31:
	pop	{r4, r5, r6, lr}
	b	glitchEffect
.L45:
	ldr	lr, .L46+8
	ldrb	r2, [lr]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L30
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L46+12
	ldr	r5, .L46+16
	strb	ip, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L46+20
	ldr	r1, .L46+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L30
.L44:
	ldr	ip, .L46+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L29
	mov	lr, #1
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L46+28
	ldr	r5, .L46+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L46+20
	ldr	r1, .L46+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L29
.L33:
	bl	initInstructions
	b	.L31
.L32:
	ldr	r3, .L46+36
	mov	lr, pc
	bx	r3
	b	.L31
.L47:
	.align	2
.L46:
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
	ldr	r3, .L58
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L54
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L57
.L54:
	b	glitchEffect
.L57:
	push	{r4, lr}
	bl	initSplash
	pop	{r4, lr}
	b	glitchEffect
.L59:
	.align	2
.L58:
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
	ldr	r4, .L78
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L61
	ldr	r2, .L78+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L76
.L61:
	tst	r3, #64
	beq	.L62
	ldr	r2, .L78+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L77
.L62:
	tst	r3, #1
	beq	.L60
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L60
	ldr	r3, .L78+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L64
	cmp	r3, #3
	beq	.L65
.L60:
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	ldr	ip, .L78+8
	ldrb	r5, [ip]	@ zero_extendqisi2
	cmp	r5, #3
	bne	.L62
	mov	lr, #2
	mov	r3, #848
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L78+12
	ldr	r6, .L78+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L78+20
	ldr	r1, .L78+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L62
.L76:
	ldr	ip, .L78+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L61
	mov	r5, #3
	mov	r3, #848
	mov	r0, r5
	mov	r2, #100663296
	ldr	r1, .L78+28
	ldr	r6, .L78+16
	strb	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L78+20
	ldr	r1, .L78+32
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L61
.L65:
	bl	initSplash
	mov	r2, #1
	ldr	r1, .L78+36
	ldr	r0, .L78+40
	ldr	r3, .L78+44
	mov	lr, pc
	bx	r3
	b	.L60
.L64:
	ldr	r3, .L78+48
	mov	lr, pc
	bx	r3
	b	.L60
.L79:
	.align	2
.L78:
	.word	oldButtons
	.word	buttons
	.word	menuState
	.word	PauseScreen_ResumeTiles
	.word	DMANow
	.word	100706304
	.word	PauseScreen_ResumeMap
	.word	PauseScreen_QuitTiles
	.word	PauseScreen_QuitMap
	.word	816943
	.word	mus_start
	.word	playSoundA
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
	ldr	r3, .L89
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L89+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	push	{r4, lr}
	bl	initSplash
	mov	r2, #1
	ldr	r1, .L89+8
	ldr	r0, .L89+12
	ldr	r3, .L89+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	oldButtons
	.word	buttons
	.word	816943
	.word	mus_start
	.word	playSoundA
	.size	updateWin, .-updateWin
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	glitchCounter.5336, %object
	.size	glitchCounter.5336, 4
glitchCounter.5336:
	.space	4
	.type	duration.5337, %object
	.size	duration.5337, 4
duration.5337:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

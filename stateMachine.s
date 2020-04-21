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
	mov	r2, #67108864
	mov	r0, #256
	mov	r1, #5376
	push	{r4, lr}
	ldr	ip, .L4
	ldr	lr, .L4+4
	strb	r3, [ip]
	strb	r3, [lr]
	ldr	r4, .L4+8
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+24
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	menuState
	.word	gameState
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
	ldr	r5, .L25
	mov	lr, pc
	bx	r5
	ldr	r3, .L25+4
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #2
	cmp	r3, #1
	ldr	r4, .L25+8
	beq	.L23
.L19:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L20
	mov	r2, #67108864
	mov	r0, #5440
	mov	r1, #5
	ldr	ip, [r4, #4]
	add	r3, r3, #1
	cmp	r3, ip
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #76]	@ movhi
	str	r3, [r4]
	movge	r3, #0
	strge	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	mov	r3, #67108864
	mov	r2, #5376
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L23:
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L25+12
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #1
	str	r0, [r4, #4]
	b	.L19
.L26:
	.align	2
.L25:
	.word	rand
	.word	1374389535
	.word	.LANCHOR0
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
	ldr	r4, .L45
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L28
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L43
.L28:
	tst	r3, #64
	beq	.L29
	ldr	r2, .L45+4
	ldrh	r2, [r2]
	ands	ip, r2, #64
	beq	.L44
.L29:
	tst	r3, #1
	beq	.L30
	ldr	r3, .L45+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L30
	ldr	r3, .L45+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L31
	cmp	r3, #1
	beq	.L32
.L30:
	pop	{r4, r5, r6, lr}
	b	glitchEffect
.L44:
	ldr	lr, .L45+8
	ldrb	r2, [lr]	@ zero_extendqisi2
	cmp	r2, #1
	bne	.L29
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L45+12
	ldr	r5, .L45+16
	strb	ip, [lr]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L45+20
	ldr	r1, .L45+24
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L29
.L43:
	ldr	ip, .L45+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #0
	bne	.L28
	mov	lr, #1
	mov	r3, #1696
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L45+28
	ldr	r5, .L45+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L45+20
	ldr	r1, .L45+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L28
.L32:
	bl	initInstructions
	b	.L30
.L31:
	ldr	r3, .L45+36
	mov	lr, pc
	bx	r3
	b	.L30
.L46:
	.align	2
.L45:
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
	ldr	r3, .L52
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	initSplash
.L53:
	.align	2
.L52:
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
	ldr	r4, .L72
	ldrh	r3, [r4]
	tst	r3, #128
	beq	.L55
	ldr	r2, .L72+4
	ldrh	r2, [r2]
	tst	r2, #128
	beq	.L70
.L55:
	tst	r3, #64
	beq	.L56
	ldr	r2, .L72+4
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L71
.L56:
	tst	r3, #1
	beq	.L54
	ldr	r3, .L72+4
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L54
	ldr	r3, .L72+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L58
	cmp	r3, #3
	beq	.L59
.L54:
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	ldr	ip, .L72+8
	ldrb	r5, [ip]	@ zero_extendqisi2
	cmp	r5, #3
	bne	.L56
	mov	lr, #2
	mov	r3, #848
	mov	r2, #100663296
	mov	r0, r5
	ldr	r1, .L72+12
	ldr	r6, .L72+16
	strb	lr, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L72+20
	ldr	r1, .L72+24
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L56
.L70:
	ldr	ip, .L72+8
	ldrb	r2, [ip]	@ zero_extendqisi2
	cmp	r2, #2
	bne	.L55
	mov	r5, #3
	mov	r3, #848
	mov	r0, r5
	mov	r2, #100663296
	ldr	r1, .L72+28
	ldr	r6, .L72+16
	strb	r5, [ip]
	mov	lr, pc
	bx	r6
	mov	r3, #1024
	mov	r0, r5
	ldr	r2, .L72+20
	ldr	r1, .L72+32
	mov	lr, pc
	bx	r6
	ldrh	r3, [r4]
	b	.L55
.L59:
	bl	initSplash
	mov	r2, #1
	ldr	r1, .L72+36
	ldr	r0, .L72+40
	ldr	r3, .L72+44
	mov	lr, pc
	bx	r3
	b	.L54
.L58:
	ldr	r3, .L72+48
	mov	lr, pc
	bx	r3
	b	.L54
.L73:
	.align	2
.L72:
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
	@ link register save eliminated.
	b	updateInstructions
	.size	updateWin, .-updateWin
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	glitchCounter.5331, %object
	.size	glitchCounter.5331, 4
glitchCounter.5331:
	.space	4
	.type	duration.5332, %object
	.size	duration.5332, 4
duration.5332:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

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
	.file	"laser.c"
	.text
	.align	2
	.global	initLaser
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLaser, %function
initLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L14
	ldr	r4, [r6]
	cmp	r4, #60
	movgt	ip, #0
	ldr	lr, .L14+4
	ldr	r7, [r0, #40]
	strgt	ip, [r6]
	ldm	lr, {ip, lr}
	lsl	r2, r2, #4
	addle	r5, r4, #11
	movgt	r4, #1
	movgt	r5, #11
	addle	r4, r4, #1
	cmp	r7, #3
	sub	ip, r2, ip
	str	r2, [r0, #8]
	moveq	r2, #256
	lsl	r1, r1, #4
	sub	lr, r1, lr
	moveq	r8, #128
	stm	r0, {ip, lr}
	str	r1, [r0, #12]
	streq	r2, [r0, #16]
	beq	.L5
	mov	r2, #128
	cmp	r7, #1
	moveq	r8, #256
	movne	r8, r2
	str	r2, [r0, #16]
.L5:
	mov	r2, #1
	mov	r7, #0
	mov	r1, #60
	lsr	ip, ip, #4
	lsl	lr, lr, #19
	tst	r3, #1
	str	r2, [r0, #32]
	str	r2, [r0, #36]
	str	r8, [r0, #20]
	str	r3, [r0, #40]
	str	r5, [r0, #44]
	str	r4, [r6]
	str	r7, [r0, #24]
	str	r1, [r0, #28]
	ldr	r2, .L14+8
	and	ip, ip, #255
	lsr	lr, lr, #23
	bne	.L6
	lsl	r1, r5, #3
	orr	ip, ip, #512
	strh	ip, [r2, r1]	@ movhi
.L7:
	cmp	r3, #1
	movgt	r3, #11
	movle	r3, #10
	add	r0, r2, r1
	add	r2, r2, r1
	strh	lr, [r0, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L6:
	cmp	r3, #1
	lslne	r1, r5, #3
	orrne	ip, ip, #16896
	strhne	ip, [r2, r1]	@ movhi
	bne	.L7
	mov	r3, #10
	lsl	r1, r5, #3
	orr	ip, ip, #33280
	strh	ip, [r2, r1]	@ movhi
	add	r5, r2, r5, lsl #3
	add	r2, r2, r1
	strh	lr, [r5, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LANCHOR0
	.word	camera
	.word	shadowOAM
	.size	initLaser, .-initLaser
	.align	2
	.global	initAllLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAllLasers, %function
initAllLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, r5, r6, lr}
	ldr	r3, .L25
	add	r2, r3, #2880
.L17:
	str	r1, [r3, #36]
	add	r3, r3, #48
	cmp	r3, r2
	bne	.L17
	mov	r3, #1
	mov	r2, #704
	mov	r1, #376
	ldr	r0, .L25
	bl	initLaser
	mov	r3, #1
	mov	r2, #688
	mov	r1, #376
	ldr	r0, .L25+4
	bl	initLaser
	mov	r3, #1
	mov	r2, #672
	mov	r1, #376
	ldr	r0, .L25+8
	bl	initLaser
	mov	r3, #1
	mov	r2, #656
	mov	r1, #376
	ldr	r0, .L25+12
	bl	initLaser
	mov	r6, #704
	mov	r5, #4
	ldr	r4, .L25+16
	b	.L19
.L20:
	add	r5, r5, #1
	add	r4, r4, #48
	sub	r6, r6, #16
.L19:
	mov	r0, r4
	mov	r3, #1
	mov	r2, r6
	mov	r1, #64
	bl	initLaser
	cmp	r5, #4
	add	r0, r4, #384
	beq	.L20
	mov	r3, #1
	mov	r2, r6
	mov	r1, #80
	bl	initLaser
	cmp	r5, #11
	bne	.L20
	mov	r4, #376
	ldr	r5, .L25+20
.L21:
	mov	r1, r4
	mov	r0, r5
	mov	r3, #3
	mov	r2, #656
	sub	r4, r4, #16
	bl	initLaser
	cmp	r4, #72
	add	r5, r5, #48
	bne	.L21
	mov	r3, #1
	mov	r2, #488
	mov	r1, #632
	ldr	r0, .L25+24
	bl	initLaser
	mov	r3, #1
	mov	r2, #472
	mov	r1, #632
	ldr	r0, .L25+28
	bl	initLaser
	mov	r3, #1
	mov	r2, #456
	mov	r1, #632
	ldr	r0, .L25+32
	bl	initLaser
	mov	r3, #1
	mov	r2, #448
	mov	r1, #664
	ldr	r0, .L25+36
	bl	initLaser
	mov	r3, #1
	mov	r2, #432
	mov	r1, #664
	ldr	r0, .L25+40
	bl	initLaser
	mov	r3, #1
	mov	r2, #416
	mov	r1, #632
	ldr	r0, .L25+44
	bl	initLaser
	mov	r3, #1
	mov	r2, #280
	mov	r1, #472
	ldr	r0, .L25+48
	bl	initLaser
	mov	r3, #0
	mov	r2, #296
	mov	r1, #472
	ldr	r0, .L25+52
	bl	initLaser
	mov	r3, #1
	mov	r2, #216
	mov	r1, #472
	ldr	r0, .L25+56
	bl	initLaser
	mov	r3, #1
	mov	r2, #232
	mov	r1, #472
	ldr	r0, .L25+56
	bl	initLaser
	mov	r3, #1
	mov	r2, #232
	mov	r1, #472
	ldr	r0, .L25+60
	bl	initLaser
	mov	r3, #1
	mov	r2, #216
	mov	r1, #472
	ldr	r0, .L25+64
	bl	initLaser
	mov	r3, #1
	mov	r2, #184
	mov	r1, #496
	ldr	r0, .L25+68
	bl	initLaser
	mov	r3, #0
	mov	r2, #200
	mov	r1, #496
	ldr	r0, .L25+72
	bl	initLaser
	mov	r3, #1
	mov	r2, #144
	mov	r1, #416
	ldr	r0, .L25+76
	bl	initLaser
	mov	r3, #3
	mov	r2, #136
	mov	r1, #376
	ldr	r0, .L25+80
	bl	initLaser
	mov	r3, #2
	mov	r2, #136
	mov	r1, #392
	ldr	r0, .L25+84
	bl	initLaser
	mov	r3, #3
	mov	r2, #136
	mov	r1, #344
	ldr	r0, .L25+88
	bl	initLaser
	mov	r3, #2
	mov	r2, #136
	mov	r1, #360
	ldr	r0, .L25+92
	bl	initLaser
	mov	r3, #1
	mov	r2, #112
	mov	r1, #336
	ldr	r0, .L25+96
	bl	initLaser
	mov	r3, #3
	mov	r2, #104
	mov	r1, #296
	ldr	r0, .L25+100
	bl	initLaser
	mov	r3, #2
	mov	r2, #104
	mov	r1, #312
	ldr	r0, .L25+104
	pop	{r4, r5, r6, lr}
	b	initLaser
.L26:
	.align	2
.L25:
	.word	lasers
	.word	lasers+48
	.word	lasers+96
	.word	lasers+144
	.word	lasers+192
	.word	lasers+960
	.word	lasers+1872
	.word	lasers+1920
	.word	lasers+1968
	.word	lasers+2016
	.word	lasers+2064
	.word	lasers+2112
	.word	lasers+2160
	.word	lasers+2208
	.word	lasers+2256
	.word	lasers+2304
	.word	lasers+2352
	.word	lasers+2400
	.word	lasers+2448
	.word	lasers+2496
	.word	lasers+2544
	.word	lasers+2592
	.word	lasers+2640
	.word	lasers+2688
	.word	lasers+2736
	.word	lasers+2784
	.word	lasers+2832
	.size	initAllLasers, .-initAllLasers
	.align	2
	.global	checkCollisionPlayerLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionPlayerLaser, %function
checkCollisionPlayerLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r1, r0, #16
	add	r2, r0, #8
	ldm	r1, {r1, lr}
	ldm	r2, {r2, r3}
	sub	sp, sp, #16
	ldr	ip, .L29
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L29+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	collision
	.size	checkCollisionPlayerLaser, .-checkCollisionPlayerLaser
	.align	2
	.global	updateLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLaser, %function
updateLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	add	r3, r3, #1
	cmp	r3, r2
	push	{r4, r5, r6, lr}
	str	r3, [r0, #24]
	movge	r3, #0
	ldr	r5, [r0, #32]
	strge	r3, [r0, #24]
	cmp	r5, #0
	mov	r4, r0
	beq	.L41
.L31:
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	bl	checkCollisionPlayerLaser
	cmp	r0, #0
	beq	.L31
	ldr	r3, [r4, #40]
	cmp	r3, #1
	ldr	r6, .L42
	ble	.L36
	ldr	r2, [r4, #8]
	ldr	r0, [r6, #8]
	ldr	r3, .L42+4
	sub	r0, r0, r2
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #8]
	add	r3, r3, r0, lsl #7
	str	r5, [r6, #16]
	str	r3, [r6, #8]
	b	.L31
.L36:
	ldr	r2, [r4, #12]
	ldr	r0, [r6, #12]
	ldr	r3, .L42+4
	sub	r0, r0, r2
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #12]
	add	r3, r3, r0, lsl #7
	str	r5, [r6, #20]
	str	r3, [r6, #12]
	b	.L31
.L43:
	.align	2
.L42:
	.word	player
	.word	signOf
	.size	updateLaser, .-updateLaser
	.align	2
	.global	updateAllLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAllLasers, %function
updateAllLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L53
	add	r5, r4, #2880
	b	.L46
.L45:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L52
.L46:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L45
	mov	r0, r4
	add	r4, r4, #48
	bl	updateLaser
	cmp	r4, r5
	bne	.L46
.L52:
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	lasers
	.size	updateAllLasers, .-updateAllLasers
	.global	__aeabi_idiv
	.align	2
	.global	showLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	showLaser, %function
showLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L71
	ldr	r1, [r0, #8]
	ldr	r2, [ip]
	sub	r2, r1, r2
	cmp	r2, #2544
	movle	r1, #0
	movgt	r1, #1
	mov	r3, r0
	ldr	r0, [r0, #20]
	rsb	r0, r0, #0
	cmp	r2, r0
	orrlt	r1, r1, #1
	ldr	ip, [ip, #4]
	ldr	r0, [r3, #12]
	cmp	r1, #0
	sub	r0, r0, ip
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	movne	r4, #1
	str	r2, [r3]
	str	r0, [r3, #4]
	beq	.L68
.L56:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	add	ip, r1, #3
	movlt	r1, ip
	str	r4, [r3, #32]
	lsl	ip, r0, #19
	ldr	r9, .L71+4
	ldr	r0, [r3, #24]
	asr	r1, r1, #2
	add	r7, r3, #40
	lsr	r6, ip, #23
	asr	r5, r2, #4
	mov	lr, pc
	bx	r9
	ldm	r7, {r7, r8}
	lsl	r0, r0, #16
	tst	r7, #1
	lsr	r0, r0, #16
	bne	.L57
	ldr	r3, .L71+8
	lsl	r1, r8, #3
	and	r2, r5, #255
	strh	r2, [r3, r1]	@ movhi
	cmp	r7, #1
	add	r2, r3, r1
	strh	r6, [r2, #2]	@ movhi
	ble	.L60
.L70:
	lsl	r0, r0, #21
	add	r0, r0, #720896
	lsr	r0, r0, #16
.L61:
	add	r2, r3, r1
	strh	r0, [r2, #4]	@ movhi
	cmp	r4, #0
	ldrhne	r2, [r3, r1]
	orrne	r2, r2, #512
	strhne	r2, [r3, r1]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L57:
	cmp	r7, #1
	and	r2, r5, #255
	beq	.L69
	ldr	r3, .L71+8
	lsl	r1, r8, #3
	orr	r2, r2, #16384
	strh	r2, [r3, r1]	@ movhi
	cmp	r7, #1
	add	r2, r3, r1
	strh	r6, [r2, #2]	@ movhi
	bgt	.L70
.L60:
	lsl	r0, r0, #22
	add	r0, r0, #655360
	lsr	r0, r0, #16
	b	.L61
.L68:
	cmp	r0, #3824
	movle	r4, #0
	movgt	r4, #1
	ldr	r1, [r3, #16]
	rsb	r1, r1, #0
	cmp	r0, r1
	orrlt	r4, r4, #1
	b	.L56
.L69:
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, .L71+8
	lsl	r0, r0, #22
	lsl	r1, r8, #3
	add	r0, r0, #655360
	add	r8, r3, r8, lsl #3
	strh	r2, [r3, r1]	@ movhi
	lsr	r0, r0, #16
	strh	r6, [r8, #2]	@ movhi
	b	.L61
.L72:
	.align	2
.L71:
	.word	camera
	.word	__aeabi_idiv
	.word	shadowOAM
	.size	showLaser, .-showLaser
	.align	2
	.global	showAllLasers
	.syntax unified
	.arm
	.fpu softvfp
	.type	showAllLasers, %function
showAllLasers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L82
	add	r5, r4, #2880
	b	.L75
.L74:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L81
.L75:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L74
	mov	r0, r4
	add	r4, r4, #48
	bl	showLaser
	cmp	r4, r5
	bne	.L75
.L81:
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	lasers
	.size	showAllLasers, .-showAllLasers
	.align	2
	.global	findCloseLaser
	.syntax unified
	.arm
	.fpu softvfp
	.type	findCloseLaser, %function
findCloseLaser:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r2, .L99
	add	r0, r2, #8
	ldr	r3, .L99+4
	ldm	r0, {r0, ip}
	ldr	r1, .L99+8
.L89:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L85
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L85
	ldr	r2, [r3, #32]
	cmp	r2, #1
	ldrgt	r5, [r3]
	ldrle	r5, [r3, #4]
	subgt	r5, r5, r0
	suble	r5, r5, ip
	add	r2, r5, #255
	cmp	r2, r1
	bls	.L98
.L85:
	add	r4, r4, #1
	cmp	r4, #60
	add	r3, r3, #48
	bne	.L89
	mov	r0, #0
.L84:
	pop	{r4, r5, r6, lr}
	bx	lr
.L98:
	mov	r0, #8
	ldr	r3, .L99+12
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L84
	ldr	r3, .L99+16
	add	r4, r4, r4, lsl #1
	add	r4, r3, r4, lsl #4
	stm	r0, {r4, r5}
	pop	{r4, r5, r6, lr}
	bx	lr
.L100:
	.align	2
.L99:
	.word	player
	.word	lasers+8
	.word	510
	.word	malloc
	.word	lasers
	.size	findCloseLaser, .-findCloseLaser
	.comm	nearestLaser,4,4
	.comm	lasers,2880,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	laserCount.5348, %object
	.size	laserCount.5348, 4
laserCount.5348:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

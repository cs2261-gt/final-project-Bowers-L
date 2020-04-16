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
	push	{r4, r5, r6, r7, lr}
	ldr	lr, .L13
	ldr	r4, [r0, #40]
	ldm	lr, {ip, lr}
	lsl	r2, r2, #4
	cmp	r4, #3
	sub	ip, r2, ip
	str	r2, [r0, #8]
	moveq	r2, #256
	lsl	r1, r1, #4
	sub	lr, r1, lr
	moveq	r7, #128
	stm	r0, {ip, lr}
	str	r1, [r0, #12]
	streq	r2, [r0, #16]
	beq	.L3
	mov	r2, #128
	cmp	r4, #1
	moveq	r7, #256
	movne	r7, r2
	str	r2, [r0, #16]
.L3:
	mov	r2, #1
	mov	r6, #0
	mov	r5, #60
	ldr	r4, .L13+4
	ldr	r1, [r4]
	str	r7, [r0, #20]
	lsl	lr, lr, #19
	add	r7, r1, r2
	tst	r3, #1
	add	r1, r1, #11
	str	r3, [r0, #40]
	str	r7, [r4]
	str	r1, [r0, #44]
	str	r6, [r0, #24]
	str	r5, [r0, #28]
	str	r2, [r0, #32]
	str	r2, [r0, #36]
	lsr	lr, lr, #23
	asr	ip, ip, #4
	bne	.L4
	ldr	r2, .L13+8
	lsl	r0, r1, #3
	and	ip, ip, #255
	strh	ip, [r2, r0]	@ movhi
.L5:
	cmp	r3, #1
	movgt	r3, #3
	movle	r3, #2
	add	r1, r2, r0
	add	r2, r2, r0
	strh	lr, [r1, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L4:
	cmp	r3, #1
	and	ip, ip, #255
	beq	.L12
	ldr	r2, .L13+8
	lsl	r0, r1, #3
	orr	ip, ip, #16384
	strh	ip, [r2, r0]	@ movhi
	b	.L5
.L12:
	mvn	ip, ip, lsl #17
	mvn	ip, ip, lsr #17
	mov	r3, #2
	ldr	r2, .L13+8
	lsl	r0, r1, #3
	strh	ip, [r2, r0]	@ movhi
	add	r1, r2, r1, lsl #3
	add	r2, r2, r0
	strh	lr, [r1, #2]	@ movhi
	strh	r3, [r2, #4]	@ movhi
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	camera
	.word	.LANCHOR0
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
	ldr	r3, .L24
	add	r2, r3, #3120
.L16:
	str	r1, [r3, #36]
	add	r3, r3, #48
	cmp	r2, r3
	bne	.L16
	mov	r3, #1
	mov	r2, #704
	mov	r1, #376
	ldr	r0, .L24
	bl	initLaser
	mov	r3, #1
	mov	r2, #688
	mov	r1, #376
	ldr	r0, .L24+4
	bl	initLaser
	mov	r3, #1
	mov	r2, #672
	mov	r1, #376
	ldr	r0, .L24+8
	bl	initLaser
	mov	r3, #1
	mov	r2, #656
	mov	r1, #376
	ldr	r0, .L24+12
	bl	initLaser
	mov	r6, #704
	mov	r5, #4
	ldr	r4, .L24+16
	b	.L18
.L19:
	add	r5, r5, #1
	add	r4, r4, #48
	sub	r6, r6, #16
.L18:
	mov	r0, r4
	mov	r3, #1
	mov	r2, r6
	mov	r1, #64
	bl	initLaser
	cmp	r5, #4
	add	r0, r4, #384
	beq	.L19
	mov	r3, #1
	mov	r2, r6
	mov	r1, #80
	bl	initLaser
	cmp	r5, #11
	bne	.L19
	mov	r4, #376
	ldr	r5, .L24+20
.L20:
	mov	r1, r4
	mov	r0, r5
	mov	r3, #3
	mov	r2, #656
	sub	r4, r4, #16
	bl	initLaser
	cmp	r4, #72
	add	r5, r5, #48
	bne	.L20
	mov	r3, #1
	mov	r2, #488
	mov	r1, #632
	ldr	r0, .L24+24
	bl	initLaser
	mov	r3, #1
	mov	r2, #472
	mov	r1, #632
	ldr	r0, .L24+28
	bl	initLaser
	mov	r3, #1
	mov	r2, #456
	mov	r1, #632
	ldr	r0, .L24+32
	bl	initLaser
	mov	r3, #1
	mov	r2, #448
	mov	r1, #664
	ldr	r0, .L24+36
	bl	initLaser
	mov	r3, #1
	mov	r2, #432
	mov	r1, #664
	ldr	r0, .L24+40
	bl	initLaser
	mov	r3, #1
	mov	r2, #416
	mov	r1, #632
	ldr	r0, .L24+44
	bl	initLaser
	mov	r3, #1
	mov	r2, #304
	mov	r1, #472
	ldr	r0, .L24+48
	bl	initLaser
	mov	r3, #1
	mov	r2, #288
	mov	r1, #472
	ldr	r0, .L24+52
	bl	initLaser
	mov	r3, #0
	mov	r2, #280
	mov	r1, #472
	ldr	r0, .L24+56
	bl	initLaser
	mov	r3, #1
	mov	r2, #232
	mov	r1, #472
	ldr	r0, .L24+60
	bl	initLaser
	mov	r3, #1
	mov	r2, #216
	mov	r1, #472
	ldr	r0, .L24+64
	bl	initLaser
	mov	r3, #1
	mov	r2, #200
	mov	r1, #504
	ldr	r0, .L24+68
	bl	initLaser
	mov	r3, #1
	mov	r2, #184
	mov	r1, #504
	ldr	r0, .L24+72
	bl	initLaser
	mov	r3, #1
	mov	r2, #120
	mov	r1, #504
	ldr	r0, .L24+76
	bl	initLaser
	mov	r3, #0
	mov	r2, #112
	mov	r1, #504
	ldr	r0, .L24+80
	bl	initLaser
	mov	r3, #3
	mov	r2, #112
	mov	r1, #288
	ldr	r0, .L24+84
	bl	initLaser
	mov	r3, #2
	mov	r2, #112
	mov	r1, #304
	ldr	r0, .L24+88
	bl	initLaser
	mov	r3, #3
	mov	r2, #32
	mov	r1, #464
	ldr	r0, .L24+92
	bl	initLaser
	mov	r3, #3
	mov	r2, #16
	mov	r1, #464
	ldr	r0, .L24+96
	bl	initLaser
	mov	r3, #3
	mov	r2, #0
	mov	r1, #464
	ldr	r0, .L24+100
	pop	{r4, r5, r6, lr}
	b	initLaser
.L25:
	.align	2
.L24:
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
	.word	lasers+2784
	.word	lasers+2832
	.word	lasers+2880
	.word	lasers+2928
	.word	lasers+2976
	.word	lasers+3024
	.word	lasers+3072
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
	ldr	ip, .L28
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L28+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L29:
	.align	2
.L28:
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
	beq	.L40
.L30:
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	bl	checkCollisionPlayerLaser
	cmp	r0, #0
	beq	.L30
	ldr	r3, [r4, #40]
	cmp	r3, #1
	ldr	r6, .L41
	ble	.L35
	ldr	r2, [r4, #8]
	ldr	r0, [r6, #8]
	ldr	r3, .L41+4
	sub	r0, r0, r2
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #8]
	add	r3, r3, r0, lsl #7
	str	r5, [r6, #16]
	str	r3, [r6, #8]
	b	.L30
.L35:
	ldr	r2, [r4, #12]
	ldr	r0, [r6, #12]
	ldr	r3, .L41+4
	sub	r0, r0, r2
	mov	lr, pc
	bx	r3
	ldr	r3, [r6, #12]
	add	r3, r3, r0, lsl #7
	str	r5, [r6, #20]
	str	r3, [r6, #12]
	b	.L30
.L42:
	.align	2
.L41:
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
	ldr	r4, .L52
	add	r5, r4, #3120
	b	.L45
.L44:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L51
.L45:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L44
	mov	r0, r4
	add	r4, r4, #48
	bl	updateLaser
	cmp	r4, r5
	bne	.L45
.L51:
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
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
	ldr	ip, .L70
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
	beq	.L67
.L55:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	add	ip, r1, #3
	movlt	r1, ip
	str	r4, [r3, #32]
	lsl	ip, r0, #19
	ldr	r9, .L70+4
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
	bne	.L56
	ldr	r3, .L70+8
	lsl	r1, r8, #3
	and	r2, r5, #255
	strh	r2, [r3, r1]	@ movhi
	cmp	r7, #1
	add	r2, r3, r1
	strh	r6, [r2, #2]	@ movhi
	ble	.L59
.L69:
	lsl	r0, r0, #21
	add	r0, r0, #196608
	lsr	r0, r0, #16
.L60:
	add	r2, r3, r1
	strh	r0, [r2, #4]	@ movhi
	cmp	r4, #0
	ldrhne	r2, [r3, r1]
	orrne	r2, r2, #512
	strhne	r2, [r3, r1]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L56:
	cmp	r7, #1
	and	r2, r5, #255
	beq	.L68
	ldr	r3, .L70+8
	lsl	r1, r8, #3
	orr	r2, r2, #16384
	strh	r2, [r3, r1]	@ movhi
	cmp	r7, #1
	add	r2, r3, r1
	strh	r6, [r2, #2]	@ movhi
	bgt	.L69
.L59:
	lsl	r0, r0, #22
	add	r0, r0, #131072
	lsr	r0, r0, #16
	b	.L60
.L67:
	cmp	r0, #3824
	movle	r4, #0
	movgt	r4, #1
	ldr	r1, [r3, #16]
	rsb	r1, r1, #0
	cmp	r0, r1
	orrlt	r4, r4, #1
	b	.L55
.L68:
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, .L70+8
	lsl	r0, r0, #22
	lsl	r1, r8, #3
	add	r0, r0, #131072
	add	r8, r3, r8, lsl #3
	strh	r2, [r3, r1]	@ movhi
	lsr	r0, r0, #16
	strh	r6, [r8, #2]	@ movhi
	b	.L60
.L71:
	.align	2
.L70:
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
	ldr	r4, .L81
	add	r5, r4, #3120
	b	.L74
.L73:
	add	r4, r4, #48
	cmp	r4, r5
	beq	.L80
.L74:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L73
	mov	r0, r4
	add	r4, r4, #48
	bl	showLaser
	cmp	r4, r5
	bne	.L74
.L80:
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	lasers
	.size	showAllLasers, .-showAllLasers
	.align	2
	.global	laserSling
	.syntax unified
	.arm
	.fpu softvfp
	.type	laserSling, %function
laserSling:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r5, .L95
	ldr	r3, .L95+4
	add	ip, r5, #8
	ldm	ip, {ip, lr}
	ldr	r4, .L95+8
	add	r1, r3, #3120
	b	.L87
.L94:
	ldr	r2, [r3]
	sub	r2, r2, ip
	add	r0, r2, #15
	cmp	r0, #30
	bls	.L93
.L84:
	add	r3, r3, #48
	cmp	r3, r1
	beq	.L83
.L87:
	ldr	r2, [r3, #28]
	cmp	r2, #0
	beq	.L84
	ldr	r2, [r3, #24]
	cmp	r2, #0
	bne	.L84
	ldr	r2, [r3, #32]
	cmp	r2, #1
	bgt	.L94
	ldr	r2, [r3, #4]
	sub	r2, r2, lr
	add	r0, r2, #255
	cmp	r0, r4
	bhi	.L84
	add	r2, lr, r2, lsl #1
	str	r2, [r5, #12]
.L83:
	pop	{r4, r5, lr}
	bx	lr
.L93:
	add	r2, ip, r2, lsl #1
	str	r2, [r5, #8]
	pop	{r4, r5, lr}
	bx	lr
.L96:
	.align	2
.L95:
	.word	player
	.word	lasers+8
	.word	510
	.size	laserSling, .-laserSling
	.comm	lasers,3120,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	laserCount.4321, %object
	.size	laserCount.4321, 4
laserCount.4321:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

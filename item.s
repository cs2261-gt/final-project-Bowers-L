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
	.file	"item.c"
	.text
	.align	2
	.global	initItem
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initItem, %function
initItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	mov	r7, #60
	mov	r5, #128
	mov	r8, #0
	mov	r6, #256
	ldr	lr, .L4
	ldm	lr, {ip, lr}
	lsl	r2, r2, #4
	str	r2, [r0, #8]
	sub	ip, r2, ip
	ldr	r2, .L4+4
	strb	r3, [r0, #44]
	lsl	r1, r1, #4
	ldr	r3, [r2]
	str	r1, [r0, #12]
	sub	lr, r1, lr
	ldr	r1, .L4+8
	add	r3, r3, r4
	str	r3, [r2]
	str	ip, [r0]
	str	r1, [r0, #40]
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	asr	ip, ip, #4
	and	ip, ip, #255
	str	lr, [r0, #4]
	str	r7, [r0, #28]
	str	r3, [r0, #48]
	lsl	r7, r3, #3
	and	lr, r2, lr, asr #4
	add	r3, r1, r3, lsl #3
	orr	ip, ip, #512
	str	r8, [r0, #24]
	str	r5, [r0, #16]
	str	r5, [r0, #20]
	str	r4, [r0, #32]
	str	r4, [r0, #36]
	strh	ip, [r1, r7]	@ movhi
	strh	lr, [r3, #2]	@ movhi
	strh	r6, [r3, #4]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	camera
	.word	.LANCHOR0
	.word	58409488
	.word	511
	.word	shadowOAM
	.size	initItem, .-initItem
	.align	2
	.global	initAllItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	initAllItems, %function
initAllItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r1, #0
	mov	r4, r0
	ldr	r3, .L12
	ldr	r2, .L12+4
	add	ip, r3, #520
.L7:
	str	r1, [r3, #36]
	add	r3, r3, #52
	cmp	r3, ip
	strb	r1, [r2, #1]!
	bne	.L7
	mov	r2, #1000
	mov	r3, #1
	mov	r1, r2
	ldr	r0, .L12
	bl	initItem
	mov	r3, #2
	mov	r2, #904
	mov	r1, #624
	ldr	r0, .L12+8
	bl	initItem
	mov	r3, #3
	mov	r2, #808
	mov	r1, #24
	ldr	r0, .L12+12
	bl	initItem
	mov	r3, #4
	mov	r2, #800
	mov	r1, #1008
	ldr	r0, .L12+16
	bl	initItem
	mov	r3, #5
	mov	r2, #712
	mov	r1, #224
	ldr	r0, .L12+20
	bl	initItem
	cmp	r4, #0
	bne	.L11
	pop	{r4, lr}
	bx	lr
.L11:
	mov	r3, #6
	mov	r2, #992
	mov	r1, #8
	ldr	r0, .L12+24
	pop	{r4, lr}
	b	initItem
.L13:
	.align	2
.L12:
	.word	items
	.word	playerInventory-1
	.word	items+52
	.word	items+104
	.word	items+156
	.word	items+208
	.word	items+260
	.size	initAllItems, .-initAllItems
	.align	2
	.global	checkCollisionPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollisionPlayer, %function
checkCollisionPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r1, r0, #16
	add	r2, r0, #8
	ldm	r1, {r1, lr}
	ldm	r2, {r2, r3}
	sub	sp, sp, #16
	ldr	ip, .L16
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L16+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	player
	.word	collision
	.size	checkCollisionPlayer, .-checkCollisionPlayer
	.align	2
	.global	showItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	showItem, %function
showItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L28
	ldr	r3, [r0, #8]
	ldr	r2, [ip]
	sub	r3, r3, r2
	cmp	r3, #2544
	movle	r1, #0
	movgt	r1, #1
	ldr	r2, [r0, #20]
	rsb	r2, r2, #0
	cmp	r3, r2
	orrlt	r1, r1, #1
	ldr	ip, [ip, #4]
	ldr	r2, [r0, #12]
	sub	r2, r2, ip
	cmp	r1, #0
	lsl	ip, r2, #19
	lsr	r1, r3, #4
	str	r3, [r0]
	push	{r4, r5, lr}
	str	r2, [r0, #4]
	ldr	r3, [r0, #48]
	and	r1, r1, #255
	lsr	ip, ip, #23
	beq	.L27
	mov	r2, #1
	mov	r4, #256
	ldr	lr, .L28+4
	str	r2, [r0, #32]
	add	r2, lr, r3, lsl #3
	strh	ip, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	lsl	r3, r3, #3
.L21:
	orr	r1, r1, #512
	strh	r1, [lr, r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L27:
	cmp	r2, #3824
	movle	lr, #0
	movgt	lr, #1
	ldr	r4, [r0, #16]
	rsb	r4, r4, #0
	cmp	r2, r4
	movge	r2, lr
	orrlt	r2, lr, #1
	mov	r5, #256
	ldr	lr, .L28+4
	cmp	r2, #0
	add	r4, lr, r3, lsl #3
	lsl	r3, r3, #3
	str	r2, [r0, #32]
	strh	r1, [lr, r3]	@ movhi
	strh	ip, [r4, #2]	@ movhi
	strh	r5, [r4, #4]	@ movhi
	bne	.L21
	pop	{r4, r5, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	camera
	.word	shadowOAM
	.size	showItem, .-showItem
	.align	2
	.global	showAllItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	showAllItems, %function
showAllItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L39
	push	{r4, lr}
	add	r4, r0, #520
	b	.L32
.L31:
	add	r0, r0, #52
	cmp	r0, r4
	beq	.L38
.L32:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L31
	bl	showItem
	add	r0, r0, #52
	cmp	r0, r4
	bne	.L32
.L38:
	pop	{r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	items
	.size	showAllItems, .-showAllItems
	.align	2
	.global	useItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	useItem, %function
useItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r0, r0, #1
	push	{r4, lr}
	cmp	r0, #5
	ldrls	pc, [pc, r0, asl #2]
	b	.L41
.L44:
	.word	.L49
	.word	.L48
	.word	.L47
	.word	.L46
	.word	.L45
	.word	.L43
.L43:
	ldr	r3, .L51
	mov	lr, pc
	bx	r3
.L41:
	pop	{r4, lr}
	bx	lr
.L49:
	ldr	r3, .L51+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r3, .L51+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r3, .L51+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L46:
	ldr	r3, .L51+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L45:
	ldr	r3, .L51+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	reverseGravity
	.word	equipBoots
	.word	shrinkPlayer
	.word	equipLegs
	.word	equipGloves
	.word	startLaserSling
	.size	useItem, .-useItem
	.align	2
	.global	showSelectorOnItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	showSelectorOnItem, %function
showSelectorOnItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #8
	ldr	r3, .L54
	ldr	r3, [r3, #116]
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #2
	ldr	r2, .L54+4
	add	r3, r3, ip
	ldr	r0, .L54+8
	and	r3, r3, #508
	add	r1, r2, #960
	orr	r3, r3, #16384
	add	r2, r2, #964
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	bx	lr
.L55:
	.align	2
.L54:
	.word	player
	.word	shadowOAM
	.word	321
	.size	showSelectorOnItem, .-showSelectorOnItem
	.align	2
	.global	getItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	getItem, %function
getItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	r2, #1
	push	{r4, r5, r6, lr}
	ldr	ip, .L64
	ldrb	r1, [ip]	@ zero_extendqisi2
	cmp	r1, r3
	mov	r4, r0
	str	r2, [r0, #32]
	str	r3, [r0, #36]
	beq	.L57
	add	r2, ip, r2
.L58:
	ldrb	r1, [r2], #1	@ zero_extendqisi2
	cmp	r1, #0
	add	r3, r3, #1
	bne	.L58
	mov	r5, #8
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	add	r2, r3, r3, lsl #2
	ldr	r1, [r4, #48]
	ldr	lr, .L64+4
	lsl	r2, r2, #2
	strb	r0, [ip, r3]
	add	r2, r2, r5
	lsl	ip, r0, #1
	add	r3, lr, r1, lsl #3
	lsl	r4, r1, #3
	orr	r2, r2, #16384
	add	r1, ip, #255
	cmp	r0, #5
	strh	r5, [lr, r4]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	beq	.L63
.L56:
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	mov	lr, #8
	ldrb	r3, [r0, #44]	@ zero_extendqisi2
	ldr	r2, [r0, #48]
	ldr	r1, .L64+4
	ldr	r0, .L64+8
	strb	r3, [ip]
	lsl	ip, r2, #3
	ldr	r0, [r0, #116]
	add	r2, r1, r2, lsl #3
	strh	lr, [r1, ip]	@ movhi
	lsl	r3, r3, #1
	ldr	r1, .L64+12
	add	r3, r3, #255
	strh	r3, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	bl	showSelectorOnItem
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	cmp	r0, #5
	bne	.L56
.L63:
	mov	r2, #1
	ldr	r1, .L64+16
	ldr	r0, .L64+20
	ldr	r3, .L64+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	playerInventory
	.word	shadowOAM
	.word	player
	.word	16392
	.word	2733395
	.word	mus_game2
	.word	playSoundA
	.size	getItem, .-getItem
	.align	2
	.global	updateItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateItem, %function
updateItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	add	r3, r3, r3, lsr #31
	cmp	r2, r3, asr #1
	push	{r4, r5, r6, r7, r8, lr}
	asr	r3, r3, #1
	mov	r4, r0
	ble	.L67
	mov	r1, #16
	ldr	r6, .L78
	mov	r0, #27
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	mov	r5, r0
	asr	r3, r3, #1
	mov	r1, #16
	mov	r0, #27
	ldr	r2, [r4, #24]
	mov	lr, pc
	bx	r6
	ldr	r3, .L78+4
	orr	r5, r5, r0, lsl #5
	strh	r5, [r3, #4]	@ movhi
.L68:
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	movgt	r3, #0
	strgt	r3, [r4, #24]
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L77
.L66:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L67:
	ldr	r7, .L78
	mov	r1, #27
	mov	r0, #16
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	mov	r5, r0
	mov	r1, #27
	ldr	r2, [r4, #24]
	asr	r3, r3, #1
	mov	r0, #16
	mov	lr, pc
	bx	r7
	ldr	r3, [r4, #28]
	add	r3, r3, r3, lsr #31
	mov	r6, r0
	ldr	r2, [r4, #24]
	asr	r3, r3, #1
	mov	r1, #0
	mov	r0, #16
	mov	lr, pc
	bx	r7
	lsl	r3, r0, #10
	ldr	r2, .L78+4
	orr	r3, r3, r6, lsl #5
	orr	r0, r3, r5
	strh	r0, [r2, #4]	@ movhi
	b	.L68
.L77:
	mov	r0, r4
	bl	checkCollisionPlayer
	cmp	r0, #0
	beq	.L66
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	getItem
.L79:
	.align	2
.L78:
	.word	lerp
	.word	83886592
	.size	updateItem, .-updateItem
	.align	2
	.global	updateAllItems
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateAllItems, %function
updateAllItems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L89
	add	r5, r4, #520
	b	.L82
.L81:
	add	r4, r4, #52
	cmp	r4, r5
	beq	.L88
.L82:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L81
	mov	r0, r4
	add	r4, r4, #52
	bl	updateItem
	cmp	r4, r5
	bne	.L82
.L88:
	pop	{r4, r5, r6, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	items
	.size	updateAllItems, .-updateAllItems
	.comm	playerInventory,10,4
	.comm	items,520,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	itemCount.5331, %object
	.size	itemCount.5331, 4
itemCount.5331:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

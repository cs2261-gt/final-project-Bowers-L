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
	push	{r4, r5, r6, r7, r8, r9, lr}
	mov	r5, #60
	mov	lr, #128
	mov	ip, #1
	mov	r7, #0
	mov	r4, #9
	ldr	r8, .L4
	strb	r3, [r0, #44]
	ldr	r6, .L4+4
	ldr	r3, [r8, #4]
	ldr	r9, [r8]
	str	r5, [r0, #28]
	lsl	r1, r1, #4
	ldr	r5, .L4+8
	str	r1, [r0, #12]
	lsl	r2, r2, #4
	sub	r1, r1, r3
	ldr	r3, [r6]
	str	r2, [r0, #8]
	str	r5, [r0, #40]
	str	lr, [r0, #16]
	str	lr, [r0, #20]
	ldr	r5, .L4+12
	sub	r2, r2, r9
	ldr	lr, .L4+16
	str	r2, [r0]
	add	r3, r3, ip
	asr	r2, r2, #4
	str	r3, [r6]
	str	r1, [r0, #4]
	str	r3, [r0, #48]
	lsl	r6, r3, #3
	and	r1, lr, r1, asr #4
	add	r3, r5, r3, lsl #3
	and	r2, r2, #255
	str	r7, [r0, #24]
	str	ip, [r0, #32]
	str	ip, [r0, #36]
	strh	r2, [r5, r6]	@ movhi
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	camera
	.word	.LANCHOR0
	.word	58409488
	.word	shadowOAM
	.word	511
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
	mov	r2, #1000
	mov	ip, #0
	push	{r4, lr}
	ldr	r4, .L8
	ldr	lr, .L8+4
	mov	r1, r2
	mov	r0, r4
	mov	r3, #1
	str	ip, [r4, #36]
	str	ip, [r4, #88]
	str	ip, [r4, #140]
	str	ip, [r4, #192]
	str	ip, [r4, #244]
	strb	ip, [lr]
	strb	ip, [lr, #1]
	strb	ip, [lr, #2]
	strb	ip, [lr, #3]
	strb	ip, [lr, #4]
	bl	initItem
	add	r0, r4, #52
	mov	r3, #2
	mov	r2, #904
	mov	r1, #624
	bl	initItem
	add	r0, r4, #104
	mov	r3, #3
	mov	r2, #808
	mov	r1, #24
	bl	initItem
	add	r0, r4, #156
	mov	r3, #4
	mov	r2, #800
	mov	r1, #1008
	bl	initItem
	add	r0, r4, #208
	mov	r3, #5
	mov	r2, #712
	mov	r1, #224
	pop	{r4, lr}
	b	initItem
.L9:
	.align	2
.L8:
	.word	items
	.word	playerInventory
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
	ldr	ip, .L12
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L12+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	collision
	.size	checkCollisionPlayer, .-checkCollisionPlayer
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
	ble	.L15
	mov	r1, #16
	ldr	r6, .L32
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
	ldr	r3, .L32+4
	orr	r5, r5, r0, lsl #5
	strh	r5, [r3, #4]	@ movhi
.L16:
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	movgt	r3, #0
	ldr	r5, [r4, #32]
	strgt	r3, [r4, #24]
	cmp	r5, #0
	beq	.L31
.L14:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L15:
	ldr	r7, .L32
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
	ldr	r2, .L32+4
	orr	r3, r3, r6, lsl #5
	orr	r0, r3, r5
	strh	r0, [r2, #4]	@ movhi
	b	.L16
.L31:
	mov	r0, r4
	bl	checkCollisionPlayer
	cmp	r0, #0
	beq	.L14
	mov	ip, #1
	ldr	r3, [r4, #48]
	ldr	r0, .L32+8
	ldr	r1, .L32+12
	lsl	r3, r3, #3
	ldrh	r2, [r0, r3]
	ldrb	lr, [r1]	@ zero_extendqisi2
	orr	r2, r2, #512
	cmp	lr, #0
	str	r5, [r4, #36]
	str	ip, [r4, #32]
	strh	r2, [r0, r3]	@ movhi
	beq	.L21
	add	r3, r1, ip
.L22:
	ldrb	r2, [r3], #1	@ zero_extendqisi2
	cmp	r2, #0
	add	r5, r5, #1
	bne	.L22
.L21:
	ldrb	r3, [r4, #44]	@ zero_extendqisi2
	strb	r3, [r1, r5]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	lerp
	.word	83886592
	.word	shadowOAM
	.word	playerInventory
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
	ldr	r4, .L43
	add	r5, r4, #260
.L36:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L42
.L35:
	add	r4, r4, #52
	cmp	r4, r5
	bne	.L36
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	mov	r0, r4
	bl	updateItem
	b	.L35
.L44:
	.align	2
.L43:
	.word	items
	.size	updateAllItems, .-updateAllItems
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
	ldr	ip, .L55
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
	beq	.L54
	mov	r2, #1
	mov	r4, #256
	ldr	lr, .L55+4
	str	r2, [r0, #32]
	add	r2, lr, r3, lsl #3
	strh	ip, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	lsl	r3, r3, #3
.L48:
	orr	r1, r1, #512
	strh	r1, [lr, r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L54:
	cmp	r2, #3824
	movle	lr, #0
	movgt	lr, #1
	ldr	r4, [r0, #16]
	rsb	r4, r4, #0
	cmp	r2, r4
	movge	r2, lr
	orrlt	r2, lr, #1
	mov	r5, #256
	ldr	lr, .L55+4
	cmp	r2, #0
	add	r4, lr, r3, lsl #3
	lsl	r3, r3, #3
	str	r2, [r0, #32]
	strh	r1, [lr, r3]	@ movhi
	strh	ip, [r4, #2]	@ movhi
	strh	r5, [r4, #4]	@ movhi
	bne	.L48
	pop	{r4, r5, lr}
	bx	lr
.L56:
	.align	2
.L55:
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
	ldr	r0, .L66
	push	{r4, lr}
	add	r4, r0, #260
.L59:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bne	.L65
.L58:
	add	r0, r0, #52
	cmp	r0, r4
	bne	.L59
	pop	{r4, lr}
	bx	lr
.L65:
	bl	showItem
	b	.L58
.L67:
	.align	2
.L66:
	.word	items
	.size	showAllItems, .-showAllItems
	.align	2
	.global	equipItem
	.syntax unified
	.arm
	.fpu softvfp
	.type	equipItem, %function
equipItem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #1
	mov	r3, #0
	ldr	r2, [r0, #48]
	ldr	lr, .L74
	ldr	ip, .L74+4
	lsl	r2, r2, #3
	ldrh	r1, [lr, r2]
	str	r4, [r0, #32]
	ldrb	r4, [ip]	@ zero_extendqisi2
	orr	r1, r1, #512
	cmp	r4, r3
	str	r3, [r0, #36]
	moveq	r3, r4
	strh	r1, [lr, r2]	@ movhi
	beq	.L69
	add	r2, ip, #1
.L70:
	ldrb	r1, [r2], #1	@ zero_extendqisi2
	cmp	r1, #0
	add	r3, r3, #1
	bne	.L70
.L69:
	ldrb	r2, [r0, #44]	@ zero_extendqisi2
	pop	{r4, lr}
	strb	r2, [ip, r3]
	bx	lr
.L75:
	.align	2
.L74:
	.word	shadowOAM
	.word	playerInventory
	.size	equipItem, .-equipItem
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
	cmp	r0, #3
	ldrls	pc, [pc, r0, asl #2]
	b	.L76
.L79:
	.word	.L82
	.word	.L81
	.word	.L80
	.word	.L78
.L78:
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
.L76:
	pop	{r4, lr}
	bx	lr
.L82:
	ldr	r3, .L84+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L81:
	ldr	r3, .L84+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L80:
	ldr	r3, .L84+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	equipGloves
	.word	equipBoots
	.word	shrinkPlayer
	.word	equipLegs
	.size	useItem, .-useItem
	.comm	playerInventory,5,4
	.comm	items,260,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	itemCount.4266, %object
	.size	itemCount.4266, 4
itemCount.4266:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

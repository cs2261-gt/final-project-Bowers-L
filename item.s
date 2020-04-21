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
	ldr	lr, .L6
	ldr	ip, [lr]
	add	ip, ip, #1
	cmp	ip, #6
	movgt	r4, #1
	strgt	r4, [lr]
	movgt	ip, r4
	mov	r4, #128
	strle	ip, [lr]
	mov	r7, #0
	mov	lr, #1
	mov	r6, #60
	mov	r5, #256
	ldr	r8, .L6+4
	strb	r3, [r0, #44]
	ldr	r3, [r8, #4]
	ldr	r9, [r8]
	lsl	r1, r1, #4
	str	r1, [r0, #12]
	lsl	r2, r2, #4
	sub	r1, r1, r3
	ldr	r3, .L6+8
	str	r2, [r0, #8]
	sub	r2, r2, r9
	str	r2, [r0]
	str	r1, [r0, #4]
	str	r4, [r0, #16]
	str	r4, [r0, #20]
	and	r1, r3, r1, asr #4
	ldr	r4, .L6+12
	ldr	r3, .L6+16
	asr	r2, r2, #4
	and	r2, r2, #255
	str	ip, [r0, #48]
	str	r3, [r0, #40]
	orr	r2, r2, #512
	lsl	r3, ip, #3
	add	ip, r4, ip, lsl #3
	str	r7, [r0, #24]
	str	r6, [r0, #28]
	str	lr, [r0, #32]
	str	lr, [r0, #36]
	strh	r2, [r4, r3]	@ movhi
	strh	r5, [ip, #4]	@ movhi
	strh	r1, [ip, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LANCHOR0
	.word	camera
	.word	511
	.word	shadowOAM
	.word	58409488
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
	ldr	r3, .L14
	ldr	r2, .L14+4
	add	ip, r3, #312
.L9:
	str	r1, [r3, #36]
	add	r3, r3, #52
	cmp	r3, ip
	strb	r1, [r2, #1]!
	bne	.L9
	mov	r2, #1000
	mov	r3, #1
	mov	r1, r2
	ldr	r0, .L14
	bl	initItem
	mov	r3, #2
	mov	r2, #904
	mov	r1, #624
	ldr	r0, .L14+8
	bl	initItem
	mov	r3, #3
	mov	r2, #808
	mov	r1, #24
	ldr	r0, .L14+12
	bl	initItem
	mov	r3, #4
	mov	r2, #800
	mov	r1, #1008
	ldr	r0, .L14+16
	bl	initItem
	mov	r3, #5
	mov	r2, #712
	mov	r1, #224
	ldr	r0, .L14+20
	bl	initItem
	cmp	r4, #0
	bne	.L13
	pop	{r4, lr}
	bx	lr
.L13:
	mov	r3, #6
	mov	r2, #992
	mov	r1, #8
	ldr	r0, .L14+24
	pop	{r4, lr}
	b	initItem
.L15:
	.align	2
.L14:
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
	ldr	ip, .L18
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	lr, [sp, #12]
	str	r3, [sp]
	add	r2, ip, #24
	ldm	r2, {r2, r3}
	ldr	r1, [ip, #8]
	ldr	r0, [ip, #12]
	ldr	r4, .L18+4
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
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
	ldr	ip, .L30
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
	beq	.L29
	mov	r2, #1
	mov	r4, #256
	ldr	lr, .L30+4
	str	r2, [r0, #32]
	add	r2, lr, r3, lsl #3
	strh	ip, [r2, #2]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	lsl	r3, r3, #3
.L23:
	orr	r1, r1, #512
	strh	r1, [lr, r3]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L29:
	cmp	r2, #3824
	movle	lr, #0
	movgt	lr, #1
	ldr	r4, [r0, #16]
	rsb	r4, r4, #0
	cmp	r2, r4
	movge	r2, lr
	orrlt	r2, lr, #1
	mov	r5, #256
	ldr	lr, .L30+4
	cmp	r2, #0
	add	r4, lr, r3, lsl #3
	lsl	r3, r3, #3
	str	r2, [r0, #32]
	strh	r1, [lr, r3]	@ movhi
	strh	ip, [r4, #2]	@ movhi
	strh	r5, [r4, #4]	@ movhi
	bne	.L23
	pop	{r4, r5, lr}
	bx	lr
.L31:
	.align	2
.L30:
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
	ldr	r0, .L41
	push	{r4, lr}
	add	r4, r0, #312
	b	.L34
.L33:
	add	r0, r0, #52
	cmp	r0, r4
	beq	.L40
.L34:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L33
	bl	showItem
	add	r0, r0, #52
	cmp	r0, r4
	bne	.L34
.L40:
	pop	{r4, lr}
	bx	lr
.L42:
	.align	2
.L41:
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
	b	.L43
.L46:
	.word	.L51
	.word	.L50
	.word	.L49
	.word	.L48
	.word	.L47
	.word	.L45
.L45:
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
.L43:
	pop	{r4, lr}
	bx	lr
.L51:
	ldr	r3, .L53+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L50:
	ldr	r3, .L53+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L49:
	ldr	r3, .L53+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L48:
	ldr	r3, .L53+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r3, .L53+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
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
	ldr	r3, .L56
	ldr	r3, [r3, #108]
	add	r3, r3, r3, lsl #2
	lsl	r3, r3, #2
	ldr	r2, .L56+4
	add	r3, r3, ip
	ldr	r0, .L56+8
	and	r3, r3, #508
	add	r1, r2, #960
	orr	r3, r3, #16384
	add	r2, r2, #964
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r0, [r2]	@ movhi
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	ip, .L66
	ldrb	r1, [ip]	@ zero_extendqisi2
	cmp	r1, r3
	mov	r4, r0
	str	r2, [r0, #32]
	str	r3, [r0, #36]
	beq	.L59
	add	r2, ip, r2
.L60:
	ldrb	r1, [r2], #1	@ zero_extendqisi2
	cmp	r1, #0
	add	r3, r3, #1
	bne	.L60
	mov	r5, #8
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	add	r2, r3, r3, lsl #2
	ldr	r1, [r4, #48]
	ldr	lr, .L66+4
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
	beq	.L65
.L58:
	pop	{r4, r5, r6, lr}
	bx	lr
.L59:
	mov	lr, #8
	ldrb	r3, [r0, #44]	@ zero_extendqisi2
	ldr	r2, [r0, #48]
	ldr	r1, .L66+4
	ldr	r0, .L66+8
	strb	r3, [ip]
	lsl	ip, r2, #3
	ldr	r0, [r0, #108]
	add	r2, r1, r2, lsl #3
	strh	lr, [r1, ip]	@ movhi
	lsl	r3, r3, #1
	ldr	r1, .L66+12
	add	r3, r3, #255
	strh	r3, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	bl	showSelectorOnItem
	ldrb	r0, [r4, #44]	@ zero_extendqisi2
	cmp	r0, #5
	bne	.L58
.L65:
	mov	r2, #1
	ldr	r1, .L66+16
	ldr	r0, .L66+20
	ldr	r3, .L66+24
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L67:
	.align	2
.L66:
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
	ble	.L69
	mov	r1, #16
	ldr	r6, .L80
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
	ldr	r3, .L80+4
	orr	r5, r5, r0, lsl #5
	strh	r5, [r3, #4]	@ movhi
.L70:
	ldr	r3, [r4, #24]
	ldr	r2, [r4, #28]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #24]
	movgt	r3, #0
	strgt	r3, [r4, #24]
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L79
.L68:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L69:
	ldr	r7, .L80
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
	ldr	r2, .L80+4
	orr	r3, r3, r6, lsl #5
	orr	r0, r3, r5
	strh	r0, [r2, #4]	@ movhi
	b	.L70
.L79:
	mov	r0, r4
	bl	checkCollisionPlayer
	cmp	r0, #0
	beq	.L68
	mov	r0, r4
	pop	{r4, r5, r6, r7, r8, lr}
	b	getItem
.L81:
	.align	2
.L80:
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
	ldr	r4, .L91
	add	r5, r4, #312
	b	.L84
.L83:
	add	r4, r4, #52
	cmp	r4, r5
	beq	.L90
.L84:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L83
	mov	r0, r4
	add	r4, r4, #52
	bl	updateItem
	cmp	r4, r5
	bne	.L84
.L90:
	pop	{r4, r5, r6, lr}
	bx	lr
.L92:
	.align	2
.L91:
	.word	items
	.size	updateAllItems, .-updateAllItems
	.comm	playerInventory,6,4
	.comm	items,312,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	itemCount.5329, %object
	.size	itemCount.5329, 4
itemCount.5329:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

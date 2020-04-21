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
	.file	"camera.c"
	.text
	.align	2
	.global	initCamera
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCamera, %function
initCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	asr	r3, r0, #4
	mov	ip, r0
	cmp	r3, #0
	add	r0, r3, #255
	movlt	r3, r0
	push	{r4, r5, r6, lr}
	mov	r4, r1
	ldr	r5, .L4
	ldr	r6, .L4+4
	mov	r2, #2
	mov	r1, #0
	asr	r0, r3, #8
	stm	r5, {r4, ip}
	mov	lr, pc
	bx	r6
	asr	r1, r4, #4
	mov	r3, r0
	cmp	r1, #0
	add	r0, r1, #255
	movlt	r1, r0
	mov	r2, #2
	asr	r0, r1, #8
	mov	r1, #0
	str	r3, [r5, #12]
	mov	lr, pc
	bx	r6
	str	r0, [r5, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	camera
	.word	clamp
	.size	initCamera, .-initCamera
	.align	2
	.global	updateSBB
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSBB, %function
updateSBB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L32
	ldr	r1, [r4, #12]
	ldr	r3, [r4, #4]
	cmp	r1, #0
	asr	ip, r3, #4
	lsl	r0, r1, #8
	movle	r2, #0
	movgt	r2, #1
	cmp	ip, r0
	movge	r2, #0
	cmp	r2, #0
	moveq	r2, ip
	bne	.L29
.L7:
	add	r3, r1, #1
	lsl	r0, r3, #8
	cmp	r1, #1
	cmple	r0, r2
	blt	.L30
.L10:
	ldr	r3, [r4, #8]
	ldr	r2, [r4]
	lsl	r1, r3, #8
	cmp	r3, #0
	asr	ip, r2, #4
	movle	r0, #0
	movgt	r0, #1
	cmp	ip, r1
	movge	r0, #0
	cmp	r0, #0
	mov	r2, ip
	subne	ip, r3, #1
	movne	r0, r3
	movne	r3, ip
	addeq	r0, r3, #1
	strne	ip, [r4, #8]
	addeq	r1, r1, #256
	cmp	r3, #1
	movle	r3, #1
	movgt	r3, #0
	cmp	r2, r1
	movle	r3, #0
	cmp	r3, #0
	strne	r0, [r4, #8]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L29:
	mov	r7, #2
	sub	r1, r1, #1
	str	r1, [r4, #12]
	ldr	r6, .L32+4
	ldr	r5, .L32+8
.L9:
	add	r2, r7, r1
	lsl	r2, r2, #11
	add	r1, r1, r7, lsl #1
	add	r2, r2, #100663296
	mov	r3, #1024
	mov	r0, #3
	add	r2, r2, #45056
	add	r1, r6, r1, lsl #11
	add	r7, r7, #2
	mov	lr, pc
	bx	r5
	cmp	r7, #8
	ldrne	r1, [r4, #12]
	bne	.L9
.L31:
	ldr	r3, [r4, #4]
	ldr	r1, [r4, #12]
	asr	r2, r3, #4
	b	.L7
.L30:
	mov	r7, #0
	str	r3, [r4, #12]
	ldr	r6, .L32+4
	ldr	r5, .L32+8
.L11:
	add	r3, r3, #1
	add	r2, r7, r3
	lsl	r2, r2, #11
	add	r3, r3, r7, lsl #1
	add	r2, r2, #100663296
	add	r1, r6, r3, lsl #11
	mov	r0, #3
	mov	r3, #1024
	add	r2, r2, #45056
	add	r7, r7, #2
	mov	lr, pc
	bx	r5
	cmp	r7, #6
	beq	.L10
	ldr	r3, [r4, #12]
	b	.L11
.L33:
	.align	2
.L32:
	.word	camera
	.word	mapMap
	.word	DMANow
	.size	updateSBB, .-updateSBB
	.align	2
	.global	centerCameraToPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	centerCameraToPlayer, %function
centerCameraToPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L44
	ldr	r3, [r4, #20]
	cmp	r3, #0
	blt	.L40
	bne	.L41
.L36:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L42
	beq	.L34
	ldr	r5, .L44+4
	ldr	r2, .L44+8
	ldr	r0, [r5]
	cmp	r0, r2
	bgt	.L34
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1280
	bgt	.L43
.L34:
	pop	{r4, r5, r6, lr}
	bx	lr
.L41:
	ldr	r5, .L44+4
	ldr	r2, .L44+12
	ldr	r0, [r5, #4]
	cmp	r0, r2
	bgt	.L36
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1920
	ble	.L36
	add	r0, r3, r0
	mov	r1, #12544
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	str	r0, [r5, #4]
	b	.L36
.L42:
	ldr	r5, .L44+4
	ldr	r0, [r5]
	cmp	r0, #0
	ble	.L34
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1280
	bge	.L34
	add	r0, r3, r0
	mov	r1, #0
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	str	r0, [r5]
	b	.L34
.L40:
	ldr	r5, .L44+4
	ldr	r0, [r5, #4]
	cmp	r0, #0
	ble	.L36
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1920
	bge	.L36
	add	r0, r3, r0
	mov	r1, #0
	ldr	r3, .L44+20
	mov	lr, pc
	bx	r3
	str	r0, [r5, #4]
	b	.L36
.L43:
	add	r0, r3, r0
	mov	r1, #13824
	ldr	r3, .L44+16
	mov	lr, pc
	bx	r3
	str	r0, [r5]
	b	.L34
.L45:
	.align	2
.L44:
	.word	player
	.word	camera
	.word	13839
	.word	12559
	.word	min
	.word	max
	.size	centerCameraToPlayer, .-centerCameraToPlayer
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
	ldr	r3, .L56
	ldrh	r1, [r3, #48]
	ands	r1, r1, #32
	push	{r4, lr}
	bne	.L47
	ldr	r4, .L56+4
	ldr	r0, [r4, #4]
	cmp	r0, #0
	bgt	.L52
.L47:
	ldr	r3, .L56
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L48
	ldr	r4, .L56+4
	ldr	r0, [r4, #4]
	cmp	r0, #12544
	blt	.L53
.L48:
	ldr	r3, .L56
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	bne	.L49
	ldr	r4, .L56+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L54
.L49:
	ldr	r3, .L56
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L46
	ldr	r4, .L56+4
	ldr	r0, [r4]
	cmp	r0, #13824
	blt	.L55
.L46:
	pop	{r4, lr}
	bx	lr
.L54:
	ldr	r3, .L56+8
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L49
.L52:
	ldr	r3, .L56+8
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4, #4]
	b	.L47
.L53:
	mov	r1, #12544
	ldr	r3, .L56+12
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4, #4]
	b	.L48
.L55:
	mov	r1, #13824
	ldr	r3, .L56+12
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	pop	{r4, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	67109120
	.word	camera
	.word	max
	.word	min
	.size	cameraDebug, .-cameraDebug
	.align	2
	.global	updateCamera
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCamera, %function
updateCamera:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L62
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L59
	bl	cameraDebug
	pop	{r4, lr}
	b	updateSBB
.L59:
	bl	centerCameraToPlayer
	pop	{r4, lr}
	b	updateSBB
.L63:
	.align	2
.L62:
	.word	debug
	.size	updateCamera, .-updateCamera
	.comm	camera,16,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

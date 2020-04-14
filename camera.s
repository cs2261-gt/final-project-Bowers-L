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
	@ link register save eliminated.
	ldr	r3, .L3
	str	r0, [r3, #4]
	str	r1, [r3]
	bx	lr
.L4:
	.align	2
.L3:
	.word	camera
	.size	initCamera, .-initCamera
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L15
	ldr	r3, [r4, #20]
	cmp	r3, #0
	blt	.L11
	bne	.L12
.L7:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	blt	.L13
	beq	.L5
	ldr	r5, .L15+4
	ldr	r2, .L15+8
	ldr	r0, [r5]
	cmp	r0, r2
	bgt	.L5
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1280
	bgt	.L14
.L5:
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	ldr	r5, .L15+4
	ldr	r2, .L15+12
	ldr	r0, [r5, #4]
	cmp	r0, r2
	bgt	.L7
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1920
	ble	.L7
	add	r0, r3, r0
	mov	r1, #4352
	ldr	r3, .L15+16
	mov	lr, pc
	bx	r3
	str	r0, [r5, #4]
	b	.L7
.L13:
	ldr	r5, .L15+4
	ldr	r0, [r5]
	cmp	r0, #0
	ble	.L5
	ldr	r2, [r4, #28]
	ldr	r1, [r4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1280
	bge	.L5
	add	r0, r3, r0
	mov	r1, #0
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	str	r0, [r5]
	b	.L5
.L11:
	ldr	r5, .L15+4
	ldr	r0, [r5, #4]
	cmp	r0, #0
	ble	.L7
	ldr	r2, [r4, #24]
	ldr	r1, [r4, #4]
	add	r2, r2, r2, lsr #31
	add	r2, r1, r2, asr #1
	cmp	r2, #1920
	bge	.L7
	add	r0, r3, r0
	mov	r1, #0
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	str	r0, [r5, #4]
	b	.L7
.L14:
	add	r0, r3, r0
	mov	r1, #5632
	ldr	r3, .L15+16
	mov	lr, pc
	bx	r3
	str	r0, [r5]
	b	.L5
.L16:
	.align	2
.L15:
	.word	player
	.word	camera
	.word	5647
	.word	4367
	.word	min
	.word	max
	.size	updateCamera, .-updateCamera
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
	ldr	r3, .L27
	ldrh	r1, [r3, #48]
	ands	r1, r1, #32
	push	{r4, lr}
	bne	.L18
	ldr	r4, .L27+4
	ldr	r0, [r4, #4]
	cmp	r0, #0
	bgt	.L23
.L18:
	ldr	r3, .L27
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L19
	ldr	r4, .L27+4
	ldr	r0, [r4, #4]
	cmp	r0, #4352
	blt	.L24
.L19:
	ldr	r3, .L27
	ldrh	r1, [r3, #48]
	ands	r1, r1, #64
	bne	.L20
	ldr	r4, .L27+4
	ldr	r0, [r4]
	cmp	r0, #0
	bgt	.L25
.L20:
	ldr	r3, .L27
	ldrh	r3, [r3, #48]
	tst	r3, #128
	bne	.L17
	ldr	r4, .L27+4
	ldr	r0, [r4]
	cmp	r0, #5632
	blt	.L26
.L17:
	pop	{r4, lr}
	bx	lr
.L25:
	ldr	r3, .L27+8
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	b	.L20
.L23:
	ldr	r3, .L27+8
	sub	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4, #4]
	b	.L18
.L24:
	mov	r1, #4352
	ldr	r3, .L27+12
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4, #4]
	b	.L19
.L26:
	mov	r1, #5632
	ldr	r3, .L27+12
	add	r0, r0, #32
	mov	lr, pc
	bx	r3
	str	r0, [r4]
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	67109120
	.word	camera
	.word	max
	.word	min
	.size	cameraDebug, .-cameraDebug
	.comm	camera,8,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

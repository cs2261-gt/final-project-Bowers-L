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
	.file	"sound.c"
	.text
	.align	2
	.global	setupSounds
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L3
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L4:
	.align	2
.L3:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L7+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #20]
	mov	r0, #1
	mov	r3, #910163968
	ldr	r2, .L7+12
	ldr	r4, .L7+16
	mov	lr, pc
	bx	r4
	mvn	ip, #1520
	mov	r2, #1
	mov	r0, #128
	ldr	r4, .L7+20
	ldr	r3, .L7+24
	ldr	r1, .L7+28
	strh	r7, [r3, #2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	mov	r0, r5
	str	r6, [r4]
	ldr	r3, .L7+32
	str	r8, [r4, #16]
	str	r1, [r4, #8]
	mov	lr, pc
	bx	r3
	ldr	r5, .L7+36
	adr	r3, .L7
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L7+40
	ldr	r3, .L7+44
	mov	lr, pc
	bx	r5
	ldr	r3, .L7+48
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L8:
	.align	3
.L7:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109024
	.word	DMANow
	.word	soundA
	.word	67109120
	.word	11025
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #0
	ldr	r3, .L11+8
	ldr	r3, [r3]
	mov	r5, r1
	mov	r6, r0
	mov	r8, r2
	mov	r1, r0
	str	r7, [r3, #32]
	mov	r0, #2
	mov	r3, #910163968
	ldr	r2, .L11+12
	ldr	r4, .L11+16
	mov	lr, pc
	bx	r4
	mvn	ip, #1520
	mov	r2, #1
	mov	r0, #128
	ldr	r4, .L11+20
	ldr	r3, .L11+24
	ldr	r1, .L11+28
	strh	r7, [r3, #6]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	strh	r0, [r3, #6]	@ movhi
	str	r5, [r4, #4]
	str	r2, [r4, #12]
	mov	r0, r5
	str	r6, [r4]
	ldr	r3, .L11+32
	str	r8, [r4, #16]
	str	r1, [r4, #8]
	mov	lr, pc
	bx	r3
	ldr	r5, .L11+36
	adr	r3, .L11
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r5, .L11+40
	ldr	r3, .L11+44
	mov	lr, pc
	bx	r5
	ldr	r3, .L11+48
	mov	lr, pc
	bx	r3
	str	r7, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L12:
	.align	3
.L11:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109028
	.word	DMANow
	.word	soundB
	.word	67109120
	.word	11025
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	1086687360
	.word	__aeabi_d2iz
	.size	playSoundB, .-playSoundB
	.align	2
	.global	handleSoundVBlank
	.syntax unified
	.arm
	.fpu softvfp
	.type	handleSoundVBlank, %function
handleSoundVBlank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L26
	ldr	r2, [r3, #12]
	cmp	r2, #0
	push	{r4, lr}
	beq	.L15
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	bgt	.L23
.L15:
	ldr	r3, .L26+4
	ldr	r2, [r3, #12]
	cmp	r2, #0
	beq	.L13
	ldr	r2, [r3, #28]
	ldr	r1, [r3, #20]
	add	r2, r2, #1
	cmp	r2, r1
	str	r2, [r3, #28]
	ble	.L13
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L24
	ldr	r0, .L26+8
	ldr	r1, .L26+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L13:
	pop	{r4, lr}
	bx	lr
.L23:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	bne	.L25
	ldr	r0, .L26+8
	ldr	r1, .L26+12
	ldr	r0, [r0]
	str	r2, [r3, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
	b	.L15
.L25:
	ldm	r3, {r0, r1}
	bl	playSoundA
	b	.L15
.L24:
	ldm	r3, {r0, r1}
	pop	{r4, lr}
	b	playSoundB
.L27:
	.align	2
.L26:
	.word	soundA
	.word	soundB
	.word	dma
	.word	67109120
	.size	handleSoundVBlank, .-handleSoundVBlank
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L29
	ldr	r0, .L29+4
	ldr	r1, .L29+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L32
	ldr	ip, .L32+4
	ldr	r0, .L32+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L33:
	.align	2
.L32:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L35
	ldr	ip, .L35+4
	strh	r3, [r2, #2]	@ movhi
	ldr	r0, .L35+8
	strh	r3, [r2, #6]	@ movhi
	ldr	r1, .L35+12
	ldr	r2, [ip]
	str	r3, [r0, #12]
	str	r3, [r2, #20]
	str	r3, [r1, #12]
	str	r3, [r2, #32]
	bx	lr
.L36:
	.align	2
.L35:
	.word	67109120
	.word	dma
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"

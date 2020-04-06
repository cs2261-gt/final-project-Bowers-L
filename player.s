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
	.file	"player.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	mov	lr, #4096
	ldr	r2, .L4
	ldr	r0, [r2]
	ldr	r3, .L4+4
	rsb	r0, r0, #0
	ldr	r2, [r3]
	ldr	ip, .L4+8
	asr	r3, r0, #8
	ldr	r4, .L4+12
	orr	r3, r3, #16384
	strh	r3, [ip, #2]	@ movhi
	ldr	r3, .L4+16
	sub	r2, r4, r2
	strh	r1, [ip, #4]	@ movhi
	str	r2, [r3]
	asr	r2, r2, #8
	str	r0, [r3, #4]
	strh	r2, [ip]	@ movhi
	str	r4, [r3, #8]
	str	lr, [r3, #24]
	str	lr, [r3, #28]
	str	r1, [r3, #12]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #52]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	120576
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L12
	ldr	r1, .L12+4
	ldr	lr, [r3, #8]
	ldr	r2, [r3, #16]
	ldr	ip, [r1]
	ldr	r1, .L12+8
	ldr	r0, [r3, #12]
	add	lr, lr, r2
	ldr	r2, [r3, #20]
	ldr	r1, [r1]
	sub	ip, lr, ip
	str	lr, [r3, #8]
	add	r0, r0, r2
	ldr	lr, [r3, #52]
	asr	r2, ip, #8
	str	ip, [r3]
	sub	r1, r0, r1
	ldr	ip, .L12+12
	lsl	r2, r2, #16
	str	r0, [r3, #12]
	lsr	r2, r2, #16
	cmp	lr, r4
	asr	r0, r1, #8
	strh	r2, [ip]	@ movhi
	orr	r0, r0, #16384
	orrne	r2, r2, #512
	str	r1, [r3, #4]
	strh	r4, [ip, #4]	@ movhi
	strh	r0, [ip, #2]	@ movhi
	strhne	r2, [ip]	@ movhi
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	player
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	handlePlayerInput
	.syntax unified
	.arm
	.fpu softvfp
	.type	handlePlayerInput, %function
handlePlayerInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	handlePlayerInput, .-handlePlayerInput
	.ident	"GCC: (devkitARM release 53) 9.1.0"

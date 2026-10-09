	.text
	.file	"main.c"
	.globl	weighted_sum                    // -- Begin function weighted_sum
	.p2align	2
	.type	weighted_sum,@function
weighted_sum:                           // @weighted_sum
	.cfi_startproc
// %bb.0:
	cmp	w1, #1
	b.lt	.LBB0_8
// %bb.1:
	adrp	x9, processed_items
	mov	w10, w1
	cmp	w1, #7
	ldr	w12, [x9, :lo12:processed_items]
	b.ls	.LBB0_4
// %bb.2:
	adrp	x11, processed_items
	add	x8, x0, x10, lsl #2
	add	x11, x11, :lo12:processed_items
	cmp	x8, x11
	b.ls	.LBB0_9
// %bb.3:
	adrp	x8, processed_items+4
	add	x8, x8, :lo12:processed_items+4
	cmp	x0, x8
	b.hs	.LBB0_9
.LBB0_4:
	mov	x11, xzr
	mov	w8, wzr
	mov	w13, w12
.LBB0_5:                                // %.preheader
	add	w12, w13, #1
	sub	x10, x10, x11
	add	x11, x0, x11, lsl #2
	mov	w13, #-2
.LBB0_6:                                // =>This Inner Loop Header: Depth=1
	ldr	w14, [x11], #4
	str	w12, [x9, :lo12:processed_items]
	add	w12, w12, #1
	add	w14, w14, w14, lsl #1
	add	w15, w14, #2
	sub	w16, w13, w14
	tst	w14, #0x1
	csel	w14, w15, w16, eq
	subs	x10, x10, #1
	add	w8, w14, w8
	b.ne	.LBB0_6
.LBB0_7:
	mov	w0, w8
	ret
.LBB0_8:
	mov	w0, wzr
	ret
.LBB0_9:
	and	x11, x10, #0xfffffff8
	add	x8, x0, #16
	movi	v0.2d, #0000000000000000
	add	w13, w12, w11
	movi	v1.4s, #3
	mov	x14, x11
	movi	v2.4s, #2
	movi	v3.4s, #1
	mvni	v4.4s, #1
	movi	v5.2d, #0000000000000000
.LBB0_10:                               // =>This Inner Loop Header: Depth=1
	ldp	q6, q7, [x8, #-16]
	subs	x14, x14, #8
	add	x8, x8, #32
	add	w12, w12, #8
	mul	v6.4s, v6.4s, v1.4s
	mul	v7.4s, v7.4s, v1.4s
	and	v18.16b, v6.16b, v3.16b
	add	v16.4s, v6.4s, v2.4s
	and	v19.16b, v7.16b, v3.16b
	add	v17.4s, v7.4s, v2.4s
	sub	v6.4s, v4.4s, v6.4s
	sub	v7.4s, v4.4s, v7.4s
	cmeq	v18.4s, v18.4s, #0
	cmeq	v19.4s, v19.4s, #0
	bit	v6.16b, v16.16b, v18.16b
	bit	v7.16b, v17.16b, v19.16b
	add	v0.4s, v6.4s, v0.4s
	add	v5.4s, v7.4s, v5.4s
	b.ne	.LBB0_10
// %bb.11:
	add	v0.4s, v5.4s, v0.4s
	cmp	x11, x10
	str	w12, [x9, :lo12:processed_items]
	addv	s0, v0.4s
	fmov	w8, s0
	b.ne	.LBB0_5
	b	.LBB0_7
.Lfunc_end0:
	.size	weighted_sum, .Lfunc_end0-weighted_sum
	.cfi_endproc
                                        // -- End function
	.globl	main                            // -- Begin function main
	.p2align	2
	.type	main,@function
main:                                   // @main
	.cfi_startproc
// %bb.0:
	sub	sp, sp, #80
	stp	x29, x30, [sp, #32]             // 16-byte Folded Spill
	add	x29, sp, #32
	str	x21, [sp, #48]                  // 8-byte Folded Spill
	stp	x20, x19, [sp, #64]             // 16-byte Folded Spill
	.cfi_def_cfa w29, 48
	.cfi_offset w19, -8
	.cfi_offset w20, -16
	.cfi_offset w21, -32
	.cfi_offset w30, -40
	.cfi_offset w29, -48
	movi	v0.2d, #0000000000000000
	adrp	x0, .L.str
	add	x0, x0, :lo12:.L.str
	add	x1, x29, #28
	str	wzr, [x29, #28]
	stp	q0, q0, [sp]
	bl	__isoc99_scanf
	mov	w8, w0
	mov	w0, #1
	cmp	w8, #1
	b.ne	.LBB1_18
// %bb.1:
	ldr	w8, [x29, #28]
	cmp	w8, #1
	b.lt	.LBB1_18
// %bb.2:
	cmp	w8, #8
	b.gt	.LBB1_18
// %bb.3:                               // %.preheader2
	adrp	x20, .L.str
	mov	x21, xzr
	mov	x19, sp
	add	x20, x20, :lo12:.L.str
.LBB1_4:                                // =>This Inner Loop Header: Depth=1
	mov	x0, x20
	mov	x1, x19
	bl	__isoc99_scanf
	cmp	w0, #1
	b.ne	.LBB1_9
// %bb.5:                               //   in Loop: Header=BB1_4 Depth=1
	ldrsw	x8, [x29, #28]
	add	x21, x21, #1
	add	x19, x19, #4
	cmp	x21, x8
	b.lt	.LBB1_4
// %bb.6:
	and	x8, x8, #0xffffffff
	cmp	w8, #0
	b.le	.LBB1_10
// %bb.7:
	adrp	x9, processed_items
	cmp	w8, #8
	ldr	w10, [x9, :lo12:processed_items]
	b.hs	.LBB1_11
// %bb.8:
	mov	x11, xzr
	mov	w1, wzr
	b	.LBB1_14
.LBB1_9:
	mov	w0, #1
	b	.LBB1_18
.LBB1_10:
	adrp	x8, processed_items
	mov	w1, wzr
	ldr	w2, [x8, :lo12:processed_items]
	b	.LBB1_17
.LBB1_11:
	and	x11, x8, #0xfffffff8
	mov	x12, sp
	movi	v0.2d, #0000000000000000
	add	x12, x12, #16
	movi	v1.4s, #3
	mov	x13, x11
	movi	v2.4s, #2
	movi	v3.4s, #1
	mvni	v4.4s, #1
	movi	v5.2d, #0000000000000000
.LBB1_12:                               // =>This Inner Loop Header: Depth=1
	ldp	q6, q7, [x12, #-16]
	subs	x13, x13, #8
	add	x12, x12, #32
	mul	v6.4s, v6.4s, v1.4s
	mul	v7.4s, v7.4s, v1.4s
	and	v18.16b, v6.16b, v3.16b
	add	v16.4s, v6.4s, v2.4s
	and	v19.16b, v7.16b, v3.16b
	add	v17.4s, v7.4s, v2.4s
	sub	v6.4s, v4.4s, v6.4s
	sub	v7.4s, v4.4s, v7.4s
	cmeq	v18.4s, v18.4s, #0
	cmeq	v19.4s, v19.4s, #0
	bit	v6.16b, v16.16b, v18.16b
	bit	v7.16b, v17.16b, v19.16b
	add	v0.4s, v6.4s, v0.4s
	add	v5.4s, v7.4s, v5.4s
	b.ne	.LBB1_12
// %bb.13:
	add	v0.4s, v5.4s, v0.4s
	cmp	x11, x8
	addv	s0, v0.4s
	fmov	w1, s0
	b.eq	.LBB1_16
.LBB1_14:                               // %.preheader
	mov	x13, sp
	sub	x12, x8, x11
	add	x11, x13, x11, lsl #2
	mov	w13, #-2
.LBB1_15:                               // =>This Inner Loop Header: Depth=1
	ldr	w14, [x11], #4
	add	w14, w14, w14, lsl #1
	add	w15, w14, #2
	sub	w16, w13, w14
	tst	w14, #0x1
	csel	w14, w15, w16, eq
	subs	x12, x12, #1
	add	w1, w14, w1
	b.ne	.LBB1_15
.LBB1_16:
	add	w2, w8, w10
	str	w2, [x9, :lo12:processed_items]
.LBB1_17:
	adrp	x0, .L.str.1
	add	x0, x0, :lo12:.L.str.1
	bl	printf
	mov	w0, wzr
.LBB1_18:
	ldp	x20, x19, [sp, #64]             // 16-byte Folded Reload
	ldp	x29, x30, [sp, #32]             // 16-byte Folded Reload
	ldr	x21, [sp, #48]                  // 8-byte Folded Reload
	add	sp, sp, #80
	ret
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        // -- End function
	.type	global_bias,@object             // @global_bias
	.section	.rodata,"a",@progbits
	.globl	global_bias
	.p2align	2
global_bias:
	.word	2                               // 0x2
	.size	global_bias, 4

	.type	processed_items,@object         // @processed_items
	.bss
	.globl	processed_items
	.p2align	2
processed_items:
	.word	0                               // 0x0
	.size	processed_items, 4

	.type	.L.str,@object                  // @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                // @.str.1
.L.str.1:
	.asciz	"result=%d, processed=%d\n"
	.size	.L.str.1, 25

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits

	.text
	.file	"main.c"
	.globl	weighted_sum                    # -- Begin function weighted_sum
	.p2align	4, 0x90
	.type	weighted_sum,@function
weighted_sum:                           # @weighted_sum
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	movq	%rdi, -24(%rbp)
	movl	%esi, -16(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jge	.LBB0_7
# %bb.2:                                #   in Loop: Header=BB0_1 Depth=1
	movq	-24(%rbp), %rax
	movslq	-8(%rbp), %rcx
	imull	$3, (%rax,%rcx,4), %eax
	addl	$2, %eax
	movl	%eax, -12(%rbp)
	movl	-12(%rbp), %eax
	movl	$2, %ecx
	cltd
	idivl	%ecx
	cmpl	$0, %edx
	jne	.LBB0_4
# %bb.3:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	addl	-4(%rbp), %eax
	movl	%eax, -4(%rbp)
	jmp	.LBB0_5
.LBB0_4:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-12(%rbp), %eax
	movl	-4(%rbp), %ecx
	subl	%eax, %ecx
	movl	%ecx, -4(%rbp)
.LBB0_5:                                #   in Loop: Header=BB0_1 Depth=1
	movl	processed_items, %eax
	addl	$1, %eax
	movl	%eax, processed_items
# %bb.6:                                #   in Loop: Header=BB0_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB0_1
.LBB0_7:
	movl	-4(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	weighted_sum, .Lfunc_end0-weighted_sum
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movl	$0, -12(%rbp)
	movl	$0, -4(%rbp)
	leaq	-48(%rbp), %rdi
	xorl	%esi, %esi
	movl	$32, %edx
	callq	memset@PLT
	movabsq	$.L.str, %rdi
	leaq	-4(%rbp), %rsi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.LBB1_3
# %bb.1:
	cmpl	$1, -4(%rbp)
	jl	.LBB1_3
# %bb.2:
	cmpl	$8, -4(%rbp)
	jle	.LBB1_4
.LBB1_3:
	movl	$1, -12(%rbp)
	jmp	.LBB1_11
.LBB1_4:
	movl	$0, -8(%rbp)
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jge	.LBB1_10
# %bb.6:                                #   in Loop: Header=BB1_5 Depth=1
	movslq	-8(%rbp), %rax
	leaq	-48(%rbp), %rsi
	shlq	$2, %rax
	addq	%rax, %rsi
	movabsq	$.L.str, %rdi
	movb	$0, %al
	callq	__isoc99_scanf@PLT
	cmpl	$1, %eax
	je	.LBB1_8
# %bb.7:
	movl	$1, -12(%rbp)
	jmp	.LBB1_11
.LBB1_8:                                #   in Loop: Header=BB1_5 Depth=1
	jmp	.LBB1_9
.LBB1_9:                                #   in Loop: Header=BB1_5 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB1_5
.LBB1_10:
	leaq	-48(%rbp), %rdi
	movl	-4(%rbp), %esi
	callq	weighted_sum
	movl	%eax, -16(%rbp)
	movl	-16(%rbp), %esi
	movl	processed_items, %edx
	movabsq	$.L.str.1, %rdi
	movb	$0, %al
	callq	printf@PLT
	movl	$0, -12(%rbp)
.LBB1_11:
	movl	-12(%rbp), %eax
	addq	$48, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	global_bias,@object             # @global_bias
	.section	.rodata,"a",@progbits
	.globl	global_bias
	.p2align	2
global_bias:
	.long	2                               # 0x2
	.size	global_bias, 4

	.type	processed_items,@object         # @processed_items
	.bss
	.globl	processed_items
	.p2align	2
processed_items:
	.long	0                               # 0x0
	.size	processed_items, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%d"
	.size	.L.str, 3

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"result=%d, processed=%d\n"
	.size	.L.str.1, 25

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits

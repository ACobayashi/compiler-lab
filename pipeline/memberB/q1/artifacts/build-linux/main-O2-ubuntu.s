	.text
	.file	"main.c"
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function weighted_sum
.LCPI0_0:
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	2                               # 0x2
.LCPI0_1:
	.long	4294967294                      # 0xfffffffe
	.long	4294967294                      # 0xfffffffe
	.long	4294967294                      # 0xfffffffe
	.long	4294967294                      # 0xfffffffe
	.text
	.globl	weighted_sum
	.p2align	4, 0x90
	.type	weighted_sum,@function
weighted_sum:                           # @weighted_sum
	.cfi_startproc
# %bb.0:
	pushq	%r14
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset %rbx, -24
	.cfi_offset %r14, -16
	testl	%esi, %esi
	jle	.LBB0_1
# %bb.2:
	movl	%esi, %r11d
	movl	processed_items(%rip), %r8d
	cmpl	$8, %esi
	jb	.LBB0_3
# %bb.4:
	leaq	(%rdi,%r11,4), %rax
	cmpq	$processed_items, %rax
	jbe	.LBB0_6
# %bb.5:
	cmpq	$processed_items+4, %rdi
	jae	.LBB0_6
.LBB0_3:
	xorl	%edx, %edx
	movl	%r8d, %r14d
	xorl	%eax, %eax
.LBB0_9:
	movq	%rdx, %r8
	notq	%r8
	testb	$1, %r11b
	je	.LBB0_11
# %bb.10:
	movl	(%rdi,%rdx,4), %r9d
	leal	(%r9,%r9,2), %r10d
	leal	(%r9,%r9,2), %r9d
	addl	$2, %r9d
	movl	$-2, %ecx
	subl	%r10d, %ecx
	testb	$1, %r10b
	cmovel	%r9d, %ecx
	addl	%ecx, %eax
	addl	$1, %r14d
	movl	%r14d, processed_items(%rip)
	orq	$1, %rdx
.LBB0_11:
	addq	%r11, %r8
	je	.LBB0_14
# %bb.12:                               # %.preheader
	addl	$2, %r14d
	.p2align	4, 0x90
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	movl	(%rdi,%rdx,4), %ecx
	leal	(%rcx,%rcx,2), %esi
	leal	(%rcx,%rcx,2), %ecx
	addl	$2, %ecx
	movl	$-2, %ebx
	subl	%esi, %ebx
	testb	$1, %sil
	cmovel	%ecx, %ebx
	addl	%eax, %ebx
	leal	-1(%r14), %eax
	movl	%eax, processed_items(%rip)
	movl	4(%rdi,%rdx,4), %eax
	leal	(%rax,%rax,2), %ecx
	leal	(%rax,%rax,2), %esi
	addl	$2, %esi
	movl	$-2, %eax
	subl	%ecx, %eax
	testb	$1, %cl
	cmovel	%esi, %eax
	addl	%ebx, %eax
	movl	%r14d, processed_items(%rip)
	addq	$2, %rdx
	addl	$2, %r14d
	cmpq	%rdx, %r11
	jne	.LBB0_13
	jmp	.LBB0_14
.LBB0_1:
	xorl	%eax, %eax
	jmp	.LBB0_14
.LBB0_6:
	movl	%r11d, %edx
	andl	$-8, %edx
	leal	(%rdx,%r8), %r14d
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	movdqa	.LCPI0_0(%rip), %xmm8           # xmm8 = [2,2,2,2]
	movdqa	.LCPI0_1(%rip), %xmm9           # xmm9 = [4294967294,4294967294,4294967294,4294967294]
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movdqu	(%rdi,%rax,4), %xmm4
	movdqu	16(%rdi,%rax,4), %xmm5
	movdqa	%xmm4, %xmm6
	paddd	%xmm4, %xmm6
	paddd	%xmm4, %xmm6
	movdqa	%xmm5, %xmm4
	paddd	%xmm5, %xmm4
	paddd	%xmm5, %xmm4
	movdqa	%xmm6, %xmm5
	paddd	%xmm8, %xmm5
	movdqa	%xmm4, %xmm7
	paddd	%xmm8, %xmm7
	movdqa	%xmm9, %xmm3
	psubd	%xmm6, %xmm3
	movdqa	%xmm9, %xmm2
	psubd	%xmm4, %xmm2
	pslld	$31, %xmm6
	psrad	$31, %xmm6
	pand	%xmm6, %xmm3
	pandn	%xmm5, %xmm6
	por	%xmm3, %xmm6
	paddd	%xmm6, %xmm0
	pslld	$31, %xmm4
	psrad	$31, %xmm4
	pand	%xmm4, %xmm2
	pandn	%xmm7, %xmm4
	por	%xmm2, %xmm4
	paddd	%xmm4, %xmm1
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.LBB0_7
# %bb.8:
	addl	%r8d, %eax
	movl	%eax, processed_items(%rip)
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %eax
	cmpq	%r11, %rdx
	jne	.LBB0_9
.LBB0_14:
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	weighted_sum, .Lfunc_end0-weighted_sum
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst16,"aM",@progbits,16
	.p2align	4                               # -- Begin function main
.LCPI1_0:
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	2                               # 0x2
	.long	2                               # 0x2
.LCPI1_1:
	.long	4294967294                      # 0xfffffffe
	.long	4294967294                      # 0xfffffffe
	.long	4294967294                      # 0xfffffffe
	.long	4294967294                      # 0xfffffffe
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	subq	$48, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	$0, 12(%rsp)
	pxor	%xmm0, %xmm0
	movdqa	%xmm0, 32(%rsp)
	movdqa	%xmm0, 16(%rsp)
	leaq	12(%rsp), %rsi
	movl	$.L.str, %edi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	movl	$1, %r14d
	cmpl	$1, %eax
	jne	.LBB1_16
# %bb.1:
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.LBB1_16
# %bb.2:
	cmpl	$8, %eax
	jg	.LBB1_16
# %bb.3:                                # %.preheader
	leaq	16(%rsp), %rbx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB1_5:                                # =>This Inner Loop Header: Depth=1
	movl	$.L.str, %edi
	movq	%rbx, %rsi
	xorl	%eax, %eax
	callq	__isoc99_scanf@PLT
	cmpl	$1, %eax
	jne	.LBB1_16
# %bb.4:                                #   in Loop: Header=BB1_5 Depth=1
	addq	$1, %rbp
	movslq	12(%rsp), %rax
	addq	$4, %rbx
	cmpq	%rax, %rbp
	jl	.LBB1_5
# %bb.6:
	movl	%eax, %edx
	testl	%edx, %edx
	jle	.LBB1_7
# %bb.8:
	movl	processed_items(%rip), %eax
	cmpl	$8, %edx
	jae	.LBB1_10
# %bb.9:
	xorl	%ecx, %ecx
	xorl	%esi, %esi
	jmp	.LBB1_13
.LBB1_7:
	xorl	%esi, %esi
	movl	processed_items(%rip), %edx
	jmp	.LBB1_15
.LBB1_10:
	movl	%edx, %ecx
	andl	$-8, %ecx
	leaq	(,%rdx,4), %rsi
	andq	$-32, %rsi
	pxor	%xmm0, %xmm0
	xorl	%edi, %edi
	movdqa	.LCPI1_0(%rip), %xmm8           # xmm8 = [2,2,2,2]
	movdqa	.LCPI1_1(%rip), %xmm9           # xmm9 = [4294967294,4294967294,4294967294,4294967294]
	pxor	%xmm1, %xmm1
	.p2align	4, 0x90
.LBB1_11:                               # =>This Inner Loop Header: Depth=1
	movdqa	16(%rsp,%rdi), %xmm4
	movdqa	32(%rsp,%rdi), %xmm5
	movdqa	%xmm4, %xmm6
	paddd	%xmm4, %xmm6
	paddd	%xmm4, %xmm6
	movdqa	%xmm5, %xmm4
	paddd	%xmm5, %xmm4
	paddd	%xmm5, %xmm4
	movdqa	%xmm6, %xmm5
	paddd	%xmm8, %xmm5
	movdqa	%xmm4, %xmm7
	paddd	%xmm8, %xmm7
	movdqa	%xmm9, %xmm3
	psubd	%xmm6, %xmm3
	movdqa	%xmm9, %xmm2
	psubd	%xmm4, %xmm2
	pslld	$31, %xmm6
	psrad	$31, %xmm6
	pand	%xmm6, %xmm3
	pandn	%xmm5, %xmm6
	por	%xmm3, %xmm6
	paddd	%xmm6, %xmm0
	pslld	$31, %xmm4
	psrad	$31, %xmm4
	pand	%xmm4, %xmm2
	pandn	%xmm7, %xmm4
	por	%xmm2, %xmm4
	paddd	%xmm4, %xmm1
	addq	$32, %rdi
	cmpq	%rdi, %rsi
	jne	.LBB1_11
# %bb.12:
	paddd	%xmm0, %xmm1
	pshufd	$238, %xmm1, %xmm0              # xmm0 = xmm1[2,3,2,3]
	paddd	%xmm1, %xmm0
	pshufd	$85, %xmm0, %xmm1               # xmm1 = xmm0[1,1,1,1]
	paddd	%xmm0, %xmm1
	movd	%xmm1, %esi
	cmpq	%rdx, %rcx
	je	.LBB1_14
	.p2align	4, 0x90
.LBB1_13:                               # =>This Inner Loop Header: Depth=1
	movl	16(%rsp,%rcx,4), %edi
	leal	(%rdi,%rdi,2), %ebp
	leal	(%rdi,%rdi,2), %edi
	addl	$2, %edi
	movl	$-2, %ebx
	subl	%ebp, %ebx
	testb	$1, %bpl
	cmovel	%edi, %ebx
	addl	%ebx, %esi
	addq	$1, %rcx
	cmpq	%rcx, %rdx
	jne	.LBB1_13
.LBB1_14:
	addl	%eax, %edx
	movl	%edx, processed_items(%rip)
.LBB1_15:
	xorl	%r14d, %r14d
	movl	$.L.str.1, %edi
                                        # kill: def $edx killed $edx killed $rdx
	xorl	%eax, %eax
	callq	printf@PLT
.LBB1_16:
	movl	%r14d, %eax
	addq	$48, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
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

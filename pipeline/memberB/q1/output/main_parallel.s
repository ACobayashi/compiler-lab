	.file	"main.cpp"
	.text
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB2303:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %r12
	testq	%r12, %r12
	je	.L7
	cmpb	$0, 56(%r12)
	movq	%rdi, %rbp
	je	.L3
	movsbl	67(%r12), %esi
.L4:
	movq	%rbp, %rdi
	call	_ZNSo3putEc@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rax, %rdi
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	_ZNSo5flushEv@PLT
.L3:
	.cfi_restore_state
	movq	%r12, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	(%r12), %rax
	movl	$10, %esi
	movq	%r12, %rdi
	call	*48(%rax)
	movsbl	%al, %esi
	jmp	.L4
.L7:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2303:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.globl	_Z9factoriali
	.type	_Z9factoriali, @function
_Z9factoriali:
.LFB1812:
	.cfi_startproc
	endbr64
	cmpl	$1, %edi
	jle	.L11
	leal	1(%rdi), %edx
	movl	$2, %eax
	movl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L10:
	imulq	%rax, %r8
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L10
	addl	$1, times(%rip)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L11:
	movl	$1, %r8d
	addl	$1, times(%rip)
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE1812:
	.size	_Z9factoriali, .-_Z9factoriali
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB1813:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZSt3cin(%rip), %rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	leaq	4(%rsp), %rsi
	call	_ZNSirsERi@PLT
	movl	4(%rsp), %eax
	cmpl	$20, %eax
	ja	.L14
	cmpl	$1, %eax
	jle	.L18
	leal	-2(%rax), %edx
	movl	$1, %esi
	movl	$2, %eax
	addq	$3, %rdx
	.p2align 4,,10
	.p2align 3
.L16:
	imulq	%rax, %rsi
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L16
.L15:
	leaq	_ZSt4cout(%rip), %rbp
	addl	$1, times(%rip)
	movq	%rbp, %rdi
	call	_ZNSo9_M_insertIxEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	times(%rip), %esi
	movq	%rbp, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.L14:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L21
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	movl	$1, %esi
	jmp	.L15
.L21:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE1813:
	.size	main, .-main
	.p2align 4
	.type	_GLOBAL__sub_I_times, @function
_GLOBAL__sub_I_times:
.LFB2301:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	leaq	_ZStL8__ioinit(%rip), %rbp
	movq	%rbp, %rdi
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	movq	%rbp, %rsi
	popq	%rbp
	.cfi_def_cfa_offset 8
	leaq	__dso_handle(%rip), %rdx
	jmp	__cxa_atexit@PLT
	.cfi_endproc
.LFE2301:
	.size	_GLOBAL__sub_I_times, .-_GLOBAL__sub_I_times
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_times
	.globl	times
	.bss
	.align 4
	.type	times, @object
	.size	times, 4
times:
	.zero	4
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

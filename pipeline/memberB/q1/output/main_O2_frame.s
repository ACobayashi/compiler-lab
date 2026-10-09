	.file	"main.cpp"
	.text
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
	.p2align 4
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB1565:
	.cfi_startproc
	endbr64
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE1565:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.text
	.p2align 4
	.type	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, @function
_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0:
.LFB2304:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r13
	pushq	%r12
	.cfi_offset 13, -24
	.cfi_offset 12, -32
	movq	(%rdi), %rax
	movq	-24(%rax), %rax
	movq	240(%rdi,%rax), %r13
	testq	%r13, %r13
	je	.L9
	cmpb	$0, 56(%r13)
	movq	%rdi, %r12
	je	.L5
	movsbl	67(%r13), %esi
.L6:
	movq	%r12, %rdi
	call	_ZNSo3putEc@PLT
	popq	%r12
	popq	%r13
	movq	%rax, %rdi
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	jmp	_ZNSo5flushEv@PLT
.L5:
	.cfi_restore_state
	movq	%r13, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv@PLT
	movq	0(%r13), %rax
	movl	$10, %esi
	leaq	_ZNKSt5ctypeIcE8do_widenEc(%rip), %rdx
	movq	48(%rax), %rax
	cmpq	%rdx, %rax
	je	.L6
	movl	$10, %esi
	movq	%r13, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L6
.L9:
	call	_ZSt16__throw_bad_castv@PLT
	.cfi_endproc
.LFE2304:
	.size	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0, .-_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	.p2align 4
	.globl	_Z9factoriali
	.type	_Z9factoriali, @function
_Z9factoriali:
.LFB1812:
	.cfi_startproc
	endbr64
	cmpl	$1, %edi
	jle	.L13
	leal	1(%rdi), %edx
	movl	$2, %eax
	movl	$1, %r8d
	.p2align 4,,10
	.p2align 3
.L12:
	imulq	%rax, %r8
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L12
	addl	$1, times(%rip)
	movq	%r8, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L13:
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	leaq	-28(%rbp), %rsi
	subq	$24, %rsp
	.cfi_offset 12, -24
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	call	_ZNSirsERi@PLT
	movl	-28(%rbp), %eax
	cmpl	$20, %eax
	ja	.L16
	cmpl	$1, %eax
	jle	.L20
	leal	-2(%rax), %edx
	movl	$1, %esi
	movl	$2, %eax
	addq	$3, %rdx
	.p2align 4,,10
	.p2align 3
.L18:
	imulq	%rax, %rsi
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L18
.L17:
	leaq	_ZSt4cout(%rip), %r12
	addl	$1, times(%rip)
	movq	%r12, %rdi
	call	_ZNSo9_M_insertIxEERSoT_@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
	movl	times(%rip), %esi
	movq	%r12, %rdi
	call	_ZNSolsEi@PLT
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_.isra.0
.L16:
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L23
	addq	$24, %rsp
	xorl	%eax, %eax
	popq	%r12
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L20:
	.cfi_restore_state
	movl	$1, %esi
	jmp	.L17
.L23:
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
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r12
	.cfi_offset 12, -24
	leaq	_ZStL8__ioinit(%rip), %r12
	movq	%r12, %rdi
	subq	$8, %rsp
	call	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	addq	$8, %rsp
	movq	%r12, %rsi
	leaq	__dso_handle(%rip), %rdx
	popq	%r12
	popq	%rbp
	.cfi_def_cfa 7, 8
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

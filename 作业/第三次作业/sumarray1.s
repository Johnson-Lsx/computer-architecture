	.file	"sumarray.c"
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC1:
	.ascii "%f seconds to complete the calculation \12\0"
LC2:
	.ascii "sum= %d \12\0"
LC3:
	.ascii "pause\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	movl	$131136, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	call	___main
	movl	$0, 131132(%esp)
	movl	$0, 131128(%esp)
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, 131132(%esp)
	jmp	L2
L3:
	call	_rand
	movl	%eax, %edx
	movl	%edx, %eax
	sarl	$31, %eax
	shrl	$24, %eax
	addl	%eax, %edx
	movzbl	%dl, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	movl	131132(%esp), %eax
	movl	%edx, 32(%esp,%eax,4)
	addl	$1, 131132(%esp)
L2:
	cmpl	$32767, 131132(%esp)
	jle	L3
	call	_clock
	movl	%eax, 131120(%esp)
	movl	$0, 131132(%esp)
	jmp	L4
L8:
	movl	$0, 131128(%esp)
	movl	$0, 131124(%esp)
	jmp	L5
L7:
	movl	131124(%esp), %eax
	movl	32(%esp,%eax,4), %eax
	cmpl	$127, %eax
	jle	L6
	movl	131124(%esp), %eax
	movl	32(%esp,%eax,4), %eax
	addl	%eax, 131128(%esp)
L6:
	addl	$1, 131124(%esp)
L5:
	cmpl	$32767, 131124(%esp)
	jle	L7
	addl	$1, 131132(%esp)
L4:
	cmpl	$99999, 131132(%esp)
	jle	L8
	call	_clock
	movl	%eax, 131116(%esp)
	movl	131116(%esp), %eax
	subl	131120(%esp), %eax
	movl	%eax, 20(%esp)
	fildl	20(%esp)
	fldt	LC0
	fdivrp	%st, %st(1)
	fstpl	131104(%esp)
	fldl	131104(%esp)
	fstpl	4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	131128(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$LC3, (%esp)
	call	_system
	movl	$0, %eax
	leave
	ret
	.section .rdata,"dr"
	.align 16
LC0:
	.long	0
	.long	-100663296
	.long	16392
	.ident	"GCC: (i686-posix-sjlj, built by strawberryperl.com project) 4.9.2"
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef

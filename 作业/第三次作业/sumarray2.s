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
	pushl	%edi
	pushl	%esi
	pushl	%ebx
	andl	$-16, %esp
	movl	$131104, %eax
	call	___chkstk_ms
	subl	%eax, %esp
	call	___main
	movl	$0, (%esp)
	call	__time32
	movl	%eax, (%esp)
	call	_srand
	leal	131104(%esp), %esi
	leal	32(%esp), %ebx
L2:
	call	_rand
	cltd
	shrl	$24, %edx
	addl	%edx, %eax
	movzbl	%al, %eax
	subl	%edx, %eax
	movl	%eax, (%ebx)
	addl	$4, %ebx
	cmpl	%esi, %ebx
	jne	L2
	call	_clock
	movl	%eax, 20(%esp)
	movl	$100000, %edi
	jmp	L3
L5:
	movl	(%eax), %edx
	leal	(%ebx,%edx), %ecx
	cmpl	$128, %edx
	cmovge	%ecx, %ebx
	addl	$4, %eax
	cmpl	%esi, %eax
	jne	L5
	subl	$1, %edi
	je	L6
L3:
	leal	32(%esp), %eax
	movl	$0, %ebx
	jmp	L5
L6:
	call	_clock
	subl	20(%esp), %eax
	movl	%eax, 20(%esp)
	fildl	20(%esp)
	fdivs	LC0
	fstpl	4(%esp)
	movl	$LC1, (%esp)
	call	_printf
	movl	%ebx, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	movl	$LC3, (%esp)
	call	_system
	movl	$0, %eax
	leal	-12(%ebp), %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
	.section .rdata,"dr"
	.align 4
LC0:
	.long	1148846080
	.ident	"GCC: (i686-posix-sjlj, built by strawberryperl.com project) 4.9.2"
	.def	__time32;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_clock;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_system;	.scl	2;	.type	32;	.endef

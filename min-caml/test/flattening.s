.data
.balign	8
.text
.globl	min_caml_start
min_caml_start:
.globl	_min_caml_start
_min_caml_start: # for cygwin
	pushl	%eax
	pushl	%ebx
	pushl	%ecx
	pushl	%edx
	pushl	%esi
	pushl	%edi
	pushl	%ebp
	movl	32(%esp),%ebp
	movl	36(%esp),%eax
	movl	%eax,min_caml_hp
	movl	$1, %eax
	movl	$2, %ebx
	movl	$3, %ecx
	movl	min_caml_hp, %edx
	addl	$8, min_caml_hp
	movl	%ecx, 4(%edx)
	movl	%ebx, 0(%edx)
	movl	min_caml_hp, %ebx
	addl	$8, min_caml_hp
	movl	%edx, 4(%ebx)
	movl	%eax, 0(%ebx)
	movl	4(%ebx), %eax
	movl	0(%ebx), %ebx
	movl	4(%eax), %ecx
	movl	0(%eax), %eax
	addl	%eax, %ebx
	movl	%ebx, %eax
	addl	%ecx, %eax
	call	min_caml_print_int
	popl	%ebp
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret

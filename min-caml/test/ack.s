.data
.balign	8
.text
ack.1.15:
	movl	4(%edi), %ebx
	cmpl	$0, %ebx
	jg	jle_else.31
	addl	$1, %eax
	ret
jle_else.31:
	cmpl	$0, %eax
	jg	jle_else.32
	movl	%ebx, %eax
	subl	$1, %eax
	call	ack.11
	movl	%eax, %edi
	movl	$1, %eax
	jmp	*(%edi)
jle_else.32:
	movl	%ebx, %ecx
	subl	$1, %ecx
	movl	%eax, 0(%ebp)
	movl	%ebx, 4(%ebp)
	movl	%ecx, %eax
	addl	$8, %ebp
	call	ack.11
	subl	$8, %ebp
	movl	4(%ebp), %ebx
	movl	%eax, 8(%ebp)
	movl	%ebx, %eax
	addl	$16, %ebp
	call	ack.11
	subl	$16, %ebp
	movl	%eax, %edi
	movl	0(%ebp), %eax
	subl	$1, %eax
	addl	$16, %ebp
	call	*(%edi)
	subl	$16, %ebp
	movl	8(%ebp), %edi
	jmp	*(%edi)
ack.11:
	movl	min_caml_hp, %ebx
	addl	$8, min_caml_hp
	movl	$ack.1.15, %ecx
	movl	%ecx, 0(%ebx)
	movl	%eax, 4(%ebx)
	movl	%ebx, %eax
	ret
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
	movl	$3, %eax
	call	ack.11
	movl	%eax, %edi
	movl	$10, %eax
	call	*(%edi)
	call	min_caml_print_int
	popl	%ebp
	popl	%edi
	popl	%esi
	popl	%edx
	popl	%ecx
	popl	%ebx
	popl	%eax
	ret

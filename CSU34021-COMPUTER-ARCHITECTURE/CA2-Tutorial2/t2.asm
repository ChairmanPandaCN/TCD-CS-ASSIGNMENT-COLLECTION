option casemap:none             ; case sensitive


.data 
	public g;
	g QWORD 4; 
.code

public min;
public p;
public gcd;
;public q;


min:
	mov rax,rcx				;rax = v
	cmp rdx,rax				;if(b<v)
	jg	if_b_greater_v		;	v=b;
	mov rax,rdx				;
if_b_greater_v:				;

	cmp r8,rax				;if(c<v)
	jg if_c_greater_v		;	v=c
	mov rax,r8				;
if_c_greater_v:				;
	ret 0					;

p:
	sub rsp,32				;  allocate shadow space
	push rbp				;
	push r9					;  Push l onto the stack
	mov r9,r8				;  r9 = k
	mov r8,rdx				;  r8 = j
	mov rdx,rcx				;  rdx = i
	mov rcx,g				;  rcx = g
	call min				;  call min
	mov rcx,rax				;  rcx = min(g,i,j)
	mov rdx,r8				;  rdx =k
	pop r8					;  r8  =l
	call min				;  call min
	pop rbp					;
	add rsp,32				;  deallocate shadow space
	ret 0					;  ret 0


gcd:							
	test rdx,rdx			; if(b!=0)
	je	b_equal_zero		;
	mov r10,rdx				;
	mov rax,rcx				;
	cqo						;
	idiv r10				;
	mov rcx,r10				;
	sub rsp,32				;
	call gcd				;
	add rsp,32				;
	ret 0					;
b_equal_zero:				;
	mov rax,rcx				;
	ret 0					;

	
	



end
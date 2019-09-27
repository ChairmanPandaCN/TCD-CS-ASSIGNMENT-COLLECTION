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
	push r9					;
	mov r9,r8				;
	mov r8,rdx				;
	mov rdx,rcx				;
	mov rcx,g				;
	sub rsp,32				;
	call min				;
	add rsp,32				;
	mov rcx,rax				;
	mov rdx,r8				;
	pop r8					;
	sub rsp,32				;
	call min				;
	add rsp,32				;
	ret 0					;




	
	



end
.686                                ; create 32 bit code
.model flat, C                      ; 32 bit memory model
 option casemap:none                ; case sensitive

 .data 
	public g                        ;
	g DWORD 4                       ;

.code
	public	min						;
	public  p                       ;
	public gcd						;



;int min(int a, int b, int c) {
;	int v = a;
;	if (b < v)
;		v = b;
;	if (c < v)
;		v = c;	
;	return v;
;}

min:
	push ebp						;Save frame point to stack 
	mov	ebp,esp						;Update ebp
	;sub esp,4				        ;Assign 4 byte memory space for local variable v
	push ebx                        ;save non-volatile register
	mov edx,[ebp+8]					;v=a
	mov ecx,[ebp+16]				;ecx=c
	mov ebx,[ebp+12]				;ebx=b
	mov eax,[ebp+8]					;eax=a
	
	cmp ebx,edx                     ;if(b<v){
	jg  if_b_greater_v				;
	mov edx,ebx						;b=d;}
if_b_greater_v:
	
	cmp ecx,edx						;if(c<v){
	jg  if_c_greater_v				;
	mov edx,ecx						;v=c}

if_c_greater_v:
    mov eax,edx						;
	pop ebx							;
	mov esp,ebp						;de-allocate local variable
	pop ebp							;
	ret	0							;



;int p(int i, int j, int, k, int l) {
;	return min(min(g, i, j), k, l);
;}
p:
  push ebp			;
  mov ebp,esp		;
  push ebx			;

  mov eax,[ebp+12]	; push j onto the stack
  push eax          ;
  mov eax,[ebp+8]	; push i onto the stack
  push eax          ;
  push g			; push g onto the stack
  call min          ; push eip onto the stack and start the subrountine
                    ; return value is stored in eax
  
  add esp,12		; remove parameter

  mov ebx,[ebp+20]  ; push l onto the stack
  push ebx          ;
  mov ebx,[ebp+16]  ; push k onto the stack
  push ebx			;
  push eax          ; push min(g,i,j)onto the stack
  call min			;
  add esp,12        ;

  pop ebx			;
  mov esp,ebp		;
  pop ebp			;

  ret 0				;


;int gcd(int a, int b) {
;	if (b == 0) {
;		return a;
;	} else {
;		return gcd(b, a % b);
;	}
;}

gcd:
	push ebp		;
	mov ebp,esp		;
	push ebx		;

	 
	mov eax,[ebp+8]	; eax=a
	mov ebx,[ebp+12]; eax=a

	test ebx,ebx    ;
	je ifZero       ;
	cdq             ;
	idiv ebx        ;	ebx = a mod b

	push edx        ;  push a%b onto the stack
	mov ebx,[ebp+12] ;  eax=a
	push ebx        ;  push b onto the stack 
	call gcd        ;  
	sub esp,8       ;
	pop ebx         ;
	mov esp,ebp     ;
	pop ebp         ;
	ret 0           ;
ifZero:             ;
	pop ebx         ;
	mov esp,ebp     ;
	pop ebp         ;
    ret 0			;

end
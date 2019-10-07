/*
Exercise 2.1 and Exercise 2.2 doesnt output the minimum form of the expression.

*/
numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(X-Y) :- numeral(X), numeral(Y).
numeral(p(s(X))) :- numeral(X).
numeral(s(p(X))) :- numeral(X).




add(s(X),p(Y),Z) :- add(X,Y,Z). 
add(p(X),s(Y),Z) :- add(X,Y,Z). 
add(s(X),Y,s(Z)) :- add(X,Y,Z). 
add(p(X),Y,p(Z)) :- add(X,Y,Z). 
add(p(s(0)),Y,Z) :- add(0,Y,Z).
add(s(p(0)),Y,Z) :- add(0,Y,Z).
add(X,p(s(0)),Z) :- add(X,0,Z).
add(X,s(p(0)),Z) :- add(X,0,Z).
add(0,X,X).


add2(-X,Y,Z) :- minus(X,A),expand(Y,0,R),add2(A,R,P),expand(P,0,Z).                                   
add2(X,-Y,Z) :- minus(Y,A),expand(X,0,R),add2(R,A,P),expand(P,0,Z).

add2(0,X+Y,Z) :- expand(X,0,A),expand(Y,0,B),add2(A,B,P),expand(P,0,Z).
add2(X+Y,0,Z) :- expand(X,0,A),expand(Y,0,B),add2(A,B,P),expand(P,0,Z).
add2(X+Y,s(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,P),expand(P,0,Z).
add2(s(X+Y),A+B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(X,s(A+B),Z) :- expand(X,0,C),expand(A,0,D),expand(B,0,E),add2(s(0),D+E,F),add2(C,F,P),expand(P,0,Z).
add2(s(X+Y),A,Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),add2(s(0),C+D,F),add2(F,E,P),expand(P,0,Z).
add2(s(X+Y),s(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).

add2(X+Y,p(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand( B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,P),expand(P,0,Z).
add2(p(X+Y),A+B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(X,p(A+B),Z) :- expand(X,0,C),expand(A,0,D),expand(B,0,E),add2(p(0),D+E,F),add2(C,F,P),expand(P,0,Z).
add2(p(X+Y),A,Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),add2(p(0),C+D,F),add2(F,E,P),expand(P,0,Z).
add2(p(X+Y),p(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(X+Y,R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,P),expand(P,0,Z).
add2(X,Y+R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,P),expand(P,0,Z).
add2(X+Y,A+B,Z) :- expand(X,0,D),expand(Y,0,E),expand(A,0,F),expand(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,P),expand(P,0,Z).

add2(0,X-Y,Z) :- expand(X,0,A),minus(Y,0,B),add2(A,B,P),expand(P,0,Z).
add2(X-Y,0,Z) :- expand(X,0,A),minus(Y,0,B),add2(A,B,P),expand(P,0,Z).

add2(X-Y,s(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,P),expand(P,0,Z).
add2(X+Y,s(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,P),expand(P,0,Z).
add2(X-Y,s(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(E,F,H),add2(s(0),H,I),add2(G,I,P),expand(P,0,Z).

add2(s(X-Y),A+B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(s(X+Y),A-B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(s(X-Y),A-B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(X,s(A-B),Z) :- expand(X,0,C),expand(A,0,D),minus(B,0,E),add2(s(0),D+E,F),add2(C,F,P),expand(P,0,Z).
add2(s(X-Y),A,Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),add2(s(0),C+D,F),add2(F,E,P),expand(P,0,Z).
add2(s(X-Y),s(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(s(X+Y),s(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(s(X-Y),s(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,P),expand(P,0,Z).

add2(X-Y,p(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,P),expand(P,0,Z).
add2(X+Y,p(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,P),expand(P,0,Z).
add2(X-Y,p(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(E,F,H),add2(p(0),H,I),add2(G,I,P),expand(P,0,Z).


add2(p(X-Y),A+B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(p(X+Y),A-B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(p(X-Y),A-B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).

add2(X,p(A-B),Z) :- expand(X,0,C),expand(A,0,D),minus(B,0,E),add2(p(0),D+E,F),add2(C,F,P),expand(P,0,Z).
add2(p(X-Y),A,Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),add2(p(0),C+D,F),add2(F,E,P),expand(P,0,Z).

add2(p(X-Y),p(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(p(X+Y),p(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).
add2(p(X-Y),p(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,P),expand(P,0,Z).

add2(X-Y,R,Z) :- expand(X,0,A),minus(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,P),expand(P,0,Z).
add2(X,Y-R,Z) :- expand(X,0,A),expand(Y,0,B),minus(R,0,C),add2(A,B,D),add2(D,C,P),expand(P,0,Z).
add2(X-Y,A+B,Z) :- expand(X,0,D),minus(Y,0,E),expand(A,0,F),expand(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,P),expand(P,0,Z).
add2(X+Y,A-B,Z) :- expand(X,0,D),expand(Y,0,E),expand(A,0,F),minus(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,P),expand(P,0,Z).
add2(X+Y,A-B,Z) :- expand(X,0,D),minus(Y,0,E),expand(A,0,F),minus(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,P),expand(P,0,Z).

/*
onlyZ(0).
onlyZ(s(p(X))) :- onlyZ(X).
onlyZ(p(s(X))) :- onlyZ(X).
*/
add2(X,Y,Z) :- add(X,Y,Z).

subtract(X,Y,Z) :- expand(X,0,A),minus(Y,B),add2(A,B,P),expand(P,0,Z).
/*
main purpse of this block is to eliminate redundant expression such as reduce p(p(p(s(s(0))))) to p(0).
*/
expand(0,X,X).
expand(s(X),p(Y),Z) :- expand(X,Y,Z).
expand(p(X),s(Y),Z) :- expand(X,Y,Z).
expand(s(X),Y,Z) :- add2(s(0),Y,W),expand(X,W,Z).
expand(p(X),Y,Z) :- add2(p(0),Y,W),expand(X,W,Z).
expand(-X,W,Z) :- minus(X,Y),expand(Y,W,Z).
expand(X+Y,W,Z) :- expand(X,W,R),expand(Y,R,Z). 
expand(X-Y,W,Z) :- expand(X,W,R),minus(Y,A),expand(A,R,Z).  
expand(X,W,Z):-expand(X,W,Z). 
/* 
main purpse of this block is to find opposite expression for the given parameter  
such as p(p(p(p(0)))) is the opposite of s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))) 
*/ 
minus(X,Y):-expand(X,0,A),minus(A,0,Y). 
minus(0,X,X). 
minus(s(X),Y,Z):-add2(p(0),Y,W),minus(X,W,Z).
minus(p(X),Y,Z):-add2(s(0),Y,W),minus(X,W,Z).





/* 
    purly for fun.=.=
Exercise 1
  test case   
    1.add2(s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).        Answer  : s(s(s(s(s(s(s(s(0))))))))               ☑
    2.add2(s(0)+s(0)+s(0)+s(0)+s(0),0,Z).                     Answer  : s(s(s(s(s(0)))))                        ☑
Exercise 2
  test case 
    1.expand(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),0,Z).    Answer  : s(s(s(s(0))))                           ☑
    2.add2(s(0+p(0+s(0)))+s(0)+s(0),s(0+p(0+s(0))),Z).        Answer  : s(s(s(s(0))))                           ☑
Exercise 3
  test case 
    1.minus(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),Z).       Answer  : p(p(p(p(0))))                           ☑
Exercise 4
  test case
    1.add2(-s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).       Answer  : s(s(0))                                 ☑
    2.add2(-s(0+p(0+s(0)))+s(0)+s(0),-s(0+p(0+s(0))),Z).      Answer  : 0                                       ☑
Exercise 5 
  test code 
    1. subtract(-s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).  Answer  : p(p(p(p(0))))                           ☑
    2. subtract(-s(0+s(0+s(0)))+s(0)+s(0),-s(0+s(0+s(0))),Z). Answer  : s(s(0))                                 ☑
Exercise 6
  test code
    1. subtract(-s(0+s(0+s(0)))+s(0)+s(0),s(0-s(0-s(0))),Z).  Answer  : p(p(0))                                 ☑               
    2. subtract(-s(0+s(0+s(0)))-s(0)-s(0),-s(0-s(0-s(0))),Z). Answer  : p(p(p(p(0))))                           ☑        
    3. add2(s(s(0))+p(0)-p(0),p(s(0)),Z).                     Answer  : s(s(0))                                 ☑               
    4. add2((s(s(0))-p(0))-p(0),p(s(0)),Z).                   Answer  : s(s(s(s(0))))                           ☑
    5. add2(s(s(0))-p(0)-p(0),p(s(0)),Z).                     Answer  : s(s(s(s(0))))                           ☑
*/


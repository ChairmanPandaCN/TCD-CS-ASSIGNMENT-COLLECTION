/*
Must use brace to enclose expreesion when negative signs involve.

Example:
  1. add2(s(s(0))-p(0)-p(0),p(s(0)),Z).   Answer : s(s(0))
  2. add2((s(s(0))-p(0))-p(0),p(s(0)),Z).  Answer : 0

  Those two seems to be equivalent in real world math,but in this project,its not the case. 
*/

numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),p(Y),Z) :- add(X,Y,Z). 
add(p(X),s(Y),Z) :- add(X,Y,Z). 
add(s(X),Y,s(Z)) :- add(X,Y,Z). 
add(p(X),Y,p(Z)) :- add(X,Y,Z). 
 

add2((-X),Y,Z) :- minus(X,A),add2(A,Y,Z).
add2(X,(-Y),Z) :- minus(Y,A),add2(X,A,Z).




add2(0,X+Y,Z) :- expand(X,0,A),expand(Y,0,B),add2(A,B,Z).
add2(X+Y,0,Z) :- expand(X,0,A),expand(Y,0,B),add2(A,B,Z).
add2(X+Y,s(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,Z).
add2(s(X+Y),A+B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,Z).
add2(X,s(A+B),Z) :- expand(X,0,C),expand(A,0,D),expand(B,0,E),add2(s(0),D+E,F),add2(C,F,Z).
add2(s(X+Y),A,Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),add2(s(0),C+D,F),add2(F,E,Z).
add2(s(X+Y),s(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,Z).

add2(X+Y,p(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand( B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,Z).
add2(p(X+Y),A+B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(X,p(A+B),Z) :- expand(X,0,C),expand(A,0,D),expand(B,0,E),add2(p(0),D+E,F),add2(C,F,Z).
add2(p(X+Y),A,Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),add2(p(0),C+D,F),add2(F,E,Z).
add2(p(X+Y),p(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(X+Y,R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).
add2(X,Y+R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).
add2(X+Y,A+B,Z) :- expand(X,0,D),expand(Y,0,E),expand(A,0,F),expand(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,Z).

add2(0,X-Y,Z) :- expand(X,0,A),minus(Y,0,B),add2(A,B,Z).
add2(X-Y,0,Z) :- expand(X,0,A),minus(Y,0,B),add2(A,B,Z).

add2(X-Y,s(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,Z).
add2(X+Y,s(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,Z).
add2(X-Y,s(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(E,F,H),add2(s(0),H,I),add2(G,I,Z).


add2(s(X-Y),A+B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,Z).
add2(s(X+Y),A-B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,Z).
add2(s(X-Y),A-B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,Z).

add2(X,s(A-B),Z) :- expand(X,0,C),expand(A,0,D),minus(B,0,E),add2(s(0),D+E,F),add2(C,F,Z).
add2(s(X-Y),A,Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),add2(s(0),C+D,F),add2(F,E,Z).

add2(s(X-Y),s(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,Z).
add2(s(X+Y),s(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,Z).
add2(s(X-Y),s(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,Z).

add2(X-Y,p(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,Z).
add2(X+Y,p(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,Z).
add2(X-Y,p(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(C,D,G),add2(E,F,H),add2(p(0),H,I),add2(G,I,Z).


add2(p(X-Y),A+B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(p(X+Y),A-B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(p(X-Y),A-B,Z) :-  expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,Z).

add2(X,p(A-B),Z) :- expand(X,0,C),expand(A,0,D),minus(B,0,E),add2(p(0),D+E,F),add2(C,F,Z).
add2(p(X-Y),A,Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),add2(p(0),C+D,F),add2(F,E,Z).

add2(p(X-Y),p(A+B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),expand(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(p(X+Y),p(A-B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),minus(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(p(X-Y),p(A-B),Z) :- expand(X,0,C),minus(Y,0,D),expand(A,0,E),minus(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,Z).

add2(X-Y,R,Z) :- expand(X,0,A),minus(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).
add2(X,Y-R,Z) :- expand(X,0,A),expand(Y,0,B),minus(R,0,C),add2(A,B,D),add2(D,C,Z).
add2(X-Y,A+B,Z) :- expand(X,0,D),minus(Y,0,E),expand(A,0,F),expand(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,Z).
add2(X+Y,A-B,Z) :- expand(X,0,D),expand(Y,0,E),expand(A,0,F),minus(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,Z).
add2(X+Y,A-B,Z) :- expand(X,0,D),minus(Y,0,E),expand(A,0,F),minus(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,Z).

add2(X,Y,Z) :- add(X,Y,Z).

subtract(X,Y,Z) :- expand(X,0,A),minus(Y,B),add2(A,B,Z).
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
expand(X-Y,W,Z) :- expand(X,W,R),expand(Y,R,Z).  
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
    1.add2(s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0),Z).
    2.add2(s(0)+s(0)+s(0)+s(0)+s(0),0,Z).add2(s(s(0))+p(0)-p(0),p(s(0)),Z).
Exercise 2
  test case 
    1.expand(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),0,Z).
    2.add2(s(0+p(0+s(0)))+s(0)+s(0),s(0+p(0+s(0))),Z)
Exercise 3
  test case 
    1.minus(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),Z).
Exercise 4
  test case
    1.add2(-s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).
    2.add2(-s(0+p(0+s(0)))+s(0)+s(0),-s(0+p(0+s(0))),Z) 
Exercise 5 
  test code 
    1. subtract(-s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).
    2. subtract(-s(0+s(0+s(0)))+s(0)+s(0),-s(0+s(0+s(0))),Z).
Exercise 6
  test code
    1. subtract(-s(0+s(0+s(0)))+s(0)+s(0),s(0-s(0-s(0))),Z).
    2. add2(s(s(0))+p(0)-p(0),p(s(0)),Z).
    3. add2(s(s(0))-p(0)-p(0),p(s(0)),Z).
*/

git 
numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(-X) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).


add(0,X,X).
add(s(X),p(Y),Z) :- add(X,Y,Z).
add(p(X),s(Y),Z) :- add(X,Y,Z).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).

add2(-X,Y,Z) :- minus(X,A),add2(A,Y,Z).
add2(X,-Y,Z) :- minus(Y,A),add2(X,A,Z).
add2(0,X+Y,Z) :- expand(X,0,A),expand(Y,0,B),add2(A,B,Z).
add2(X+Y,0,Z) :- expand(X,0,A),expand(Y,0,B),add2(A,B,Z).
add2(X+Y,s(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(s(0),E+F,H),add2(G,H,Z).
add2(s(X+Y),A+B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(s(0),C+D,H),add2(G,H,Z).
add2(X,s(A+B),Z) :- expand(X,0,C),expand(A,0,D),expand(B,0,E),add2(s(0),D+E,F),add2(C,F,Z).
add2(s(X+Y),A,Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),add2(s(0),C+D,F),add2(F,E,Z).
add2(s(X+Y),s(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(s(0),E+F,G),add2(s(0),C+D,H),add2(G,H,Z).

add2(X+Y,p(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(C,D,G),add2(p(0),E+F,H),add2(G,H,Z).
add2(p(X+Y),A+B,Z) :-  expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(E,F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(X,p(A+B),Z) :- expand(X,0,C),expand(A,0,D),expand(B,0,E),add2(p(0),D+E,F),add2(C,F,Z).
add2(p(X+Y),A,Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),add2(p(0),C+D,F),add2(F,E,Z).
add2(p(X+Y),p(A+B),Z) :- expand(X,0,C),expand(Y,0,D),expand(A,0,E),expand(B,0,F),add2(p(0),E+F,G),add2(p(0),C+D,H),add2(G,H,Z).
add2(X+Y,R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).
add2(X,Y+R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).
add2(X+Y,A+B,Z) :- expand(X,0,D),expand(Y,0,E),expand(A,0,F),expand(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,Z).
 

%minus sign
/*
add2(0,(-X)+Y,Z) :- minus(X,A),expand(A,0,B),expand(Y,0,C),add2(B,C,Z).
add2(0,X+(-Y),Z) :- minus(Y,A),expand(A,0,B),expand(X,0,C),add2(B,C,Z).
add2((-X)+Y,0,Z) :- minus(X,A),expand(A,0,B),expand(Y,0,C),add2(B,C,Z).
add2(X+(-Y),0,Z) :- minus(Y,A),expand(A,0,B),expand(X,0,C),add2(B,C,Z).
add2((-X),Y,Z) :- minus(X,A),add2(A,Y,Z).
add2(X,(-Y),Z) :- minus(Y,A),add2(X,A,Z).

add2((-X)+Y,s(A+B),Z) :- minus(X,D),add2(D,Y,W), add2(s(0),A+B,C),add2(W,C,Z).
add2(X+(-Y),s(A+B),Z) :- minus(Y,D),add2(X,D,W), add2(s(0),A+B,C),add2(W,C,Z).
add2(X+Y,s((-A)+B),Z):-add2(X,Y,W),minus(A,D),add2(D,B,C),add2(s(0),C,E),add2(W,E,Z).
add2(X+Y,s(A+(-B)),Z):-add2(X,Y,W),minus(B,D),add2(A,D,C),add2(s(0),C,E),add2(W,E,Z).
add2(s((-X)+Y),A+B,Z) :- minus(X,D),add2(D,Y,C),add2(s(0),C,E),add2(A,B,F),add2(E,F,Z).
add2(s(X+(-Y)),A+B,Z) :- minus(Y,D),add2(X,D,C),add2(s(0),C,E),add2(A,B,F),add2(E,F,Z).
add2((-X),s(A+B),Z) :- minus(X,D),add2(s(0),A+B,C),add2(D,C,Z).
add2(X,s((-A)+B),Z) :- minus(A,D),add2(D,B,C),add2(s(0),C,E),add2(X,E,Z).
add2(X,s(A+(-B)),Z) :- minus(B,D),add2(A,D,C),add2(s(0),C,E),add2(X,E,Z).
add2(s((-X)+Y),A,Z) :- minus(X,D),add2(D,Y,C),add2(s(0),C,E),add2(E,A,Z).
add2(s(X+(-Y)),A,Z) :- minus(Y,D),add2(X,D,C),add2(s(0),C,E),add2(E,A,Z).
add2(s((-X)+Y),s(A+B),Z) :- minus(X,D),add2(s(0),D+Y,E),add2(s(0),A+B,F),add2(E,F,Z).
add2(s(X+(-Y)),s(A+B),Z) :- minus(Y,D),add2(s(0),X+D,E),add2(s(0),A+B,F),add2(E,F,Z).
add2(s(X+Y),s((-A)+B),Z) :- minus(A,D),add2(s(0),X+Y,E),add2(s(0),D+B,F),add2(E,F,Z).
add2(s(X+Y),s(A+(-B)),Z) :- minus(B,D),add2(s(0),X+Y,E),add2(s(0),A+D,F),add2(E,F,Z).
add2((-X)+Y,p(A+B),Z) :- minus(X,D),add2(D,Y,W), add2(p(0),A+B,C),add2(W,C,Z).
add2(X+(-Y),p(A+B),Z) :- minus(Y,D),add2(X,D,W), add2(p(0),A+B,C),add2(W,C,Z).
add2(X+Y,p((-A)+B),Z):-add2(X,Y,W),minus(A,D),add2(D,B,C),add2(p(0),C,E),add2(W,E,Z).
add2(X+Y,p(A+(-B)),Z):-add2(X,Y,W),minus(B,D),add2(A,D,C),add2(p(0),C,E),add2(W,E,Z).
add2(p((-X)+Y),A+B,Z) :- minus(X,D),add2(D,Y,C),add2(p(0),C,E),add2(A,B,F),add2(E,F,Z).
add2(p(X+(-Y)),A+B,Z) :- minus(Y,D),add2(X,D,C),add2(p(0),C,E),add2(A,B,F),add2(E,F,Z).
add2((-X),p(A+B),Z) :- minus(X,D),add2(p(0),A+B,C),add2(D,C,Z).
add2(X,p((-A)+B),Z) :- minus(A,D),add2(D,B,C),add2(p(0),C,E),add2(X,E,Z).minus(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),Z).
add2(X,p(A+(-B)),Z) :- minus(B,D),add2(A,D,C),add2(p(0),C,E),add2(X,E,Z).
add2(p((-X)+Y),A,Z) :- minus(X,D),add2(D,Y,C),add2add(s(X),p(Y),Z) :- add(X,Y,Z).
add(p(X),s(Y),Z) :- add(X,Y,Z).(p(0),C,E),add2(E,A,Z).
add2(p(X+(-Y)),A,Z) :- minus(Y,D),add2(X,D,C),add2add(s(X),p(Y),Z) :- add(X,Y,Z).
add(p(X),s(Y),Z) :- add(X,Y,Z).(p(0),C,E),add2(E,A,Z).
add2(p((-X)+Y),p(A+B),Z) :- minus(X,D),add2(p(0),Dadd(s(X),p(Y),Z) :- add(X,Y,Z).
add(p(X),s(Y),Z) :- add(X,Y,Z).+Y,E),add2(p(0),A+B,F),add2(E,F,Z).
add2(p(X+(-Y)),p(A+B),Z) :- minus(Y,D),add2(p(0),X+D,E),add2(p(0),A+B,F),add2(E,F,Z).
add2(p(X+Y),p((-A)+B),Z) :- minus(A,D),add2(p(0),X+Y,E),add2(p(0),D+B,F),add2(E,F,Z).
add2(p(X+Y),p(A+(-B)),Z) :- minus(B,D),add2(p(0),X+Y,E),add2(p(0),A+D,F),add2(E,F,Z).


add2((-X)+Y,R,Z) :- minus(X,E),expand(Y,0,B),expand(R,0,C),add2(E,B,D),add2(D,C,Z).
add2(X+(-Y),R,Z) :- minus(Y,E),expand(X,0,A),expand(R,0,C),add2(A,E,D),add2(D,C,Z).
add2(X+Y,(-R),Z) :- minus(R,E),expand(X,0,A),expand(Y,0,B),add2(A,B,D),add2(D,E,Z).

add2((-X),Y+R,Z) :- minus(X,D),expand(Y,0,A),expand(R,0,B),add2(A,B,E),add2(D,E,Z).
add2(X,(-Y)+R,Z) :- minus(Y,D),expand(X,0,A),expand(R,0,B),add2(A,B,E),add2(D,E,Z).
add2(X,Y+(-R),Z) :- minus(R,D),expand(X,0,A),expand(Y,0,B),add2(A,B,E),add2(D,E,Z).

add2((-X)+Y,A+B,Z) :- minus(X,W),expand(Y,0,E),expand(A,0,F),expand(B,0,G),add2(W,E,H),add2(F,G,I),add2(H,I,Z).
add2(X+(-Y),A+B,Z) :- minus(Y,W),expand(X,0,E),expand(A,0,F),expand(B,0,G),add2(W,E,H),add2(F,G,I),add2(H,I,Z).
add2(X+Y,(-A)+B,Z) :- minus(A,W),expand(X,0,C),expand(Y,0,E),expand(B,0,G),add2(C,E,H),add2(W,G,I),add2(H,I,Z).
add2(X+Y,A+(-B),Z) :- minus(B,W),expand(X,0,C),expand(Y,0,E),expand(A,0,G),add2(C,E,H),add2(W,G,I),add2(H,I,Z).
*/
add2(X,Y,Z) :- add(X,Y,Z).

/*
main purpse of this block is to eliminate redundant expression such as reduce p(p(p(s(s(0))))) to p(0).
*/
expand(0,X,X).
expand(s(X),p(Y),Z) :- expand(X,Y,Z).
expand(p(X),s(Y),Z) :- expand(X,Y,Z).
expand(s(X),Y,Z) :- add2(s(0),Y,W),expand(X,W,Z).
expand(p(X),Y,Z) :- add2(p(0),Y,W),expand(X,W,Z).
expand((-X),W,Z) :- minus(X,Y),expand(Y,W,Z).
expand(X+Y,W,Z) :- expand(X,W,R),expand(Y,R,Z). 


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
    1.add2(s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).
    2.add2(s(0)+s(0)+s(0)+s(0)+s(0),0,Z).
Exercise 2
  test case 
    1.expand(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),0,Z).
    2.add2(s(0+p(0+s(0)))+s(0)+s(0),s(0+p(0+s(0))),Z).
Exercise 3
  test case 
    1.minus(s(0+p(0+s(0)))+s(0)+s(0)+s(0+p(0+s(0))),Z).
Exercise 4
  test case
    1.add2(-s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).
    2.add2(-s(0+p(0+s(0)))+s(0)+s(0),-s(0+p(0+s(0))),Z)
*/


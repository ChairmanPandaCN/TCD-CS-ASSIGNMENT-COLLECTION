numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).


add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).


add2(0,X+Y,Z) :- add2(X,Y,Z).
add2(X+Y,0,Z) :- add2(X,Y,Z).

add2(X+Y,s(A+B),Z) :- add2(X,Y,W), add2(s(0),A+B,C),add2(W,C,Z).
add2(s(X+Y),A+B,Z) :- add2(s(0),X+Y,W), add2(A,B,C),add2(W,C,Z).
add2(X,s(A+B),Z) :- add2(s(0),A+B,C),add2(X,C,Z).
add2(s(X+Y),A,Z) :- add2(s(0),X+Y,W),add2(W,A,Z).
add2(s(X+Y),s(A+B),Z) :- add2(s(0),X+Y,W),add2(s(0),A+B,C),add2(W,C,Z).


add2(X+Y,p(A+B),Z) :- add2(X,Y,W), add2(p(0),A+B,C),add2(W,C,Z).
add2(p(X+Y),A+B,Z) :- add2(p(0),X+Y,W), add2(A,B,C),add2(W,C,Z).
add2(X,p(A+B),Z) :- add2(p(0),A+B,C),add2(X,C,Z).
add2(p(X+Y),A,Z) :- add2(p(0),X+Y,W),add2(W,A,Z).
add2(p(X+Y),p(A+B),Z) :- add2(p(0),X+Y,W),add2(p(0),A+B,C),add2(W,C,Z).

add2(X+Y,R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).

add2(X,Y+R,Z) :- expand(X,0,A),expand(Y,0,B),expand(R,0,C),add2(A,B,D),add2(D,C,Z).

add2(X+Y,A+B,Z) :- expand(X,0,D),expand(Y,0,E),expand(A,0,F),expand(B,0,G),add2(D,E,H),add2(F,G,I),add2(H,I,Z).
add2(X,Y,Z) :- add(X,Y,Z).


expand(0,X,X).
expand(s(X),p(Y),Z) :- expand(X,Y,Z).
expand(p(X),s(Y),Z) :- expand(X,Y,Z).
expand(s(X),Y,Z) :- add2(s(0),Y,W),expand(X,W,Z).
expand(p(X),Y,Z) :- add2(p(0),Y,W),expand(X,W,Z).
expand(X+Y,W,Z) :- expand(X,W,R),expand(Y,R,Z). 


/* 
    purly for fun.=.=
Exercise 1
  test case 
    1.add2(s(0+s(0+s(0)))+s(0)+s(0),s(0+s(0+s(0))),Z).
    2.add2(s(0)+s(0)+s(0)+s(0)+s(0),0,Z).
Exercise 2
  test case 
    1.add2(s(0+p(0+s(0)))+s(0)+s(0),s(0+p(0+s(0))),Z).
*/
numeral(0).
numeral(succ(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).


add(0,X,X).
add(succ(X),Y,succ(Z)) :- add(X,Y,Z).


%Exercise 1

add2(0,X+Y,Z) :- add(X,Y,Z).
add2(X+Y,0,Z) :- add(X,Y,Z).

add2(X+Y,succ(A+B),Z) :- add(X,Y,W), add(succ(A),B,C),add2(W,C,Z).
add2(X+Y,R,Z) :- add(X,Y,A), add(A,R,Z).
add2(X,Y+R,Z) :- add(Y,R,A), add(X,A,Z).
%add2(X+Y,A+B,Z) :- add(X,Y,W), add(A,B,C) ,add2(W,C,Z).
add2(X,Y,Z) :- add(X,Y,Z).

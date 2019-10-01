numeral(0).
numeral(s(X)) :- numeral(X).
numeral(p(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).


add(0,X,X).
add(p(X),s(X),0).
add(s(X),Y,s(Z)) :- add(X,Y,Z).
add(p(X),Y,p(Z)) :- add(X,Y,Z).
%Exercise 1
/*

*/
add2(0,X+Y,Z) :- add2(X,Y,Z).
add2(X+Y,0,Z) :- add2(X,Y,Z).
add2(X+Y,s(A+B),Z) :- add2(X,Y,W), add2(s(0),A+B,C),add2(W,C,Z).
add2(s(X+Y),A+B,Z) :- add2(s(0),X+Y,W), add2(A,B,C),add2(W,C,Z).

add2(X,s(A+B),Z) :- add2(s(0),A+B,C),add2(X,C,Z).
add2(s(X+Y),A,Z) :- add2(s(0),X+Y,W),add2(W,A,Z).

add2(s(X+Y),s(A+B),Z) :- add2(s(0),X+Y,W),add2(s(0),A+B,C),add2(W,C,Z).

add2(X+Y,R,Z) :- add2(X,Y,A), add2(A,R,Z).
add2(X,Y+R,Z) :- add2(Y,R,A), add2(X,A,Z).
add2(X+Y,A+B,Z) :- add2(X,Y,W), add2(A,B,C) ,add2(W,C,Z).
add2(X,Y,Z) :- add(X,Y,Z).

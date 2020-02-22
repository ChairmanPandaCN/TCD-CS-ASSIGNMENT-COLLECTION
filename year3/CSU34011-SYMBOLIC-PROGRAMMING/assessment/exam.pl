q(a).
q(X):- X=b,!.
q(c).


mylength(X,Y) :- test(X,0,Y).
test([_|Y],Z,W) :- Z1 is Z+1,test(Y,Z1,W).
test([],Z,Z).

reverse(X,Z) :- accreverse(X,[],Z).
accreverse([X|Y],W,Z):-accreverse(Y,[X|W],Z). 
accreverse([],W,W).


append([],Y,Y).
append([X|A],Y,[X|Z]) :- append(A,Y,Z).

accMax([H|T],A,B):- H > A,accMax(T,H,B).
accMax([H|T],A,B):- H =< A,accMax(T,A,B).
accMax([],A,A).
max([H|T],Result) :- accMax([H|T],H,Result). 

prefix(P,List) :- append(P,_,List).
suffix(S,List) :- append(_,S,List).
sublist(Sub,List) :- suffix(S,List),prefix(Sub,S).

child(martha,charlotte).
child(charlotte,caroline).
child(caroline,laura).
child(laura,rose).

descend(X,Y) :- child(X,Y).
descend(X,Z) :- child(X,Y),descend(Y,Z).


memb(X,[X|_]).
memb(X,[_|T]) :- memb(X,T).

numeral(0).
numeral(succ(X)):- numeral(X).
add(0,Y,Y).
add(succ(X),Y,Z):- add(X,succ(Y),Z).

multiply(X,Y,Z) :- mul(X,Y,0,Z).
mul(succ(X),Y,W,Z):- add(Y,W,A),mul(X,Y,A,Z).
mul(0,_,Y,Y).

pos(succ(0)).
pos(succ(X)):- pos(X).
neg(pred(0)).
neg(pred(X)):- neg(X).

pure(0).
pure(X):- pos(X);neg(X).

mixed(0).
mixed(succ(X)):-mixed(X).
mixed(pred(X)):-mixed(X).

convert(X,Y) :- subconvert(X,0,Y).
subconvert(0,Y,Y).
subconvert(succ(X),succ(Y),Z):- subconvert(X,succ(succ(Y)),Z).
subconvert(pred(X),pred(Y),Z):- subconvert(X,pred(pred(Y)),Z).
subconvert(succ(X),pred(Y),Z):- subconvert(X,Y,Z).
subconvert(pred(X),succ(Y),Z):- subconvert(X,Y,Z).
subconvert(pred(X),0,Z):- subconvert(X,pred(0),Z).
subconvert(succ(X),0,Z):- subconvert(X,succ(0),Z).

s --> [].
s --> singleZero,choice,ending.
singleZero --> [0].
choice -->[].
choice -->[0],choice.
choice -->[1,1],choice.
ending-->[1,1].

s1(X,L) :- lending(X,A),choice1(A,B),ending1(B,L).
lending([0|W],W).
choice1(W,W).
choice1([0|W],Z):- choice1(W,Z).
choice1([1,1|W],Z) :- choice1(W,Z).
ending1([1,1|X],X).

s2017 --> [].
s2017 --> ab,bc.
ab --> [].
ab --> [a],ab,[b].
bc --> [].
bc --> [b],bc,[c].

mklist(-1,[]).
mklist(X,[X|T]) :- X > -1 , Y is X-1, mklist(Y,T).


s20171(0) -->[].
s20171(Max) --> {Max>0,mklist(Max,List),member(Before,List), member(After,List),Before + After =<6},ab1(Before),bc1(After).
ab1(0) --> [].
ab1(Max) --> {Max>0,NewMax is Max -2},[a],ab1(NewMax),[b].
bc1(0) --> [].
bc1(Max) --> {Max>0,NewMax is Max -2},[b],bc1(NewMax),[c].

s2018 --> [].
s2018 --> b,s2018.
b --> [0].
b --> [1].




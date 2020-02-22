mklist(0, []).
mklist(X,[X|T]) :- X \= 0, Y is X-1, mklist(Y,T).

s(0) --> [].
s(Num) --> {mklist(Num, List)}, [Temp], {member(Temp, List)}, {Remainder is Num-Temp}, s(Remainder).

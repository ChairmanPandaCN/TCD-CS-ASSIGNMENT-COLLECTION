s1(InputList,2)--> {length(InputList,Y),New is Y*2},a1(New).
a1(0) --> [].
a1(Max) --> {New is Max-1,New>=0},[a],a1(New).
a1(Max) --> {New is Max-1,New>=0},[b],a1(New).


s --> a.
a --> [].
a --> [a],a,b,c.
b --> [].
b --> [b],b,c.
c --> [c].
s --> u(Ucount),two,v(Vcount),{Ucount=:=2*Vcount}.
two --> [2].
u(0) -->[].
u(NewCount) --> [0], u(Count),{NewCount is Count+1}.
u(Count) --> [1], u(Count).
v(0) -->[].
v(NewCount) --> [1], v(Count),{NewCount is Count+1}.
v(Count) --> [0], v(Count).
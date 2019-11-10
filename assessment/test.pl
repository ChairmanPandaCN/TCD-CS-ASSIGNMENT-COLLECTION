lex(red,colour).
lex(blue,colour).
lex(green,colour).
lex(english,nationality).
lex(japanese,nationality).
lex(spanish,nationality).
lex(snail,pet).
lex(jaguar,pet).
lex(zebra,pet).
colour(Word) -->[Word],{lex(Word,colour)}.
nationality(Word) -->[Word],{lex(Word,nationality)}.
pet(Word) -->[Word],{lex(Word,pet)}.
house(Col,Nat,Pet)--> colour(Col),nationality(Nat),pet(Pet). 
s --> house(Col1,Nat1,Nat1),house(Col2,Nat2,Pet2),house(Col3,Nat3,Pet3),{Col1=\=Col2,Col1=\=Col3,Col2=\=Col3},{Nat1=\=Nat2,Nat1=\=Nat3,Nat2=\=Nat3},{Pet1=\=Pet2,Pet1=\=Pet3}.
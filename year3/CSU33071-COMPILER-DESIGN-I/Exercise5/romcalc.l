%{
# include "romcalc.tab.h"
void yyerror(char *s);
%}

%%
IV  { return FOUR; }
IX  { return NINE; }
XL  { return FORTY;}
XC  { return NINTY;}
CD  { return FOURH;}
CM  { return NINEH;}
Z   { return ZERO;}
I	{ return ONE; }
V	{ return FIVE; }
X	{ return TEN; }
L	{ return FIFTY; }
C   { return HUNDRED; }
D   { return FIVEH; }
M   { return THOUSAND; }
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"{" {return OB;}
"}" {return CB;}
\n  { return EOL; }
.	{ yyerror("syntax error");return 0;}
%%

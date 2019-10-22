%{
# include "roman.tab.h"
void yyerror(char *s);
%}

%%
CMCC {yyerror("syntax error");return 0;}
IV  { return FOUR; }
IX  { return NINE; }
XL  { return FORTY;}
XC  { return NINTY;}
CD  { return FOURH;}
CM  { return NINEH;}
I	{ return ONE; }
V	{ return FIVE; }
X	{ return TEN; }
L	{ return FIFTY; }
C   { return HUNDRED; }
D   { return FIVEH; }
M   { return THOUSAND; }
\n  { return EOL; }
.	{ yyerror("syntax error");return 0;}
%%

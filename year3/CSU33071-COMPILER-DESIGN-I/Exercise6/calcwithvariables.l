%{
#include "calcwithvariables.tab.h"
void yyerror(char *s);    
%}

%%
[0-9]+ {yylval = atoi(yytext);return VALUE;}
[a-z] { yylval = yytext[0];return VARIABLE;}
"print" { return PRINT;}
":=" { return ASSIGN;}
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
";" { return EOL; }
[\n\t\v ] {}
. {yyerror("syntax error");}
%%

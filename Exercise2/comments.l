%{
%}

%%
\*{2}.* {}
\{[^\}]*\} {}
\".*\"  {printf(yytext);}
\{[^\}]* {printf("syntax error\n");}
\}[( \n\t\v\r)|(a-zA-Z0-9\.\:\=\;\+)]* {printf("syntax error\n");}
%%


int main(){
yylex();
return 0;
}

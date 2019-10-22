%{
    #include <stdio.h>
    int yylex();
    void yyerror(char *s);
    int value =0;
%}
%token ONE FIVE TEN FIFTY HUNDRED FIVEH THOUSAND
%token FOUR NINE FORTY NINTY FOURH NINEH
%token EOL

%%
roman : /* nothing */
    |roman arabic EOL { printf("%d\n",value);value=0;}
    ;

arabic : 
    | arabic FOUR arabic{value = value+4;}
    | arabic NINE arabic{value = value+9;}
    | arabic FORTY arabic{value = value+40;}
    | arabic NINTY arabic{value = value+90;}
    | arabic FOURH arabic{value = value+400;}
    | arabic NINEH arabic{value = value+900;}
    | arabic ONE arabic{value = value+1;}
    | arabic FIVE arabic{value = value+5;}
    | arabic TEN arabic{value = value+10;}
    | arabic FIFTY arabic{value = value+50;}
    | arabic HUNDRED arabic{value = value+100;}
    | arabic FIVEH arabic{value = value+500;}
    | arabic THOUSAND arabic{value = value+1000;}
    ;
%%

int main(){
    yyparse();
    return 0;
}
void yyerror(char *s){
    fprintf(stderr,"%s\n",s);
}
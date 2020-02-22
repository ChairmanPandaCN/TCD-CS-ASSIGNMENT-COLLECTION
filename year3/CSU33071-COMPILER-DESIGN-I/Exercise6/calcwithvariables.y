%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char *s);

    void setVariableTable(char c,int value);
    int readVariableValue(char c);
    int variableNotExist(char c);

    int variableValueTable['z'-'a'];
    int variableTable['z'-'a'];

%}
%token ADD SUB MUL DIV ASSIGN
%token VALUE VARIABLE
%token PRINT
%token EOL

%%
calclist:
    | calclist ASSIGNMENT EOL 
    ;
ASSIGNMENT: VARIABLE ASSIGN EXPRESSION {setVariableTable($1, $3);}
    | PRINT EXPRESSION {printf("%d\n",$2);}
    ;
EXPRESSION: EXPRESSION ADD NUM {$$=$1+$3;}
    | EXPRESSION SUB NUM {$$=$1-$3;}
    | FACTOR
    ;
FACTOR: FACTOR MUL NUM {$$=$1*$3;}
    | FACTOR DIV NUM {$$=$1/$3;}
    | NUM
    ;
NUM: SUB NUM {$$=-$2;}
    | VARIABLE { 
        if(variableNotExist($1)){
            $$=readVariableValue($1);
        }else{
            yyerror("syntax error");
        }
    }
    | VALUE
    ;
%%

int main(){
    yyparse();
    return 0;
}
void yyerror(char *s){
    printf("%s\n", s);
    exit(0);
}

void setVariableTable(char c,int value){
    int index = c-'a';
    variableValueTable[index]=value;
    variableTable[index]=1;
}
int readVariableValue(char c){
    int index = c - 'a';
    return variableValueTable[index];
}
int variableNotExist(char c){
    int index = c - 'a';
    return variableTable[index];
}
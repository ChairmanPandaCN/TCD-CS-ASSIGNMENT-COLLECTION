%{
    #include <stdio.h>
    #include <stdlib.h>
    int yylex();
    void yyerror(char *s);
%}
%token ONE FIVE TEN FIFTY HUNDRED FIVEH THOUSAND
%token FOUR NINE FORTY NINTY FOURH NINEH ZERO
%token ADD SUB MUL DIV OB CB 
%token EOL

%%
calclist :
    | calclist EXPRESSION EOL {printf("%d\n",$2);$2=0;}
    ;
EXPRESSION : 
    | number {$$=+$1;}
    | EXPRESSION ADD number {$$ = $1+$3;}
    | EXPRESSION SUB number {$$ = $1-$3;}
    | EXPRESSION MUL number {$$ = $1*$3;}
    | EXPRESSION DIV number {$$ = $1/$3;}
    | OB EXPRESSION CB {$$=$2;}
    ;
    

    
number :
    | number FOUR {$$ = $1+4;}
    | number NINE {$$ =$1+9;}
    | number FORTY {$$ =$1+40;}
    | number NINTY {$$ =$1+90;}
    | number FOURH {$$ =$1+400;}
    | number NINEH {$$ =$1+900;}
    | number ONE {$$ =$1+1;}
    | number FIVE{$$ =$1+5;}
    | number TEN {$$ =$1+10;}
    | number FIFTY {$$ =$1+50;}
    | number HUNDRED {$$ =$1+100;}
    | number FIVEH {$$ =$1+500;}
    | number THOUSAND {$$ =$1+1000;}
    | number ZERO {$$ = $1+0;}
    ;
%%

int main(){
    yyparse();
    return 0;
}
void yyerror(char *s){
    fprintf(stderr,"%s\n",s);
}

void ans_to_rom (int number) {
  int neg = 0;
  if(number < 0) {
    number -= number*2;
    neg = 1;
  }
  	if (neg == 1){
			printf("-");
			
		  } 
	
  	while (number > 0) {
		  
		  
		if(number >= 1000) {
			number -= 1000;
			printf("M");
		}
		else if(number >= 900) {
			number -= 900;
			printf("CM");
		}
		else if(number >= 500) {
			number -= 500;
			printf("D");
		}
		else if(number >= 400) {
			number -= 400;
			printf("CD");
		}
		else if(number >= 100) {
			number -= 100;
			printf("C");
		}
		else if(number >= 90) {
			number -= 90;
			printf("XC");
		}
		else if(number >= 50) {
			number -= 50;
			printf("L");
		}
		else if(number >= 40) {
			number -= 40;
			printf("XL");
		}
		else if(number >= 10) {
			number -= 10;
			printf("X");
		}
		else if(number >= 9) {
			number -= 9;
			printf("IX");
		}
		else if(number >= 5) {
			number -= 5;
			printf("V");
		}
		else if(number >= 4) {
			number -= 4;
			printf("IV");
		}
		else if(number >= 1) {
			number -= 1;
			printf("I");
		}
	}
	printf("\n");
  }
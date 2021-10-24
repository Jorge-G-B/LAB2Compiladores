%{
	#include <ctype.h>
	#include <stdio.h>
	
	extern int yylex();
	void yyerror(char *msg);
%}
%token AND
%token OR
%token NOT
%token BOOLEAN

%%

lines : lines bexpr '\n' {if ($2 != 0){ printf("true(1)\n");} else{ printf("false(0)\n");}}
	  | lines '\n'
	  | /* empty */;
bexpr : bexpr OR bterm {$$ = $1 || $3}
	  |	bterm;
bterm : bterm AND bfactor {$$ = $1 && $3}
	  |  bfactor;
bfactor : NOT bfactor	{$$ = ! $2}
        | '(' bexpr ')' {$$ = $2}
        | BOOLEAN;

%%

#include "lex.yy.c"

void yyerror(char *msg){
	printf("Error de sintaxis");
	exit(0);
}

int main(){
	yyparse();
	return 0;
}
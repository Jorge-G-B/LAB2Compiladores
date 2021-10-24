/*%{
	#define AND 251
	#define NOT	252	
	#define OR	253
	#define BOOLEAN 254
%}*/
AND 	[Aa][Nn][Dd]
NOT		[Nn][Oo][Tt]
OR		[Oo][Rr]
true	[Tt][Rr][Uu][Ee]
false	[Ff][Aa][Ll][Ss][Ee]
%%

[ \t]		; { /* Espacios en blanco */ }
[()\n]		return yytext[0];
{AND}		return AND;
{NOT}		return NOT;
{OR}		return OR;
{true}		yylval = 1; return BOOLEAN;
{false}		yylval = 0; return BOOLEAN;
.			printf("Error\n");

%%
int yywrap(void)
{
	return 0;
}

/*main(){
	int token;
	token = yylex();
	while (token){
		printf("%d\n", token);
		token = yylex();
	}
}*/
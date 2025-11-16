%{
#include <stdio.h>
extern char *yytext;
int yylex(void);
void yyerror(const char *s){ 
printf("Error: %s\n", s); 
}
%}
%token VARIABLE
%%
input: VARIABLE { 
printf("Valid variable: %s\n", yytext); 
};
%%
int main(){ 
printf("Enter a variable: "); 
return yyparse(); 
}

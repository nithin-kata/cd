%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s) { printf("Syntax error: %s\n", s); }
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
input:
    | input expr '\n' { printf("Result = %d\n", $2); }
;
expr:
      NUM
    | '(' expr ')' { $$ = $2; }
    | expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { if($3 == 0){ yyerror("Division by zero"); YYABORT; } $$ = $1 / $3; }
;
%%
int main() {
    printf("Enter an arithmetic expression:\n");
    return yyparse();
}

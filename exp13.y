%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s){
    fprintf(stderr, "\n%s expression is invalid\n", s);
}
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%start start
%%
start:
    expr    { printf("Result = %d\n", $1); }
;
expr:
      expr '+' expr   { $$ = $1 + $3; }
    | expr '-' expr   { $$ = $1 - $3; }
    | expr '*' expr   { $$ = $1 * $3; }
    | expr '/' expr   { $$ = $1 / $3; }
    | '-' NUMBER      { $$ = -$2; }
    | '(' expr ')'    { $$ = $2; }
    | NUMBER          { $$ = $1; }
;
%%
int main() {
    printf("enter the expression\n");
    return yyparse();
}

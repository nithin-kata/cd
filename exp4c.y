%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(char *s){ printf("Error: %s\n", s); }
%}
%token NUM
%%
S : /* empty */
  | S E '\n' { printf("= %d\n", $2); }
  ;
E : E '+' T { $$ = $1 + $3; }
  | E '-' T { $$ = $1 - $3; }
  | T
  ;
T : T '*' F { $$ = $1 * $3; }
  | T '/' F { $$ = $3 ? $1 / $3 : (yyerror("Divide by zero"), 0); }
  | F
  ;
F : '(' E ')' { $$ = $2; }
  | NUM
  ;
%%
int main() {
    printf("Enter expressions:\n");
    return yyparse();
}

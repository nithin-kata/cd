%{
#include "y.tab.h"
#include <string.h>
%}
%%
int     { return INT; }
float   { return FLOAT; }
char    { return CHAR; }
[a-zA-Z][a-zA-Z0-9]*  { yylval.s=strdup(yytext); return ID; }
";"     { return ';'; }
[ \t\n]+ ;
.       ;
%%
int yywrap(){return 1;}

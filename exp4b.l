%{
#include "y.tab.h"
%}

%%
[a-zA-Z][a-zA-Z0-9]*    return VARIABLE;
[ \t\n]+                ;
.                       return *yytext;
%%
int yywrap()  { return 1;}

%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
%}
%%
int         { return INT; }
float       { return FLOAT; }
[a-zA-Z][a-zA-Z0-9]*   { yylval.s=strdup(yytext); return ID; }
[0-9]+                 { yylval.i=atoi(yytext); return INT_NUM; }
[0-9]+"."[0-9]+        { yylval.f=atof(yytext); return FLOAT_NUM; }
"="         { return '='; }
";"         { return ';'; }
[ \t\n]+    ;
.           { printf("Unknown: %s\n", yytext); }
%%
int yywrap() {
    return 1;
}

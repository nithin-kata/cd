%{
#include<stdio.h>
%}
%%
if|else|while|int|switch|for|char|float|double|break|goto|do {printf("keyword");}
[_a-z A-Z][_a-z A-Z 0-9]+ {printf("identifier");}
[0-9]* {printf("number");}
.* {printf("invalid");}
%%
int yywrap()
{
 return 1;
}
int main()
{
yylex();
return 0;
}

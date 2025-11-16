%{
#include <stdio.h>
#include <string.h>
int o=0;
int S(char*t){return strcmp(t,"char")==0?1:4;}
int A(char*t){return S(t);}
void F(int a){ if(o%a) o+=a-(o%a); }
int yylex(); void yyerror(const char*s){}
%}
%union{char*s;}
%token <s> ID INT FLOAT CHAR
%type <s> T
%%
P:|P D;
D:
 T ID ';' {
   int s=S($1),a=A($1); F(a);
   printf("Allocated %s %s at stack offset %d (size %d, alignment %d)\n",$1,$2,o,s,a);
   o+=s;
 }
;
T:INT{$$="int";}|FLOAT{$$="float";}|CHAR{$$="char";};
%%
int main(){return yyparse();}

%{
#include<stdio.h>
int l=0,w=0,in=0;
%}
%%
\n      {l++;in=0;}
[ \t]+  {in=0;}
[^\t\n ]+ {if(!in){w++;in=1;}}
%%
int main(){
 printf("Enter text (Ctrl+D to end):\n");
 yylex();
 printf("Lines:%d\nWords:%d\n",l,w);
}
int yywrap(){return 1;}

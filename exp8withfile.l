%{
#include<stdio.h>
int nc,nw,nl;
%}
%%
[a-zA-Z0-9]+ {nw++;nc+=yyleng;}
[ \t]+       {nc+=yyleng;}
\n           {nl++;nc++;}
.            {nc++;}
%%
int yywrap(){return 1;}

int main(int c,char**v){
 if(c<2)return printf("Use: %s <file>\n",v[0]),0;
 if(!(yyin=fopen(v[1],"r")))return puts("File error"),1;
 yylex();
 printf("Characters:%d\nWords:%d\nLines:%d\n",nc,nw,nl);
}


%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
typedef struct S{ char*n,*t; struct S*next;}S;
S*T=0;
void add(char*n,char*t){
    for(S*p=T;p;p=p->next)
        if(!strcmp(p->n,n)){ printf("Error: Variable redeclared\n"); return; }
    S*p=malloc(sizeof(S)); p->n=strdup(n); p->t=strdup(t); p->next=T; T=p;
}
char* find(char*n){
    for(S*p=T;p;p=p->next)
        if(!strcmp(p->n,n)) return p->t;
    return 0;
}
void yyerror(const char*s){ printf("Error: %s\n",s); }
int yylex();
%}
%union{ int i; float f; char*s; }
%token <s> ID
%token <i> INT_NUM
%token <f> FLOAT_NUM
%token INT FLOAT
%type <s> type expression
%%
program: | program stmt ;
stmt: decl ';' | asg ';' ;
decl:
    type ID { add($2,$1); printf("Declared %s %s\n",$1,$2); free($2); }
;
asg:
    ID '=' expression {
        char*t=find($1);
        if(!t) printf("Error: Undeclared variable %s\n",$1);
        else{
            if(strcmp(t,$3)) printf("Warning: Assigning incompatible type to variable %s\n",$1);
            printf("Assigned value to %s\n",$1);
        }
        free($1);
    }
;
type: INT {$$="int";} | FLOAT {$$="float";};
expression: INT_NUM {$$="int";} | FLOAT_NUM {$$="float";};
%%
int main(){ return yyparse(); }

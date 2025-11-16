#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
const char *p;
char c0;
void err(){ printf("Parse error at '%c'\n", c0); exit(1); }
void next(){
    do c0 = *p++;
    while(c0==' ' || c0=='\t' || c0=='\n');
}
void match(char c){ if(c0==c) next(); else err(); }
void E(),T(),F();
void E(){ T(); while(c0=='+'){ next(); T(); } }
void T(){ F(); while(c0=='*'){ next(); F(); } }
void F(){
    if(c0=='('){ next(); E(); match(')'); }
    else if(isalpha(c0)) next();
    else err();
}
int main(){
    char s[100];
    printf("Enter an expression: ");
    fgets(s,100,stdin);
    p=s; next(); E();
    if(c0==0 || c0=='\n') printf("Parsing successful.\n");
    else err();
}

#include <stdio.h>
#include <stdlib.h>
char *p, c;
void e(char *m) {
    printf("Syntax Error: %s\n", m);
    exit(0);
}
void n() {
    c = *++p;
}
void s(), l();
void s() {
    if (c == '(') {
        n();
        s();
        l();
        if (c != ')')
            e("missing ')'");
        n();
    }
    else if (c == 'a')  n();
    else  e("Invalid");
}
void l() {
    if (c == ',') {
        n();
        s();
        l();
    }
}
void main() {
    char str[100];
    printf("Expression: ");
    scanf("%s", str);
    p = str;
    c = *p;
    s();
    if (c == '\0')
        printf("Parsing successful: valid expression\n");
    else   e("Extra characters in expression");
}

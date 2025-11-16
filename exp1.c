#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
int main() {
    char expr[50], c;
    void *addr[50];
    int i = 0, x = 0;
    printf("Expression terminated by $: ");
    while ((c = getchar()) != '$') expr[i++] = c;
    printf("Given Expression: ");
    for (int j = 0; j < i; j++) printf("%c", expr[j]);
    printf("\n\nSymbol Table\nSymbol\tAddress\tType\n");
    for (int j = 0; j < i; j++) {
        c = expr[j];
        if (isalpha(c)) {
            addr[x] = malloc(1);
            printf("%c\t%p\tidentifier\n", c, addr[x++]);
        } else if (c == '+' || c == '-' || c == '*' || c == '=') {
            addr[x] = malloc(1);
            printf("%c\t%p\toperator\n", c, addr[x++]);
        }
    }
    return 0;
}

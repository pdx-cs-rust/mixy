#include <stdio.h>

extern char *myfun(void);

int main(void) {
    char *s1 = myfun();
    printf("%u %s\n", (unsigned long) s1, s1);
    char *s2 = myfun();
    printf("%u %s\n", (unsigned long) s1, s2);
    return 0;
}

/* Copyright © 2016 Bart Massey */

/* Demonstrate calling statically-linked Rust from C. */

#include <stdio.h>
#include <stdlib.h>

/* Rust externals. */
extern char *gethello(void);
extern void freehello(char *);

/* This program should print the same string but different addresses.
   When run with valgrind, it should show no leaks. */
int main(void) {
    char *s1 = gethello();
    printf("%u: %s\n", (unsigned long) s1, s1);
    char *s2 = gethello();
    printf("%u: %s\n", (unsigned long) s2, s2);
    freehello(s1);
    free(s2);
    return 0;
}

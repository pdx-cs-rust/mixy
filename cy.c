/*
 * Copyright © 2016 Bart Massey
 * [This program is licensed under the "MIT License"] Please
 * see the file COPYING in the source distribution of this
 * software for license terms.
 */


/* Demonstrate calling statically-linked Rust from C. */

#include <stdio.h>
#include <stdlib.h>

/* Rust externals. */
extern int rust_add(int, int);

int main(void) {
    printf("%d\n", rust_add(2, 3));
    return 0;
}

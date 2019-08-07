/*
 * Copyright © 2016 Bart Massey
 * [This program is licensed under the "MIT License"] Please
 * see the file COPYING in the source distribution of this
 * software for license terms.
 */


/* Demonstrate calling statically-linked Rust from C and vice-versa. */

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

/* Rust externals. */
extern int32_t rust_add(int32_t, int32_t);

int32_t c_mul(int32_t x, int32_t y) {
    return x * y;
}

int main(void) {
    printf("%d\n", rust_add(2, 3));
    return 0;
}

# Copyright © 2016 Bart Massey
# 
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source distribution of
# this software for license terms.
# 
# Makefile for mixy: demonstration of calling
# statically-linked rust from C.


RUSTFLAGS = --crate-type=staticlib --emit=obj -C lto=fat \
  -C overflow-checks=true -C panic=abort

# Optimized
#RUSTC = rustc -C opt-level=3
#CC = clang -O3

# Debug
#
# NOTE: This is extremely fragile and sus. Requires lto=fat from above to
# link. Requires opt-level=1 to link and get a reasonable-sized text
# section.
#
RUSTC = rustc -g -C opt-level=1
CC = clang -g

OBJS = cy.o rusty.o

mixy: $(OBJS)
	$(CC) $(CFLAGS) -o mixy $(OBJS) $(LIBS)

rusty.o: Makefile rusty.rs
	$(RUSTC) $(RUSTFLAGS) rusty.rs

cy.o: Makefile

clean:
	-rm -f mixy $(OBJS)

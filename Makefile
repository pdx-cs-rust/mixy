# Copyright © 2016 Bart Massey
# 
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source distribution of
# this software for license terms.
# 
# Makefile for mixy: demonstration of calling
# statically-linked rust from C.

OBJS = cy.o rusty.o

mixy: $(OBJS)
	$(CC) $(CFLAGS) -o mixy $(OBJS) $(LIBS)

# XXX This will not currently work without -O.
#   https://github.com/rust-lang-nursery/compiler-builtins/issues/245
rusty.o: rusty.rs
	rustc -O --emit=obj -C panic="abort" rusty.rs

clean:
	-rm -f mixy $(OBJS)

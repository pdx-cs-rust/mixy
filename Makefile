# Copyright © 2016 Bart Massey
# 
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source distribution of
# this software for license terms.
# 
# Makefile for mixy: demonstration of calling
# statically-linked rust from C.

OBJS = cy.o librusty.a

# These libraries were culled from the link info produced by
# rustc when it compiles rusty.rs.
LIBS = -ldl -lpthread -lm -lrt -lutil

mixy: $(OBJS)
	$(CC) $(CFLAGS) -o mixy $(OBJS) $(LIBS)

librusty.a: rusty.rs
	rustc rusty.rs

clean:
	-rm -f mixy $(OBJS)

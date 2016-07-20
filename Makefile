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

# There is no way to turn off the link info from rustc,
# which is sent to stderr. So we grep it out. Then we
# run cat so that the error status from the whole mess
# is 0 and not the 1 egrep -v returns when it finds things.
librusty.a: rusty.rs
	rustc rusty.rs 2>&1 | egrep -v '^note:' | cat

clean:
	-rm -f mixy $(OBJS)

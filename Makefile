# Copyright © 2016 Bart Massey
# 
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source distribution of
# this software for license terms.
# 
# Makefile for mixy: demonstration of calling
# statically-linked rust from C.

CC = clang
CFLAGS = -O3

# Optimized
RUSTC = rustc --crate-type=staticlib --emit=obj -C opt-level=3 -C panic="abort"
# Debug: See 
#   https://github.com/rust-lang-nursery/compiler-builtins/issues/245
# for a discussion of why debug-assertions must be turned off when
# compiling for debugging.
#RUSTC = rustc --emit=obj -C debug-assertions=off -C panic="abort"

OBJS = cy.o rusty.o

mixy: $(OBJS)
	$(CC) $(CFLAGS) -o mixy $(OBJS) $(LIBS)

rusty.o: rusty.rs
	$(RUSTC) rusty.rs

clean:
	-rm -f mixy $(OBJS)

# mixy: Calling statically-linked Rust from a C program
Copyright (c) 2016 Bart Massey

This little demo archive produces a trivial C program,
`mixy`, that acquires and releases heap-allocated strings
via trivial Rust functions. The source file `cy.c` contains
the C program including `main()`, the source file `rusty.rs`
contains the Rust functions, and the `Makefile` does what
you think it does. Please read all the things for more
information.
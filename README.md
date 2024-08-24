# mixy: Mix statically-linked Rust with C
Copyright (c) 2016 Bart Massey

This little demo archive produces a trivial C program,
`mixy`. The source file `cy.c` contains the C program
including `main()`, the source file `rusty.rs` contains the
Rust functions, and the `Makefile` does what you think it
does. Please read all the things for more information.

*Issue:* Right now `rustc` tries to call stuff from
`core::panicking` even when `-C panic="abort"` —
thus, this Rust code will not link if it contains any
potential panics.

This program is licensed under the "MIT License".  Please
see the file `LICENSE.txt` in the source distribution of this
software for license terms.

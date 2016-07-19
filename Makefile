.SUFFIXES: .rs

.rs.o:
	rustc --emit obj $*.rs

mixy: rusty.o cy.o
	$(CC) $(CFLAGS) -o mixy rusty.o cy.o

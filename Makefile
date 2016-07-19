OBJS = cy.o librusty.a
LIBS = -lm

mixy: $(OBJS)
	$(CC) $(CFLAGS) -o mixy $(OBJS) $(LIBS)

librusty.a: rusty.rs
	rustc $*.rs

clean:
	-rm -f mixy $(OBJS)

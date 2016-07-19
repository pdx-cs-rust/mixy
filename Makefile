OBJS = cy.o librusty.a
LIBS = -lpthread -ldl -lm -lrt -lutil

mixy: $(OBJS)
	$(CC) $(CFLAGS) -o mixy $(OBJS) $(LIBS)

librusty.a: rusty.rs
	rustc rusty.rs

clean:
	-rm -f mixy $(OBJS)

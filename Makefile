OBJS = cy.o librusty.a
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

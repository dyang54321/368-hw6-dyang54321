WARNING = -Wall -Wshadow --pedantic
ERROR = -Wvla -Werror
GCC = gcc -std=c99 -g $(WARNING) $(ERROR)
VAL = valgrind --tool=memcheck --log-file=memcheck.txt --leak-check=full --verbose

TESTFLAGS = -DOPEN -DCLOSE -DLIST_PRINT -DSWITCH
SRCS = main.c a6.c
OBJS = $(SRCS:%.c=%.o)

a6: $(OBJS)
	$(GCC) $(TESTFLAGS) $(OBJS) -o a6 -lm

.c.o:
	$(GCC) $(TESTFLAGS) -c $*.c

testmemory: a6
	$(VAL) ./a6 

test: a6
	./a6

clean:
	rm -f a6 *.o *.txt output? *~
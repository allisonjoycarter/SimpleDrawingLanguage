YFLAGS		= -d
PROGRAM		= zjs
OBJS		= zjs.tab.o lex.yy.o zoomjoystrong.o
SRCS		= zjs.tab.c lex.yy.c zoomjoystrong.c
CC		= gcc
all:		$(PROGRAM)
.c.o:		$(SRCS)
		$(CC) -c $*.c -o $@ -O
zjs.tab.c:	zjs.y
		bison $(YFLAGS) zjs.y
lex.yy.c:	zjs.lex
		flex zjs.lex

zjs:		$(OBJS)
		$(CC) $(OBJS) -o $@ -lfl -lSDL2 -lm

clean:;		rm -f $(OBJS) core *~ \#* *.o $(PROGRAM) \
		y.* lex.yy.* zjs.tab.*

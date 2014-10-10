CPROGS=kl10main.c fe.c load10exe.c
APROGS=kl10.s 

OBJS=kl10.o kl10main.o fe.o load10exe.o

CFLAGS=-g -c -pthread
AFLAGS=-g 
AS=as -g

all:	kl10

kl10.s:	kl10m.s kl10_a.h
	gasp -u kl10m.s -o kl10.s

kl10:	$(OBJS)	kl10.s kl10main.c fe.c kl10_c.h
	cc $(OBJS) -o kl10 -lpthread -lexc -lc


clean:
	rm -f $(OBJS) kl10.s kl10

static char RCSIDkl10main[]="@(#)$Id: kl10main.c,v 1.1 2000/08/22 06:19:10 mark Exp mark $";
/*
* $Log: kl10main.c,v $
 * Revision 1.1  2000/08/22  06:19:10  mark
 * Initial revision
 *
*/
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <signal.h>
#include <pthread.h>
#include <sys/types.h>
#include "kl10_c.h"

void *cpu00( int );
void *startcpu();
#define	pthread_attr_default	(pthread_attr_t *)NULL


main(argc, argv)
int	argc;
char	*argv[];
{
	pthread_t th1;

/* turn off all signal handling so that cpu00 thread will not rec any sigs */
	signal(SIGHUP	,SIG_IGN);
	signal(SIGINT	,SIG_IGN);
	signal(SIGQUIT	,SIG_IGN);
	signal(SIGILL	,SIG_IGN);
	signal(SIGTRAP	,SIG_IGN);
	signal(SIGABRT	,SIG_IGN);
	signal(SIGEMT	,SIG_IGN);
	signal(SIGFPE	,SIG_IGN);
	signal(SIGKILL	,SIG_IGN);
	signal(SIGBUS	,SIG_IGN);
	signal(SIGSEGV	,SIG_IGN);
	signal(SIGSYS	,SIG_IGN);
	signal(SIGPIPE	,SIG_IGN);
	signal(SIGALRM	,SIG_IGN);
	signal(SIGTERM	,SIG_IGN);
	signal(SIGURG	,SIG_IGN);
	signal(SIGSTOP	,SIG_IGN);
	signal(SIGTSTP	,SIG_IGN);
	signal(SIGCONT	,SIG_IGN);
	signal(SIGCHLD	,SIG_IGN);
	signal(SIGTTIN	,SIG_IGN);
	signal(SIGTTOU	,SIG_IGN);
	signal(SIGPOLL	,SIG_IGN);
	signal(SIGXCPU	,SIG_IGN);
	signal(SIGXFSZ	,SIG_IGN);
	signal(SIGVTALRM	,SIG_IGN);
	signal(SIGPROF	,SIG_IGN);
	signal(SIGWINCH	,SIG_IGN);
	signal(SIGINFO	,SIG_IGN);
	signal(SIGUSR1	,SIG_IGN);
	signal(SIGUSR2	,SIG_IGN);
	signal(SIGRESV	,SIG_IGN);

	bzero(&emboxreg,sizeof(emboxreg)); /* clear all memory reg and flags */
	
	if ( pthread_create( &th1, pthread_attr_default, startcpu, NULL) != 0)  {
		perror("pthread_create");
		exit(errno);
	}
/* fe will enable its signals */
	fe();
}

void *startcpu(int cpu)
{
	return (cpu00(cpu));
}

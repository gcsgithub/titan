static RCSIDkl10main[]="@(#)$Id:$";
/*
* $Log:$
*/
#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <pthread.h>
#include <sys/types.h>
#include "kl10.h"

void *cpu00( void *);
#define	pthread_attr_default	(pthread_attr_t *)NULL


main(argc, argv)
int	argc;
char	*argv[];
{
	pthread_t th1;

	emboxreg.interupt = FALSE;

	signal(SIGHUP	,SIG_IGN);
	signal(SIGINT	,SIG_IGN);
	signal(SIGQUIT	,SIG_IGN);
	signal(SIGILL	,SIG_IGN);
	signal(SIGTRAP	,SIG_IGN);
	signal(SIGABRT	,SIG_IGN);
	signal(SIGEMT	,SIG_IGN);
	signal(SIGFPE	,SIG_IGN);
	signal(SIGCHLD	,SIG_IGN);
	
	if ( pthread_create( &th1, pthread_attr_default, cpu00, NULL) != 0)  {
		perror("pthread_create");
		exit(errno);
	}

	fe();
}

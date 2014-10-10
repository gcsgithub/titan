static char RCSIDfe[]="@(#)$Id: fe.c,v 1.1 2000/08/22 06:20:02 mark Exp mark $";
/* KL10 - Front End
* @(#)$Log: fe.c,v $
 * Revision 1.1  2000/08/22  06:20:02  mark
 * Initial revision
 *
*/

#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <math.h>
#include <signal.h>
#include <errno.h>
#include <fcntl.h>
#include <termios.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/time.h>
#include "kl10_c.h"
#include "keys.h"

/* seconday protocol console IO */
/* CMD complete */
#define DTEFLG  ebr[0444]
/* From FE arg */
#define DTEF11  ebr[0450]
/* CMD */
#define DTECMD  ebr[0451]
/* Output Done set by 11  clear by 10 */
#define DTEMTD  ebr[0455]
/* Input rdy <0 if char rdy  set by 11 cleared by 10 */
#define DTEMTI  ebr[0456]


void	parse();
void	pdp10alarm(int);
void	tshe(int);

struct	itimerval	ITIMSTART;
struct	itimerval	ITIMPREV;
int	TT;

#define	getcon(x)		read(TT,x,1)
#define	putcon(x)		write(TT,x,1)
struct	termios	tsave, tset;

char	cmdbuf[1024];	/* input for parser */
int	cmdptr;
enum	{par,con} conmode = con;
enum	{pri,sec} protocol = sec;
char	PPROMPT[6] = {'P','A','R','%',' ','\0'};
struct	{
	int	serialno;
	char	proctype[5];
	char	model;
	int	hertz;
} SYS = {2102,{'K','L','1','0','\0'}, 'B',60};


fe()
{
	int	err;
	char	c, x;
	int	i;
	char	outb[1024];

	ITIMSTART.it_interval.tv_usec=1;	/* reload with 1usec on expir */
	ITIMSTART.it_value.tv_usec=1;		/* start with 1usec */

/*	signal(SIGINT, tshe); */
	signal(SIGALRM, pdp10alarm);
	setitimer(ITIMER_REAL, &ITIMSTART, &ITIMPREV);

	

	fprintf(stdout,"RSX-20F VB16-00 ) %02d:%02d %s\n\n[SY0: redirected to DB0:]\n[DB0: mounted]\nKLI -- VERSION VB16-00 RUNNING\n",12,12,"11-Sep-2000");
	fprintf(stdout,"KLI -- %s S/N: %d., MODEL %c, %d HERTZ\n", SYS.proctype,SYS.serialno,SYS.model,SYS.hertz);
	fprintf(stdout,"KLI -- % NO FILE\nKLI -- PAGE TABLE SELECTED: BOTH\n");

	if ( (TT = open("/dev/tty",O_RDWR|O_NONBLOCK) ) == -1 ) {
		err=errno;
		fprintf(stderr, "error opening terminal:%s\n", strerror(err));
		exit(err);
	}
	tcgetattr(TT, &tsave);
	bcopy(&tsave,&tset,sizeof(tset));
	tset.c_lflag &= ~ISIG;
	tset.c_lflag &= ~ICANON;
	tset.c_lflag &= ~ECHO;
	tcsetattr(TT,TCSANOW, &tset);

	bzero(cmdbuf, sizeof(cmdbuf));

	i=0;
	while(1) {
		if ( getcon(&c) == 1 ) {
			if ( c == k_CTRL_C ) tshe(0);
			if ( c == k_CTRL_BSLASH ) {
				conmode=par;	/* switch to parser */
				bzero(cmdbuf, sizeof(cmdbuf));
				cmdptr=0;
				write(TT,"\n",1);
				write(TT,PPROMPT,6);
			} else {
				if (conmode == par ) {
				  switch(c) {
				  case '\n':
					/*cmdbuf[cmdptr++]=c; */
					cmdbuf[cmdptr]='\0';
					parse();
				  	break;
				  case	k_DEL: /* delete */
					if ( cmdptr > 0 ) {
						cmdbuf[--cmdptr]='\0';
						write(TT,"\b \b",3);
					} else {
						putcon("\a"); /* ring Bell */
					}
					break;
				  case	k_CTRL_Z:
					conmode = con;
					write(TT,"^Z\n", 3);
					break;
				  default:
					putcon(&c);
					cmdbuf[cmdptr++]=c;
					break;
				}
				} else {
					if ( protocol == sec ) {
					} else {
					}
				}
			}
		}
		i++;

/*		if ( emboxreg.usec10 % 1000000 ) 
		fprintf(stdout, "%0d, %x, %d\n", emboxreg.PC, emboxreg.PC, emboxreg.PC);
*/
	}
}


void
pdp10alarm(int p1)
{
	if (++emboxreg.usec % 10 ) ++emboxreg.usec10;
	setitimer(ITIMER_REAL, &ITIMSTART, &ITIMPREV);
}

void	tshe(int p1)
{
/* Time Sharing Has Ended */

	tcsetattr(TT,TCSANOW, &tsave);
	fprintf(stderr,"\nTime Sharing Has Ended: Abruptly with ^C\n");
	/* ioctl(TT,); */
	close(TT);
	exit(0);
}

void	parse()
{
	write(TT,"\n",1);
	write(TT, cmdbuf, cmdptr);
	bzero(cmdbuf,sizeof(cmdbuf));
	cmdptr=0;
	write(TT,"\n",1);
	write(TT,PPROMPT,6);
}

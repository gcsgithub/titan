const	char RCS10exe[]="@(#) $Id:$";
/* 
** $Log:$
 *
*/

#include <stdio.h>
#include <ctype.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include "kl10_c.h"

ulong_t rword (int,int *,int *);
void	dbgbrk(void);

struct	dblock {
	int	flags,		fpage;
	int	wdpagecount,	cpage;
	int	pagecount;
} BDIR[128];

int	DIRLEN;
int	WORDSREAD;
int	WORDS;
int	DEBUG;
int	SKIP;

load10exe(name)
char *name;
{
	int in,i,errors,errflg,c;

	WORDSREAD=0;
	DEBUG=0;
	SKIP=5;		/* don't print more than 5 duplicated */
	optarg=NULL;
	errors=errflg=0;
	
	if (  (in = open(name,O_RDONLY,0)) >= 0 ) {
		errors += loadfile(in,name);
		close(in);
	} else {
		errors=errno;
		fprintf(stderr,"Can't open input file: %s : %s\n",
				name,strerror(errors));
				exit(errors);
	}
}

loadfile(in,name)
int in;
char *name;
{
  int i,j;
  int addr, fblk, bdirp, pagestoread,page;
  ulong_t word;
  int lh,rh;
  int	dlen, wordsread, pageidx;

  bdirp = fblk = addr=0;

  wordsread=-1; /* 0 based 0..777 for a page */

/* first check its an EXE and then read the directory */

  word=rword(in,&lh,&rh);
  wordsread++;
  if ((lh != 01776) || (rh > 128 )) {
	fprintf(stderr,"File is not and exe\n");
	exit(1);
  }
  DIRLEN = (rh-1)/2;	/* length of exe directory */
/* read 128 word into DIRB reguardles of length */
  while ( wordsread < 128 ) { /* 1..127 */
  	word=rword(in,&lh,&rh); wordsread++;
	BDIR[bdirp].flags = lh;
	BDIR[bdirp].fpage = rh;

  	word=rword(in,&lh,&rh); wordsread++;
	BDIR[bdirp].wdpagecount = lh;
	BDIR[bdirp].cpage = rh;

	BDIR[bdirp].pagecount = (lh >>9 ) & 0777;

	bdirp++;
  }
 if (DEBUG > 2 ) {
  printf("Read D^%d O^%o words into %d bdirentrys\n",wordsread,wordsread,bdirp);
  printf("WORDSREAD: D^%d  O^%o\n", WORDSREAD, WORDSREAD);
 }
  while( wordsread < 0777 ) { rword(in,0,0);wordsread++;} /* skiptoendofpage */
 if (DEBUG > 2 ) {
  printf("WORDSREAD: D^%d  O^%o expect 01000\n", WORDSREAD, WORDSREAD);
  printf("Read D^%d O^%o words into %d bdirentrys\n", wordsread,wordsread,bdirp);
 }
/* dump BDIR */
 if (DEBUG > 1 ) {
  fprintf(stderr,"\nEXE directory header \n");
  for ( bdirp = 0; bdirp < DIRLEN;bdirp++) {
   fprintf(stderr,"%08o|%06o,,%6o %06o,,%6o pages=%o \n",bdirp,
		BDIR[bdirp].flags			,
		BDIR[bdirp].fpage		,
		BDIR[bdirp].wdpagecount		,
		BDIR[bdirp].cpage		,
		BDIR[bdirp].pagecount		
   );
  }
  fprintf(stderr,"\n---------------END of EXE directory header \n");
 }
/* now process BDIR for DIRLEN entries */ 
  for ( bdirp = 0; bdirp < DIRLEN;bdirp++) {
	addr = BDIR[bdirp].cpage<<9;
  	wordsread = -1;
	pagestoread = BDIR[bdirp].pagecount+1;
 if (DEBUG > 2 ) printf("WORDSREAD: D^%d  O^%o\n", WORDSREAD, WORDSREAD);
	if ( (WORDSREAD & 0777) != 0 ) {
		printf("Not page aligned when reading start word of page %o %o\n", WORDSREAD, wordsread);
		exit(1);
	}
	if (BDIR[bdirp].cpage == 0) {/* special case */
/* skip 040 */
	   while (wordsread < 040 ) {rword(in,0,0);wordsread++;addr++;};
	   if (DEBUG > 2) 
	   printf("WORDSREAD: D^%d  O^%o D^%d O^%o expected 1040,1037\n",
				WORDSREAD, WORDSREAD, wordsread,wordsread);
	} else {
	   if (DEBUG > 2) 
	   printf("WORDSREAD: D^%d  O^%o\n",WORDSREAD, WORDSREAD);
	}
/* now read the page(s) into memory */
	if (BDIR[bdirp].fpage > 0 ) {
	   if (DEBUG > 2) 
		printf("load pages %o \n", pagestoread);
		while(pagestoread > 0 ) {
		  pageidx = (BDIR[bdirp].pagecount+1-pagestoread);
	   if (DEBUG > 2) 
		  printf("load page %o to cpage %o start addr: %06o ", 
		  BDIR[bdirp].fpage+pageidx,BDIR[bdirp].cpage+pageidx, addr);
	 	  while(wordsread < 0777 ) {
  			word=rword(in,&lh,&rh); wordsread++;
			emboxreg.MM[addr] = word;	
			addr++;
	 	  }
	   if (DEBUG > 2) 
		  printf("last loaded addr: %06o\n", addr-1);
	 	  pagestoread--;
	 	  wordsread = -1;
		}
	} else {
	   if (DEBUG > 2) 
		printf(" zero fill %o pages \n", pagestoread);
		while(pagestoread > 0 ) {
		  	pageidx = (BDIR[bdirp].pagecount+1-pagestoread);
	   if (DEBUG > 2) 
		 	printf("zero core page %o start addr: %06o ", 
		  		BDIR[bdirp].cpage+pageidx, addr);
	 		while(wordsread < 0777 ) {
				wordsread++;
				emboxreg.MM[addr] = 0;	
				addr++;
	 		}
	   if (DEBUG > 2) 
		  	printf("last loaded addr: %06o\n", addr-1);
	 		pagestoread--;
	 		wordsread = -1;
		}
	}
  }
  fprintf(stderr,"Highest Loaded %d %x words\n", addr,addr);
  WORDS = addr; /* highest address loaded */
  dbgbrk();
}

ulong_t rword (in,lh,rh)
int	in;
int	*lh,*rh;
{
  unsigned char data[5];
  int count;
  ulong_t word,lh0,rh0;
/*
 * this is the 5 bytes in binary ftp mode
 * |00 01 02 03 04 05 06|07	
 *  08 09 10 11 12 13|14 15
 *  16 17,18 19 20|21 22 23
 *  24 25 26 27|28 29 30 31
 *  __ __ __ __ 32 33 34|35
 */
	WORDSREAD++;
	if ( read(in,data,5) == 5) {
  		lh0 = data[0]<<10 | data[1]<<2 | (data[2]&0xc0)>>6;
  		rh0 = (data[2]&0x3f)<<12 | data[3]<<4 | data[4]&0x0f;
		word  = lh0 << 18;
		word |= rh0;
		if (lh) *lh = lh0;
		if (rh) *rh = rh0;
		return(word);
	} else {
		return(-1);
	}
}


void dbgbrk()
{
	int i;
}

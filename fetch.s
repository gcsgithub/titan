fetch:
startfetch:
	/* fetch macro */							
	/* PDP-10 PC = s2 */							
	/* PDP-10 memory base reg = s1 */					
	mov	s4, s5	/* setup reg base in s5 so PXCT can use s5 to drive */
			/* intructions */
startfetchpxct: /* entry point for PXCT */
	ldq	t2, interupt-MM(s1)!lituse_base!3				
									
	lda	t3,opjmp-inthdl(s0)!lituse_base!2  /*  base for hdl table */	
	s8addq	t2,t3,v0		 /* get address of handler */	
	bne	t2,dispatch		/* COND DISP request interupt != 0 */

	and	s2, t11, t1		/* t1 get PC section part */ 		
	lda	v0, 1(s2)		/* inc the PC */			
									
	bic	v0, t11, v0		/* v0 get PC 18bit and so wrap */	
	or	t1, v0, s2		/* recombine PC with section part */	
					/* put sect+incPC back to PC */ 	
	mov	s2, t0			/* put full virt addr into t0 */
	srl	t1, 18, t1		/* convert section mask to section number */
/* now t0=5sectno+9bitpg+9bitwordaddr bit virtual  t1=5 bit sect no */

	/* now convert pc in s2 t1=sectbits t0=VA  into a0 */	
 	vtophy_rx
					/* FETCH opcode from PC */		
	ldq	a1,(a0)			/* a1 == fetch opcode	*/
	blt	a1,addrbrk		/* branch if addr break */
	bic	a1, t10, a1		/* clear off non 36 bit part */
noaddrbrk:
	srl	a1,27,a2		/* a2 == 9 bit opcode 	*/
									
	srl	a1,23,a3							
	and	a3,0xf,a3		/* a3 == AC register */			
										
	srl	a1,18,a4							
	and	a4,0xf,a4		/* a4 == X register  */			
									
	bic	a1,t11,a5		/* a5 == Y */				

/* calc effective address part */
	calc_e
/* returns s6, a0 */
/* Now the following is setup
	s0 = PC
	s6 = e
	t1 = sect(e)
	t3 = G|P|W|S|C
	a0 = phyaddr(e)	      This may either be a register or pdp10core
				in eithercase in is not a base 
	s5 = effective regbase  PXCT will fiddle this register base
	s4 = real regbase
*/
	
									
	s8addq	a2,s0,v0		/* lookup op func add in opjmp */	
dispatch:
	ldq	v0,(v0)								
	jmp	(v0)								

addrbrk:
	srl	a1,1,t3			/* get bit for addr break exec type */
	bge	t3, noaddrbrk		/* branch if ist not a exec break */
	bge	s3, noaddrbrk		/* branch is VM is not enabled */
	sll	s3,21,t3		/* get flags Addr Fail Inhibit */
	blt	t3, noaddrbrk		/* branch if Addr Fail Inhibit set */

/* Note: Address break is only really valid if VM is enabled
** since this mechanism is under our control finding an address break bit set
** we can assume VM is enable
** also KL10 only has one address break our implementation could support
** many and we could enable many using console functions for debug purposes
**
** now handle address break on execute
** address break is basically a page fail
*/
	/* work out a page fail word */
	sll	s3, 18, v0		/* get User/Exec mode */
	and	v0, 1,v0
	sll	v0, 5, v0		/* make room for failure type */
	or	v0, 0123, v0		/* set flags to Address failure */
	sll	v0, 8, v0		/* make room for virtual address */
	or	v0, t0, v0		/* add virtual address to word */
/* reg UBR+500 base */
	extwl	s3, 2, t4		/* get UBR */
	sll	t4, 9, t4		/* calc PDP phy address */
	addq	t4,s1, t4		/* calc axp base address of UPT */
	mov	0500,t5
	s8addq	t5,t4,t4		/* now have axp addres of page fail*/

/* save page flag word @UPT+500 */
	stq	v0, (t4)		/* 500 save page flag word */
	lda	t4, 1(t4)		/* inc pointer */

/* save Flag-PC double word @UPT+501, @UPT+502 */
	extwl	s3, 7, t5		/* get PDP10 flag */
	sll	t5, 23, v0		/* put them in correct part of 36bit*/
	sll	t5, sll_user, t6	/* get User flag in sign bit, exec = 0*/
	cmovgt	t6,zero, t1		/* clear currect section if in User*/
	srl	t1, 18, t1		/* get in lower 5 bits */
	or	t1, t1, v0		/* add PC section 2 Flag word */
	stq	v0 , (t4)		/* save flag word */
	lda	t4, 1(t4)		/* inc pointer */

	stq	s2, (t4)		/* save virtual PC */
	lda	t4, 1(t4)		/* inc pointer */
/* load new PC from @UPT+503 and clear User and branch back to start fetch*/
	bic	t5, msk_user, v0	/* clear User */
	inswl	v0, 7 , s3		/* put flags back */
	ldq	s2, (t4)		/* fetch new PC from 503 */
	bic	s2, t10, s2		/* clear off non 36 bit part */
	br	startfetch		/* do it all over */

	

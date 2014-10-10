	/*@(#)$Id: kl10m.s,v 1.4 2000/10/27 4:20:59 mark Exp mark $
	* @(#)$Log: kl10m.s,v $
	;; Revision 1.4  2000/10/27  4:20:59  mark
	;; about to change from macro fetch in single routine fetch that
	;; maybe more cache efficent with alpha even though we have some extra
	;; jumps.
	;;
	;; Revision 1.3  2000/10/13  12:32:30  mark
	;; friday night checkin now has good part of vir to phy memory done
	;;
	;; Revision 1.2  2000/10/3  0:31:24  mark
	;; cpt
	;;
	* Revision 1.1  2000/8/27  12:18:48  mark
	* Initial revision
	*
	*/

	.arch ev4
	.set noat
	.set volatile
	.set noreorder
	.set nomacro 




	.data	
opjmp:	.quad	E_MUU0   	#	op000 MUUO00
	.quad	E_LUU0   	#	op001 LUUO01
	.quad	E_LUU0   	#	op002 LUUO02
	.quad	E_LUU0   	#	op003 LUUO03
	.quad	E_LUU0   	#	op004 LUUO04
	.quad	E_LUU0   	#	op005 LUUO05
	.quad	E_LUU0   	#	op006 LUUO06
	.quad	E_LUU0   	#	op007 LUUO07
	.quad	E_LUU0   	#	op010 LUUO10
	.quad	E_LUU0   	#	op011 LUUO11
	.quad	E_LUU0   	#	op012 LUUO12
	.quad	E_LUU0   	#	op013 LUUO13
	.quad	E_LUU0   	#	op014 LUUO14
	.quad	E_LUU0   	#	op015 LUUO15
	.quad	E_LUU0   	#	op016 LUUO16
	.quad	E_LUU0   	#	op017 LUUO17
	.quad	E_LUU0   	#	op020 LUUO20
	.quad	E_LUU0   	#	op021 LUUO21
	.quad	E_LUU0   	#	op022 LUUO22
	.quad	E_LUU0   	#	op023 LUUO23
	.quad	E_LUU0   	#	op024 LUUO24
	.quad	E_LUU0   	#	op025 LUUO25
	.quad	E_LUU0   	#	op026 LUUO26
	.quad	E_LUU0   	#	op027 LUUO27
	.quad	E_LUU0   	#	op030 LUUO30
	.quad	E_LUU0   	#	op031 LUUO31
	.quad	E_LUU0   	#	op032 LUUO32
	.quad	E_LUU0   	#	op033 LUUO33
	.quad	E_LUU0   	#	op034 LUUO34
	.quad	E_LUU0   	#	op035 LUUO35
	.quad	E_LUU0   	#	op036 LUUO36
	.quad	E_LUU0   	#	op037 LUUO37
	.quad	E_MUU0   	#	op040 CALL
	.quad	E_MUU0   	#	op041 INITI
	.quad	E_MUU0   	#	op042 MUUO42
	.quad	E_MUU0   	#	op043 MUUO43
	.quad	E_MUU0   	#	op044 MUUO44
	.quad	E_MUU0   	#	op045 MUUO45
	.quad	E_MUU0   	#	op046 MUUO46
	.quad	E_MUU0   	#	op047 CALLI
	.quad	E_MUU0   	#	op050 OPEN
	.quad	E_MUU0   	#	op051 TTCALL
	.quad	E_MUU0   	#	op052 MUUO52
	.quad	E_MUU0   	#	op053 MUUO53
	.quad	E_MUU0   	#	op054 MUUO54
	.quad	E_MUU0   	#	op055 RENAME
	.quad	E_MUU0   	#	op056 IN
	.quad	E_MUU0   	#	op057 OUT
	.quad	E_MUU0   	#	op060 SETSTS
	.quad	E_MUU0   	#	op061 STATO
	.quad	E_MUU0   	#	op062 STATUS
	.quad	E_MUU0   	#	op063 GETSTS
	.quad	E_MUU0   	#	op064 INBUF
	.quad	E_MUU0   	#	op065 OUTBUF
	.quad	E_MUU0   	#	op066 INPUT
	.quad	E_MUU0   	#	op067 OUTPUT
	.quad	E_MUU0   	#	op070 CLOSE
	.quad	E_MUU0   	#	op071 RELEAS
	.quad	E_MUU0   	#	op072 MTAPE
	.quad	E_MUU0   	#	op073 UGETF
	.quad	E_MUU0   	#	op074 USETI
	.quad	E_MUU0   	#	op075 USETO
	.quad	E_MUU0   	#	op076 LOOKUP
	.quad	E_MUU0   	#	op077 ENTER
	.quad	E_UJEN   	#	op100 UJEN
	.quad	E_OP101  	#	op101 OP101
	.quad	E_GFAD   	#	op102 GFAD
	.quad	E_GFSB   	#	op103 GFSB
	.quad	E_JSYS   	#	op104 JSYS
	.quad	E_ADJSP  	#	op105 ADJSP
	.quad	E_GFMP   	#	op106 GFMP
	.quad	E_GFDV   	#	op107 GFDV
	.quad	E_DFAD   	#	op110 DFAD
	.quad	E_DFSB   	#	op111 DFSB
	.quad	E_DFMP   	#	op112 DFMP
	.quad	E_DFDV   	#	op113 DFDV
	.quad	E_DADD   	#	op114 DADD
	.quad	E_DSUB   	#	op115 DSUB
	.quad	E_DMUL   	#	op116 DMUL
	.quad	E_DDIV   	#	op117 DDIV
	.quad	E_DMOVE  	#	op120 DMOVE
	.quad	E_DMOVN  	#	op121 DMOVN
	.quad	E_FIX    	#	op122 FIX
	.quad	E_EXTEND 	#	op123 EXTEND
	.quad	E_DMOVEM 	#	op124 DMOVEM
	.quad	E_DMOVNM 	#	op125 DMOVNM
	.quad	E_FIXR   	#	op126 FIXR
	.quad	E_FLTR   	#	op127 FLTR
	.quad	E_UFA    	#	op130 UFA
	.quad	E_DFN    	#	op131 DFN
	.quad	E_FSC    	#	op132 FSC
	.quad	E_IBP    	#	op133 IBP
	.quad	E_ILDB   	#	op134 ILDB
	.quad	E_LDB    	#	op135 LDB
	.quad	E_IDPB   	#	op136 IDPB
	.quad	E_DPB    	#	op137 DPB
	.quad	E_FAD    	#	op140 FAD
	.quad	E_FADL   	#	op141 FADL
	.quad	E_FADM   	#	op142 FADM
	.quad	E_FADB   	#	op143 FADB
	.quad	E_FADR   	#	op144 FADR
	.quad	E_FADRL  	#	op145 FADRL
	.quad	E_FADRM  	#	op146 FADRM
	.quad	E_FADRB  	#	op147 FADRB
	.quad	E_FSB    	#	op150 FSB
	.quad	E_FSBL   	#	op151 FSBL
	.quad	E_FSBM   	#	op152 FSBM
	.quad	E_FSBB   	#	op153 FSBB
	.quad	E_FSBR   	#	op154 FSBR
	.quad	E_FSBRL  	#	op155 FSBRL
	.quad	E_FSBRM  	#	op156 FSBRM
	.quad	E_FSBRB  	#	op157 FSBRB
	.quad	E_FMP    	#	op160 FMP
	.quad	E_FMPL   	#	op161 FMPL
	.quad	E_FMPM   	#	op162 FMPM
	.quad	E_FMPB   	#	op163 FMPB
	.quad	E_FMPR   	#	op164 FMPR
	.quad	E_FMPRL  	#	op165 FMPRL
	.quad	E_FMPRM  	#	op166 FMPRM
	.quad	E_FMPRB  	#	op167 FMPRB
	.quad	E_FDV    	#	op170 FDV
	.quad	E_FDVL   	#	op171 FDVL
	.quad	E_FDVM   	#	op172 FDVM
	.quad	E_FDVB   	#	op173 FDVB
	.quad	E_FDVR   	#	op174 FDVR
	.quad	E_FDVRL  	#	op175 FDVRL
	.quad	E_FDVRM  	#	op176 FDVRM
	.quad	E_FDVRB  	#	op177 FDVRB
	.quad	E_MOVE   	#	op200 MOVE
	.quad	E_MOVEI  	#	op201 MOVEI
	.quad	E_MOVEM  	#	op202 MOVEM
	.quad	E_MOVES  	#	op203 MOVES
	.quad	E_MOVS   	#	op204 MOVS
	.quad	E_MOVSI  	#	op205 MOVSI
	.quad	E_MOVSM  	#	op206 MOVSM
	.quad	E_MOVSS  	#	op207 MOVSS
	.quad	E_MOVN   	#	op210 MOVN
	.quad	E_MOVNI  	#	op211 MOVNI
	.quad	E_MOVNM  	#	op212 MOVNM
	.quad	E_MOVNS  	#	op213 MOVNS
	.quad	E_MOVM   	#	op214 MOVM
	.quad	E_MOVMI  	#	op215 MOVMI
	.quad	E_MOVMM  	#	op216 MOVMM
	.quad	E_MOVMS  	#	op217 MOVMS
	.quad	E_IMUL   	#	op220 IMUL
	.quad	E_IMULI  	#	op221 IMULI
	.quad	E_IMULM  	#	op222 IMULM
	.quad	E_IMULB  	#	op223 IMULB
	.quad	E_MUL    	#	op224 MUL
	.quad	E_MULI   	#	op225 MULI
	.quad	E_MULM   	#	op226 MULM
	.quad	E_MULB   	#	op227 MULB
	.quad	E_IDIV   	#	op230 IDIV
	.quad	E_IDIVI  	#	op231 IDIVI
	.quad	E_IDIVM  	#	op232 IDIVM
	.quad	E_IDIVB  	#	op233 IDIVB
	.quad	E_DIV    	#	op234 DIV
	.quad	E_DIVI   	#	op235 DIVI
	.quad	E_DIVM   	#	op236 DIVM
	.quad	E_DIVB   	#	op237 DIVB
	.quad	E_ASH    	#	op240 ASH
	.quad	E_ROT    	#	op241 ROT
	.quad	E_LSH    	#	op242 LSH
	.quad	E_JFFO   	#	op243 JFFO
	.quad	E_ASHC   	#	op244 ASHC
	.quad	E_ROTC   	#	op245 ROTC
	.quad	E_LSHC   	#	op246 LSHC
	.quad	E_op247  	#	op247 op247
	.quad	E_EXCH   	#	op250 EXCH
	.quad	E_BLT    	#	op251 BLT
	.quad	E_AOBJP  	#	op252 AOBJP
	.quad	E_AOBJN  	#	op253 AOBJN
	.quad	E_JRST   	#	op254 JRST
	.quad	E_JFCL   	#	op255 JFCL
	.quad	E_XCT    	#	op256 XCT
	.quad	E_MAP    	#	op257 MAP
	.quad	E_PUSHJ  	#	op260 PUSHJ
	.quad	E_PUSH   	#	op261 PUSH
	.quad	E_POP    	#	op262 POP
	.quad	E_POPJ   	#	op263 POPJ
	.quad	E_JSR    	#	op264 JSR
	.quad	E_JSP    	#	op265 JSP
	.quad	E_JSA    	#	op266 JSA
	.quad	E_JRA    	#	op267 JRA
	.quad	E_ADD    	#	op270 ADD
	.quad	E_ADDI   	#	op271 ADDI
	.quad	E_ADDM   	#	op272 ADDM
	.quad	E_ADDB   	#	op273 ADDB
	.quad	E_SUB    	#	op274 SUB
	.quad	E_SUBI   	#	op275 SUBI
	.quad	E_SUBM   	#	op276 SUBM
	.quad	E_SUBB   	#	op277 SUBB
	.quad	E_CAI    	#	op300 CAI
	.quad	E_CAIL   	#	op301 CAIL
	.quad	E_CAIE   	#	op302 CAIE
	.quad	E_CAILE  	#	op303 CAILE
	.quad	E_CAIA   	#	op304 CAIA
	.quad	E_CAIGE  	#	op305 CAIGE
	.quad	E_CAIN   	#	op306 CAIN
	.quad	E_CAIG   	#	op307 CAIG
	.quad	E_CAM    	#	op310 CAM
	.quad	E_CAML   	#	op311 CAML
	.quad	E_CAME   	#	op312 CAME
	.quad	E_CAMLE  	#	op313 CAMLE
	.quad	E_CAMA   	#	op314 CAMA
	.quad	E_CAMGE  	#	op315 CAMGE
	.quad	E_CAMN   	#	op316 CAMN
	.quad	E_CAMG   	#	op317 CAMG
	.quad	E_JUMP   	#	op320 JUMP
	.quad	E_JUMPL  	#	op321 JUMPL
	.quad	E_JUMPE  	#	op322 JUMPE
	.quad	E_JUMPLE 	#	op323 JUMPLE
	.quad	E_JUMPA  	#	op324 JUMPA
	.quad	E_JUMPGE 	#	op325 JUMPGE
	.quad	E_JUMPN  	#	op326 JUMPN
	.quad	E_JUMPG  	#	op327 JUMPG
	.quad	E_SKIP   	#	op330 SKIP
	.quad	E_SKIPL  	#	op331 SKIPL
	.quad	E_SKIPE  	#	op332 SKIPE
	.quad	E_SKIPLE 	#	op333 SKIPLE
	.quad	E_SKIPA  	#	op334 SKIPA
	.quad	E_SKIPGE 	#	op335 SKIPGE
	.quad	E_SKIPN  	#	op336 SKIPN
	.quad	E_SKIPG  	#	op337 SKIPG
	.quad	E_AOJ    	#	op340 AOJ
	.quad	E_AOJL   	#	op341 AOJL
	.quad	E_AOJE   	#	op342 AOJE
	.quad	E_AOJLE  	#	op343 AOJLE
	.quad	E_AOJA   	#	op344 AOJA
	.quad	E_AOJGE  	#	op345 AOJGE
	.quad	E_AOJN   	#	op346 AOJN
	.quad	E_AOJG   	#	op347 AOJG
	.quad	E_AOS    	#	op350 AOS
	.quad	E_AOSL   	#	op351 AOSL
	.quad	E_AOSE   	#	op352 AOSE
	.quad	E_AOSLE  	#	op353 AOSLE
	.quad	E_AOSA   	#	op354 AOSA
	.quad	E_AOSGE  	#	op355 AOSGE
	.quad	E_AOSN   	#	op356 AOSN
	.quad	E_AOSG   	#	op357 AOSG
	.quad	E_SOJ    	#	op360 SOJ
	.quad	E_SOJL   	#	op361 SOJL
	.quad	E_SOJE   	#	op362 SOJE
	.quad	E_SOJLE  	#	op363 SOJLE
	.quad	E_SOJA   	#	op364 SOJA
	.quad	E_SOJGE  	#	op365 SOJGE
	.quad	E_SOJN   	#	op366 SOJN
	.quad	E_SOJG   	#	op367 SOJG
	.quad	E_SOS    	#	op370 SOS
	.quad	E_SOSL   	#	op371 SOSL
	.quad	E_SOSE   	#	op372 SOSE
	.quad	E_SOSLE  	#	op373 SOSLE
	.quad	E_SOSA   	#	op374 SOSA
	.quad	E_SOSGE  	#	op375 SOSGE
	.quad	E_SOSN   	#	op376 SOSN
	.quad	E_SOSG   	#	op377 SOSG
	.quad	E_SETZ   	#	op400 SETZ
	.quad	E_SETZI  	#	op401 SETZI
	.quad	E_SETZM  	#	op402 SETZM
	.quad	E_SETZB  	#	op403 SETZB
	.quad	E_AND    	#	op404 AND
	.quad	E_ANDI   	#	op405 ANDI
	.quad	E_ANDM   	#	op406 ANDM
	.quad	E_ANDB   	#	op407 ANDB
	.quad	E_ANDCA  	#	op410 ANDCA
	.quad	E_ANDCAI 	#	op411 ANDCAI
	.quad	E_ANDCAM 	#	op412 ANDCAM
	.quad	E_ANDCAB 	#	op413 ANDCAB
	.quad	E_SETM   	#	op414 SETM
	.quad	E_XMOVEI 	#	op415 XMOVEI
	.quad	E_SETMM  	#	op416 SETMM
	.quad	E_SETMB  	#	op417 SETMB
	.quad	E_ANDCM  	#	op420 ANDCM
	.quad	E_ANDCMI 	#	op421 ANDCMI
	.quad	E_ANDCMM 	#	op422 ANDCMM
	.quad	E_ANDCMB 	#	op423 ANDCMB
	.quad	E_SETA   	#	op424 SETA
	.quad	E_SETAI  	#	op425 SETAI
	.quad	E_SETAM  	#	op426 SETAM
	.quad	E_SETAB  	#	op427 SETAB
	.quad	E_XOR    	#	op430 XOR
	.quad	E_XORI   	#	op431 XORI
	.quad	E_XORM   	#	op432 XORM
	.quad	E_XORB   	#	op433 XORB
	.quad	E_OR     	#	op434 OR
	.quad	E_ORI    	#	op435 ORI
	.quad	E_ORM    	#	op436 ORM
	.quad	E_ORB    	#	op437 ORB
	.quad	E_ANDCB  	#	op440 ANDCB
	.quad	E_ANDCBI 	#	op441 ANDCBI
	.quad	E_ANDCBM 	#	op442 ANDCBM
	.quad	E_ANDCBB 	#	op443 ANDCBB
	.quad	E_EQV    	#	op444 EQV
	.quad	E_EQVI   	#	op445 EQVI
	.quad	E_EQVM   	#	op446 EQVM
	.quad	E_EQVB   	#	op447 EQVB
	.quad	E_SETCA  	#	op450 SETCA
	.quad	E_SETCAI 	#	op451 SETCAI
	.quad	E_SETCAM 	#	op452 SETCAM
	.quad	E_SETCAB 	#	op453 SETCAB
	.quad	E_ORCA   	#	op454 ORCA
	.quad	E_ORCAI  	#	op455 ORCAI
	.quad	E_ORCAM  	#	op456 ORCAM
	.quad	E_ORCAB  	#	op457 ORCAB
	.quad	E_SETCM  	#	op460 SETCM
	.quad	E_SETCMI 	#	op461 SETCMI
	.quad	E_SETCMM 	#	op462 SETCMM
	.quad	E_SETCMB 	#	op463 SETCMB
	.quad	E_ORCM   	#	op464 ORCM
	.quad	E_ORCMI  	#	op465 ORCMI
	.quad	E_ORCMM  	#	op466 ORCMM
	.quad	E_ORCMB  	#	op467 ORCMB
	.quad	E_ORCB   	#	op470 ORCB
	.quad	E_ORCBI  	#	op471 ORCBI
	.quad	E_ORCBM  	#	op472 ORCBM
	.quad	E_ORCBB  	#	op473 ORCBB
	.quad	E_SETO   	#	op474 SETO
	.quad	E_SETOI  	#	op475 SETOI
	.quad	E_SETOM  	#	op476 SETOM
	.quad	E_SETOB  	#	op477 SETOB
	.quad	E_HLL    	#	op500 HLL
	.quad	E_XHLLI  	#	op501 XHLLI
	.quad	E_HLLM   	#	op502 HLLM
	.quad	E_HLLS   	#	op503 HLLS
	.quad	E_HRL    	#	op504 HRL
	.quad	E_HRLI   	#	op505 HRLI
	.quad	E_HRLM   	#	op506 HRLM
	.quad	E_HRLS   	#	op507 HRLS
	.quad	E_HLLZ   	#	op510 HLLZ
	.quad	E_HLLZI  	#	op511 HLLZI
	.quad	E_HLLZM  	#	op512 HLLZM
	.quad	E_HLLZS  	#	op513 HLLZS
	.quad	E_HRLZ   	#	op514 HRLZ
	.quad	E_HRLZI  	#	op515 HRLZI
	.quad	E_HRLZM  	#	op516 HRLZM
	.quad	E_HRLZS  	#	op517 HRLZS
	.quad	E_HLLO   	#	op520 HLLO
	.quad	E_HLLOI  	#	op521 HLLOI
	.quad	E_HLLOM  	#	op522 HLLOM
	.quad	E_HLLOS  	#	op523 HLLOS
	.quad	E_HRLO   	#	op524 HRLO
	.quad	E_HRLOI  	#	op525 HRLOI
	.quad	E_HRLOM  	#	op526 HRLOM
	.quad	E_HRLOS  	#	op527 HRLOS
	.quad	E_HLLE   	#	op530 HLLE
	.quad	E_HLLEI  	#	op531 HLLEI
	.quad	E_HLLEM  	#	op532 HLLEM
	.quad	E_HLLES  	#	op533 HLLES
	.quad	E_HRLE   	#	op534 HRLE
	.quad	E_HRLEI  	#	op535 HRLEI
	.quad	E_HRLEM  	#	op536 HRLEM
	.quad	E_HRLES  	#	op537 HRLES
	.quad	E_HRR    	#	op540 HRR
	.quad	E_HRRI   	#	op541 HRRI
	.quad	E_HRRM   	#	op542 HRRM
	.quad	E_HRRS   	#	op543 HRRS
	.quad	E_HLR    	#	op544 HLR
	.quad	E_HLRI   	#	op545 HLRI
	.quad	E_HLRM   	#	op546 HLRM
	.quad	E_HLRS   	#	op547 HLRS
	.quad	E_HRRZ   	#	op550 HRRZ
	.quad	E_HRRZI  	#	op551 HRRZI
	.quad	E_HRRZM  	#	op552 HRRZM
	.quad	E_HRRZS  	#	op553 HRRZS
	.quad	E_HLRZ   	#	op554 HLRZ
	.quad	E_HLRZI  	#	op555 HLRZI
	.quad	E_HLRZM  	#	op556 HLRZM
	.quad	E_HLRZS  	#	op557 HLRZS
	.quad	E_HRRO   	#	op560 HRRO
	.quad	E_HRROI  	#	op561 HRROI
	.quad	E_HRROM  	#	op562 HRROM
	.quad	E_HRROS  	#	op563 HRROS
	.quad	E_HLRO   	#	op564 HLRO
	.quad	E_HLROI  	#	op565 HLROI
	.quad	E_HLROM  	#	op566 HLROM
	.quad	E_HLROS  	#	op567 HLROS
	.quad	E_HRRE   	#	op570 HRRE
	.quad	E_HRREI  	#	op571 HRREI
	.quad	E_HRREM  	#	op572 HRREM
	.quad	E_HRRES  	#	op573 HRRES
	.quad	E_HLRE   	#	op574 HLRE
	.quad	E_HLREI  	#	op575 HLREI
	.quad	E_HLREM  	#	op576 HLREM
	.quad	E_HLRES  	#	op577 HLRES
	.quad	E_TRN    	#	op600 TRN
	.quad	E_TLN    	#	op601 TLN
	.quad	E_TRNE   	#	op602 TRNE
	.quad	E_TLNE   	#	op603 TLNE
	.quad	E_TRNA   	#	op604 TRNA
	.quad	E_TLNA   	#	op605 TLNA
	.quad	E_TRNN   	#	op606 TRNN
	.quad	E_TLNN   	#	op607 TLNN
	.quad	E_TDN    	#	op610 TDN
	.quad	E_TSN    	#	op611 TSN
	.quad	E_TDNE   	#	op612 TDNE
	.quad	E_TSNE   	#	op613 TSNE
	.quad	E_TDNA   	#	op614 TDNA
	.quad	E_TSNA   	#	op615 TSNA
	.quad	E_TDNN   	#	op616 TDNN
	.quad	E_TSNN   	#	op617 TSNN
	.quad	E_TRZ    	#	op620 TRZ
	.quad	E_TLZ    	#	op621 TLZ
	.quad	E_TRZE   	#	op622 TRZE
	.quad	E_TLZE   	#	op623 TLZE
	.quad	E_TRZA   	#	op624 TRZA
	.quad	E_TLZA   	#	op625 TLZA
	.quad	E_TRZN   	#	op626 TRZN
	.quad	E_TLZN   	#	op627 TLZN
	.quad	E_TDZ    	#	op630 TDZ
	.quad	E_TSZ    	#	op631 TSZ
	.quad	E_TDZE   	#	op632 TDZE
	.quad	E_TSZE   	#	op633 TSZE
	.quad	E_TDZA   	#	op634 TDZA
	.quad	E_TSZA   	#	op635 TSZA
	.quad	E_TDZN   	#	op636 TDZN
	.quad	E_TSZN   	#	op637 TSZN
	.quad	E_TRC    	#	op640 TRC
	.quad	E_TLC    	#	op641 TLC
	.quad	E_TRCE   	#	op642 TRCE
	.quad	E_TLCE   	#	op643 TLCE
	.quad	E_TRCA   	#	op644 TRCA
	.quad	E_TLCA   	#	op645 TLCA
	.quad	E_TRCN   	#	op646 TRCN
	.quad	E_TLCN   	#	op647 TLCN
	.quad	E_TDC    	#	op650 TDC
	.quad	E_TSC    	#	op651 TSC
	.quad	E_TDCE   	#	op652 TDCE
	.quad	E_TSCE   	#	op653 TSCE
	.quad	E_TDCA   	#	op654 TDCA
	.quad	E_TSCA   	#	op655 TSCA
	.quad	E_TDCN   	#	op656 TDCN
	.quad	E_TSCN   	#	op657 TSCN
	.quad	E_TRO    	#	op660 TRO
	.quad	E_TLO    	#	op661 TLO
	.quad	E_TROE   	#	op662 TROE
	.quad	E_TLOE   	#	op663 TLOE
	.quad	E_TROA   	#	op664 TROA
	.quad	E_TLOA   	#	op665 TLOA
	.quad	E_TRON   	#	op666 TRON
	.quad	E_TLON   	#	op667 TLON
	.quad	E_TDO    	#	op670 TDO
	.quad	E_TSO    	#	op671 TSO
	.quad	E_TDOE   	#	op672 TDOE
	.quad	E_TSOE   	#	op673 TSOE
	.quad	E_TDOA   	#	op674 TDOA
	.quad	E_TSOA   	#	op675 TSOA
	.quad	E_TDON   	#	op676 TDON
	.quad	E_TSON   	#	op677 TSON
	.quad E_DEVIO		#	op700 device IO instruction
	.quad E_DEVIO		#	op701 device IO instruction
	.quad E_DEVIO		#	op702 device IO instruction
	.quad E_DEVIO		#	op703 device IO instruction
	.quad E_DEVIO		#	op704 device IO instruction
	.quad E_DEVIO		#	op705 device IO instruction
	.quad E_DEVIO		#	op706 device IO instruction
	.quad E_DEVIO		#	op707 device IO instruction
	.quad E_DEVIO		#	op710 device IO instruction
	.quad E_DEVIO		#	op711 device IO instruction
	.quad E_DEVIO		#	op712 device IO instruction
	.quad E_DEVIO		#	op713 device IO instruction
	.quad E_DEVIO		#	op714 device IO instruction
	.quad E_DEVIO		#	op715 device IO instruction
	.quad E_DEVIO		#	op716 device IO instruction
	.quad E_DEVIO		#	op717 device IO instruction
	.quad E_DEVIO		#	op720 device IO instruction
	.quad E_DEVIO		#	op721 device IO instruction
	.quad E_DEVIO		#	op722 device IO instruction
	.quad E_DEVIO		#	op723 device IO instruction
	.quad E_DEVIO		#	op724 device IO instruction
	.quad E_DEVIO		#	op725 device IO instruction
	.quad E_DEVIO		#	op726 device IO instruction
	.quad E_DEVIO		#	op727 device IO instruction
	.quad E_DEVIO		#	op730 device IO instruction
	.quad E_DEVIO		#	op731 device IO instruction
	.quad E_DEVIO		#	op732 device IO instruction
	.quad E_DEVIO		#	op733 device IO instruction
	.quad E_DEVIO		#	op734 device IO instruction
	.quad E_DEVIO		#	op735 device IO instruction
	.quad E_DEVIO		#	op736 device IO instruction
	.quad E_DEVIO		#	op737 device IO instruction
	.quad E_DEVIO		#	op740 device IO instruction
	.quad E_DEVIO		#	op741 device IO instruction
	.quad E_DEVIO		#	op742 device IO instruction
	.quad E_DEVIO		#	op743 device IO instruction
	.quad E_DEVIO		#	op744 device IO instruction
	.quad E_DEVIO		#	op745 device IO instruction
	.quad E_DEVIO		#	op746 device IO instruction
	.quad E_DEVIO		#	op747 device IO instruction
	.quad E_DEVIO		#	op750 device IO instruction
	.quad E_DEVIO		#	op751 device IO instruction
	.quad E_DEVIO		#	op752 device IO instruction
	.quad E_DEVIO		#	op753 device IO instruction
	.quad E_DEVIO		#	op754 device IO instruction
	.quad E_DEVIO		#	op755 device IO instruction
	.quad E_DEVIO		#	op756 device IO instruction
	.quad E_DEVIO		#	op757 device IO instruction
	.quad E_DEVIO		#	op760 device IO instruction
	.quad E_DEVIO		#	op761 device IO instruction
	.quad E_DEVIO		#	op762 device IO instruction
	.quad E_DEVIO		#	op763 device IO instruction
	.quad E_DEVIO		#	op764 device IO instruction
	.quad E_DEVIO		#	op765 device IO instruction
	.quad E_DEVIO		#	op766 device IO instruction
	.quad E_DEVIO		#	op767 device IO instruction
	.quad E_DEVIO		#	op770 device IO instruction
	.quad E_DEVIO		#	op771 device IO instruction
	.quad E_DEVIO		#	op772 device IO instruction
	.quad E_DEVIO		#	op773 device IO instruction
	.quad E_DEVIO		#	op774 device IO instruction
	.quad E_DEVIO		#	op775 device IO instruction
	.quad E_DEVIO		#	op776 device IO instruction
	.quad E_DEVIO		#	op777 device IO instruction

	.data	
extjmp:	.quad	E_MUU0  	#	EXTEND op000 MUUO00
	.quad	E_CMPSL  	#	EXTEND op001 CMPSL
	.quad	E_CMPSE  	#	EXTEND op002 CMPSE
	.quad	E_CMPSLE 	#	EXTEND op003 CMPSLE
	.quad	E_EDIT   	#	EXTEND op004 EDIT
	.quad	E_CMPSGE 	#	EXTEND op005 CMPSGE
	.quad	E_CMPSN  	#	EXTEND op006 CMPSN
	.quad	E_CMPSG  	#	EXTEND op007 CMPSG
	.quad	E_CVTDBO 	#	EXTEND op010 CVTDBO
	.quad	E_CVTDBT 	#	EXTEND op011 CVTDBT
	.quad	E_CVTBDO 	#	EXTEND op012 CVTBDO
	.quad	E_CVTBDT 	#	EXTEND op013 CVTBDT
	.quad	E_MOVSO  	#	EXTEND op014 MOVSO
	.quad	E_MOVST  	#	EXTEND op015 MOVST
	.quad	E_MOVSLJ 	#	EXTEND op016 MOVSLJ
	.quad	E_MOVSRJ 	#	EXTEND op017 MOVSRJ
	.quad	E_XBLT   	#	EXTEND op020 XBLT
	.quad	E_MUU0 		#	EXTEND op021
	.quad	E_MUU0 		#	EXTEND op022
	.quad	E_MUU0 		#	EXTEND op023
	.quad	E_MUU0 		#	EXTEND op024
	.quad	E_MUU0 		#	EXTEND op025
	.quad	E_MUU0 		#	EXTEND op026
	.quad	E_MUU0 		#	EXTEND op027
	.quad	E_MUU0 		#	EXTEND op030
	.quad	E_MUU0 		#	EXTEND op031
	.quad	E_MUU0 		#	EXTEND op032
	.quad	E_MUU0 		#	EXTEND op033
	.quad	E_MUU0 		#	EXTEND op034
	.quad	E_MUU0 		#	EXTEND op035
	.quad	E_MUU0 		#	EXTEND op036
	.quad	E_MUU0 		#	EXTEND op037
	.quad	E_MUU0 		#	EXTEND op040
	.quad	E_MUU0 		#	EXTEND op041
	.quad	E_MUU0 		#	EXTEND op042
	.quad	E_MUU0 		#	EXTEND op043
	.quad	E_MUU0 		#	EXTEND op044
	.quad	E_MUU0 		#	EXTEND op045
	.quad	E_MUU0 		#	EXTEND op046
	.quad	E_MUU0 		#	EXTEND op047
	.quad	E_MUU0 		#	EXTEND op050
	.quad	E_MUU0 		#	EXTEND op051
	.quad	E_MUU0 		#	EXTEND op052
	.quad	E_MUU0 		#	EXTEND op053
	.quad	E_MUU0 		#	EXTEND op054
	.quad	E_MUU0 		#	EXTEND op055
	.quad	E_MUU0 		#	EXTEND op056
	.quad	E_MUU0 		#	EXTEND op057
	.quad	E_MUU0 		#	EXTEND op060
	.quad	E_MUU0 		#	EXTEND op061
	.quad	E_MUU0 		#	EXTEND op062
	.quad	E_MUU0 		#	EXTEND op063
	.quad	E_MUU0 		#	EXTEND op064
	.quad	E_MUU0 		#	EXTEND op065
	.quad	E_MUU0 		#	EXTEND op066
	.quad	E_MUU0 		#	EXTEND op067
	.quad	E_MUU0 		#	EXTEND op070
	.quad	E_MUU0 		#	EXTEND op071
	.quad	E_MUU0 		#	EXTEND op072
	.quad	E_MUU0 		#	EXTEND op073
	.quad	E_MUU0 		#	EXTEND op074
	.quad	E_MUU0 		#	EXTEND op075
	.quad	E_MUU0 		#	EXTEND op076
	.quad	E_MUU0 		#	EXTEND op077
	.quad	E_MUU0 		#	EXTEND op100
	.quad	E_MUU0 		#	EXTEND op101
	.quad	E_MUU0 		#	EXTEND op102
	.quad	E_MUU0 		#	EXTEND op103
	.quad	E_MUU0 		#	EXTEND op104
	.quad	E_MUU0 		#	EXTEND op105
	.quad	E_MUU0 		#	EXTEND op106
	.quad	E_MUU0 		#	EXTEND op107
	.quad	E_MUU0 		#	EXTEND op110
	.quad	E_MUU0 		#	EXTEND op111
	.quad	E_MUU0 		#	EXTEND op112
	.quad	E_MUU0 		#	EXTEND op113
	.quad	E_MUU0 		#	EXTEND op114
	.quad	E_MUU0 		#	EXTEND op115
	.quad	E_MUU0 		#	EXTEND op116
	.quad	E_MUU0 		#	EXTEND op117
	.quad	E_MUU0 		#	EXTEND op120
	.quad	E_MUU0 		#	EXTEND op121
	.quad	E_MUU0 		#	EXTEND op122
	.quad	E_MUU0 		#	EXTEND op123
	.quad	E_MUU0 		#	EXTEND op124
	.quad	E_MUU0 		#	EXTEND op125
	.quad	E_MUU0 		#	EXTEND op126
	.quad	E_MUU0 		#	EXTEND op127
	.quad	E_MUU0 		#	EXTEND op130
	.quad	E_MUU0 		#	EXTEND op131
	.quad	E_MUU0 		#	EXTEND op132
	.quad	E_MUU0 		#	EXTEND op133
	.quad	E_MUU0 		#	EXTEND op134
	.quad	E_MUU0 		#	EXTEND op135
	.quad	E_MUU0 		#	EXTEND op136
	.quad	E_MUU0 		#	EXTEND op137
	.quad	E_MUU0 		#	EXTEND op140
	.quad	E_MUU0 		#	EXTEND op141
	.quad	E_MUU0 		#	EXTEND op142
	.quad	E_MUU0 		#	EXTEND op143
	.quad	E_MUU0 		#	EXTEND op144
	.quad	E_MUU0 		#	EXTEND op145
	.quad	E_MUU0 		#	EXTEND op146
	.quad	E_MUU0 		#	EXTEND op147
	.quad	E_MUU0 		#	EXTEND op150
	.quad	E_MUU0 		#	EXTEND op151
	.quad	E_MUU0 		#	EXTEND op152
	.quad	E_MUU0 		#	EXTEND op153
	.quad	E_MUU0 		#	EXTEND op154
	.quad	E_MUU0 		#	EXTEND op155
	.quad	E_MUU0 		#	EXTEND op156
	.quad	E_MUU0 		#	EXTEND op157
	.quad	E_MUU0 		#	EXTEND op160
	.quad	E_MUU0 		#	EXTEND op161
	.quad	E_MUU0 		#	EXTEND op162
	.quad	E_MUU0 		#	EXTEND op163
	.quad	E_MUU0 		#	EXTEND op164
	.quad	E_MUU0 		#	EXTEND op165
	.quad	E_MUU0 		#	EXTEND op166
	.quad	E_MUU0 		#	EXTEND op167
	.quad	E_MUU0 		#	EXTEND op170
	.quad	E_MUU0 		#	EXTEND op171
	.quad	E_MUU0 		#	EXTEND op172
	.quad	E_MUU0 		#	EXTEND op173
	.quad	E_MUU0 		#	EXTEND op174
	.quad	E_MUU0 		#	EXTEND op175
	.quad	E_MUU0 		#	EXTEND op176
	.quad	E_MUU0 		#	EXTEND op177
	.quad	E_MUU0 		#	EXTEND op200
	.quad	E_MUU0 		#	EXTEND op201
	.quad	E_MUU0 		#	EXTEND op202
	.quad	E_MUU0 		#	EXTEND op203
	.quad	E_MUU0 		#	EXTEND op204
	.quad	E_MUU0 		#	EXTEND op205
	.quad	E_MUU0 		#	EXTEND op206
	.quad	E_MUU0 		#	EXTEND op207
	.quad	E_MUU0 		#	EXTEND op210
	.quad	E_MUU0 		#	EXTEND op211
	.quad	E_MUU0 		#	EXTEND op212
	.quad	E_MUU0 		#	EXTEND op213
	.quad	E_MUU0 		#	EXTEND op214
	.quad	E_MUU0 		#	EXTEND op215
	.quad	E_MUU0 		#	EXTEND op216
	.quad	E_MUU0 		#	EXTEND op217
	.quad	E_MUU0 		#	EXTEND op220
	.quad	E_MUU0 		#	EXTEND op221
	.quad	E_MUU0 		#	EXTEND op222
	.quad	E_MUU0 		#	EXTEND op223
	.quad	E_MUU0 		#	EXTEND op224
	.quad	E_MUU0 		#	EXTEND op225
	.quad	E_MUU0 		#	EXTEND op226
	.quad	E_MUU0 		#	EXTEND op227
	.quad	E_MUU0 		#	EXTEND op230
	.quad	E_MUU0 		#	EXTEND op231
	.quad	E_MUU0 		#	EXTEND op232
	.quad	E_MUU0 		#	EXTEND op233
	.quad	E_MUU0 		#	EXTEND op234
	.quad	E_MUU0 		#	EXTEND op235
	.quad	E_MUU0 		#	EXTEND op236
	.quad	E_MUU0 		#	EXTEND op237
	.quad	E_MUU0 		#	EXTEND op240
	.quad	E_MUU0 		#	EXTEND op241
	.quad	E_MUU0 		#	EXTEND op242
	.quad	E_MUU0 		#	EXTEND op243
	.quad	E_MUU0 		#	EXTEND op244
	.quad	E_MUU0 		#	EXTEND op245
	.quad	E_MUU0 		#	EXTEND op246
	.quad	E_MUU0 		#	EXTEND op247
	.quad	E_MUU0 		#	EXTEND op250
	.quad	E_MUU0 		#	EXTEND op251
	.quad	E_MUU0 		#	EXTEND op252
	.quad	E_MUU0 		#	EXTEND op253
	.quad	E_MUU0 		#	EXTEND op254
	.quad	E_MUU0 		#	EXTEND op255
	.quad	E_MUU0 		#	EXTEND op256
	.quad	E_MUU0 		#	EXTEND op257
	.quad	E_MUU0 		#	EXTEND op260
	.quad	E_MUU0 		#	EXTEND op261
	.quad	E_MUU0 		#	EXTEND op262
	.quad	E_MUU0 		#	EXTEND op263
	.quad	E_MUU0 		#	EXTEND op264
	.quad	E_MUU0 		#	EXTEND op265
	.quad	E_MUU0 		#	EXTEND op266
	.quad	E_MUU0 		#	EXTEND op267
	.quad	E_MUU0 		#	EXTEND op270
	.quad	E_MUU0 		#	EXTEND op271
	.quad	E_MUU0 		#	EXTEND op272
	.quad	E_MUU0 		#	EXTEND op273
	.quad	E_MUU0 		#	EXTEND op274
	.quad	E_MUU0 		#	EXTEND op275
	.quad	E_MUU0 		#	EXTEND op276
	.quad	E_MUU0 		#	EXTEND op277
	.quad	E_MUU0 		#	EXTEND op300
	.quad	E_MUU0 		#	EXTEND op301
	.quad	E_MUU0 		#	EXTEND op302
	.quad	E_MUU0 		#	EXTEND op303
	.quad	E_MUU0 		#	EXTEND op304
	.quad	E_MUU0 		#	EXTEND op305
	.quad	E_MUU0 		#	EXTEND op306
	.quad	E_MUU0 		#	EXTEND op307
	.quad	E_MUU0 		#	EXTEND op310
	.quad	E_MUU0 		#	EXTEND op311
	.quad	E_MUU0 		#	EXTEND op312
	.quad	E_MUU0 		#	EXTEND op313
	.quad	E_MUU0 		#	EXTEND op314
	.quad	E_MUU0 		#	EXTEND op315
	.quad	E_MUU0 		#	EXTEND op316
	.quad	E_MUU0 		#	EXTEND op317
	.quad	E_MUU0 		#	EXTEND op320
	.quad	E_MUU0 		#	EXTEND op321
	.quad	E_MUU0 		#	EXTEND op322
	.quad	E_MUU0 		#	EXTEND op323
	.quad	E_MUU0 		#	EXTEND op324
	.quad	E_MUU0 		#	EXTEND op325
	.quad	E_MUU0 		#	EXTEND op326
	.quad	E_MUU0 		#	EXTEND op327
	.quad	E_MUU0 		#	EXTEND op330
	.quad	E_MUU0 		#	EXTEND op331
	.quad	E_MUU0 		#	EXTEND op332
	.quad	E_MUU0 		#	EXTEND op333
	.quad	E_MUU0 		#	EXTEND op334
	.quad	E_MUU0 		#	EXTEND op335
	.quad	E_MUU0 		#	EXTEND op336
	.quad	E_MUU0 		#	EXTEND op337
	.quad	E_MUU0 		#	EXTEND op340
	.quad	E_MUU0 		#	EXTEND op341
	.quad	E_MUU0 		#	EXTEND op342
	.quad	E_MUU0 		#	EXTEND op343
	.quad	E_MUU0 		#	EXTEND op344
	.quad	E_MUU0 		#	EXTEND op345
	.quad	E_MUU0 		#	EXTEND op346
	.quad	E_MUU0 		#	EXTEND op347
	.quad	E_MUU0 		#	EXTEND op350
	.quad	E_MUU0 		#	EXTEND op351
	.quad	E_MUU0 		#	EXTEND op352
	.quad	E_MUU0 		#	EXTEND op353
	.quad	E_MUU0 		#	EXTEND op354
	.quad	E_MUU0 		#	EXTEND op355
	.quad	E_MUU0 		#	EXTEND op356
	.quad	E_MUU0 		#	EXTEND op357
	.quad	E_MUU0 		#	EXTEND op360
	.quad	E_MUU0 		#	EXTEND op361
	.quad	E_MUU0 		#	EXTEND op362
	.quad	E_MUU0 		#	EXTEND op363
	.quad	E_MUU0 		#	EXTEND op364
	.quad	E_MUU0 		#	EXTEND op365
	.quad	E_MUU0 		#	EXTEND op366
	.quad	E_MUU0 		#	EXTEND op367
	.quad	E_MUU0 		#	EXTEND op370
	.quad	E_MUU0 		#	EXTEND op371
	.quad	E_MUU0 		#	EXTEND op372
	.quad	E_MUU0 		#	EXTEND op373
	.quad	E_MUU0 		#	EXTEND op374
	.quad	E_MUU0 		#	EXTEND op375
	.quad	E_MUU0 		#	EXTEND op376
	.quad	E_MUU0 		#	EXTEND op377
	.quad	E_MUU0 		#	EXTEND op400
	.quad	E_MUU0 		#	EXTEND op401
	.quad	E_MUU0 		#	EXTEND op402
	.quad	E_MUU0 		#	EXTEND op403
	.quad	E_MUU0 		#	EXTEND op404
	.quad	E_MUU0 		#	EXTEND op405
	.quad	E_MUU0 		#	EXTEND op406
	.quad	E_MUU0 		#	EXTEND op407
	.quad	E_MUU0 		#	EXTEND op410
	.quad	E_MUU0 		#	EXTEND op411
	.quad	E_MUU0 		#	EXTEND op412
	.quad	E_MUU0 		#	EXTEND op413
	.quad	E_MUU0 		#	EXTEND op414
	.quad	E_MUU0 		#	EXTEND op415
	.quad	E_MUU0 		#	EXTEND op416
	.quad	E_MUU0 		#	EXTEND op417
	.quad	E_MUU0 		#	EXTEND op420
	.quad	E_MUU0 		#	EXTEND op421
	.quad	E_MUU0 		#	EXTEND op422
	.quad	E_MUU0 		#	EXTEND op423
	.quad	E_MUU0 		#	EXTEND op424
	.quad	E_MUU0 		#	EXTEND op425
	.quad	E_MUU0 		#	EXTEND op426
	.quad	E_MUU0 		#	EXTEND op427
	.quad	E_MUU0 		#	EXTEND op430
	.quad	E_MUU0 		#	EXTEND op431
	.quad	E_MUU0 		#	EXTEND op432
	.quad	E_MUU0 		#	EXTEND op433
	.quad	E_MUU0 		#	EXTEND op434
	.quad	E_MUU0 		#	EXTEND op435
	.quad	E_MUU0 		#	EXTEND op436
	.quad	E_MUU0 		#	EXTEND op437
	.quad	E_MUU0 		#	EXTEND op440
	.quad	E_MUU0 		#	EXTEND op441
	.quad	E_MUU0 		#	EXTEND op442
	.quad	E_MUU0 		#	EXTEND op443
	.quad	E_MUU0 		#	EXTEND op444
	.quad	E_MUU0 		#	EXTEND op445
	.quad	E_MUU0 		#	EXTEND op446
	.quad	E_MUU0 		#	EXTEND op447
	.quad	E_MUU0 		#	EXTEND op450
	.quad	E_MUU0 		#	EXTEND op451
	.quad	E_MUU0 		#	EXTEND op452
	.quad	E_MUU0 		#	EXTEND op453
	.quad	E_MUU0 		#	EXTEND op454
	.quad	E_MUU0 		#	EXTEND op455
	.quad	E_MUU0 		#	EXTEND op456
	.quad	E_MUU0 		#	EXTEND op457
	.quad	E_MUU0 		#	EXTEND op460
	.quad	E_MUU0 		#	EXTEND op461
	.quad	E_MUU0 		#	EXTEND op462
	.quad	E_MUU0 		#	EXTEND op463
	.quad	E_MUU0 		#	EXTEND op464
	.quad	E_MUU0 		#	EXTEND op465
	.quad	E_MUU0 		#	EXTEND op466
	.quad	E_MUU0 		#	EXTEND op467
	.quad	E_MUU0 		#	EXTEND op470
	.quad	E_MUU0 		#	EXTEND op471
	.quad	E_MUU0 		#	EXTEND op472
	.quad	E_MUU0 		#	EXTEND op473
	.quad	E_MUU0 		#	EXTEND op474
	.quad	E_MUU0 		#	EXTEND op475
	.quad	E_MUU0 		#	EXTEND op476
	.quad	E_MUU0 		#	EXTEND op477
	.quad	E_MUU0 		#	EXTEND op500
	.quad	E_MUU0 		#	EXTEND op501
	.quad	E_MUU0 		#	EXTEND op502
	.quad	E_MUU0 		#	EXTEND op503
	.quad	E_MUU0 		#	EXTEND op504
	.quad	E_MUU0 		#	EXTEND op505
	.quad	E_MUU0 		#	EXTEND op506
	.quad	E_MUU0 		#	EXTEND op507
	.quad	E_MUU0 		#	EXTEND op510
	.quad	E_MUU0 		#	EXTEND op511
	.quad	E_MUU0 		#	EXTEND op512
	.quad	E_MUU0 		#	EXTEND op513
	.quad	E_MUU0 		#	EXTEND op514
	.quad	E_MUU0 		#	EXTEND op515
	.quad	E_MUU0 		#	EXTEND op516
	.quad	E_MUU0 		#	EXTEND op517
	.quad	E_MUU0 		#	EXTEND op520
	.quad	E_MUU0 		#	EXTEND op521
	.quad	E_MUU0 		#	EXTEND op522
	.quad	E_MUU0 		#	EXTEND op523
	.quad	E_MUU0 		#	EXTEND op524
	.quad	E_MUU0 		#	EXTEND op525
	.quad	E_MUU0 		#	EXTEND op526
	.quad	E_MUU0 		#	EXTEND op527
	.quad	E_MUU0 		#	EXTEND op530
	.quad	E_MUU0 		#	EXTEND op531
	.quad	E_MUU0 		#	EXTEND op532
	.quad	E_MUU0 		#	EXTEND op533
	.quad	E_MUU0 		#	EXTEND op534
	.quad	E_MUU0 		#	EXTEND op535
	.quad	E_MUU0 		#	EXTEND op536
	.quad	E_MUU0 		#	EXTEND op537
	.quad	E_MUU0 		#	EXTEND op540
	.quad	E_MUU0 		#	EXTEND op541
	.quad	E_MUU0 		#	EXTEND op542
	.quad	E_MUU0 		#	EXTEND op543
	.quad	E_MUU0 		#	EXTEND op544
	.quad	E_MUU0 		#	EXTEND op545
	.quad	E_MUU0 		#	EXTEND op546
	.quad	E_MUU0 		#	EXTEND op547
	.quad	E_MUU0 		#	EXTEND op550
	.quad	E_MUU0 		#	EXTEND op551
	.quad	E_MUU0 		#	EXTEND op552
	.quad	E_MUU0 		#	EXTEND op553
	.quad	E_MUU0 		#	EXTEND op554
	.quad	E_MUU0 		#	EXTEND op555
	.quad	E_MUU0 		#	EXTEND op556
	.quad	E_MUU0 		#	EXTEND op557
	.quad	E_MUU0 		#	EXTEND op560
	.quad	E_MUU0 		#	EXTEND op561
	.quad	E_MUU0 		#	EXTEND op562
	.quad	E_MUU0 		#	EXTEND op563
	.quad	E_MUU0 		#	EXTEND op564
	.quad	E_MUU0 		#	EXTEND op565
	.quad	E_MUU0 		#	EXTEND op566
	.quad	E_MUU0 		#	EXTEND op567
	.quad	E_MUU0 		#	EXTEND op570
	.quad	E_MUU0 		#	EXTEND op571
	.quad	E_MUU0 		#	EXTEND op572
	.quad	E_MUU0 		#	EXTEND op573
	.quad	E_MUU0 		#	EXTEND op574
	.quad	E_MUU0 		#	EXTEND op575
	.quad	E_MUU0 		#	EXTEND op576
	.quad	E_MUU0 		#	EXTEND op577
	.quad	E_MUU0 		#	EXTEND op600
	.quad	E_MUU0 		#	EXTEND op601
	.quad	E_MUU0 		#	EXTEND op602
	.quad	E_MUU0 		#	EXTEND op603
	.quad	E_MUU0 		#	EXTEND op604
	.quad	E_MUU0 		#	EXTEND op605
	.quad	E_MUU0 		#	EXTEND op606
	.quad	E_MUU0 		#	EXTEND op607
	.quad	E_MUU0 		#	EXTEND op610
	.quad	E_MUU0 		#	EXTEND op611
	.quad	E_MUU0 		#	EXTEND op612
	.quad	E_MUU0 		#	EXTEND op613
	.quad	E_MUU0 		#	EXTEND op614
	.quad	E_MUU0 		#	EXTEND op615
	.quad	E_MUU0 		#	EXTEND op616
	.quad	E_MUU0 		#	EXTEND op617
	.quad	E_MUU0 		#	EXTEND op620
	.quad	E_MUU0 		#	EXTEND op621
	.quad	E_MUU0 		#	EXTEND op622
	.quad	E_MUU0 		#	EXTEND op623
	.quad	E_MUU0 		#	EXTEND op624
	.quad	E_MUU0 		#	EXTEND op625
	.quad	E_MUU0 		#	EXTEND op626
	.quad	E_MUU0 		#	EXTEND op627
	.quad	E_MUU0 		#	EXTEND op630
	.quad	E_MUU0 		#	EXTEND op631
	.quad	E_MUU0 		#	EXTEND op632
	.quad	E_MUU0 		#	EXTEND op633
	.quad	E_MUU0 		#	EXTEND op634
	.quad	E_MUU0 		#	EXTEND op635
	.quad	E_MUU0 		#	EXTEND op636
	.quad	E_MUU0 		#	EXTEND op637
	.quad	E_MUU0 		#	EXTEND op640
	.quad	E_MUU0 		#	EXTEND op641
	.quad	E_MUU0 		#	EXTEND op642
	.quad	E_MUU0 		#	EXTEND op643
	.quad	E_MUU0 		#	EXTEND op644
	.quad	E_MUU0 		#	EXTEND op645
	.quad	E_MUU0 		#	EXTEND op646
	.quad	E_MUU0 		#	EXTEND op647
	.quad	E_MUU0 		#	EXTEND op650
	.quad	E_MUU0 		#	EXTEND op651
	.quad	E_MUU0 		#	EXTEND op652
	.quad	E_MUU0 		#	EXTEND op653
	.quad	E_MUU0 		#	EXTEND op654
	.quad	E_MUU0 		#	EXTEND op655
	.quad	E_MUU0 		#	EXTEND op656
	.quad	E_MUU0 		#	EXTEND op657
	.quad	E_MUU0 		#	EXTEND op660
	.quad	E_MUU0 		#	EXTEND op661
	.quad	E_MUU0 		#	EXTEND op662
	.quad	E_MUU0 		#	EXTEND op663
	.quad	E_MUU0 		#	EXTEND op664
	.quad	E_MUU0 		#	EXTEND op665
	.quad	E_MUU0 		#	EXTEND op666
	.quad	E_MUU0 		#	EXTEND op667
	.quad	E_MUU0 		#	EXTEND op670
	.quad	E_MUU0 		#	EXTEND op671
	.quad	E_MUU0 		#	EXTEND op672
	.quad	E_MUU0 		#	EXTEND op673
	.quad	E_MUU0 		#	EXTEND op674
	.quad	E_MUU0 		#	EXTEND op675
	.quad	E_MUU0 		#	EXTEND op676
	.quad	E_MUU0 		#	EXTEND op677
	.quad	E_MUU0 		#	EXTEND op700
	.quad	E_MUU0 		#	EXTEND op701
	.quad	E_MUU0 		#	EXTEND op702
	.quad	E_MUU0 		#	EXTEND op703
	.quad	E_MUU0 		#	EXTEND op704
	.quad	E_MUU0 		#	EXTEND op705
	.quad	E_MUU0 		#	EXTEND op706
	.quad	E_MUU0 		#	EXTEND op707
	.quad	E_MUU0 		#	EXTEND op710
	.quad	E_MUU0 		#	EXTEND op711
	.quad	E_MUU0 		#	EXTEND op712
	.quad	E_MUU0 		#	EXTEND op713
	.quad	E_MUU0 		#	EXTEND op714
	.quad	E_MUU0 		#	EXTEND op715
	.quad	E_MUU0 		#	EXTEND op716
	.quad	E_MUU0 		#	EXTEND op717
	.quad	E_MUU0 		#	EXTEND op720
	.quad	E_MUU0 		#	EXTEND op721
	.quad	E_MUU0 		#	EXTEND op722
	.quad	E_MUU0 		#	EXTEND op723
	.quad	E_MUU0 		#	EXTEND op724
	.quad	E_MUU0 		#	EXTEND op725
	.quad	E_MUU0 		#	EXTEND op726
	.quad	E_MUU0 		#	EXTEND op727
	.quad	E_MUU0 		#	EXTEND op730
	.quad	E_MUU0 		#	EXTEND op731
	.quad	E_MUU0 		#	EXTEND op732
	.quad	E_MUU0 		#	EXTEND op733
	.quad	E_MUU0 		#	EXTEND op734
	.quad	E_MUU0 		#	EXTEND op735
	.quad	E_MUU0 		#	EXTEND op736
	.quad	E_MUU0 		#	EXTEND op737
	.quad	E_MUU0 		#	EXTEND op740
	.quad	E_MUU0 		#	EXTEND op741
	.quad	E_MUU0 		#	EXTEND op742
	.quad	E_MUU0 		#	EXTEND op743
	.quad	E_MUU0 		#	EXTEND op744
	.quad	E_MUU0 		#	EXTEND op745
	.quad	E_MUU0 		#	EXTEND op746
	.quad	E_MUU0 		#	EXTEND op747
	.quad	E_MUU0 		#	EXTEND op750
	.quad	E_MUU0 		#	EXTEND op751
	.quad	E_MUU0 		#	EXTEND op752
	.quad	E_MUU0 		#	EXTEND op753
	.quad	E_MUU0 		#	EXTEND op754
	.quad	E_MUU0 		#	EXTEND op755
	.quad	E_MUU0 		#	EXTEND op756
	.quad	E_MUU0 		#	EXTEND op757
	.quad	E_MUU0 		#	EXTEND op760
	.quad	E_MUU0 		#	EXTEND op761
	.quad	E_MUU0 		#	EXTEND op762
	.quad	E_MUU0 		#	EXTEND op763
	.quad	E_MUU0 		#	EXTEND op764
	.quad	E_MUU0 		#	EXTEND op765
	.quad	E_MUU0 		#	EXTEND op766
	.quad	E_MUU0 		#	EXTEND op767
	.quad	E_MUU0 		#	EXTEND op770
	.quad	E_MUU0 		#	EXTEND op771
	.quad	E_MUU0 		#	EXTEND op772
	.quad	E_MUU0 		#	EXTEND op773
	.quad	E_MUU0 		#	EXTEND op774
	.quad	E_MUU0 		#	EXTEND op775
	.quad	E_MUU0 		#	EXTEND op776
	.quad	E_MUU0 		#	EXTEND op777

inthdl:	.quad	0		# never used
	.quad	I_lvl0
	.quad	I_lvl1
	.quad	I_lvl2
	.quad	I_lvl3
	.quad	I_lvl4
	.quad	I_lvl5
	.quad	I_lvl6
	.quad	I_lvl7
	.quad	I_savepc	# save PC+flags for examine
	# Start of registers just before MM memory area
	.data	
	.comm	emboxreg 33555480

	# Start of registers just before MM memory area
	# use var - MM offset from base reg pointing to MM
	# load base as emboxreg+MM
	#
	.struct	0
emboxstart:	# indexed by $13 and $14 
	# $14 is axp base for effective reg base and is the one the instructions reference
	#  		when $13 != $14 then we are doing some PXCT stuff
	# $13 is axp base for CAB 
	# PAB or CAB 3 bits  (PAB*16)+reg# + r0_0-MM(S1)
	# or (CAB*16)+reg# + r0_0-MM($10)

r0_0:	.quad	0
r0_1:	.quad	0
r0_2:	.quad	0
r0_3:	.quad	0
r0_4:	.quad	0
r0_5:	.quad	0
r0_6:	.quad	0
r0_7:	.quad	0
r0_8:	.quad	0
r0_9:	.quad	0
r0_10:	.quad	0
r0_11:	.quad	0
r0_12:	.quad	0
r0_13:	.quad	0
r0_14:	.quad	0
r0_15:	.quad	0


r1_0:	.quad	0
r1_1:	.quad	0
r1_2:	.quad	0
r1_3:	.quad	0
r1_4:	.quad	0
r1_5:	.quad	0
r1_6:	.quad	0
r1_7:	.quad	0
r1_8:	.quad	0
r1_9:	.quad	0
r1_10:	.quad	0
r1_11:	.quad	0
r1_12:	.quad	0
r1_13:	.quad	0
r1_14:	.quad	0
r1_15:	.quad	0

r2_0:	.quad	0
r2_1:	.quad	0
r2_2:	.quad	0
r2_3:	.quad	0
r2_4:	.quad	0
r2_5:	.quad	0
r2_6:	.quad	0
r2_7:	.quad	0
r2_8:	.quad	0
r2_9:	.quad	0
r2_10:	.quad	0
r2_11:	.quad	0
r2_12:	.quad	0
r2_13:	.quad	0
r2_14:	.quad	0
r2_15:	.quad	0

r3_0:	.quad	0
r3_1:	.quad	0
r3_2:	.quad	0
r3_3:	.quad	0
r3_4:	.quad	0
r3_5:	.quad	0
r3_6:	.quad	0
r3_7:	.quad	0
r3_8:	.quad	0
r3_9:	.quad	0
r3_10:	.quad	0
r3_11:	.quad	0
r3_12:	.quad	0
r3_13:	.quad	0
r3_14:	.quad	0
r3_15:	.quad	0

r4_0:	.quad	0
r4_1:	.quad	0
r4_2:	.quad	0
r4_3:	.quad	0
r4_4:	.quad	0
r4_5:	.quad	0
r4_6:	.quad	0
r4_7:	.quad	0
r4_8:	.quad	0
r4_9:	.quad	0
r4_10:	.quad	0
r4_11:	.quad	0
r4_12:	.quad	0
r4_13:	.quad	0
r4_14:	.quad	0
r4_15:	.quad	0

r5_0:	.quad	0
r5_1:	.quad	0
r5_2:	.quad	0
r5_3:	.quad	0
r5_4:	.quad	0
r5_5:	.quad	0
r5_6:	.quad	0
r5_7:	.quad	0
r5_8:	.quad	0
r5_9:	.quad	0
r5_10:	.quad	0
r5_11:	.quad	0
r5_12:	.quad	0
r5_13:	.quad	0
r5_14:	.quad	0
r5_15:	.quad	0

cstmsk:
r6_0:	.quad	0

cstdata:
r6_1:	.quad	0

cst:
r6_2:	.quad	0

spt:
r6_3:	.quad	0

r6_4:	.quad	0
r6_5:	.quad	0
r6_6:	.quad	0
r6_7:	.quad	0
r6_8:	.quad	0
r6_9:	.quad	0
r6_10:	.quad	0
r6_11:	.quad	0
r6_12:	.quad	0
r6_13:	.quad	0
r6_14:	.quad	0
r6_15:	.quad	0

r7_0:	.quad	0
r7_1:	.quad	0
r7_2:	.quad	0
r7_3:	.quad	0
r7_4:	.quad	0
r7_5:	.quad	0
r7_6:	.quad	0
r7_7:	.quad	0
r7_8:	.quad	0
r7_9:	.quad	0
r7_10:	.quad	0
r7_11:	.quad	0
r7_12:	.quad	0
r7_13:	.quad	0
r7_14:	.quad	0
r7_15:	.quad	0

	/* 
	index into reg set Current Accumulator Block	3bits
	previous context accumulator block		3bits
	Previous context Section include bit8=PCU	5bits
	Previous Context User Current sec is from PC
	if flags is neg ie sign bit set then VM is enabled
	allows a quick way to verify VM on

Reg:	usage:
$9:	== opjumpbase
$10:	== membase
$11:	== PC
$12:	== Flags ( see below )
$13:	== regbase CAB ( referenses the reall Current Accumulators )
$14:	== regbase effective (used by all instructions as register base )

When:	flags are negative VM is enabled

Logical:	bit usage
	Flags |1bit |       |13bits    |1bit|1bit|5bits|3bits|3bits|13bits|13bits|
	|VMena|MBZ    |PDP-flags |PCU |PCP |PCS  |PAB  |CAB  | UBR  | EBR  |

Physical:	bit usage so alpha extract/insert can be used
	Flags |1bit | 9bits |16bits    |1bit|1bit|1bit|5bits|4bits|4bits|16bits|16bits|
	|VMena|MBZ    |PDP-flags |MBZ |PCU |PCP |PCS  |PAB  |CAB  | UBR  | EBR  |

VMena:	Virtual Memory Enabled (sign bit)
MBZ:	Must Be Zero
PDP:	-flags	PDP-10 flags
PCU:	Previous Context User
PCP:	Previous Context Public
PCS:	Previous Context Section (PC section)
PAB:	Previous Accumulator Block
CAB:	Current  Accumulator Block
UBR:	User Base Register
EBR:	Executive Base Register

PDP:	-flags (16bits lower 13 bits belong to PDP10)
	*/
	/* Shift Left Logical so that bit is in axp sign */
	/* Shift Right Logicals so that bit is in low bit axp */
	/* Bit Mask for xor to clear and to get  13 bits wide */

	/* process table definitions */

	/*----+------------+------+------+--------+----+----+------------+------+-------+-----+-----+---------+------+
	|3bits|Overflow    |      |      |Floating|    |    |User IO     |      |Address|     |     |Floating | No   |
	|     |Prev context|Carry0|Carry1|Overflow|FPD |User|Prev Context|Public|Failure|Trap2|Trap1|underflow|Divide|
	|     |public      |      |      |        |    |    |User        |      |Inhibit|     |     |         |      |----+------------+------+------+--------+----+----+------------+------+-------+-----+-----+---------+------+
	| MBZ | 1 bit      | 1bit |1bit  | 1bit   |1bit|1bit| 1bit       | 1bit | 1bit  | 1bit|1bit | 1bit    |1bit  |----+------------+------+------+--------+----+----+------------+------+-------+-----+-----+---------+------+
	^10   ^13           ^14    ^15    ^16      ^17  ^18  ^19         ^20     ^21     ^22   ^23    ^24      ^25
	^^^^^^^
sll:	$12,X 
The:	above numbers correspond to how many bits to shift $12 left by 2 get that PDP10
flags:	into the axp sign bit

	*/
flags:	.quad	0		# storage locations only after console
PC:	.quad	0		# interupt requesting they be saved

usec:	.quad	0		# micro second counter
usec10:	.quad	0		# 10micro second counter

interupt:	.quad	0	# fe will indicate interupt with nozero


MM:	.quad	0:4194304
	# each word lower 36bits is PDP-10 word bit 63 is address break on
	# real 10 only has one address we can support address break
	# on each and every word fetched for execution
	# this leaves 27 bits unassigned

emboxend:










	.text
	.align	4

	.globl  cpu00
	.ent 	cpu00
cpu00:
	ldah    $29, ($27)!gpdisp!1
	lda     $29, ($29)!gpdisp!1
	lda	$30, -128($30)
	.frame  $30, 128, $26, 0
	stq	$26, 0($30)
	stq	$9, 8($30)
	stq	$10, 16($30)
	stq	$11, 24($30)
	stq	$12, 32($30)
	stq	$13, 40($30)
	stq	$14, 48($30)
	stq	$at, 56($30)
	stt	$f2, 64($30)
	stt	$f3, 72($30)
	stt	$f4, 80($30)
	stt	$f5, 88($30)
	stt	$f6, 96($30)
	stt	$f7, 104($30)
	stt	$f8, 112($30)
	stt	$f9, 120($30)
	trapb
	.mask	0x14007e00, 0
	.fmask	0x000007fc, 0
	.prologue 1
	#
	# Init base registers
	#
	ldq	$9, opjmp($29)!literal!2		# addr jump tbl
	ldq	$10, emboxreg($29)!literal!3	
	lda	$10, MM($10)!lituse_base!3	# pdp10 mem 2^22

	ldq	$11, PC-MM($10)!lituse_base!3 # load PC
	ldq	$12, flags-MM($10)!lituse_base!3 # load flags

	lda	$2,r0_0-MM($10)!lituse_base!3 # regfile base addr	
	extwl	$12,5,$0			# get PAB|CAB from flags reg $12
	and	$0,7,$0		# get CAB current accumulator block idx
	mulq	$0, 16*8, $0		# cal index into reg file 16 reg by 8 byte per reg
	addq	$0,$2,$13		# base+16*8*idx :axp address of accblk 

	ldah	$25, -4($31)		/* $25 == -1950663104 18 bit bic mask*/ 		
	sll	$25, 18, $24		/* $24 == 1956384768 36 bit bic mask */
	mov	$31, $26		/* clear page cache register */
fetch:
startfetch:
	/* fetch macro */							
	/* PDP-10 PC = $11 */							
	/* PDP-10 memory base reg = $10 */					
	mov	$13, $14	/* setup reg base in $14 so PXCT can use $14 to drive */
	/* intructions */
startfetchpxct:	/* entry point for PXCT */
	ldq	$at, interupt-MM($10)!lituse_base!3				
	lda	$27,opjmp-inthdl($9)!lituse_base!2  /*  base for hdl table */	
	s8addq	$at, $27, $0		 /* get address of handler */	
	bne	$at,dispatch		/* COND DISP request interupt != 0 */

	/* INC PC */
	and	$11, $25, $2		/* $2 get PC section part */ 		
	lda	$0, 1($11)		/* inc the PC */			
	bic	$0, $25, $0		/* $0 get PC 18bit and so wrap */	
	or	$2, $0, $11		/* recombine PC with section part */	
	/* put sect+incPC back to PC */ 	
	mov	$11, $1			/* put full virt addr into $1 */
	srl	$2, 18, $2		/* convert section mask to section number */
	/* now $1=5sectno+9bitpg+9bitwordaddr bit virtual  $2=5 bit sect no */

	/* now convert pc in $11 $2=sectbits $1=VA  into $16 */	
	/* Virtual to physical address with reference type of FETCH
	** Inputs:	$1 = 23bit virtual
	**		$2 = 5/9 bit section number
	** Outputs:	$16 = phy address (axp) may point to a reg or in KL memory
	*/
	blt	$12, VM0
	s8addq	$1, $10, $16	/* get phy axp address membase $10 */
	s8addq	$1, $13, $0	/* calc if it was a register base $13  fetch always is the current AC block read or write use $14 */
	subq	$1,17, $6	/* is the address inside the accumlators */
	cmovlt	$1, $0, $16	/* move reg address to $16 instead */
	br	endvtophyrx0
checkcache0:
	/* make key of sect+page */
	srl	$1, 9, $0		/* get section + page */
	subl	$0, $26, $0		/* subtract from lower 32bits of $26 */
	bne	$0, cachemiss0	/* not matched cache miss */
	/* here then we have a valid cache hit */
	extwl	$26, 4, $7		/* get core pg no into $7 */
	srl	$26, 32+15+5, $4		/* get GPWSC into $4 */
	br	cstpgupd0

VM0:
	bne	$26, checkcache0
cachemiss0:
	ldq	$22, spt-MM($10)!lituse_base!3	/* get spt */
	bic	$22,$24,$22		/* clear non 36 bit part */

	sll	$12, 18, $0	/* move user flag to sign */
	extwl	$12, 0, $5		/* get EBR  in $5 */
	extwl	$12, 2, $27		/* get UBR  in $27 */
	cmovgt	$0, $27, $5		/* if user ==1 then UBR */
	sll	$5, 9 , $5		/* Base reg is a page number shift left so its a PDP10 word address */
	/* now $5 is process base register either UBR or EBR */
	mov	440, $0		/* 440 == 440 ==440 */
	addq	$0, $2, $0		/* SECTNO+440 */
	addq	$0, $5, $0		/* still PDP10 address add SECTNO+440+BASE */
	mov	15, $4			/* set flags PWC = 1 */
	s8addq	$0, $10, $0		/* convert to axp address using memory base $10 */
	ldq	$7, ($0)		/* fetch page table pointer */
	bic	$7, $24, $7		/* clear non  36bit part */

fetchptr0:
	/* $7 = ar = fetched page table pointer */
	srl	$7, 29, $0		/* get page flags P,W,C in lower 4 bits of $8 ...|P|W|0|C| */
	and	$4, $0, $4		/* and the flags with current PWC */
	srl	$7, 36-3, $0		/* get type flags in $0 */
	lda	$0, -1($0)		/* dec typeflags */
	beq	$0, pgtblimed0	/* type=1 Immediate */
	lda	$0, -1($0)		/* dec typeflags */
	beq	$0, pgtblshar0	/* type=10 Shared */
	lda	$0, -1($0)		/* dec typeflags */
	bne	$0, FLTNOACC		/* if not $31 it was not 11 shared must have been either 0 or 1xx so flt noacc */
pgtblindir0:
	/* type=11 Indirect */
	srl	$7, 18, $2		/* get new section number */
	mov	511, $0			/* 9 bit and mask */
	and	$2, $0, $2		/* get lower 9 bits as pageno  number index*/

	bic	$7, $25, $0		/* get 18 bit SPTX */
	addq	$22, $0, $0		/* SPT+SPTX */
	s8addq	$0, $10, $0		/* convert to AXP address */
	ldq	$7, ($0)		/* fetch storage address */
	bic	$7, $24, $7		/* clear non 36 bit */

	srl	$7, 18, $0		/* get 6 bits that define in core */
	and	$0, 77, $0		/* clear off anything but 6 bit core flag */
	bne	$0, FLTNOTCORE		/* branch if not in core */

	bic	$7, $25, $0		/* get 18 bits if storage address  5bitsMBZ+13bit corepgno*/
	sll	$0, 9, $0		/* convert page no to PDP-10 phy address */
	addq	$2, $0, $0		/* add 9 bits of section index */
	s8addq	$0, $10, $0		/* convert to axp address
	ldq	$7,($0)			/* fetch new page table pointer */
	bic	$7, $24, $7		/* clear non 36 bit part */
	br	fetchptr0	/* branch backward and do it all again */
pgtblshar0:
	/* type=10 Shared */
	bic	$7,$25, $0		/* get SPTX 18 bits */
	addq	$22, $0, $0		/* SPT+SPTX */

	s8addq	$0, $10, $0		/* get axp address */
	ldq	$7, ($0)		/* fetch new pointer */
	bic	$7, $24, $7		/* clear non 36 bit part */

pgtblimed0:
	/* type=1 now have a storage address of page table in $7 */
	srl	$7, 18, $0
	and	$0, 77, $0
	bne	$0,FLTNOTCORE

	bic	$7, $25, $7		/* get 18 bits if storage address  5bitsMBZ+13bit corepgno*/
	sll	$7, 9 , $0		/* convert core page no to address */
	s8addq	$0, $10, $0		/* convert to axp address of page table */
	/* now do CST things for page table $7 == corepagenno of Page Table */
	ldq	$0, cst-MM($10)!lituse_base!3	/* get CST table pointer */	
	bic	$0, $24, $0		/* clear non 36 bit part */
	addq	$0, $7, $27		/* get CST+corepageno  */
	s8addq	$27, $10, $27		/* get axp address of CST entry */
	ldq	$0, ($27)		/* fetch CST entry */
	bic	$0, $24, $0		/* clear non 36 bit part */

	sll	$0, 30, $at		/* get top 6 bits of CST entry */
	beq	$at, FLTNOACC		/* 0 is no access */
	ldq	$at, cstmask-MM($10)!lituse_base!3	/* get cst mask */
	bic	$at, $24, $at		/* get 36 bit part of mask */
	and	$0, $at, $0		/* CSTentry and CSTmask */
	ldq	$at, cstdata-MM($10)!lituse_base!3	/* get cst data */
	bic	$at, $24, $at		/* get 36 bit part of cstdata */
	or	$0, $at, $0		/* CSTentry or CSTdata */
	stq	$0, ($27)		/* store CSTentry back */

	mov	511, $0			/* 9 bit and mask */
	srl	$1, 9, $at		/* gt actual page_no  first time using actual page no from VA index into pgtbl*/
	and	$at, $0, $2		/* get 9 bits only */
	/* $7 was cleared as 18 bits b4 */	
	sll	$7, 9, $0		/* we did this shift before the cst update - $7 is a 13bit corepgno of a pgtable */
	or	$0, $2, $0		/* add page_no to core page address of page table index for page pointer */
	s8addq	$0, $10, $0		/* get axp address */
	ldq	$7, ($0)		/* fetch page pointer */
	srl	$7, 29, $0		/* get flags PWC in lower bits */
	and	$4, $0, $4		/* add flags to current PWC */
	srl	$7, 36-3, $0		/* get type in $0 */
	lda	$0, -1($0)		/* dec */
	beq	$0, pgimed0	/* type=1 Immediate */
	lda	$0, -1($0)		/* dec typeflags */
	beq	$0, pgshar0	/* type=10 Shared */
	lda	$0, -1($0)		/* dec typeflags */
	beq	$0, pgtblindir0	/* */
	br	 FLTNOACC		/* if not $31 it was not 11 shared must have been either 0 or 1xx so flt noacc */
pgshar0:
	bic	$7, $25, $0		/* get SPTX */
	addq	$22, 0, $0 		/* SPT + SPTX */
	s8addq	$0, $10, $0		/* convert to axp addr */
	ldq	$7, ($0)		/* fetch pg ptr */
	bic	$7, $24, $7		/* 36bits only */
pgimed0:
	sll	$7, 18, $0		/* get 6 bit that define core */
	and	$0, 77, $0		/* 6 bits only */
	bne	$0, FLTNOTCORE
	bic	$7, $25, $7		/* get 18 bit storage address phy core pg */
cstpgupd0:
	/* now have real user pgno of core in $7 do CST update */
	ldq	$0, cst-MM($10)!lituse_base!3	/* get CST pointer */
	bic	$0, $24, $0		/* 36bits only */
	addq	$0, $7, $27		/* CST+corepgno */
	s8addq	$27, $10, $27		/* get axp address of CSTentry */
	ldq	$0, ($27)		/* fetch CSTentry */
	bic	$0, $24, $0		/* 36bits only */
	sll	$0, 30, $at		/* get top 6 bits of CSTentry */
	beq	$at, FLTNOACC		/* 0=noaccess */
	ldq	$at, cstmask-MM($10)!lituse_base!3	/* get CSTmask */
	bic	$at, $24, $at		/* 36bits only */
	and	$0, $at, $0		/* CSTentry and CSTmask */
	/* this is a fetch for rx so no need to do writeable page checks */
	/* allow the CST update even if public is failed later */
	ldq	$at, cstdata-MM($10)!lituse_base!3	/* get CSTdata */
	bic	$at, $24, $at		/* 36bits only */
	or	$0, $at, $0		/* CSTentry or CSTdata */
	stq	$0, ($27)		/* store CSTentry back */

	sll	$8, 9 , $7		/* cvt core pg no to PDP-10 address */
	mov	510, $0
	and	$1, $0, $at		/* get 9 bit address of word in page */
	addq	$7, $at, $0		/* $0 = PDP-10 address of word in phy memory */
	s8addq	$0, $10, $16		/* $16 = AXP address of word */
	/* $4 = G|P|W|S|C  now test public access of page */
	srl	$4, 3, $0		/* get P flag in low bit */
	blbs	$0, endvtophyrx0	/* branch page is public */
	/* ok its a private page aka concealed page are we in supervisor mode */
	sll	$12, 20, $0	/* get processor flag P in sign */
	bgt	$0, endvtophyrx0	/* branch we are in supervisor allow access */
	/* here if page is private and not in supervisor, check its a portal */
	ldq	$0, ($16)		/* fetch the instruction */
	/* 	is it portal ? */
	bic	$0, $24, $0		/* 36bits only */
	srl	$0, 36-15, $0
	mov	25404, $at		/* portal instruction */
	subq	$0, $at, $at
	bne	$at, FLTNOTPORTAL
	sll	$4, 18, $4
	srl	$7, 9, $0		/* get  back core pgno */
	or	$7, $4, $0		/* get GPWSC+MBZ5bits+13bit corepgno  */
	sll	$0, 32, $0		/* make room for section+pg */
	srl	$1, 9, $4
	or	$4, $0, $26		/* store new translation */

	/***********************************************/


endvtophyrx0:

	/* FETCH opcode from PC */		
	ldq	$17,($16)			/* $17 == fetch opcode	*/
	blt	$17,addrbrk		/* branch if addr break */
	bic	$17, $24, $17		/* clear off non 36 bit part */
noaddrbrk:
	srl	$17,27,$18		/* $18 == 9 bit opcode 	*/
	srl	$17,23,$19							
	and	$19,0xf,$19		/* $19 == AC register */			
	srl	$17,18,$20							
	and	$20,0xf,$20		/* $20 == X register  */			
	bic	$17,$25,$21		/* $21 == Y */				

	/* calc effective address part */
	/* Calc Effective address
	** Inputs:
	** Outputs: 
	/* returns $15, $16 */
	/* Now the following is setup
	$9 = PC
	$15 = e
	$2 = sect(e)
	$4 = G|P|W|S|C
	$16 = phyaddr(e)	      This may either be a register or pdp10core
	in eithercase in is not a base 
	$14 = effective regbase  PXCT will fiddle this register base
	$13 = real regbase
	*/
	s8addq	$18,$9,$0		/* lookup op func add in opjmp */	
dispatch:
	ldq	$0,($0)								
	jmp	($0)								

addrbrk:
	/* can use $18 as a temp here since branch back to noaddrbrk is before its loaded */
	srl	$17,1,$18			/* get bit for addr break exec type */
	bge	$18, noaddrbrk		/* branch if ist not a exec break */
	bge	$18, noaddrbrk		/* branch is VM is not enabled */
	sll	$12,21,$18		/* get flags Addr Fail Inhibit */
	blt	$18, noaddrbrk		/* branch if Addr Fail Inhibit set */

	/* Note: Address break is only really valid if VM is enabled
	** since this mechanism is under our control finding an address break bit set
	** we can assume VM is enable
	** also KL10 only has one address break our implementation could support
	** many and we could enable many using console functions for debug purposes
	**
	** now handle address break on execute
	** address break is basically a page fail

	* Continue using $18 and now $19, $20 as temp's thought the address break they will not be loaded
	* now till next fetch
	*/
	/* work out a page fail word */
	sll	$12, 18, $0		/* get User/Exec mode */
	and	$0, 1,$0
	sll	$0, 5, $0		/* make room for failure type */
	or	$0, 123, $0		/* set flags to Address failure */
	sll	$0, 8, $0		/* make room for virtual address */
	or	$0, $1, $0		/* add virtual address to word */
	/* reg UBR+500 base */
	extwl	$12, 2, $18		/* get UBR */
	sll	$18,  9, $18		/* calc PDP phy address */
	addq	$18, $10, $18		/* calc axp base address of UPT */
	mov	500, $19
	s8addq	$19,$18,$18		/* now have axp addres of page fail*/

	/* save page flag word @UPT+500 */
	stq	$0, ($18)		/* 500 save page flag word */
	lda	$18, 1($18)		/* inc pointer */

	/* save Flag-PC double word @UPT+501, @UPT+502 */
	extwl	$12, 7, $19		/* get PDP10 flag */
	sll	$19, 23, $0		/* put them in correct part of 36bit*/
	sll	$19, 18, $20	/* get User flag in sign bit, exec = 0*/
	cmovgt	$20, $31, $20		/* clear currect section if in User*/
	srl	$20, 18, $20		/* get in lower 5 bits */
	or	$20, $20, $0		/* add PC section 2 Flag word */
	stq	$0 , ($18)		/* save flag word */
	lda	$18, 1($18)		/* inc pointer */

	stq	$11, ($18)		/* save virtual PC */
	lda	$18, 1($18)		/* inc pointer */
	/* load new PC from @UPT+503 and clear User and branch back to start fetch*/
	bic	$19, 200, $0	/* clear User */
	inswl	$0, 7 , $12		/* put flags back */
	ldq	$11, ($18)		/* fetch new PC from 503 */
	bic	$11, $24, $11		/* clear off non 36 bit part */
	br	startfetch		/* do it all over */

FLTNOTPORTAL:
FLTNOTCORE:
FLTNOACC:
	br	fetch
exit_cpu:	# this should never happen but its here if we need it
	ldq	$26, 0($30)
	ldq	$9, 8($30)
	ldq	$10, 16($30)
	ldq	$11, 24($30)
	ldq	$12, 32($30)
	ldq	$13, 40($30)
	ldq	$14, 48($30)
	ldq	$at, 56($30)
	ldt	$f2, 64($30)
	ldt	$f3, 72($30)
	ldt	$f4, 80($30)
	ldt	$f5, 88($30)
	ldt	$f6, 96($30)
	ldt	$f7, 104($30)
	ldt	$f8, 112($30)
	ldt	$f9, 120($30)
	lda	$30, 128($30)
	trapb
	ret	$31,($26),1			# end proc and return
	/*===Normal ops========*/
E_LUU0:	# Local Unimplemented User Operations
	#	op001 LUUO01
	#	op002 LUUO02
	#	op003 LUUO03
	#	op004 LUUO04
	#	op005 LUUO05
	#	op006 LUUO06
	#	op007 LUUO07
	#	op010 LUUO10
	#	op011 LUUO11
	#	op012 LUUO12
	#	op013 LUUO13
	#	op014 LUUO14
	#	op015 LUUO15
	#	op016 LUUO16
	#	op017 LUUO17
	#	op020 LUUO20
	#	op021 LUUO21
	#	op022 LUUO22
	#	op023 LUUO23
	#	op024 LUUO24
	#	op025 LUUO25
	#	op026 LUUO26
	#	op027 LUUO27
	#	op030 LUUO30
	#	op031 LUUO31
	#	op032 LUUO32
	#	op033 LUUO33
	#	op034 LUUO34
	#	op035 LUUO35
	#	op036 LUUO36
	#	op037 LUUO37
	br	fetch
E_MUU0:	# Monitor Unimplemented User Operations
	#	op040 CALL
	#	op041 INITI
	#	op042 MUUO42
	#	op043 MUUO43
	#	op044 MUUO44
	#	op045 MUUO45
	#	op046 MUUO46
	#	op047 CALLI
	#	op050 OPEN
	#	op051 TTCALL
	#	op052 MUUO52
	#	op053 MUUO53
	#	op054 MUUO54
	#	op055 RENAME
	#	op056 IN
	#	op057 OUT
	#	op060 SETSTS
	#	op061 STATO
	#	op062 STATUS
	#	op063 GETSTS
	#	op064 INBUF
	#	op065 OUTBUF
	#	op066 INPUT
	#	op067 OUTPUT
	#	op070 CLOSE
	#	op071 RELEAS
	#	op072 MTAPE
	#	op073 UGETF
	#	op074 USETI
	#	op075 USETO
	#	op076 LOOKUP
	#	op077 ENTER
	br	fetch
E_UJEN:	#	op100 UJEN
	br	fetch
E_OP101:	#	op101 OP101
	br	fetch
E_GFAD:	#	op102 GFAD
	br	fetch
E_GFSB:	#	op103 GFSB
	br	fetch
E_JSYS:	#	op104 JSYS
	br	fetch
E_ADJSP:	#	op105 ADJSP
	br	fetch
E_GFMP:	#	op106 GFMP
	br	fetch
E_GFDV:	#	op107 GFDV
	br	fetch
E_DFAD:	#	op110 DFAD
	br	fetch
E_DFSB:	#	op111 DFSB
	br	fetch
E_DFMP:	#	op112 DFMP
	br	fetch
E_DFDV:	#	op113 DFDV
	br	fetch
E_DADD:	#	op114 DADD
	br	fetch
E_DSUB:	#	op115 DSUB
	br	fetch
E_DMUL:	#	op116 DMUL
	br	fetch
E_DDIV:	#	op117 DDIV
	br	fetch
E_DMOVE:	#	op120 DMOVE
	br	fetch
E_DMOVN:	#	op121 DMOVN
	br	fetch
E_FIX:	#	op122 FIX
	br	fetch
E_EXTEND:	#	op123 EXTEND
	br	fetch
E_DMOVEM:	#	op124 DMOVEM
	br	fetch
E_DMOVNM:	#	op125 DMOVNM
	br	fetch
E_FIXR:	#	op126 FIXR
	br	fetch
E_FLTR:	#	op127 FLTR
	br	fetch
E_UFA:	#	op130 UFA
	br	fetch
E_DFN:	#	op131 DFN
	br	fetch
E_FSC:	#	op132 FSC
	br	fetch
E_IBP:	#	op133 IBP
	br	fetch
E_ILDB:	#	op134 ILDB
	br	fetch
E_LDB:	#	op135 LDB
	br	fetch
E_IDPB:	#	op136 IDPB
	br	fetch
E_DPB:	#	op137 DPB
	br	fetch
E_FAD:	#	op140 FAD
	br	fetch
E_FADL:	#	op141 FADL
	br	fetch
E_FADM:	#	op142 FADM
	br	fetch
E_FADB:	#	op143 FADB
	br	fetch
E_FADR:	#	op144 FADR
	br	fetch
E_FADRL:	#	op145 FADRL
	br	fetch
E_FADRM:	#	op146 FADRM
	br	fetch
E_FADRB:	#	op147 FADRB
	br	fetch
E_FSB:	#	op150 FSB
	br	fetch
E_FSBL:	#	op151 FSBL
	br	fetch
E_FSBM:	#	op152 FSBM
	br	fetch
E_FSBB:	#	op153 FSBB
	br	fetch
E_FSBR:	#	op154 FSBR
	br	fetch
E_FSBRL:	#	op155 FSBRL
	br	fetch
E_FSBRM:	#	op156 FSBRM
	br	fetch
E_FSBRB:	#	op157 FSBRB
	br	fetch
E_FMP:	#	op160 FMP
	br	fetch
E_FMPL:	#	op161 FMPL
	br	fetch
E_FMPM:	#	op162 FMPM
	br	fetch
E_FMPB:	#	op163 FMPB
	br	fetch
E_FMPR:	#	op164 FMPR
	br	fetch
E_FMPRL:	#	op165 FMPRL
	br	fetch
E_FMPRM:	#	op166 FMPRM
	br	fetch
E_FMPRB:	#	op167 FMPRB
	br	fetch
E_FDV:	#	op170 FDV
	br	fetch
E_FDVL:	#	op171 FDVL
	br	fetch
E_FDVM:	#	op172 FDVM
	br	fetch
E_FDVB:	#	op173 FDVB
	br	fetch
E_FDVR:	#	op174 FDVR
	br	fetch
E_FDVRL:	#	op175 FDVRL
	br	fetch
E_FDVRM:	#	op176 FDVRM
	br	fetch
E_FDVRB:	#	op177 FDVRB
	br	fetch
E_MOVE:	#	op200 MOVE
	br	fetch
E_MOVEI:	#	op201 MOVEI
	br	fetch
E_MOVEM:	#	op202 MOVEM
	br	fetch
E_MOVES:	#	op203 MOVES
	br	fetch
E_MOVS:	#	op204 MOVS
	br	fetch
E_MOVSI:	#	op205 MOVSI
	br	fetch
E_MOVSM:	#	op206 MOVSM
	br	fetch
E_MOVSS:	#	op207 MOVSS
	br	fetch
E_MOVN:	#	op210 MOVN
	br	fetch
E_MOVNI:	#	op211 MOVNI
	br	fetch
E_MOVNM:	#	op212 MOVNM
	br	fetch
E_MOVNS:	#	op213 MOVNS
	br	fetch
E_MOVM:	#	op214 MOVM
	br	fetch
E_MOVMI:	#	op215 MOVMI
	br	fetch
E_MOVMM:	#	op216 MOVMM
	br	fetch
E_MOVMS:	#	op217 MOVMS
	br	fetch
E_IMUL:	#	op220 IMUL
	br	fetch
E_IMULI:	#	op221 IMULI
	br	fetch
E_IMULM:	#	op222 IMULM
	br	fetch
E_IMULB:	#	op223 IMULB
	br	fetch
E_MUL:	#	op224 MUL
	br	fetch
E_MULI:	#	op225 MULI
	br	fetch
E_MULM:	#	op226 MULM
	br	fetch
E_MULB:	#	op227 MULB
	br	fetch
E_IDIV:	#	op230 IDIV
	br	fetch
E_IDIVI:	#	op231 IDIVI
	br	fetch
E_IDIVM:	#	op232 IDIVM
	br	fetch
E_IDIVB:	#	op233 IDIVB
	br	fetch
E_DIV:	#	op234 DIV
	br	fetch
E_DIVI:	#	op235 DIVI
	br	fetch
E_DIVM:	#	op236 DIVM
	br	fetch
E_DIVB:	#	op237 DIVB
	br	fetch
E_ASH:	#	op240 ASH
	br	fetch
E_ROT:	#	op241 ROT
	br	fetch
E_LSH:	#	op242 LSH
	br	fetch
E_JFFO:	#	op243 JFFO
	br	fetch
E_ASHC:	#	op244 ASHC
	br	fetch
E_ROTC:	#	op245 ROTC
	br	fetch
E_LSHC:	#	op246 LSHC
	br	fetch
E_op247:	#	op247 op247
	br	fetch
E_EXCH:	#	op250 EXCH
	br	fetch
E_BLT:	#	op251 BLT
	br	fetch
E_AOBJP:	#	op252 AOBJP
	br	fetch
E_AOBJN:	#	op253 AOBJN
	br	fetch
E_JRST:	#	op254 JRST
	br	fetch
E_JFCL:	#	op255 JFCL
	br	fetch
E_XCT:	#	op256 XCT
	br	fetch
E_MAP:	#	op257 MAP
	br	fetch
E_PUSHJ:	#	op260 PUSHJ
	br	fetch
E_PUSH:	#	op261 PUSH
	br	fetch
E_POP:	#	op262 POP
	br	fetch
E_POPJ:	#	op263 POPJ
	br	fetch
E_JSR:	#	op264 JSR
	br	fetch
E_JSP:	#	op265 JSP
	br	fetch
E_JSA:	#	op266 JSA
	br	fetch
E_JRA:	#	op267 JRA
	br	fetch
E_ADD:	#	op270 ADD
	br	fetch
E_ADDI:	#	op271 ADDI
	br	fetch
E_ADDM:	#	op272 ADDM
	br	fetch
E_ADDB:	#	op273 ADDB
	br	fetch
E_SUB:	#	op274 SUB
	br	fetch
E_SUBI:	#	op275 SUBI
	br	fetch
E_SUBM:	#	op276 SUBM
	br	fetch
E_SUBB:	#	op277 SUBB
	br	fetch
E_CAI:	#	op300 CAI
	br	fetch
E_CAIL:	#	op301 CAIL
	br	fetch
E_CAIE:	#	op302 CAIE
	br	fetch
E_CAILE:	#	op303 CAILE
	br	fetch
E_CAIA:	#	op304 CAIA
	br	fetch
E_CAIGE:	#	op305 CAIGE
	br	fetch
E_CAIN:	#	op306 CAIN
	br	fetch
E_CAIG:	#	op307 CAIG
	br	fetch
E_CAM:	#	op310 CAM
	br	fetch
E_CAML:	#	op311 CAML
	br	fetch
E_CAME:	#	op312 CAME
	br	fetch
E_CAMLE:	#	op313 CAMLE
	br	fetch
E_CAMA:	#	op314 CAMA
	br	fetch
E_CAMGE:	#	op315 CAMGE
	br	fetch
E_CAMN:	#	op316 CAMN
	br	fetch
E_CAMG:	#	op317 CAMG
	br	fetch
E_JUMP:	#	op320 JUMP
	br	fetch
E_JUMPL:	#	op321 JUMPL
	br	fetch
E_JUMPE:	#	op322 JUMPE
	br	fetch
E_JUMPLE:	#	op323 JUMPLE
	br	fetch
E_JUMPA:	#	op324 JUMPA
	br	fetch
E_JUMPGE:	#	op325 JUMPGE
	br	fetch
E_JUMPN:	#	op326 JUMPN
	br	fetch
E_JUMPG:	#	op327 JUMPG
	br	fetch
E_SKIP:	#	op330 SKIP
	br	fetch
E_SKIPL:	#	op331 SKIPL
	br	fetch
E_SKIPE:	#	op332 SKIPE
	br	fetch
E_SKIPLE:	#	op333 SKIPLE
	br	fetch
E_SKIPA:	#	op334 SKIPA
	br	fetch
E_SKIPGE:	#	op335 SKIPGE
	br	fetch
E_SKIPN:	#	op336 SKIPN
	br	fetch
E_SKIPG:	#	op337 SKIPG
	br	fetch
E_AOJ:	#	op340 AOJ
	br	fetch
E_AOJL:	#	op341 AOJL
	br	fetch
E_AOJE:	#	op342 AOJE
	br	fetch
E_AOJLE:	#	op343 AOJLE
	br	fetch
E_AOJA:	#	op344 AOJA
	br	fetch
E_AOJGE:	#	op345 AOJGE
	br	fetch
E_AOJN:	#	op346 AOJN
	br	fetch
E_AOJG:	#	op347 AOJG
	br	fetch
E_AOS:	#	op350 AOS
	br	fetch
E_AOSL:	#	op351 AOSL
	br	fetch
E_AOSE:	#	op352 AOSE
	br	fetch
E_AOSLE:	#	op353 AOSLE
	br	fetch
E_AOSA:	#	op354 AOSA
	br	fetch
E_AOSGE:	#	op355 AOSGE
	br	fetch
E_AOSN:	#	op356 AOSN
	br	fetch
E_AOSG:	#	op357 AOSG
	br	fetch
E_SOJ:	#	op360 SOJ
	br	fetch
E_SOJL:	#	op361 SOJL
	br	fetch
E_SOJE:	#	op362 SOJE
	br	fetch
E_SOJLE:	#	op363 SOJLE
	br	fetch
E_SOJA:	#	op364 SOJA
	br	fetch
E_SOJGE:	#	op365 SOJGE
	br	fetch
E_SOJN:	#	op366 SOJN
	br	fetch
E_SOJG:	#	op367 SOJG
	br	fetch
E_SOS:	#	op370 SOS
	br	fetch
E_SOSL:	#	op371 SOSL
	br	fetch
E_SOSE:	#	op372 SOSE
	br	fetch
E_SOSLE:	#	op373 SOSLE
	br	fetch
E_SOSA:	#	op374 SOSA
	br	fetch
E_SOSGE:	#	op375 SOSGE
	br	fetch
E_SOSN:	#	op376 SOSN
	br	fetch
E_SOSG:	#	op377 SOSG
	br	fetch
E_SETZ:	#	op400 SETZ
	br	fetch
E_SETZI:	#	op401 SETZI
	br	fetch
E_SETZM:	#	op402 SETZM
	br	fetch
E_SETZB:	#	op403 SETZB
	br	fetch
E_AND:	#	op404 AND
	br	fetch
E_ANDI:	#	op405 ANDI
	br	fetch
E_ANDM:	#	op406 ANDM
	br	fetch
E_ANDB:	#	op407 ANDB
	br	fetch
E_ANDCA:	#	op410 ANDCA
	br	fetch
E_ANDCAI:	#	op411 ANDCAI
	br	fetch
E_ANDCAM:	#	op412 ANDCAM
	br	fetch
E_ANDCAB:	#	op413 ANDCAB
	br	fetch
E_SETM:	#	op414 SETM
	br	fetch
E_XMOVEI:	#	op415 XMOVEI
	br	fetch
E_SETMM:	#	op416 SETMM
	br	fetch
E_SETMB:	#	op417 SETMB
	br	fetch
E_ANDCM:	#	op420 ANDCM
	br	fetch
E_ANDCMI:	#	op421 ANDCMI
	br	fetch
E_ANDCMM:	#	op422 ANDCMM
	br	fetch
E_ANDCMB:	#	op423 ANDCMB
	br	fetch
E_SETA:	#	op424 SETA
	br	fetch
E_SETAI:	#	op425 SETAI
	br	fetch
E_SETAM:	#	op426 SETAM
	br	fetch
E_SETAB:	#	op427 SETAB
	br	fetch
E_XOR:	#	op430 XOR
	br	fetch
E_XORI:	#	op431 XORI
	br	fetch
E_XORM:	#	op432 XORM
	br	fetch
E_XORB:	#	op433 XORB
	br	fetch
E_OR:	#	op434 OR
	br	fetch
E_ORI:	#	op435 ORI
	br	fetch
E_ORM:	#	op436 ORM
	br	fetch
E_ORB:	#	op437 ORB
	br	fetch
E_ANDCB:	#	op440 ANDCB
	br	fetch
E_ANDCBI:	#	op441 ANDCBI
	br	fetch
E_ANDCBM:	#	op442 ANDCBM
	br	fetch
E_ANDCBB:	#	op443 ANDCBB
	br	fetch
E_EQV:	#	op444 EQV
	br	fetch
E_EQVI:	#	op445 EQVI
	br	fetch
E_EQVM:	#	op446 EQVM
	br	fetch
E_EQVB:	#	op447 EQVB
	br	fetch
E_SETCA:	#	op450 SETCA
	br	fetch
E_SETCAI:	#	op451 SETCAI
	br	fetch
E_SETCAM:	#	op452 SETCAM
	br	fetch
E_SETCAB:	#	op453 SETCAB
	br	fetch
E_ORCA:	#	op454 ORCA
	br	fetch
E_ORCAI:	#	op455 ORCAI
	br	fetch
E_ORCAM:	#	op456 ORCAM
	br	fetch
E_ORCAB:	#	op457 ORCAB
	br	fetch
E_SETCM:	#	op460 SETCM
	br	fetch
E_SETCMI:	#	op461 SETCMI
	br	fetch
E_SETCMM:	#	op462 SETCMM
	br	fetch
E_SETCMB:	#	op463 SETCMB
	br	fetch
E_ORCM:	#	op464 ORCM
	br	fetch
E_ORCMI:	#	op465 ORCMI
	br	fetch
E_ORCMM:	#	op466 ORCMM
	br	fetch
E_ORCMB:	#	op467 ORCMB
	br	fetch
E_ORCB:	#	op470 ORCB
	br	fetch
E_ORCBI:	#	op471 ORCBI
	br	fetch
E_ORCBM:	#	op472 ORCBM
	br	fetch
E_ORCBB:	#	op473 ORCBB
	br	fetch
E_SETO:	#	op474 SETO
	br	fetch
E_SETOI:	#	op475 SETOI
	br	fetch
E_SETOM:	#	op476 SETOM
	br	fetch
E_SETOB:	#	op477 SETOB
	br	fetch
E_HLL:	#	op500 HLL
	br	fetch
E_XHLLI:	#	op501 XHLLI
	br	fetch
E_HLLM:	#	op502 HLLM
	br	fetch
E_HLLS:	#	op503 HLLS
	br	fetch
E_HRL:	#	op504 HRL
	br	fetch
E_HRLI:	#	op505 HRLI
	br	fetch
E_HRLM:	#	op506 HRLM
	br	fetch
E_HRLS:	#	op507 HRLS
	br	fetch
E_HLLZ:	#	op510 HLLZ
	br	fetch
E_HLLZI:	#	op511 HLLZI
	br	fetch
E_HLLZM:	#	op512 HLLZM
	br	fetch
E_HLLZS:	#	op513 HLLZS
	br	fetch
E_HRLZ:	#	op514 HRLZ
	br	fetch
E_HRLZI:	#	op515 HRLZI
	br	fetch
E_HRLZM:	#	op516 HRLZM
	br	fetch
E_HRLZS:	#	op517 HRLZS
	br	fetch
E_HLLO:	#	op520 HLLO
	br	fetch
E_HLLOI:	#	op521 HLLOI
	br	fetch
E_HLLOM:	#	op522 HLLOM
	br	fetch
E_HLLOS:	#	op523 HLLOS
	br	fetch
E_HRLO:	#	op524 HRLO
	br	fetch
E_HRLOI:	#	op525 HRLOI
	br	fetch
E_HRLOM:	#	op526 HRLOM
	br	fetch
E_HRLOS:	#	op527 HRLOS
	br	fetch
E_HLLE:	#	op530 HLLE
	br	fetch
E_HLLEI:	#	op531 HLLEI
	br	fetch
E_HLLEM:	#	op532 HLLEM
	br	fetch
E_HLLES:	#	op533 HLLES
	br	fetch
E_HRLE:	#	op534 HRLE
	br	fetch
E_HRLEI:	#	op535 HRLEI
	br	fetch
E_HRLEM:	#	op536 HRLEM
	br	fetch
E_HRLES:	#	op537 HRLES
	br	fetch
E_HRR:	#	op540 HRR
	br	fetch
E_HRRI:	#	op541 HRRI
	br	fetch
E_HRRM:	#	op542 HRRM
	br	fetch
E_HRRS:	#	op543 HRRS
	br	fetch
E_HLR:	#	op544 HLR
	br	fetch
E_HLRI:	#	op545 HLRI
	br	fetch
E_HLRM:	#	op546 HLRM
	br	fetch
E_HLRS:	#	op547 HLRS
	br	fetch
E_HRRZ:	#	op550 HRRZ
	br	fetch
E_HRRZI:	#	op551 HRRZI
	br	fetch
E_HRRZM:	#	op552 HRRZM
	br	fetch
E_HRRZS:	#	op553 HRRZS
	br	fetch
E_HLRZ:	#	op554 HLRZ
	br	fetch
E_HLRZI:	#	op555 HLRZI
	br	fetch
E_HLRZM:	#	op556 HLRZM
	br	fetch
E_HLRZS:	#	op557 HLRZS
	br	fetch
E_HRRO:	#	op560 HRRO
	br	fetch
E_HRROI:	#	op561 HRROI
	br	fetch
E_HRROM:	#	op562 HRROM
	br	fetch
E_HRROS:	#	op563 HRROS
	br	fetch
E_HLRO:	#	op564 HLRO
	br	fetch
E_HLROI:	#	op565 HLROI
	br	fetch
E_HLROM:	#	op566 HLROM
	br	fetch
E_HLROS:	#	op567 HLROS
	br	fetch
E_HRRE:	#	op570 HRRE
	br	fetch
E_HRREI:	#	op571 HRREI
	br	fetch
E_HRREM:	#	op572 HRREM
	br	fetch
E_HRRES:	#	op573 HRRES
	br	fetch
E_HLRE:	#	op574 HLRE
	br	fetch
E_HLREI:	#	op575 HLREI
	br	fetch
E_HLREM:	#	op576 HLREM
	br	fetch
E_HLRES:	#	op577 HLRES
	br	fetch
E_TRN:	#	op600 TRN
	br	fetch
E_TLN:	#	op601 TLN
	br	fetch
E_TRNE:	#	op602 TRNE
	br	fetch
E_TLNE:	#	op603 TLNE
	br	fetch
E_TRNA:	#	op604 TRNA
	br	fetch
E_TLNA:	#	op605 TLNA
	br	fetch
E_TRNN:	#	op606 TRNN
	br	fetch
E_TLNN:	#	op607 TLNN
	br	fetch
E_TDN:	#	op610 TDN
	br	fetch
E_TSN:	#	op611 TSN
	br	fetch
E_TDNE:	#	op612 TDNE
	br	fetch
E_TSNE:	#	op613 TSNE
	br	fetch
E_TDNA:	#	op614 TDNA
	br	fetch
E_TSNA:	#	op615 TSNA
	br	fetch
E_TDNN:	#	op616 TDNN
	br	fetch
E_TSNN:	#	op617 TSNN
	br	fetch
E_TRZ:	#	op620 TRZ
	br	fetch
E_TLZ:	#	op621 TLZ
	br	fetch
E_TRZE:	#	op622 TRZE
	br	fetch
E_TLZE:	#	op623 TLZE
	br	fetch
E_TRZA:	#	op624 TRZA
	br	fetch
E_TLZA:	#	op625 TLZA
	br	fetch
E_TRZN:	#	op626 TRZN
	br	fetch
E_TLZN:	#	op627 TLZN
	br	fetch
E_TDZ:	#	op630 TDZ
	br	fetch
E_TSZ:	#	op631 TSZ
	br	fetch
E_TDZE:	#	op632 TDZE
	br	fetch
E_TSZE:	#	op633 TSZE
	br	fetch
E_TDZA:	#	op634 TDZA
	br	fetch
E_TSZA:	#	op635 TSZA
	br	fetch
E_TDZN:	#	op636 TDZN
	br	fetch
E_TSZN:	#	op637 TSZN
	br	fetch
E_TRC:	#	op640 TRC
	br	fetch
E_TLC:	#	op641 TLC
	br	fetch
E_TRCE:	#	op642 TRCE
	br	fetch
E_TLCE:	#	op643 TLCE
	br	fetch
E_TRCA:	#	op644 TRCA
	br	fetch
E_TLCA:	#	op645 TLCA
	br	fetch
E_TRCN:	#	op646 TRCN
	br	fetch
E_TLCN:	#	op647 TLCN
	br	fetch
E_TDC:	#	op650 TDC
	br	fetch
E_TSC:	#	op651 TSC
	br	fetch
E_TDCE:	#	op652 TDCE
	br	fetch
E_TSCE:	#	op653 TSCE
	br	fetch
E_TDCA:	#	op654 TDCA
	br	fetch
E_TSCA:	#	op655 TSCA
	br	fetch
E_TDCN:	#	op656 TDCN
	br	fetch
E_TSCN:	#	op657 TSCN
	br	fetch
E_TRO:	#	op660 TRO
	br	fetch
E_TLO:	#	op661 TLO
	br	fetch
E_TROE:	#	op662 TROE
	br	fetch
E_TLOE:	#	op663 TLOE
	br	fetch
E_TROA:	#	op664 TROA
	br	fetch
E_TLOA:	#	op665 TLOA
	br	fetch
E_TRON:	#	op666 TRON
	br	fetch
E_TLON:	#	op667 TLON
	br	fetch
E_TDO:	#	op670 TDO
	br	fetch
E_TSO:	#	op671 TSO
	br	fetch
E_TDOE:	#	op672 TDOE
	br	fetch
E_TSOE:	#	op673 TSOE
	br	fetch
E_TDOA:	#	op674 TDOA
	br	fetch
E_TSOA:	#	op675 TSOA
	br	fetch
E_TDON:	#	op676 TDON
	br	fetch
E_TSON:	#	op677 TSON
	br	fetch
E_DEVIO:	#	IO instruction
	br	fetch
	/*===Extend ops========*/
E_CMPSL:	#	op001 CMPSL
	br	fetch
E_CMPSE:	#	op002 CMPSE
	br	fetch
E_CMPSLE:	#	op003 CMPSLE
	br	fetch
E_EDIT:	#	op004 EDIT
	br	fetch
E_CMPSGE:	#	op005 CMPSGE
	br	fetch
E_CMPSN:	#	op006 CMPSN
	br	fetch
E_CMPSG:	#	op007 CMPSG
	br	fetch
E_CVTDBO:	#	op010 CVTDBO
	br	fetch
E_CVTDBT:	#	op011 CVTDBT
	br	fetch
E_CVTBDO:	#	op012 CVTBDO
	br	fetch
E_CVTBDT:	#	op013 CVTBDT
	br	fetch
E_MOVSO:	#	op014 MOVSO
	br	fetch
E_MOVST:	#	op015 MOVST
	br	fetch
E_MOVSLJ:	#	op016 MOVSLJ
	br	fetch
E_MOVSRJ:	#	op017 MOVSRJ
	br	fetch
E_XBLT:	#	op020 XBLT
	br	fetch
	/*
	** Interupt service routines 
	*/
I_lvl0:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl1:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl2:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl3:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl4:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl5:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl6:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_lvl7:
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch
I_savepc:
	stq	$11, flags-PC($10)!lituse_base!3
	stq	$12, flags-MM($10)!lituse_base!3
	stq	$31,	interupt-MM($10)!lituse_base!3	# reset interupt
	br	fetch

	.end	 	cpu00

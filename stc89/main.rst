                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (Linux)
                                      4 ;--------------------------------------------------------
                                      5 	.module main
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _segTable
                                     12 	.globl _main
                                     13 	.globl _lcdControl
                                     14 	.globl _flowControl
                                     15 	.globl _syncDuty
                                     16 	.globl _timerInit
                                     17 	.globl _adjustDuty
                                     18 	.globl _timer0Callback
                                     19 	.globl _CY
                                     20 	.globl _AC
                                     21 	.globl _F0
                                     22 	.globl _RS1
                                     23 	.globl _RS0
                                     24 	.globl _OV
                                     25 	.globl _F1
                                     26 	.globl _P
                                     27 	.globl _PS
                                     28 	.globl _PT1
                                     29 	.globl _PX1
                                     30 	.globl _PT0
                                     31 	.globl _PX0
                                     32 	.globl _RD
                                     33 	.globl _WR
                                     34 	.globl _T1
                                     35 	.globl _T0
                                     36 	.globl _INT1
                                     37 	.globl _INT0
                                     38 	.globl _TXD
                                     39 	.globl _RXD
                                     40 	.globl _P3_7
                                     41 	.globl _P3_6
                                     42 	.globl _P3_5
                                     43 	.globl _P3_4
                                     44 	.globl _P3_3
                                     45 	.globl _P3_2
                                     46 	.globl _P3_1
                                     47 	.globl _P3_0
                                     48 	.globl _EA
                                     49 	.globl _ES
                                     50 	.globl _ET1
                                     51 	.globl _EX1
                                     52 	.globl _ET0
                                     53 	.globl _EX0
                                     54 	.globl _P2_7
                                     55 	.globl _P2_6
                                     56 	.globl _P2_5
                                     57 	.globl _P2_4
                                     58 	.globl _P2_3
                                     59 	.globl _P2_2
                                     60 	.globl _P2_1
                                     61 	.globl _P2_0
                                     62 	.globl _SM0
                                     63 	.globl _SM1
                                     64 	.globl _SM2
                                     65 	.globl _REN
                                     66 	.globl _TB8
                                     67 	.globl _RB8
                                     68 	.globl _TI
                                     69 	.globl _RI
                                     70 	.globl _P1_7
                                     71 	.globl _P1_6
                                     72 	.globl _P1_5
                                     73 	.globl _P1_4
                                     74 	.globl _P1_3
                                     75 	.globl _P1_2
                                     76 	.globl _P1_1
                                     77 	.globl _P1_0
                                     78 	.globl _TF1
                                     79 	.globl _TR1
                                     80 	.globl _TF0
                                     81 	.globl _TR0
                                     82 	.globl _IE1
                                     83 	.globl _IT1
                                     84 	.globl _IE0
                                     85 	.globl _IT0
                                     86 	.globl _P0_7
                                     87 	.globl _P0_6
                                     88 	.globl _P0_5
                                     89 	.globl _P0_4
                                     90 	.globl _P0_3
                                     91 	.globl _P0_2
                                     92 	.globl _P0_1
                                     93 	.globl _P0_0
                                     94 	.globl _B
                                     95 	.globl _ACC
                                     96 	.globl _PSW
                                     97 	.globl _IP
                                     98 	.globl _P3
                                     99 	.globl _IE
                                    100 	.globl _P2
                                    101 	.globl _SBUF
                                    102 	.globl _SCON
                                    103 	.globl _P1
                                    104 	.globl _TH1
                                    105 	.globl _TH0
                                    106 	.globl _TL1
                                    107 	.globl _TL0
                                    108 	.globl _TMOD
                                    109 	.globl _TCON
                                    110 	.globl _PCON
                                    111 	.globl _DPH
                                    112 	.globl _DPL
                                    113 	.globl _SP
                                    114 	.globl _P0
                                    115 	.globl _p0State0
                                    116 	.globl _nextDisplay
                                    117 	.globl _setFlowState
                                    118 	.globl _flowState
                                    119 	.globl _dutyState
                                    120 	.globl _adjustFastTickCount
                                    121 	.globl _adjustTickCount
                                    122 	.globl _tick10msCount
                                    123 	.globl _pwmCount
                                    124 	.globl _tick10ms
                                    125 	.globl _duty
                                    126 ;--------------------------------------------------------
                                    127 ; special function registers
                                    128 ;--------------------------------------------------------
                                    129 	.area RSEG    (ABS,DATA)
      000000                        130 	.org 0x0000
                           000080   131 _P0	=	0x0080
                           000081   132 _SP	=	0x0081
                           000082   133 _DPL	=	0x0082
                           000083   134 _DPH	=	0x0083
                           000087   135 _PCON	=	0x0087
                           000088   136 _TCON	=	0x0088
                           000089   137 _TMOD	=	0x0089
                           00008A   138 _TL0	=	0x008a
                           00008B   139 _TL1	=	0x008b
                           00008C   140 _TH0	=	0x008c
                           00008D   141 _TH1	=	0x008d
                           000090   142 _P1	=	0x0090
                           000098   143 _SCON	=	0x0098
                           000099   144 _SBUF	=	0x0099
                           0000A0   145 _P2	=	0x00a0
                           0000A8   146 _IE	=	0x00a8
                           0000B0   147 _P3	=	0x00b0
                           0000B8   148 _IP	=	0x00b8
                           0000D0   149 _PSW	=	0x00d0
                           0000E0   150 _ACC	=	0x00e0
                           0000F0   151 _B	=	0x00f0
                                    152 ;--------------------------------------------------------
                                    153 ; special function bits
                                    154 ;--------------------------------------------------------
                                    155 	.area RSEG    (ABS,DATA)
      000000                        156 	.org 0x0000
                           000080   157 _P0_0	=	0x0080
                           000081   158 _P0_1	=	0x0081
                           000082   159 _P0_2	=	0x0082
                           000083   160 _P0_3	=	0x0083
                           000084   161 _P0_4	=	0x0084
                           000085   162 _P0_5	=	0x0085
                           000086   163 _P0_6	=	0x0086
                           000087   164 _P0_7	=	0x0087
                           000088   165 _IT0	=	0x0088
                           000089   166 _IE0	=	0x0089
                           00008A   167 _IT1	=	0x008a
                           00008B   168 _IE1	=	0x008b
                           00008C   169 _TR0	=	0x008c
                           00008D   170 _TF0	=	0x008d
                           00008E   171 _TR1	=	0x008e
                           00008F   172 _TF1	=	0x008f
                           000090   173 _P1_0	=	0x0090
                           000091   174 _P1_1	=	0x0091
                           000092   175 _P1_2	=	0x0092
                           000093   176 _P1_3	=	0x0093
                           000094   177 _P1_4	=	0x0094
                           000095   178 _P1_5	=	0x0095
                           000096   179 _P1_6	=	0x0096
                           000097   180 _P1_7	=	0x0097
                           000098   181 _RI	=	0x0098
                           000099   182 _TI	=	0x0099
                           00009A   183 _RB8	=	0x009a
                           00009B   184 _TB8	=	0x009b
                           00009C   185 _REN	=	0x009c
                           00009D   186 _SM2	=	0x009d
                           00009E   187 _SM1	=	0x009e
                           00009F   188 _SM0	=	0x009f
                           0000A0   189 _P2_0	=	0x00a0
                           0000A1   190 _P2_1	=	0x00a1
                           0000A2   191 _P2_2	=	0x00a2
                           0000A3   192 _P2_3	=	0x00a3
                           0000A4   193 _P2_4	=	0x00a4
                           0000A5   194 _P2_5	=	0x00a5
                           0000A6   195 _P2_6	=	0x00a6
                           0000A7   196 _P2_7	=	0x00a7
                           0000A8   197 _EX0	=	0x00a8
                           0000A9   198 _ET0	=	0x00a9
                           0000AA   199 _EX1	=	0x00aa
                           0000AB   200 _ET1	=	0x00ab
                           0000AC   201 _ES	=	0x00ac
                           0000AF   202 _EA	=	0x00af
                           0000B0   203 _P3_0	=	0x00b0
                           0000B1   204 _P3_1	=	0x00b1
                           0000B2   205 _P3_2	=	0x00b2
                           0000B3   206 _P3_3	=	0x00b3
                           0000B4   207 _P3_4	=	0x00b4
                           0000B5   208 _P3_5	=	0x00b5
                           0000B6   209 _P3_6	=	0x00b6
                           0000B7   210 _P3_7	=	0x00b7
                           0000B0   211 _RXD	=	0x00b0
                           0000B1   212 _TXD	=	0x00b1
                           0000B2   213 _INT0	=	0x00b2
                           0000B3   214 _INT1	=	0x00b3
                           0000B4   215 _T0	=	0x00b4
                           0000B5   216 _T1	=	0x00b5
                           0000B6   217 _WR	=	0x00b6
                           0000B7   218 _RD	=	0x00b7
                           0000B8   219 _PX0	=	0x00b8
                           0000B9   220 _PT0	=	0x00b9
                           0000BA   221 _PX1	=	0x00ba
                           0000BB   222 _PT1	=	0x00bb
                           0000BC   223 _PS	=	0x00bc
                           0000D0   224 _P	=	0x00d0
                           0000D1   225 _F1	=	0x00d1
                           0000D2   226 _OV	=	0x00d2
                           0000D3   227 _RS0	=	0x00d3
                           0000D4   228 _RS1	=	0x00d4
                           0000D5   229 _F0	=	0x00d5
                           0000D6   230 _AC	=	0x00d6
                           0000D7   231 _CY	=	0x00d7
                                    232 ;--------------------------------------------------------
                                    233 ; overlayable register banks
                                    234 ;--------------------------------------------------------
                                    235 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        236 	.ds 8
                                    237 ;--------------------------------------------------------
                                    238 ; internal ram data
                                    239 ;--------------------------------------------------------
                                    240 	.area DSEG    (DATA)
      000008                        241 _duty::
      000008                        242 	.ds 1
      000009                        243 _tick10ms::
      000009                        244 	.ds 1
      00000A                        245 _pwmCount::
      00000A                        246 	.ds 1
      00000B                        247 _tick10msCount::
      00000B                        248 	.ds 2
      00000D                        249 _adjustTickCount::
      00000D                        250 	.ds 1
      00000E                        251 _adjustFastTickCount::
      00000E                        252 	.ds 1
      00000F                        253 _dutyState::
      00000F                        254 	.ds 2
      000011                        255 _flowState::
      000011                        256 	.ds 2
      000013                        257 _setFlowState::
      000013                        258 	.ds 2
      000015                        259 _nextDisplay::
      000015                        260 	.ds 1
      000016                        261 _p0State0::
      000016                        262 	.ds 2
                                    263 ;--------------------------------------------------------
                                    264 ; overlayable items in internal ram
                                    265 ;--------------------------------------------------------
                                    266 ;--------------------------------------------------------
                                    267 ; Stack segment in internal ram
                                    268 ;--------------------------------------------------------
                                    269 	.area SSEG
      00001A                        270 __start__stack:
      00001A                        271 	.ds	1
                                    272 
                                    273 ;--------------------------------------------------------
                                    274 ; indirectly addressable internal ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area ISEG    (DATA)
                                    277 ;--------------------------------------------------------
                                    278 ; absolute internal ram data
                                    279 ;--------------------------------------------------------
                                    280 	.area IABS    (ABS,DATA)
                                    281 	.area IABS    (ABS,DATA)
                                    282 ;--------------------------------------------------------
                                    283 ; bit data
                                    284 ;--------------------------------------------------------
                                    285 	.area BSEG    (BIT)
                                    286 ;--------------------------------------------------------
                                    287 ; paged external ram data
                                    288 ;--------------------------------------------------------
                                    289 	.area PSEG    (PAG,XDATA)
                                    290 ;--------------------------------------------------------
                                    291 ; uninitialized external ram data
                                    292 ;--------------------------------------------------------
                                    293 	.area XSEG    (XDATA)
                                    294 ;--------------------------------------------------------
                                    295 ; absolute external ram data
                                    296 ;--------------------------------------------------------
                                    297 	.area XABS    (ABS,XDATA)
                                    298 ;--------------------------------------------------------
                                    299 ; initialized external ram data
                                    300 ;--------------------------------------------------------
                                    301 	.area XISEG   (XDATA)
                                    302 	.area HOME    (CODE)
                                    303 	.area GSINIT0 (CODE)
                                    304 	.area GSINIT1 (CODE)
                                    305 	.area GSINIT2 (CODE)
                                    306 	.area GSINIT3 (CODE)
                                    307 	.area GSINIT4 (CODE)
                                    308 	.area GSINIT5 (CODE)
                                    309 	.area GSINIT  (CODE)
                                    310 	.area GSFINAL (CODE)
                                    311 	.area CSEG    (CODE)
                                    312 ;--------------------------------------------------------
                                    313 ; interrupt vector
                                    314 ;--------------------------------------------------------
                                    315 	.area HOME    (CODE)
      000000                        316 __interrupt_vect:
      000000 02 00 54         [24]  317 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  318 	reti
      000004                        319 	.ds	7
      00000B 02 00 D2         [24]  320 	ljmp	_timer0Callback
                                    321 ; restartable atomic support routines
      00000E                        322 	.ds	2
      000010                        323 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  324 	nop
      000011 00               [12]  325 	nop
      000012                        326 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  327 	movx	a, @r0
      000013 FB               [12]  328 	mov	r3, a
      000014 EA               [12]  329 	mov	a, r2
      000015 F2               [24]  330 	movx	@r0, a
      000016 80 2C            [24]  331 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  332 	nop
      000019 00               [12]  333 	nop
      00001A                        334 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  335 	movx	a, @dptr
      00001B FB               [12]  336 	mov	r3, a
      00001C EA               [12]  337 	mov	a, r2
      00001D F0               [24]  338 	movx	@dptr, a
      00001E 80 24            [24]  339 	sjmp	sdcc_atomic_exchange_exit
      000020                        340 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  341 	mov	a, @r0
      000021 B5 02 02         [24]  342 	cjne	a, ar2, .+#5
      000024 EB               [12]  343 	mov	a, r3
      000025 F6               [12]  344 	mov	@r0, a
      000026 22               [24]  345 	ret
      000027 00               [12]  346 	nop
      000028                        347 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  348 	movx	a, @r0
      000029 B5 02 02         [24]  349 	cjne	a, ar2, .+#5
      00002C EB               [12]  350 	mov	a, r3
      00002D F2               [24]  351 	movx	@r0, a
      00002E 22               [24]  352 	ret
      00002F 00               [12]  353 	nop
      000030                        354 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  355 	movx	a, @dptr
      000031 B5 02 02         [24]  356 	cjne	a, ar2, .+#5
      000034 EB               [12]  357 	mov	a, r3
      000035 F0               [24]  358 	movx	@dptr, a
      000036 22               [24]  359 	ret
      000037                        360 sdcc_atomic_exchange_rollback_end::
                                    361 
      000037                        362 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  363 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  364 	mov	r0, dpl
      00003C 20 F5 D3         [24]  365 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        366 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  367 	mov	a, r2
      000040 C6               [12]  368 	xch	a, @r0
      000041 F5 82            [12]  369 	mov	dpl, a
      000043 22               [24]  370 	ret
      000044                        371 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  372 	mov	dpl, r3
      000046 22               [24]  373 	ret
      000047                        374 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  375 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  376 	mov	r0, dpl
      00004C 20 F5 D9         [24]  377 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  378 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    379 ;--------------------------------------------------------
                                    380 ; global & static initialisations
                                    381 ;--------------------------------------------------------
                                    382 	.area HOME    (CODE)
                                    383 	.area GSINIT  (CODE)
                                    384 	.area GSFINAL (CODE)
                                    385 	.area GSINIT  (CODE)
                                    386 	.globl __sdcc_gsinit_startup
                                    387 	.globl __sdcc_program_startup
                                    388 	.globl __start__stack
                                    389 	.globl __mcs51_genXINIT
                                    390 	.globl __mcs51_genXRAMCLEAR
                                    391 	.globl __mcs51_genRAMCLEAR
                                    392 ;	main.c:31: volatile unsigned char duty = 50;
      0000AD 75 08 32         [24]  393 	mov	_duty,#0x32
                                    394 ;	main.c:33: volatile unsigned char tick10ms = 0;
      0000B0 75 09 00         [24]  395 	mov	_tick10ms,#0x00
                                    396 ;	main.c:35: unsigned char pwmCount = 0;
      0000B3 75 0A 00         [24]  397 	mov	_pwmCount,#0x00
                                    398 ;	main.c:36: unsigned short tick10msCount = 0;
      0000B6 E4               [12]  399 	clr	a
      0000B7 F5 0B            [12]  400 	mov	_tick10msCount,a
      0000B9 F5 0C            [12]  401 	mov	(_tick10msCount + 1),a
                                    402 ;	main.c:50: unsigned char adjustTickCount = 0;
      0000BB F5 0D            [12]  403 	mov	_adjustTickCount,a
                                    404 ;	main.c:51: unsigned char adjustFastTickCount = 0;
      0000BD F5 0E            [12]  405 	mov	_adjustFastTickCount,a
                                    406 ;	main.c:118: unsigned short dutyState = 0;
      0000BF F5 0F            [12]  407 	mov	_dutyState,a
      0000C1 F5 10            [12]  408 	mov	(_dutyState + 1),a
                                    409 ;	main.c:119: unsigned short flowState = 0;
      0000C3 F5 11            [12]  410 	mov	_flowState,a
      0000C5 F5 12            [12]  411 	mov	(_flowState + 1),a
                                    412 ;	main.c:120: unsigned short setFlowState = 0;
      0000C7 F5 13            [12]  413 	mov	_setFlowState,a
      0000C9 F5 14            [12]  414 	mov	(_setFlowState + 1),a
                                    415 ;	main.c:150: unsigned char nextDisplay = 0;
      0000CB F5 15            [12]  416 	mov	_nextDisplay,a
                                    417 ;	main.c:151: unsigned char p0State0[2] = {0};
      0000CD F5 16            [12]  418 	mov	_p0State0,a
                                    419 	.area GSFINAL (CODE)
      0000CF 02 00 51         [24]  420 	ljmp	__sdcc_program_startup
                                    421 ;--------------------------------------------------------
                                    422 ; Home
                                    423 ;--------------------------------------------------------
                                    424 	.area HOME    (CODE)
                                    425 	.area HOME    (CODE)
      000051                        426 __sdcc_program_startup:
      000051 02 02 F3         [24]  427 	ljmp	_main
                                    428 ;	return from main will return to caller
                                    429 ;--------------------------------------------------------
                                    430 ; code
                                    431 ;--------------------------------------------------------
                                    432 	.area CSEG    (CODE)
                                    433 ;------------------------------------------------------------
                                    434 ;Allocation info for local variables in function 'timer0Callback'
                                    435 ;------------------------------------------------------------
                                    436 ;	main.c:37: void timer0Callback(void) __interrupt(1) {
                                    437 ;	-----------------------------------------
                                    438 ;	 function timer0Callback
                                    439 ;	-----------------------------------------
      0000D2                        440 _timer0Callback:
                           000007   441 	ar7 = 0x07
                           000006   442 	ar6 = 0x06
                           000005   443 	ar5 = 0x05
                           000004   444 	ar4 = 0x04
                           000003   445 	ar3 = 0x03
                           000002   446 	ar2 = 0x02
                           000001   447 	ar1 = 0x01
                           000000   448 	ar0 = 0x00
      0000D2 C0 E0            [24]  449 	push	acc
      0000D4 C0 D0            [24]  450 	push	psw
                                    451 ;	main.c:38: if (pwmCount < duty)
      0000D6 C3               [12]  452 	clr	c
      0000D7 E5 0A            [12]  453 	mov	a,_pwmCount
      0000D9 95 08            [12]  454 	subb	a,_duty
      0000DB 50 04            [24]  455 	jnc	00102$
                                    456 ;	main.c:39: PWM_CTRL = 0;
                                    457 ;	assignBit
      0000DD C2 A6            [12]  458 	clr	_P2_6
      0000DF 80 02            [24]  459 	sjmp	00103$
      0000E1                        460 00102$:
                                    461 ;	main.c:41: PWM_CTRL = 1;
                                    462 ;	assignBit
      0000E1 D2 A6            [12]  463 	setb	_P2_6
      0000E3                        464 00103$:
                                    465 ;	main.c:43: pwmCount++;
      0000E3 05 0A            [12]  466 	inc	_pwmCount
                                    467 ;	main.c:44: if (pwmCount >= 100) {
      0000E5 74 9C            [12]  468 	mov	a,#0x100 - 0x64
      0000E7 25 0A            [12]  469 	add	a,_pwmCount
      0000E9 50 06            [24]  470 	jnc	00106$
                                    471 ;	main.c:45: pwmCount = 0;
      0000EB 75 0A 00         [24]  472 	mov	_pwmCount,#0x00
                                    473 ;	main.c:46: tick10ms = 1;
      0000EE 75 09 01         [24]  474 	mov	_tick10ms,#0x01
      0000F1                        475 00106$:
                                    476 ;	main.c:48: }
      0000F1 D0 D0            [24]  477 	pop	psw
      0000F3 D0 E0            [24]  478 	pop	acc
      0000F5 32               [24]  479 	reti
                                    480 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    481 ;	eliminated unneeded push/pop dpl
                                    482 ;	eliminated unneeded push/pop dph
                                    483 ;	eliminated unneeded push/pop b
                                    484 ;------------------------------------------------------------
                                    485 ;Allocation info for local variables in function 'adjustDuty'
                                    486 ;------------------------------------------------------------
                                    487 ;	main.c:52: void adjustDuty(void) {
                                    488 ;	-----------------------------------------
                                    489 ;	 function adjustDuty
                                    490 ;	-----------------------------------------
      0000F6                        491 _adjustDuty:
                                    492 ;	main.c:53: if (DOWN_BUTTON == DOWN_OK && UP_BUTTON != UP_OK) {
      0000F6 20 A4 44         [24]  493 	jb	_P2_4,00143$
      0000F9 30 A5 41         [24]  494 	jnb	_P2_5,00143$
                                    495 ;	main.c:54: if (DOWN_BUTTON == DOWN_OK) {
      0000FC 20 A4 15         [24]  496 	jb	_P2_4,00108$
                                    497 ;	main.c:55: if (adjustTickCount == 0) {
      0000FF E5 0D            [12]  498 	mov	a,_adjustTickCount
      000101 70 09            [24]  499 	jnz	00104$
                                    500 ;	main.c:56: if (duty > 0)
      000103 E5 08            [12]  501 	mov	a,_duty
      000105 60 05            [24]  502 	jz	00104$
                                    503 ;	main.c:57: duty--;
      000107 E5 08            [12]  504 	mov	a,_duty
      000109 14               [12]  505 	dec	a
      00010A F5 08            [12]  506 	mov	_duty,a
      00010C                        507 00104$:
                                    508 ;	main.c:59: if (adjustTickCount <= 100)
      00010C E5 0D            [12]  509 	mov	a,_adjustTickCount
      00010E 24 9B            [12]  510 	add	a,#0xff - 0x64
      000110 40 02            [24]  511 	jc	00108$
                                    512 ;	main.c:60: adjustTickCount++;
      000112 05 0D            [12]  513 	inc	_adjustTickCount
      000114                        514 00108$:
                                    515 ;	main.c:63: if (DOWN_BUTTON != DOWN_OK && adjustTickCount > 0) {
      000114 30 A4 0A         [24]  516 	jnb	_P2_4,00110$
      000117 E5 0D            [12]  517 	mov	a,_adjustTickCount
      000119 60 06            [24]  518 	jz	00110$
                                    519 ;	main.c:64: adjustTickCount = 0;
      00011B 75 0D 00         [24]  520 	mov	_adjustTickCount,#0x00
                                    521 ;	main.c:65: adjustFastTickCount = 0;
      00011E 75 0E 00         [24]  522 	mov	_adjustFastTickCount,#0x00
      000121                        523 00110$:
                                    524 ;	main.c:68: if (adjustTickCount > 100) {
      000121 E5 0D            [12]  525 	mov	a,_adjustTickCount
      000123 24 9B            [12]  526 	add	a,#0xff - 0x64
      000125 40 01            [24]  527 	jc	00300$
      000127 22               [24]  528 	ret
      000128                        529 00300$:
                                    530 ;	main.c:69: adjustFastTickCount++;
      000128 05 0E            [12]  531 	inc	_adjustFastTickCount
                                    532 ;	main.c:71: if (adjustFastTickCount > 10) {
      00012A E5 0E            [12]  533 	mov	a,_adjustFastTickCount
      00012C 24 F5            [12]  534 	add	a,#0xff - 0x0a
      00012E 50 63            [24]  535 	jnc	00146$
                                    536 ;	main.c:72: adjustFastTickCount = 0;
      000130 75 0E 00         [24]  537 	mov	_adjustFastTickCount,#0x00
                                    538 ;	main.c:73: if (duty > 0)
      000133 E5 08            [12]  539 	mov	a,_duty
      000135 60 5C            [24]  540 	jz	00146$
                                    541 ;	main.c:74: duty--;
      000137 E5 08            [12]  542 	mov	a,_duty
      000139 14               [12]  543 	dec	a
      00013A F5 08            [12]  544 	mov	_duty,a
      00013C 22               [24]  545 	ret
      00013D                        546 00143$:
                                    547 ;	main.c:77: } else if (UP_BUTTON == UP_OK && DOWN_BUTTON != DOWN_OK) {
      00013D 20 A5 47         [24]  548 	jb	_P2_5,00139$
      000140 30 A4 44         [24]  549 	jnb	_P2_4,00139$
                                    550 ;	main.c:78: if (UP_BUTTON == DOWN_OK) {
      000143 20 A5 17         [24]  551 	jb	_P2_5,00125$
                                    552 ;	main.c:79: if (adjustTickCount == 0) {
      000146 E5 0D            [12]  553 	mov	a,_adjustTickCount
      000148 70 0B            [24]  554 	jnz	00121$
                                    555 ;	main.c:80: if (duty < 100)
      00014A 74 9C            [12]  556 	mov	a,#0x100 - 0x64
      00014C 25 08            [12]  557 	add	a,_duty
      00014E 40 05            [24]  558 	jc	00121$
                                    559 ;	main.c:81: duty++;
      000150 E5 08            [12]  560 	mov	a,_duty
      000152 04               [12]  561 	inc	a
      000153 F5 08            [12]  562 	mov	_duty,a
      000155                        563 00121$:
                                    564 ;	main.c:83: if (adjustTickCount <= 100)
      000155 E5 0D            [12]  565 	mov	a,_adjustTickCount
      000157 24 9B            [12]  566 	add	a,#0xff - 0x64
      000159 40 02            [24]  567 	jc	00125$
                                    568 ;	main.c:84: adjustTickCount++;
      00015B 05 0D            [12]  569 	inc	_adjustTickCount
      00015D                        570 00125$:
                                    571 ;	main.c:87: if (UP_BUTTON != DOWN_OK && adjustTickCount > 0) {
      00015D 30 A5 0A         [24]  572 	jnb	_P2_5,00127$
      000160 E5 0D            [12]  573 	mov	a,_adjustTickCount
      000162 60 06            [24]  574 	jz	00127$
                                    575 ;	main.c:88: adjustTickCount = 0;
      000164 75 0D 00         [24]  576 	mov	_adjustTickCount,#0x00
                                    577 ;	main.c:89: adjustFastTickCount = 0;
      000167 75 0E 00         [24]  578 	mov	_adjustFastTickCount,#0x00
      00016A                        579 00127$:
                                    580 ;	main.c:92: if (adjustTickCount > 100) {
      00016A E5 0D            [12]  581 	mov	a,_adjustTickCount
      00016C 24 9B            [12]  582 	add	a,#0xff - 0x64
      00016E 50 23            [24]  583 	jnc	00146$
                                    584 ;	main.c:93: adjustFastTickCount++;
      000170 05 0E            [12]  585 	inc	_adjustFastTickCount
                                    586 ;	main.c:95: if (adjustFastTickCount > 10) {
      000172 E5 0E            [12]  587 	mov	a,_adjustFastTickCount
      000174 24 F5            [12]  588 	add	a,#0xff - 0x0a
      000176 50 1B            [24]  589 	jnc	00146$
                                    590 ;	main.c:96: adjustFastTickCount = 0;
      000178 75 0E 00         [24]  591 	mov	_adjustFastTickCount,#0x00
                                    592 ;	main.c:97: if (duty < 100)
      00017B 74 9C            [12]  593 	mov	a,#0x100 - 0x64
      00017D 25 08            [12]  594 	add	a,_duty
      00017F 40 12            [24]  595 	jc	00146$
                                    596 ;	main.c:98: duty++;
      000181 E5 08            [12]  597 	mov	a,_duty
      000183 04               [12]  598 	inc	a
      000184 F5 08            [12]  599 	mov	_duty,a
      000186 22               [24]  600 	ret
      000187                        601 00139$:
                                    602 ;	main.c:101: } else if (DOWN_BUTTON != DOWN_OK && UP_BUTTON != UP_OK)
      000187 30 A4 09         [24]  603 	jnb	_P2_4,00146$
      00018A 30 A5 06         [24]  604 	jnb	_P2_5,00146$
                                    605 ;	main.c:102: adjustTickCount = adjustFastTickCount = 0;
      00018D 75 0E 00         [24]  606 	mov	_adjustFastTickCount,#0x00
      000190 75 0D 00         [24]  607 	mov	_adjustTickCount,#0x00
      000193                        608 00146$:
                                    609 ;	main.c:103: }
      000193 22               [24]  610 	ret
                                    611 ;------------------------------------------------------------
                                    612 ;Allocation info for local variables in function 'timerInit'
                                    613 ;------------------------------------------------------------
                                    614 ;	main.c:105: void timerInit(void) {
                                    615 ;	-----------------------------------------
                                    616 ;	 function timerInit
                                    617 ;	-----------------------------------------
      000194                        618 _timerInit:
                                    619 ;	main.c:106: TMOD = 0x02;
      000194 75 89 02         [24]  620 	mov	_TMOD,#0x02
                                    621 ;	main.c:109: TH0 = 0xec;
      000197 75 8C EC         [24]  622 	mov	_TH0,#0xec
                                    623 ;	main.c:110: TL0 = 0xec;
      00019A 75 8A EC         [24]  624 	mov	_TL0,#0xec
                                    625 ;	main.c:112: ET0 = 1;
                                    626 ;	assignBit
      00019D D2 A9            [12]  627 	setb	_ET0
                                    628 ;	main.c:113: EA = 1;
                                    629 ;	assignBit
      00019F D2 AF            [12]  630 	setb	_EA
                                    631 ;	main.c:114: TR0 = 1;
                                    632 ;	assignBit
      0001A1 D2 8C            [12]  633 	setb	_TR0
                                    634 ;	main.c:115: }
      0001A3 22               [24]  635 	ret
                                    636 ;------------------------------------------------------------
                                    637 ;Allocation info for local variables in function 'syncDuty'
                                    638 ;------------------------------------------------------------
                                    639 ;i             Allocated to registers r7 
                                    640 ;------------------------------------------------------------
                                    641 ;	main.c:121: void syncDuty(void) {
                                    642 ;	-----------------------------------------
                                    643 ;	 function syncDuty
                                    644 ;	-----------------------------------------
      0001A4                        645 _syncDuty:
                                    646 ;	main.c:122: dutyState = 0;
      0001A4 E4               [12]  647 	clr	a
      0001A5 F5 0F            [12]  648 	mov	_dutyState,a
      0001A7 F5 10            [12]  649 	mov	(_dutyState + 1),a
                                    650 ;	main.c:123: for (unsigned char i = 0; i < 10; i++) {
      0001A9 FF               [12]  651 	mov	r7,a
      0001AA                        652 00105$:
      0001AA BF 0A 00         [24]  653 	cjne	r7,#0x0a,00128$
      0001AD                        654 00128$:
      0001AD 50 52            [24]  655 	jnc	00107$
                                    656 ;	main.c:124: if (duty >= ((i + 1) * 10))
      0001AF 8F 05            [24]  657 	mov	ar5,r7
      0001B1 7E 00            [12]  658 	mov	r6,#0x00
      0001B3 74 01            [12]  659 	mov	a,#0x01
      0001B5 2D               [12]  660 	add	a, r5
      0001B6 F5 18            [12]  661 	mov	__mulint_PARM_2,a
      0001B8 E4               [12]  662 	clr	a
      0001B9 3E               [12]  663 	addc	a, r6
      0001BA F5 19            [12]  664 	mov	(__mulint_PARM_2 + 1),a
      0001BC 90 00 0A         [24]  665 	mov	dptr,#0x000a
      0001BF C0 07            [24]  666 	push	ar7
      0001C1 12 03 64         [24]  667 	lcall	__mulint
      0001C4 AD 82            [24]  668 	mov	r5, dpl
      0001C6 AE 83            [24]  669 	mov	r6, dph
      0001C8 D0 07            [24]  670 	pop	ar7
      0001CA AB 08            [24]  671 	mov	r3,_duty
      0001CC 7C 00            [12]  672 	mov	r4,#0x00
      0001CE C3               [12]  673 	clr	c
      0001CF EB               [12]  674 	mov	a,r3
      0001D0 9D               [12]  675 	subb	a,r5
      0001D1 EC               [12]  676 	mov	a,r4
      0001D2 64 80            [12]  677 	xrl	a,#0x80
      0001D4 8E F0            [24]  678 	mov	b,r6
      0001D6 63 F0 80         [24]  679 	xrl	b,#0x80
      0001D9 95 F0            [12]  680 	subb	a,b
      0001DB 40 21            [24]  681 	jc	00106$
                                    682 ;	main.c:125: dutyState |= (1U << i);
      0001DD 8F F0            [24]  683 	mov	b,r7
      0001DF 05 F0            [12]  684 	inc	b
      0001E1 7D 01            [12]  685 	mov	r5,#0x01
      0001E3 7E 00            [12]  686 	mov	r6,#0x00
      0001E5 80 06            [24]  687 	sjmp	00132$
      0001E7                        688 00131$:
      0001E7 ED               [12]  689 	mov	a,r5
      0001E8 2D               [12]  690 	add	a,r5
      0001E9 FD               [12]  691 	mov	r5,a
      0001EA EE               [12]  692 	mov	a,r6
      0001EB 33               [12]  693 	rlc	a
      0001EC FE               [12]  694 	mov	r6,a
      0001ED                        695 00132$:
      0001ED D5 F0 F7         [24]  696 	djnz	b,00131$
      0001F0 AB 0F            [24]  697 	mov	r3,_dutyState
      0001F2 AC 10            [24]  698 	mov	r4,(_dutyState + 1)
      0001F4 EB               [12]  699 	mov	a,r3
      0001F5 42 05            [12]  700 	orl	ar5,a
      0001F7 EC               [12]  701 	mov	a,r4
      0001F8 42 06            [12]  702 	orl	ar6,a
      0001FA 8D 0F            [24]  703 	mov	_dutyState,r5
      0001FC 8E 10            [24]  704 	mov	(_dutyState + 1),r6
      0001FE                        705 00106$:
                                    706 ;	main.c:123: for (unsigned char i = 0; i < 10; i++) {
      0001FE 0F               [12]  707 	inc	r7
      0001FF 80 A9            [24]  708 	sjmp	00105$
      000201                        709 00107$:
                                    710 ;	main.c:127: }
      000201 22               [24]  711 	ret
                                    712 ;------------------------------------------------------------
                                    713 ;Allocation info for local variables in function 'flowControl'
                                    714 ;------------------------------------------------------------
                                    715 ;	main.c:128: void flowControl(void) {
                                    716 ;	-----------------------------------------
                                    717 ;	 function flowControl
                                    718 ;	-----------------------------------------
      000202                        719 _flowControl:
                                    720 ;	main.c:129: flowState = (flowState << 1) | 1;
      000202 E5 11            [12]  721 	mov	a,_flowState
      000204 25 11            [12]  722 	add	a,_flowState
      000206 FE               [12]  723 	mov	r6,a
      000207 E5 12            [12]  724 	mov	a,(_flowState + 1)
      000209 33               [12]  725 	rlc	a
      00020A FF               [12]  726 	mov	r7,a
      00020B 43 06 01         [24]  727 	orl	ar6,#0x01
      00020E 8E 11            [24]  728 	mov	_flowState,r6
      000210 8F 12            [24]  729 	mov	(_flowState + 1),r7
                                    730 ;	main.c:130: if (flowState >= ((dutyState << 1) | 1))
      000212 E5 0F            [12]  731 	mov	a,_dutyState
      000214 25 0F            [12]  732 	add	a,_dutyState
      000216 FE               [12]  733 	mov	r6,a
      000217 E5 10            [12]  734 	mov	a,(_dutyState + 1)
      000219 33               [12]  735 	rlc	a
      00021A FF               [12]  736 	mov	r7,a
      00021B 43 06 01         [24]  737 	orl	ar6,#0x01
      00021E AC 11            [24]  738 	mov	r4,_flowState
      000220 AD 12            [24]  739 	mov	r5,(_flowState + 1)
      000222 C3               [12]  740 	clr	c
      000223 EC               [12]  741 	mov	a,r4
      000224 9E               [12]  742 	subb	a,r6
      000225 ED               [12]  743 	mov	a,r5
      000226 9F               [12]  744 	subb	a,r7
      000227 40 05            [24]  745 	jc	00102$
                                    746 ;	main.c:131: flowState = 0;
      000229 E4               [12]  747 	clr	a
      00022A F5 11            [12]  748 	mov	_flowState,a
      00022C F5 12            [12]  749 	mov	(_flowState + 1),a
      00022E                        750 00102$:
                                    751 ;	main.c:133: setFlowState = flowState & dutyState;
      00022E E5 0F            [12]  752 	mov	a,_dutyState
      000230 55 11            [12]  753 	anl	a,_flowState
      000232 F5 13            [12]  754 	mov	_setFlowState,a
      000234 E5 10            [12]  755 	mov	a,(_dutyState + 1)
      000236 55 12            [12]  756 	anl	a,(_flowState + 1)
      000238 F5 14            [12]  757 	mov	(_setFlowState + 1),a
                                    758 ;	main.c:135: FLOW_1 = (setFlowState >> 0) & 1;
      00023A E5 13            [12]  759 	mov	a,_setFlowState
      00023C 54 01            [12]  760 	anl	a,#0x01
                                    761 ;	assignBit
      00023E 24 FF            [12]  762 	add	a,#0xff
      000240 92 A3            [24]  763 	mov	_P2_3,c
                                    764 ;	main.c:136: FLOW_2 = (setFlowState >> 1) & 1;
      000242 E5 13            [12]  765 	mov	a,_setFlowState
      000244 03               [12]  766 	rr	a
      000245 54 01            [12]  767 	anl	a,#0x01
                                    768 ;	assignBit
      000247 24 FF            [12]  769 	add	a,#0xff
      000249 92 A2            [24]  770 	mov	_P2_2,c
                                    771 ;	main.c:137: FLOW_3 = (setFlowState >> 2) & 1;
      00024B E5 13            [12]  772 	mov	a,_setFlowState
      00024D 03               [12]  773 	rr	a
      00024E 03               [12]  774 	rr	a
      00024F 54 01            [12]  775 	anl	a,#0x01
                                    776 ;	assignBit
      000251 24 FF            [12]  777 	add	a,#0xff
      000253 92 A1            [24]  778 	mov	_P2_1,c
                                    779 ;	main.c:138: FLOW_4 = (setFlowState >> 3) & 1;
      000255 E5 13            [12]  780 	mov	a,_setFlowState
      000257 A2 E3            [12]  781 	mov	c,acc.3
      000259 E4               [12]  782 	clr	a
      00025A 33               [12]  783 	rlc	a
                                    784 ;	assignBit
      00025B 24 FF            [12]  785 	add	a,#0xff
      00025D 92 A0            [24]  786 	mov	_P2_0,c
                                    787 ;	main.c:139: FLOW_5 = (setFlowState >> 4) & 1;
      00025F E5 13            [12]  788 	mov	a,_setFlowState
      000261 C4               [12]  789 	swap	a
      000262 54 01            [12]  790 	anl	a,#0x01
                                    791 ;	assignBit
      000264 24 FF            [12]  792 	add	a,#0xff
      000266 92 97            [24]  793 	mov	_P1_7,c
                                    794 ;	main.c:140: FLOW_6 = (setFlowState >> 5) & 1;
      000268 E5 13            [12]  795 	mov	a,_setFlowState
      00026A A2 E5            [12]  796 	mov	c,acc.5
      00026C E4               [12]  797 	clr	a
      00026D 33               [12]  798 	rlc	a
                                    799 ;	assignBit
      00026E 24 FF            [12]  800 	add	a,#0xff
      000270 92 96            [24]  801 	mov	_P1_6,c
                                    802 ;	main.c:141: FLOW_7 = (setFlowState >> 6) & 1;
      000272 E5 13            [12]  803 	mov	a,_setFlowState
      000274 23               [12]  804 	rl	a
      000275 23               [12]  805 	rl	a
      000276 54 01            [12]  806 	anl	a,#0x01
                                    807 ;	assignBit
      000278 24 FF            [12]  808 	add	a,#0xff
      00027A 92 95            [24]  809 	mov	_P1_5,c
                                    810 ;	main.c:142: FLOW_8 = (setFlowState >> 7) & 1;
      00027C E5 13            [12]  811 	mov	a,_setFlowState
      00027E 23               [12]  812 	rl	a
      00027F 54 01            [12]  813 	anl	a,#0x01
                                    814 ;	assignBit
      000281 24 FF            [12]  815 	add	a,#0xff
      000283 92 94            [24]  816 	mov	_P1_4,c
                                    817 ;	main.c:143: FLOW_9 = (setFlowState >> 8) & 1;
      000285 E5 14            [12]  818 	mov	a,(_setFlowState + 1)
      000287 54 01            [12]  819 	anl	a,#0x01
                                    820 ;	assignBit
      000289 24 FF            [12]  821 	add	a,#0xff
      00028B 92 93            [24]  822 	mov	_P1_3,c
                                    823 ;	main.c:144: FLOW_10 = (setFlowState >> 9) & 1;
      00028D E5 14            [12]  824 	mov	a,(_setFlowState + 1)
      00028F 03               [12]  825 	rr	a
      000290 54 01            [12]  826 	anl	a,#0x01
                                    827 ;	assignBit
      000292 24 FF            [12]  828 	add	a,#0xff
      000294 92 92            [24]  829 	mov	_P1_2,c
                                    830 ;	main.c:145: }
      000296 22               [24]  831 	ret
                                    832 ;------------------------------------------------------------
                                    833 ;Allocation info for local variables in function 'lcdControl'
                                    834 ;------------------------------------------------------------
                                    835 ;	main.c:152: void lcdControl(void) {
                                    836 ;	-----------------------------------------
                                    837 ;	 function lcdControl
                                    838 ;	-----------------------------------------
      000297                        839 _lcdControl:
                                    840 ;	main.c:153: if (DOWN_BUTTON == DOWN_OK || UP_BUTTON == UP_OK) {
      000297 30 A4 03         [24]  841 	jnb	_P2_4,00101$
      00029A 20 A5 1C         [24]  842 	jb	_P2_5,00102$
      00029D                        843 00101$:
                                    844 ;	main.c:154: p0State0[0] = segTable[duty / 10];
      00029D AF 08            [24]  845 	mov	r7,_duty
      00029F 75 F0 0A         [24]  846 	mov	b,#0x0a
      0002A2 EF               [12]  847 	mov	a,r7
      0002A3 84               [48]  848 	div	ab
      0002A4 90 03 85         [24]  849 	mov	dptr,#_segTable
      0002A7 93               [24]  850 	movc	a,@a+dptr
      0002A8 F5 16            [12]  851 	mov	_p0State0, a
                                    852 ;	main.c:155: p0State0[1] = segTable[duty % 10];
      0002AA AF 08            [24]  853 	mov	r7,_duty
      0002AC 75 F0 0A         [24]  854 	mov	b,#0x0a
      0002AF EF               [12]  855 	mov	a,r7
      0002B0 84               [48]  856 	div	ab
      0002B1 E5 F0            [12]  857 	mov	a,b
      0002B3 90 03 85         [24]  858 	mov	dptr,#_segTable
      0002B6 93               [24]  859 	movc	a,@a+dptr
      0002B7 F5 17            [12]  860 	mov	(_p0State0 + 0x0001), a
      0002B9                        861 00102$:
                                    862 ;	main.c:158: if (duty == 0) {
      0002B9 E5 08            [12]  863 	mov	a,_duty
      0002BB 70 0C            [24]  864 	jnz	00111$
                                    865 ;	main.c:159: LED_G1 = 0;
                                    866 ;	assignBit
      0002BD C2 A7            [12]  867 	clr	_P2_7
                                    868 ;	main.c:160: LED_G2 = 1;
                                    869 ;	assignBit
      0002BF D2 B2            [12]  870 	setb	_P3_2
                                    871 ;	main.c:161: P0 = segTable[0];
      0002C1 90 03 85         [24]  872 	mov	dptr,#_segTable
      0002C4 E4               [12]  873 	clr	a
      0002C5 93               [24]  874 	movc	a,@a+dptr
      0002C6 F5 80            [12]  875 	mov	_P0,a
      0002C8 22               [24]  876 	ret
      0002C9                        877 00111$:
                                    878 ;	main.c:162: } else if (duty == 100) {
      0002C9 74 64            [12]  879 	mov	a,#0x64
      0002CB B5 08 08         [24]  880 	cjne	a,_duty,00108$
                                    881 ;	main.c:163: LED_G1 = 1;
                                    882 ;	assignBit
      0002CE D2 A7            [12]  883 	setb	_P2_7
                                    884 ;	main.c:164: LED_G2 = 1;
                                    885 ;	assignBit
      0002D0 D2 B2            [12]  886 	setb	_P3_2
                                    887 ;	main.c:165: P0 = 0xbf;
      0002D2 75 80 BF         [24]  888 	mov	_P0,#0xbf
      0002D5 22               [24]  889 	ret
      0002D6                        890 00108$:
                                    891 ;	main.c:167: LED_G1 = 0;
                                    892 ;	assignBit
      0002D6 C2 A7            [12]  893 	clr	_P2_7
                                    894 ;	main.c:168: LED_G2 = 0;
                                    895 ;	assignBit
      0002D8 C2 B2            [12]  896 	clr	_P3_2
                                    897 ;	main.c:169: P0 = 0;
      0002DA 75 80 00         [24]  898 	mov	_P0,#0x00
                                    899 ;	main.c:171: if (nextDisplay == 0) {
      0002DD E5 15            [12]  900 	mov	a,_nextDisplay
      0002DF 70 09            [24]  901 	jnz	00105$
                                    902 ;	main.c:172: P0 = p0State0[0];
      0002E1 85 16 80         [24]  903 	mov	_P0,_p0State0
                                    904 ;	main.c:173: LED_G1 = 1;
                                    905 ;	assignBit
      0002E4 D2 A7            [12]  906 	setb	_P2_7
                                    907 ;	main.c:174: nextDisplay = 1;
      0002E6 75 15 01         [24]  908 	mov	_nextDisplay,#0x01
      0002E9 22               [24]  909 	ret
      0002EA                        910 00105$:
                                    911 ;	main.c:176: P0 = p0State0[1];
      0002EA 85 17 80         [24]  912 	mov	_P0,(_p0State0 + 0x0001)
                                    913 ;	main.c:177: LED_G2 = 1;
                                    914 ;	assignBit
      0002ED D2 B2            [12]  915 	setb	_P3_2
                                    916 ;	main.c:178: nextDisplay = 0;
      0002EF 75 15 00         [24]  917 	mov	_nextDisplay,#0x00
                                    918 ;	main.c:181: }
      0002F2 22               [24]  919 	ret
                                    920 ;------------------------------------------------------------
                                    921 ;Allocation info for local variables in function 'main'
                                    922 ;------------------------------------------------------------
                                    923 ;flowTimer     Allocated to registers r7 
                                    924 ;syncDutyTimer Allocated to registers r6 
                                    925 ;------------------------------------------------------------
                                    926 ;	main.c:183: void main(void) {
                                    927 ;	-----------------------------------------
                                    928 ;	 function main
                                    929 ;	-----------------------------------------
      0002F3                        930 _main:
                                    931 ;	main.c:185: p0State0[0] = segTable[duty / 10];
      0002F3 AF 08            [24]  932 	mov	r7,_duty
      0002F5 75 F0 0A         [24]  933 	mov	b,#0x0a
      0002F8 EF               [12]  934 	mov	a,r7
      0002F9 84               [48]  935 	div	ab
      0002FA 90 03 85         [24]  936 	mov	dptr,#_segTable
      0002FD 93               [24]  937 	movc	a,@a+dptr
      0002FE F5 16            [12]  938 	mov	_p0State0, a
                                    939 ;	main.c:186: p0State0[1] = segTable[duty % 10];
      000300 AF 08            [24]  940 	mov	r7,_duty
      000302 75 F0 0A         [24]  941 	mov	b,#0x0a
      000305 EF               [12]  942 	mov	a,r7
      000306 84               [48]  943 	div	ab
      000307 E5 F0            [12]  944 	mov	a,b
      000309 90 03 85         [24]  945 	mov	dptr,#_segTable
      00030C 93               [24]  946 	movc	a,@a+dptr
      00030D F5 17            [12]  947 	mov	(_p0State0 + 0x0001), a
                                    948 ;	main.c:187: syncDuty();
      00030F 12 01 A4         [24]  949 	lcall	_syncDuty
                                    950 ;	main.c:189: unsigned char flowTimer = 0;
      000312 7F 00            [12]  951 	mov	r7,#0x00
                                    952 ;	main.c:190: unsigned char syncDutyTimer = 0;
      000314 7E 00            [12]  953 	mov	r6,#0x00
                                    954 ;	main.c:192: timerInit();
      000316 C0 07            [24]  955 	push	ar7
      000318 C0 06            [24]  956 	push	ar6
      00031A 12 01 94         [24]  957 	lcall	_timerInit
      00031D D0 06            [24]  958 	pop	ar6
      00031F D0 07            [24]  959 	pop	ar7
                                    960 ;	main.c:194: while (1) {
      000321                        961 00111$:
                                    962 ;	main.c:195: if (tick10ms) {
      000321 E5 09            [12]  963 	mov	a,_tick10ms
      000323 60 FC            [24]  964 	jz	00111$
                                    965 ;	main.c:196: tick10ms = 0;
      000325 75 09 00         [24]  966 	mov	_tick10ms,#0x00
                                    967 ;	main.c:199: lcdControl();
      000328 C0 07            [24]  968 	push	ar7
      00032A C0 06            [24]  969 	push	ar6
      00032C 12 02 97         [24]  970 	lcall	_lcdControl
                                    971 ;	main.c:201: adjustDuty();
      00032F 12 00 F6         [24]  972 	lcall	_adjustDuty
      000332 D0 06            [24]  973 	pop	ar6
      000334 D0 07            [24]  974 	pop	ar7
                                    975 ;	main.c:204: flowTimer++;
      000336 0F               [12]  976 	inc	r7
                                    977 ;	main.c:205: if (flowTimer >= 10) {
      000337 BF 0A 00         [24]  978 	cjne	r7,#0x0a,00146$
      00033A                        979 00146$:
      00033A 40 0D            [24]  980 	jc	00102$
                                    981 ;	main.c:206: flowTimer = 0;
      00033C 7F 00            [12]  982 	mov	r7,#0x00
                                    983 ;	main.c:207: flowControl();
      00033E C0 07            [24]  984 	push	ar7
      000340 C0 06            [24]  985 	push	ar6
      000342 12 02 02         [24]  986 	lcall	_flowControl
      000345 D0 06            [24]  987 	pop	ar6
      000347 D0 07            [24]  988 	pop	ar7
      000349                        989 00102$:
                                    990 ;	main.c:211: syncDutyTimer++;
      000349 0E               [12]  991 	inc	r6
                                    992 ;	main.c:212: if (syncDutyTimer >= 100) {
      00034A BE 64 00         [24]  993 	cjne	r6,#0x64,00148$
      00034D                        994 00148$:
      00034D 40 D2            [24]  995 	jc	00111$
                                    996 ;	main.c:213: syncDutyTimer = 0;
      00034F 7E 00            [12]  997 	mov	r6,#0x00
                                    998 ;	main.c:214: if (DOWN_BUTTON == DOWN_OK || UP_BUTTON == UP_OK)
      000351 30 A4 03         [24]  999 	jnb	_P2_4,00103$
      000354 20 A5 CA         [24] 1000 	jb	_P2_5,00111$
      000357                       1001 00103$:
                                   1002 ;	main.c:215: syncDuty();
      000357 C0 07            [24] 1003 	push	ar7
      000359 C0 06            [24] 1004 	push	ar6
      00035B 12 01 A4         [24] 1005 	lcall	_syncDuty
      00035E D0 06            [24] 1006 	pop	ar6
      000360 D0 07            [24] 1007 	pop	ar7
                                   1008 ;	main.c:219: }
      000362 80 BD            [24] 1009 	sjmp	00111$
                                   1010 	.area CSEG    (CODE)
                                   1011 	.area CONST   (CODE)
                                   1012 	.area CONST   (CODE)
      000385                       1013 _segTable:
      000385 3F                    1014 	.db #0x3f	; 63
      000386 06                    1015 	.db #0x06	; 6
      000387 5B                    1016 	.db #0x5b	; 91
      000388 4F                    1017 	.db #0x4f	; 79	'O'
      000389 66                    1018 	.db #0x66	; 102	'f'
      00038A 6D                    1019 	.db #0x6d	; 109	'm'
      00038B 7D                    1020 	.db #0x7d	; 125
      00038C 07                    1021 	.db #0x07	; 7
      00038D 7F                    1022 	.db #0x7f	; 127
      00038E 6F                    1023 	.db #0x6f	; 111	'o'
                                   1024 	.area CSEG    (CODE)
                                   1025 	.area XINIT   (CODE)
                                   1026 	.area CABS    (ABS,CODE)

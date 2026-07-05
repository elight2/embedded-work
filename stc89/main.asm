;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (Linux)
;--------------------------------------------------------
	.module main
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _segTable
	.globl _main
	.globl _lcdControl
	.globl _flowControl
	.globl _syncDuty
	.globl _timerInit
	.globl _adjustDuty
	.globl _timer0Callback
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _p0State0
	.globl _nextDisplay
	.globl _setFlowState
	.globl _flowState
	.globl _dutyState
	.globl _adjustFastTickCount
	.globl _adjustTickCount
	.globl _tick10msCount
	.globl _pwmCount
	.globl _tick10ms
	.globl _duty
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_duty::
	.ds 1
_tick10ms::
	.ds 1
_pwmCount::
	.ds 1
_tick10msCount::
	.ds 2
_adjustTickCount::
	.ds 1
_adjustFastTickCount::
	.ds 1
_dutyState::
	.ds 2
_flowState::
	.ds 2
_setFlowState::
	.ds 2
_nextDisplay::
	.ds 1
_p0State0::
	.ds 2
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram
;--------------------------------------------------------
	.area SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0Callback
; restartable atomic support routines
	.ds	2
sdcc_atomic_exchange_rollback_start::
	nop
	nop
sdcc_atomic_exchange_pdata_impl:
	movx	a, @r0
	mov	r3, a
	mov	a, r2
	movx	@r0, a
	sjmp	sdcc_atomic_exchange_exit
	nop
	nop
sdcc_atomic_exchange_xdata_impl:
	movx	a, @dptr
	mov	r3, a
	mov	a, r2
	movx	@dptr, a
	sjmp	sdcc_atomic_exchange_exit
sdcc_atomic_compare_exchange_idata_impl:
	mov	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	mov	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_pdata_impl:
	movx	a, @r0
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@r0, a
	ret
	nop
sdcc_atomic_compare_exchange_xdata_impl:
	movx	a, @dptr
	cjne	a, ar2, .+#5
	mov	a, r3
	movx	@dptr, a
	ret
sdcc_atomic_exchange_rollback_end::

sdcc_atomic_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_exchange_pdata_impl
sdcc_atomic_exchange_idata_impl:
	mov	a, r2
	xch	a, @r0
	mov	dpl, a
	ret
sdcc_atomic_exchange_exit:
	mov	dpl, r3
	ret
sdcc_atomic_compare_exchange_gptr_impl::
	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
	mov	r0, dpl
	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
	sjmp	sdcc_atomic_compare_exchange_idata_impl
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
;	main.c:31: volatile unsigned char duty = 50;
	mov	_duty,#0x32
;	main.c:33: volatile unsigned char tick10ms = 0;
	mov	_tick10ms,#0x00
;	main.c:35: unsigned char pwmCount = 0;
	mov	_pwmCount,#0x00
;	main.c:36: unsigned short tick10msCount = 0;
	clr	a
	mov	_tick10msCount,a
	mov	(_tick10msCount + 1),a
;	main.c:50: unsigned char adjustTickCount = 0;
	mov	_adjustTickCount,a
;	main.c:51: unsigned char adjustFastTickCount = 0;
	mov	_adjustFastTickCount,a
;	main.c:118: unsigned short dutyState = 0;
	mov	_dutyState,a
	mov	(_dutyState + 1),a
;	main.c:119: unsigned short flowState = 0;
	mov	_flowState,a
	mov	(_flowState + 1),a
;	main.c:120: unsigned short setFlowState = 0;
	mov	_setFlowState,a
	mov	(_setFlowState + 1),a
;	main.c:150: unsigned char nextDisplay = 0;
	mov	_nextDisplay,a
;	main.c:151: unsigned char p0State0[2] = {0};
	mov	_p0State0,a
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0Callback'
;------------------------------------------------------------
;	main.c:37: void timer0Callback(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0Callback
;	-----------------------------------------
_timer0Callback:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	push	acc
	push	psw
;	main.c:38: if (pwmCount < duty)
	clr	c
	mov	a,_pwmCount
	subb	a,_duty
	jnc	00102$
;	main.c:39: PWM_CTRL = 0;
;	assignBit
	clr	_P2_6
	sjmp	00103$
00102$:
;	main.c:41: PWM_CTRL = 1;
;	assignBit
	setb	_P2_6
00103$:
;	main.c:43: pwmCount++;
	inc	_pwmCount
;	main.c:44: if (pwmCount >= 100) {
	mov	a,#0x100 - 0x64
	add	a,_pwmCount
	jnc	00106$
;	main.c:45: pwmCount = 0;
	mov	_pwmCount,#0x00
;	main.c:46: tick10ms = 1;
	mov	_tick10ms,#0x01
00106$:
;	main.c:48: }
	pop	psw
	pop	acc
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;------------------------------------------------------------
;Allocation info for local variables in function 'adjustDuty'
;------------------------------------------------------------
;	main.c:52: void adjustDuty(void) {
;	-----------------------------------------
;	 function adjustDuty
;	-----------------------------------------
_adjustDuty:
;	main.c:53: if (DOWN_BUTTON == DOWN_OK && UP_BUTTON != UP_OK) {
	jb	_P2_4,00143$
	jnb	_P2_5,00143$
;	main.c:54: if (DOWN_BUTTON == DOWN_OK) {
	jb	_P2_4,00108$
;	main.c:55: if (adjustTickCount == 0) {
	mov	a,_adjustTickCount
	jnz	00104$
;	main.c:56: if (duty > 0)
	mov	a,_duty
	jz	00104$
;	main.c:57: duty--;
	mov	a,_duty
	dec	a
	mov	_duty,a
00104$:
;	main.c:59: if (adjustTickCount <= 100)
	mov	a,_adjustTickCount
	add	a,#0xff - 0x64
	jc	00108$
;	main.c:60: adjustTickCount++;
	inc	_adjustTickCount
00108$:
;	main.c:63: if (DOWN_BUTTON != DOWN_OK && adjustTickCount > 0) {
	jnb	_P2_4,00110$
	mov	a,_adjustTickCount
	jz	00110$
;	main.c:64: adjustTickCount = 0;
	mov	_adjustTickCount,#0x00
;	main.c:65: adjustFastTickCount = 0;
	mov	_adjustFastTickCount,#0x00
00110$:
;	main.c:68: if (adjustTickCount > 100) {
	mov	a,_adjustTickCount
	add	a,#0xff - 0x64
	jc	00300$
	ret
00300$:
;	main.c:69: adjustFastTickCount++;
	inc	_adjustFastTickCount
;	main.c:71: if (adjustFastTickCount > 10) {
	mov	a,_adjustFastTickCount
	add	a,#0xff - 0x0a
	jnc	00146$
;	main.c:72: adjustFastTickCount = 0;
	mov	_adjustFastTickCount,#0x00
;	main.c:73: if (duty > 0)
	mov	a,_duty
	jz	00146$
;	main.c:74: duty--;
	mov	a,_duty
	dec	a
	mov	_duty,a
	ret
00143$:
;	main.c:77: } else if (UP_BUTTON == UP_OK && DOWN_BUTTON != DOWN_OK) {
	jb	_P2_5,00139$
	jnb	_P2_4,00139$
;	main.c:78: if (UP_BUTTON == DOWN_OK) {
	jb	_P2_5,00125$
;	main.c:79: if (adjustTickCount == 0) {
	mov	a,_adjustTickCount
	jnz	00121$
;	main.c:80: if (duty < 100)
	mov	a,#0x100 - 0x64
	add	a,_duty
	jc	00121$
;	main.c:81: duty++;
	mov	a,_duty
	inc	a
	mov	_duty,a
00121$:
;	main.c:83: if (adjustTickCount <= 100)
	mov	a,_adjustTickCount
	add	a,#0xff - 0x64
	jc	00125$
;	main.c:84: adjustTickCount++;
	inc	_adjustTickCount
00125$:
;	main.c:87: if (UP_BUTTON != DOWN_OK && adjustTickCount > 0) {
	jnb	_P2_5,00127$
	mov	a,_adjustTickCount
	jz	00127$
;	main.c:88: adjustTickCount = 0;
	mov	_adjustTickCount,#0x00
;	main.c:89: adjustFastTickCount = 0;
	mov	_adjustFastTickCount,#0x00
00127$:
;	main.c:92: if (adjustTickCount > 100) {
	mov	a,_adjustTickCount
	add	a,#0xff - 0x64
	jnc	00146$
;	main.c:93: adjustFastTickCount++;
	inc	_adjustFastTickCount
;	main.c:95: if (adjustFastTickCount > 10) {
	mov	a,_adjustFastTickCount
	add	a,#0xff - 0x0a
	jnc	00146$
;	main.c:96: adjustFastTickCount = 0;
	mov	_adjustFastTickCount,#0x00
;	main.c:97: if (duty < 100)
	mov	a,#0x100 - 0x64
	add	a,_duty
	jc	00146$
;	main.c:98: duty++;
	mov	a,_duty
	inc	a
	mov	_duty,a
	ret
00139$:
;	main.c:101: } else if (DOWN_BUTTON != DOWN_OK && UP_BUTTON != UP_OK)
	jnb	_P2_4,00146$
	jnb	_P2_5,00146$
;	main.c:102: adjustTickCount = adjustFastTickCount = 0;
	mov	_adjustFastTickCount,#0x00
	mov	_adjustTickCount,#0x00
00146$:
;	main.c:103: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timerInit'
;------------------------------------------------------------
;	main.c:105: void timerInit(void) {
;	-----------------------------------------
;	 function timerInit
;	-----------------------------------------
_timerInit:
;	main.c:106: TMOD = 0x02;
	mov	_TMOD,#0x02
;	main.c:109: TH0 = 0xec;
	mov	_TH0,#0xec
;	main.c:110: TL0 = 0xec;
	mov	_TL0,#0xec
;	main.c:112: ET0 = 1;
;	assignBit
	setb	_ET0
;	main.c:113: EA = 1;
;	assignBit
	setb	_EA
;	main.c:114: TR0 = 1;
;	assignBit
	setb	_TR0
;	main.c:115: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'syncDuty'
;------------------------------------------------------------
;i             Allocated to registers r7 
;------------------------------------------------------------
;	main.c:121: void syncDuty(void) {
;	-----------------------------------------
;	 function syncDuty
;	-----------------------------------------
_syncDuty:
;	main.c:122: dutyState = 0;
	clr	a
	mov	_dutyState,a
	mov	(_dutyState + 1),a
;	main.c:123: for (unsigned char i = 0; i < 10; i++) {
	mov	r7,a
00105$:
	cjne	r7,#0x0a,00128$
00128$:
	jnc	00107$
;	main.c:124: if (duty >= ((i + 1) * 10))
	mov	ar5,r7
	mov	r6,#0x00
	mov	a,#0x01
	add	a, r5
	mov	__mulint_PARM_2,a
	clr	a
	addc	a, r6
	mov	(__mulint_PARM_2 + 1),a
	mov	dptr,#0x000a
	push	ar7
	lcall	__mulint
	mov	r5, dpl
	mov	r6, dph
	pop	ar7
	mov	r3,_duty
	mov	r4,#0x00
	clr	c
	mov	a,r3
	subb	a,r5
	mov	a,r4
	xrl	a,#0x80
	mov	b,r6
	xrl	b,#0x80
	subb	a,b
	jc	00106$
;	main.c:125: dutyState |= (1U << i);
	mov	b,r7
	inc	b
	mov	r5,#0x01
	mov	r6,#0x00
	sjmp	00132$
00131$:
	mov	a,r5
	add	a,r5
	mov	r5,a
	mov	a,r6
	rlc	a
	mov	r6,a
00132$:
	djnz	b,00131$
	mov	r3,_dutyState
	mov	r4,(_dutyState + 1)
	mov	a,r3
	orl	ar5,a
	mov	a,r4
	orl	ar6,a
	mov	_dutyState,r5
	mov	(_dutyState + 1),r6
00106$:
;	main.c:123: for (unsigned char i = 0; i < 10; i++) {
	inc	r7
	sjmp	00105$
00107$:
;	main.c:127: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'flowControl'
;------------------------------------------------------------
;	main.c:128: void flowControl(void) {
;	-----------------------------------------
;	 function flowControl
;	-----------------------------------------
_flowControl:
;	main.c:129: flowState = (flowState << 1) | 1;
	mov	a,_flowState
	add	a,_flowState
	mov	r6,a
	mov	a,(_flowState + 1)
	rlc	a
	mov	r7,a
	orl	ar6,#0x01
	mov	_flowState,r6
	mov	(_flowState + 1),r7
;	main.c:130: if (flowState >= ((dutyState << 1) | 1))
	mov	a,_dutyState
	add	a,_dutyState
	mov	r6,a
	mov	a,(_dutyState + 1)
	rlc	a
	mov	r7,a
	orl	ar6,#0x01
	mov	r4,_flowState
	mov	r5,(_flowState + 1)
	clr	c
	mov	a,r4
	subb	a,r6
	mov	a,r5
	subb	a,r7
	jc	00102$
;	main.c:131: flowState = 0;
	clr	a
	mov	_flowState,a
	mov	(_flowState + 1),a
00102$:
;	main.c:133: setFlowState = flowState & dutyState;
	mov	a,_dutyState
	anl	a,_flowState
	mov	_setFlowState,a
	mov	a,(_dutyState + 1)
	anl	a,(_flowState + 1)
	mov	(_setFlowState + 1),a
;	main.c:135: FLOW_1 = (setFlowState >> 0) & 1;
	mov	a,_setFlowState
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P2_3,c
;	main.c:136: FLOW_2 = (setFlowState >> 1) & 1;
	mov	a,_setFlowState
	rr	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P2_2,c
;	main.c:137: FLOW_3 = (setFlowState >> 2) & 1;
	mov	a,_setFlowState
	rr	a
	rr	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P2_1,c
;	main.c:138: FLOW_4 = (setFlowState >> 3) & 1;
	mov	a,_setFlowState
	mov	c,acc.3
	clr	a
	rlc	a
;	assignBit
	add	a,#0xff
	mov	_P2_0,c
;	main.c:139: FLOW_5 = (setFlowState >> 4) & 1;
	mov	a,_setFlowState
	swap	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P1_7,c
;	main.c:140: FLOW_6 = (setFlowState >> 5) & 1;
	mov	a,_setFlowState
	mov	c,acc.5
	clr	a
	rlc	a
;	assignBit
	add	a,#0xff
	mov	_P1_6,c
;	main.c:141: FLOW_7 = (setFlowState >> 6) & 1;
	mov	a,_setFlowState
	rl	a
	rl	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P1_5,c
;	main.c:142: FLOW_8 = (setFlowState >> 7) & 1;
	mov	a,_setFlowState
	rl	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P1_4,c
;	main.c:143: FLOW_9 = (setFlowState >> 8) & 1;
	mov	a,(_setFlowState + 1)
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P1_3,c
;	main.c:144: FLOW_10 = (setFlowState >> 9) & 1;
	mov	a,(_setFlowState + 1)
	rr	a
	anl	a,#0x01
;	assignBit
	add	a,#0xff
	mov	_P1_2,c
;	main.c:145: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'lcdControl'
;------------------------------------------------------------
;	main.c:152: void lcdControl(void) {
;	-----------------------------------------
;	 function lcdControl
;	-----------------------------------------
_lcdControl:
;	main.c:153: if (DOWN_BUTTON == DOWN_OK || UP_BUTTON == UP_OK) {
	jnb	_P2_4,00101$
	jb	_P2_5,00102$
00101$:
;	main.c:154: p0State0[0] = segTable[duty / 10];
	mov	r7,_duty
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	dptr,#_segTable
	movc	a,@a+dptr
	mov	_p0State0, a
;	main.c:155: p0State0[1] = segTable[duty % 10];
	mov	r7,_duty
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	a,b
	mov	dptr,#_segTable
	movc	a,@a+dptr
	mov	(_p0State0 + 0x0001), a
00102$:
;	main.c:158: if (duty == 0) {
	mov	a,_duty
	jnz	00111$
;	main.c:159: LED_G1 = 0;
;	assignBit
	clr	_P2_7
;	main.c:160: LED_G2 = 1;
;	assignBit
	setb	_P3_2
;	main.c:161: P0 = segTable[0];
	mov	dptr,#_segTable
	clr	a
	movc	a,@a+dptr
	mov	_P0,a
	ret
00111$:
;	main.c:162: } else if (duty == 100) {
	mov	a,#0x64
	cjne	a,_duty,00108$
;	main.c:163: LED_G1 = 1;
;	assignBit
	setb	_P2_7
;	main.c:164: LED_G2 = 1;
;	assignBit
	setb	_P3_2
;	main.c:165: P0 = 0xbf;
	mov	_P0,#0xbf
	ret
00108$:
;	main.c:167: LED_G1 = 0;
;	assignBit
	clr	_P2_7
;	main.c:168: LED_G2 = 0;
;	assignBit
	clr	_P3_2
;	main.c:169: P0 = 0;
	mov	_P0,#0x00
;	main.c:171: if (nextDisplay == 0) {
	mov	a,_nextDisplay
	jnz	00105$
;	main.c:172: P0 = p0State0[0];
	mov	_P0,_p0State0
;	main.c:173: LED_G1 = 1;
;	assignBit
	setb	_P2_7
;	main.c:174: nextDisplay = 1;
	mov	_nextDisplay,#0x01
	ret
00105$:
;	main.c:176: P0 = p0State0[1];
	mov	_P0,(_p0State0 + 0x0001)
;	main.c:177: LED_G2 = 1;
;	assignBit
	setb	_P3_2
;	main.c:178: nextDisplay = 0;
	mov	_nextDisplay,#0x00
;	main.c:181: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;flowTimer     Allocated to registers r7 
;syncDutyTimer Allocated to registers r6 
;------------------------------------------------------------
;	main.c:183: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	main.c:185: p0State0[0] = segTable[duty / 10];
	mov	r7,_duty
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	dptr,#_segTable
	movc	a,@a+dptr
	mov	_p0State0, a
;	main.c:186: p0State0[1] = segTable[duty % 10];
	mov	r7,_duty
	mov	b,#0x0a
	mov	a,r7
	div	ab
	mov	a,b
	mov	dptr,#_segTable
	movc	a,@a+dptr
	mov	(_p0State0 + 0x0001), a
;	main.c:187: syncDuty();
	lcall	_syncDuty
;	main.c:189: unsigned char flowTimer = 0;
	mov	r7,#0x00
;	main.c:190: unsigned char syncDutyTimer = 0;
	mov	r6,#0x00
;	main.c:192: timerInit();
	push	ar7
	push	ar6
	lcall	_timerInit
	pop	ar6
	pop	ar7
;	main.c:194: while (1) {
00111$:
;	main.c:195: if (tick10ms) {
	mov	a,_tick10ms
	jz	00111$
;	main.c:196: tick10ms = 0;
	mov	_tick10ms,#0x00
;	main.c:199: lcdControl();
	push	ar7
	push	ar6
	lcall	_lcdControl
;	main.c:201: adjustDuty();
	lcall	_adjustDuty
	pop	ar6
	pop	ar7
;	main.c:204: flowTimer++;
	inc	r7
;	main.c:205: if (flowTimer >= 10) {
	cjne	r7,#0x0a,00146$
00146$:
	jc	00102$
;	main.c:206: flowTimer = 0;
	mov	r7,#0x00
;	main.c:207: flowControl();
	push	ar7
	push	ar6
	lcall	_flowControl
	pop	ar6
	pop	ar7
00102$:
;	main.c:211: syncDutyTimer++;
	inc	r6
;	main.c:212: if (syncDutyTimer >= 100) {
	cjne	r6,#0x64,00148$
00148$:
	jc	00111$
;	main.c:213: syncDutyTimer = 0;
	mov	r6,#0x00
;	main.c:214: if (DOWN_BUTTON == DOWN_OK || UP_BUTTON == UP_OK)
	jnb	_P2_4,00103$
	jb	_P2_5,00111$
00103$:
;	main.c:215: syncDuty();
	push	ar7
	push	ar6
	lcall	_syncDuty
	pop	ar6
	pop	ar7
;	main.c:219: }
	sjmp	00111$
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area CONST   (CODE)
_segTable:
	.db #0x3f	; 63
	.db #0x06	; 6
	.db #0x5b	; 91
	.db #0x4f	; 79	'O'
	.db #0x66	; 102	'f'
	.db #0x6d	; 109	'm'
	.db #0x7d	; 125
	.db #0x07	; 7
	.db #0x7f	; 127
	.db #0x6f	; 111	'o'
	.area CSEG    (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)

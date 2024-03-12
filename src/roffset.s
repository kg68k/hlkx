		.title	get roffset table size


* Include File -------------------------------- *

		.include	hlk.mac
		.include	sub_list.mac


* Global Symbol ------------------------------- *

		.xref	get_com_no
		.xref	skip_com

		.xref	get_xref_label
		.xref	c_stack_over
		.xref	c_stack_under

		.xref	unknown_cmd


* Text Section -------------------------------- *

		.cpu	68000

		.text
		.even

*------------------------------------------------------------------------------
*
*	calc_roff_sz
*
*	in:	nothing
*
*	out:	roff_tbl_size
*
*------------------------------------------------------------------------------

		_obj_list_	obj_list,a1,0
		_link_list_	link_list,a2,0

calc_roff_sz::
		link		a6,#-12
		push		d1-d6/a0-a3

		moveq.l		#0,d6			;d6.l = roff_tbl_size
		lea		(workbuf+LINK_LIST_HEAD,pc),a2
		move.l		(a2),d0			;a2.l = link_list_head
		beq		calc_size_b20
calc_size_l11:
		movea.l		d0,a2
		move.l		link_list_obj_list,a1	* a1.l = obj_list

		move.w		#1,d5			* d5.w = section no.
		movea.l		obj_list_obj_image,a0	* a0.l = obj_image
		move		(a0),d0
		beq		object_end
calc_size_l12:
		move		d0,d1
		bsr		get_com_no
		bmi		unknown_cmd

		lea		(jump_table,pc),a3
		move		(a3,d0.w),d0
		jsr		(a3,d0.w)		* d1.w = command code
		move		(a0),d0
		bne		calc_size_l12
object_end:
		lea		link_list_next,a2	* a2.l = next
		move.l		(a2),d0
		bne		calc_size_l11
calc_size_b20:
		lea		(workbuf+ROFF_TBL_SIZE,pc),a0
		move.l		d6,(a0)

		pop		d1-d6/a0-a3
		unlk		a6
		rts

define_const: .reg skip_com
define_space: .reg skip_com

*------------------------------------------------------------------------------

chg_sect_2001:
chg_sect_2002:
chg_sect_2003:
chg_sect_2004:
chg_sect_2005:
chg_sect_2006:
chg_sect_2007:
chg_sect_2008:
chg_sect_2009:
chg_sect_200a:
		tst.l		2(a0)
		bne		unknown_cmd
		addq.l		#6,a0

		and.l		#$ff,d1
		move.l		d1,d5

		rts

*------------------------------------------------------------------------------

wrt_lbl_40fc: .reg skip_com
wrt_lbl_40fd: .reg skip_com
wrt_lbl_40fe: .reg skip_com
wrt_lbl_40ff: .reg skip_com
wrt_lbl_4000: .reg skip_com
wrt_lbl_4001: .reg skip_com
wrt_lbl_4002: .reg skip_com
wrt_lbl_4003: .reg skip_com
wrt_lbl_4004: .reg skip_com
wrt_lbl_4005: .reg skip_com
wrt_lbl_4006: .reg skip_com
wrt_lbl_4007: .reg skip_com
wrt_lbl_4008: .reg skip_com
wrt_lbl_4009: .reg skip_com
wrt_lbl_400a: .reg skip_com

wrt_lbl_41fc: .reg skip_com
wrt_lbl_41fd: .reg skip_com
wrt_lbl_41fe: .reg skip_com
wrt_lbl_41ff: .reg skip_com
wrt_lbl_4100: .reg skip_com
wrt_lbl_4101: .reg skip_com
wrt_lbl_4102: .reg skip_com
wrt_lbl_4103: .reg skip_com
wrt_lbl_4104: .reg skip_com
wrt_lbl_4105: .reg skip_com
wrt_lbl_4106: .reg skip_com
wrt_lbl_4107: .reg skip_com
wrt_lbl_4108: .reg skip_com
wrt_lbl_4109: .reg skip_com
wrt_lbl_410a: .reg skip_com

wrt_lbl_42fe: .reg skip_com
wrt_lbl_4200: .reg skip_com
wrt_lbl_4201: .reg skip_com
wrt_lbl_4202: .reg skip_com
wrt_lbl_4203: .reg skip_com
wrt_lbl_4204: .reg skip_com

wrt_lbl_43fc: .reg skip_com
wrt_lbl_43fd: .reg skip_com
wrt_lbl_43fe: .reg skip_com
wrt_lbl_43ff: .reg skip_com
wrt_lbl_4300: .reg skip_com
wrt_lbl_4301: .reg skip_com
wrt_lbl_4302: .reg skip_com
wrt_lbl_4303: .reg skip_com
wrt_lbl_4304: .reg skip_com
wrt_lbl_4305: .reg skip_com
wrt_lbl_4306: .reg skip_com
wrt_lbl_4307: .reg skip_com
wrt_lbl_4308: .reg skip_com
wrt_lbl_4309: .reg skip_com
wrt_lbl_430a: .reg skip_com

wrt_lbl_45fe: .reg skip_com
wrt_lbl_45ff: .reg skip_com

wrt_lbl_46fe: .reg skip_com
wrt_lbl_4600: .reg skip_com
wrt_lbl_4601: .reg skip_com
wrt_lbl_4602: .reg skip_com
wrt_lbl_4603: .reg skip_com
wrt_lbl_4604: .reg skip_com

wrt_lbl_47fe: .reg skip_com
wrt_lbl_47ff: .reg skip_com
wrt_ctor_4c01: .reg skip_com
wrt_dtor_4d01: .reg skip_com

wrt_lbl_50fc: .reg skip_com
wrt_lbl_50fd: .reg skip_com
wrt_lbl_50fe: .reg skip_com
wrt_lbl_50ff: .reg skip_com
wrt_lbl_5000: .reg skip_com
wrt_lbl_5001: .reg skip_com
wrt_lbl_5002: .reg skip_com
wrt_lbl_5003: .reg skip_com
wrt_lbl_5004: .reg skip_com
wrt_lbl_5005: .reg skip_com
wrt_lbl_5006: .reg skip_com
wrt_lbl_5007: .reg skip_com
wrt_lbl_5008: .reg skip_com
wrt_lbl_5009: .reg skip_com
wrt_lbl_500a: .reg skip_com

wrt_lbl_51fc: .reg skip_com
wrt_lbl_51fd: .reg skip_com
wrt_lbl_51fe: .reg skip_com
wrt_lbl_51ff: .reg skip_com
wrt_lbl_5100: .reg skip_com
wrt_lbl_5101: .reg skip_com
wrt_lbl_5102: .reg skip_com
wrt_lbl_5103: .reg skip_com
wrt_lbl_5104: .reg skip_com
wrt_lbl_5105: .reg skip_com
wrt_lbl_5106: .reg skip_com
wrt_lbl_5107: .reg skip_com
wrt_lbl_5108: .reg skip_com
wrt_lbl_5109: .reg skip_com
wrt_lbl_510a: .reg skip_com

wrt_lbl_52fe: .reg skip_com
wrt_lbl_5200: .reg skip_com
wrt_lbl_5201: .reg skip_com
wrt_lbl_5202: .reg skip_com
wrt_lbl_5203: .reg skip_com
wrt_lbl_5204: .reg skip_com

wrt_lbl_53fc: .reg skip_com
wrt_lbl_53fd: .reg skip_com
wrt_lbl_53fe: .reg skip_com
wrt_lbl_53ff: .reg skip_com
wrt_lbl_5300: .reg skip_com
wrt_lbl_5301: .reg skip_com
wrt_lbl_5302: .reg skip_com
wrt_lbl_5303: .reg skip_com
wrt_lbl_5304: .reg skip_com
wrt_lbl_5305: .reg skip_com
wrt_lbl_5306: .reg skip_com
wrt_lbl_5307: .reg skip_com
wrt_lbl_5308: .reg skip_com
wrt_lbl_5309: .reg skip_com
wrt_lbl_530a: .reg skip_com

wrt_lbl_55fe: .reg skip_com
wrt_lbl_55ff: .reg skip_com

wrt_lbl_56fe: .reg skip_com
wrt_lbl_5600: .reg skip_com
wrt_lbl_5601: .reg skip_com
wrt_lbl_5602: .reg skip_com
wrt_lbl_5603: .reg skip_com
wrt_lbl_5604: .reg skip_com

wrt_lbl_57fe: .reg skip_com
wrt_lbl_57ff: .reg skip_com

*------------------------------------------------------------------------------

wrt_lbl_5205:
wrt_lbl_5206:
wrt_lbl_5207:
wrt_lbl_5208:
wrt_lbl_5209:
wrt_lbl_520a:
wrt_lbl_5605:
wrt_lbl_5606:
wrt_lbl_5607:
wrt_lbl_5608:
wrt_lbl_5609:
wrt_lbl_560a:
		addq.l		#2,a0			;command + adr.l + num.l

wrt_lbl_52fc:
wrt_lbl_52fd:
wrt_lbl_56fc:
wrt_lbl_56fd:
		addq.l		#2,a0			;command + label no.w + num.l

wrt_lbl_4205:
wrt_lbl_4206:
wrt_lbl_4207:
wrt_lbl_4208:
wrt_lbl_4209:
wrt_lbl_420a:
wrt_lbl_4605:
wrt_lbl_4606:
wrt_lbl_4607:
wrt_lbl_4608:
wrt_lbl_4609:
wrt_lbl_460a:
		addq.l		#2,a0			;command + adr.l

wrt_lbl_42fc:
wrt_lbl_42fd:
wrt_lbl_46fc:
wrt_lbl_46fd:
		addq.l		#4,a0			;command + label no.w

		cmp.w		#$0005,d5		* rdata
		beq		wrt_lbl_560a_b
		cmp.w		#$0008,d5		* rldata
		bne		wrt_lbl_560a_be
wrt_lbl_560a_b	addq.l		#4,d6
wrt_lbl_560a_be	rts


wrt_lbl_52ff:
wrt_lbl_56ff:
		addq.l		#2,a0
		move.w		(a0)+,d0
		addq.l		#4,a0

		cmp.w		#$0005,d5		* rdata
		beq		wrt_lbl_56ff_b
		cmp.w		#$0008,d5		* rldata
		bne		wrt_lbl_56ff_be

wrt_lbl_56ff_b	bsr		get_xref_label		* a3.l = xdef_list
							* d0.w = type
							* d1.l = value
		cmp.w		#$0004,d0
		bls		wrt_lbl_56ff_be
		cmp.w		#$00fe,d0
		beq		wrt_lbl_56ff_be
		addq.l		#4,d6
wrt_lbl_56ff_be	rts


wrt_lbl_42ff:
wrt_lbl_46ff:
		addq.l		#2,a0
		move.w		(a0)+,d0

		cmp.w		#$0005,d5		* rdata
		beq		wrt_lbl_46ff_b
		cmp.w		#$0008,d5		* rldata
		bne		wrt_lbl_46ff_be

wrt_lbl_46ff_b	bsr		get_xref_label		* a3.l = xdef_list
							* d0.w = type
							* d1.l = value
		cmp.w		#$0004,d0
		bls		wrt_lbl_46ff_be
		cmp.w		#$00fe,d0
		beq		wrt_lbl_46ff_be
		addq.l		#4,d6
wrt_lbl_46ff_be	rts

*------------------------------------------------------------------------------

wrt_lbl_6501: .reg skip_com
wrt_lbl_6502: .reg skip_com
wrt_lbl_6503: .reg skip_com
wrt_lbl_6504: .reg skip_com
wrt_lbl_6505: .reg skip_com
wrt_lbl_6506: .reg skip_com
wrt_lbl_6507: .reg skip_com
wrt_lbl_6508: .reg skip_com
wrt_lbl_6509: .reg skip_com
wrt_lbl_650a: .reg skip_com

wrt_lbl_6901: .reg skip_com
wrt_lbl_6902: .reg skip_com
wrt_lbl_6903: .reg skip_com
wrt_lbl_6904: .reg skip_com
wrt_lbl_6905: .reg skip_com
wrt_lbl_6906: .reg skip_com
wrt_lbl_6907: .reg skip_com
wrt_lbl_6908: .reg skip_com
wrt_lbl_6909: .reg skip_com
wrt_lbl_690a: .reg skip_com

wrt_lbl_6b01: .reg skip_com
wrt_lbl_6b02: .reg skip_com
wrt_lbl_6b03: .reg skip_com
wrt_lbl_6b04: .reg skip_com
wrt_lbl_6b05: .reg skip_com
wrt_lbl_6b06: .reg skip_com
wrt_lbl_6b07: .reg skip_com
wrt_lbl_6b08: .reg skip_com
wrt_lbl_6b09: .reg skip_com
wrt_lbl_6b0a: .reg skip_com

*------------------------------------------------------------------------------

psh_lbl_80fc:
psh_lbl_80fd:
psh_lbl_80fe:
psh_lbl_80ff:
		addq.l		#2,a0
		move.w		(a0)+,d0
		bsr		get_xref_label		* a3.l = xdef_list
							* d0.w = type
							* d1.l = value
		tst.w		d0
		beq		psh_lbl_80ff_b2
		cmp.w		#$0004,d0
		bls		psh_lbl_80ff_b1
		cmp.w		#$00fe,d0
		beq		psh_lbl_80ff_b1
		move.w		#2,d0
		bra		psh_lbl_80ff_b2
psh_lbl_80ff_b1	move.w		#1,d0
psh_lbl_80ff_b2	movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_TOP,pc),a3
		beq		c_stack_over		* calc stack over flow
		move.l		d1,-(a3)
		move		d0,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		subq.l		#6,(a3)
		rts


psh_lbl_8000:
		addq.l		#2,a0
		move.l		(a0)+,d1
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_TOP,pc),a3
		beq		c_stack_over		* calc stack over flow
		move.l		d1,-(a3)
		move		#0,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		subq.l		#6,(a3)
		rts


psh_lbl_8001:
psh_lbl_8002:
psh_lbl_8003:
psh_lbl_8004:
		addq.l		#2,a0
		move.l		(a0)+,d1
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_TOP,pc),a3
		beq		c_stack_over		* calc stack over flow
		move.l		d1,-(a3)
		move		#1,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		subq.l		#6,(a3)
		rts


psh_lbl_8005:
psh_lbl_8006:
psh_lbl_8007:
psh_lbl_8008:
psh_lbl_8009:
psh_lbl_800a:
		addq.l		#2,a0
		move.l		(a0)+,d1
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_TOP,pc),a3
		beq		c_stack_over		* calc stack over flow
		move.l		d1,-(a3)
		move		#2,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		subq.l		#6,(a3)
		rts

*------------------------------------------------------------------------------

wrt_stk_9000:
wrt_stk_9100:
wrt_stk_9300:
wrt_stk_9900:
		addq.l		#2,a0			* write stack
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_BOT,pc),a3
		beq		c_stack_under		* calc stack under flow
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		addq.l		#6,(a3)
		rts


wrt_stk_9200:
wrt_stk_9600:
		addq.l		#2,a0			* write stack (stk.l)
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_BOT,pc),a3
		beq		c_stack_under		* calc stack under flow
		move		(a3)+,d0		* d0.w = type
		move.l		(a3)+,d1		* d1.l = value
		cmp.w		#2,d0
		bne		wrt_stk_9600_be
		cmp.w		#$0004,d5
		bls		wrt_stk_9600_be
		addq.l		#4,d6
wrt_stk_9600_be:
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		addq.l		#6,(a3)
		rts

*------------------------------------------------------------------------------

*------------------------------------------------------------------------------
*
*	chk_cstk_und1
*
*	計算用スタックから値を１つ取り出す。スタックアンダーフローが
*	発生した場合はエラールーチンへジャンプする。
*
*------------------------------------------------------------------------------

chk_cstk_und1:
		addq.l		#2,a0
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_BOT,pc),a3
		beq		chk_cstk_err
		move.w		(a3)+,d2
		move.l		(a3)+,d0
		rts


*------------------------------------------------------------------------------
*
*	chk_cstk_und2
*
*	計算用スタックから値を２つ取り出す。スタックアンダーフローが
*	発生した場合はエラールーチンへジャンプする。
*
*------------------------------------------------------------------------------

chk_cstk_und2:
		addq.l		#2,a0
		movea.l		(workbuf+CALC_STACK_PTR,pc),a3
		cmp.l		(workbuf+CALC_STACK_BOT,pc),a3
		beq		chk_cstk_err
		move.w		(a3)+,d2
		move.l		(a3)+,d0		* d0.l = (stk+0)
		cmp.l		(workbuf+CALC_STACK_BOT,pc),a3
		beq		chk_cstk_err
		move.w		(a3)+,d3
		move.l		(a3)+,d1		* d1.l = (stk+1)
		rts

chk_cstk_err:
		addq.l		#4,sp
		bra		c_stack_under		* calc stack under flow


*------------------------------------------------------------------------------
*
*	chk_calcexp1
*
*	取り出した値が定数なら何もしない。
*	そうでなければ、エラーを表示して無効な値の属性を設定する。
*
*------------------------------------------------------------------------------

chk_calcexp1:
		tst.w		d2
		ble		chk_calcexp1_be
*		bsr		expression_err
		moveq.l		#-1,d2
chk_calcexp1_be	rts


*------------------------------------------------------------------------------
*
*	chk_calcexp2
*
*	取り出した２つの値が２つとも定数なら何もしない。
*	そうでなければ、エラーを表示して無効な値の属性を設定する。
*
*------------------------------------------------------------------------------

chk_calcexp2:
		moveq.l		#0,d4			* d4.w = new stat
		tst.w		d2
		beq		chk_calcexp2_b2
*		bmi		chk_calcexp2_b1
*		bsr		expression_err
chk_calcexp2_b1	moveq.l		#-1,d4			* d4.w = new stat (undefined)
		bra		chk_calcexp2_be

chk_calcexp2_b2	tst.w		d3
		beq		chk_calcexp2_be
*		bmi		chk_calcexp2_b3
*		bsr		expression_err
chk_calcexp2_b3	moveq.l		#-1,d4			* d4.w = new stat (undefined)

chk_calcexp2_be	rts


cal_stk_a001:						* .neg.(stk)
cal_stk_a002:						* (stk)
cal_stk_a003:						* .not.(stk)
cal_stk_a004:						* .high.(stk)
cal_stk_a005:						* .low.(stk)
cal_stk_a006:						* .highw.(stk)
cal_stk_a007:						* .loww.(stk)
		bsr		chk_cstk_und1

		bsr		chk_calcexp1

		move.l		d0,-(a3)
		move.w		d2,-(a3)
		rts


cal_stk_a009:						* (stk+1) * (stk+0)
cal_stk_a00a:						* (stk+1) / (stk+0)
cal_stk_a00b:						* (stk+1) % (stk+0)
cal_stk_a00c:						* (stk+1) .shr. (stk+0)
cal_stk_a00d:						* (stk+1) .shl. (stk+0)
cal_stk_a00e:						* (stk+1) .asr. (stk+0)
cal_stk_a011:						* (stk+1) .eq. (stk+0)
cal_stk_a012:						* (stk+1) .ne. (stk+0)
cal_stk_a013:						* (stk+1) .lt. (stk+0)
cal_stk_a014:						* (stk+1) .le. (stk+0)
cal_stk_a015:						* (stk+1) .gt. (stk+0)
cal_stk_a016:						* (stk+1) .ge. (stk+0)
cal_stk_a017:						* (stk+1) .slt. (stk+0)
cal_stk_a018:						* (stk+1) .sle. (stk+0)
cal_stk_a019:						* (stk+1) .sgt. (stk+0)
cal_stk_a01a:						* (stk+1) .sge. (stk+0)
cal_stk_a01b:						* (stk+1) .and. (stk+0)
cal_stk_a01c:						* (stk+1) .xor. (stk+0)
cal_stk_a01d:						* (stk+1) .or. (stk+0)
		bsr		chk_cstk_und2
		bsr		chk_calcexp2

		move.l		d1,-(a3)
		move		d4,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		addq.l		#6,(a3)			;+6+6-6=+6
		rts

cal_stk_a00f:
		bsr		chk_cstk_und2		* (stk+1) - (stk+0)

		tst.w		d2
		beq		cal_stk_a00f_b3
		bgt		cal_stk_a00f_b1
		moveq.l		#-1,d4
		bra		cal_stk_a00f_be

cal_stk_a00f_b1	tst.w		d3
		bge		cal_stk_a00f_b2
		moveq.l		#-1,d4
		bra		cal_stk_a00f_be

cal_stk_a00f_b2	cmp.w		d2,d3
		beq		cal_stk_a00f_b3
*		bsr		expression_err
		moveq.l		#-1,d4
		bra		cal_stk_a00f_be

cal_stk_a00f_b3	move.w		d3,d4
		eor.w		d2,d4
*		sub.l		d0,d1			* d1.l = (stk+1) - (stk+0)

cal_stk_a00f_be	move.l		d1,-(a3)
		move		d4,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		addq.l		#6,(a3)			;+6+6-6=+6
		rts


cal_stk_a010:
		bsr		chk_cstk_und2		* (stk+1) + (stk+0)

		tst.w		d2
		beq		cal_stk_a010_b3
		bgt		cal_stk_a010_b1
		moveq.l		#-1,d4
		bra		cal_stk_a010_be

cal_stk_a010_b1	tst.w		d3
		beq		cal_stk_a010_b3
*		bmi		cal_stk_a010_b2
*		bsr		expression_err
cal_stk_a010_b2	moveq.l		#-1,d4
		bra		cal_stk_a010_be

cal_stk_a010_b3	move.w		d3,d4
		eor.w		d2,d4
*		add.l		d0,d1			* d1.l = (stk+1) + (stk+0)

cal_stk_a010_be	move.l		d1,-(a3)
		move		d4,-(a3)
		lea		(workbuf+CALC_STACK_PTR,pc),a3
		addq.l		#6,(a3)			;+6+6-6=+6
		rts


*------------------------------------------------------------------------------

def_lbl_b0ff: .reg skip_com

def_lbl_b2fc: .reg skip_com
def_lbl_b2fd: .reg skip_com
def_lbl_b2fe: .reg skip_com
def_lbl_b2ff: .reg skip_com
def_lbl_b200: .reg skip_com
def_lbl_b201: .reg skip_com
def_lbl_b202: .reg skip_com
def_lbl_b203: .reg skip_com
def_lbl_b204: .reg skip_com
def_lbl_b205: .reg skip_com
def_lbl_b206: .reg skip_com
def_lbl_b207: .reg skip_com
def_lbl_b208: .reg skip_com
def_lbl_b209: .reg skip_com
def_lbl_b20a: .reg skip_com

obj_head_c001: .reg skip_com
obj_head_c002: .reg skip_com
obj_head_c003: .reg skip_com
obj_head_c004: .reg skip_com
obj_head_c005: .reg skip_com
obj_head_c006: .reg skip_com
obj_head_c007: .reg skip_com
obj_head_c008: .reg skip_com
obj_head_c009: .reg skip_com
obj_head_c00a: .reg skip_com
obj_head_c00c: .reg skip_com
obj_head_c00d: .reg skip_com

obj_name: .reg skip_com

set_exec_adr: .reg skip_com
req_obj_e001: .reg skip_com
do_ctor_e00c: .reg skip_com
do_dtor_e00d: .reg skip_com

*------------------------------------------------------------------------------

jump_table:
  OBJECT_COMMAND_LIST jump_table,unknown_cmd


		.end

* End of File --------------------------------- *

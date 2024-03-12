		.title	analize object module


* Include File -------------------------------- *

		.include	hlk.mac
		.include	sub_list.mac


* Text Section -------------------------------- *

		.cpu	68000

		.text
		.even

*------------------------------------------------------------------------------
*
*	get_com_no
*
*	in:	d0.w	コマンドコード
*
*	out:	d0.l	ステータス
*
*	ステータス:	-1	unknown command
*			other	command no * 2
*
*------------------------------------------------------------------------------

COM_NO_SCALE: .equ 2

get_com_no::
		PUSH		d1-d2/a0
		move		d0,d1
		beq		get_com_no_0		;$0000
		lsr		#8,d1
		cmpi.b		#$10,d1
		beq		get_com_no_1		;$10xx
		add		d1,d1
		lea		(index_table,pc),a0
		move		(a0,d1.w),d1
		beq		get_com_no_err		* unknown command

		lea		(command_table,pc),a0
		move.b		d0,d2
		ext		d2
		add		d2,d2
		add		d1,d2
		cmp		(a0,d2.w),d0
		bne		get_com_no_err
		moveq		#0,d0
		move		d2,d0			;COM_NO_SCALE倍のまま返す
get_com_no_end:	POP		d1-d2/a0
		tst.l		d0
		rts

get_com_no_0:	moveq		#0*COM_NO_SCALE,d0
		bra		get_com_no_end
get_com_no_1:	moveq		#1*COM_NO_SCALE,d0
		bra		get_com_no_end
get_com_no_err:	moveq		#-1,d0
		bra		get_com_no_end


*------------------------------------------------------------------------------
*
*	skip_com
*
*	in:	a0.l	コマンドへのポインタ
*
*	out:	d0.l	ステータス
*		a0.l	次のコマンドへのポインタ
*
*	ステータス:	-1	unknown command
*			0	ok
*
*------------------------------------------------------------------------------

skip_com::
		PUSH		d1/a1
		move.w		(a0)+,d0
		move.w		d0,d1
		bsr		get_com_no
		bmi		skip_com_err		* unknown command

		lea		(jump_table,pc),a1
		move		(a1,d0.w),d0
		jsr		(a1,d0.w)		* d1.w = command code
		moveq		#0,d0
@@:		POP		d1/a1
		rts

skip_com_err:
		subq.l		#2,a0
		moveq		#-1,d0
		bra		@b


object_end:	subq.l		#2,a0
		rts


define_const:	andi		#$fe,d1
		addq		#2,d1
		adda		d1,a0
		rts


wrt_stk_9000:
wrt_stk_9100:
wrt_stk_9200:
wrt_stk_9300:
wrt_stk_9600:
wrt_stk_9900:
cal_stk_a001:
cal_stk_a002:
cal_stk_a003:
cal_stk_a004:
cal_stk_a005:
cal_stk_a006:
cal_stk_a007:
cal_stk_a009:
cal_stk_a00a:
cal_stk_a00b:
cal_stk_a00c:
cal_stk_a00d:
cal_stk_a00e:
cal_stk_a00f:
cal_stk_a010:
cal_stk_a011:
cal_stk_a012:
cal_stk_a013:
cal_stk_a014:
cal_stk_a015:
cal_stk_a016:
cal_stk_a017:
cal_stk_a018:
cal_stk_a019:
cal_stk_a01a:
cal_stk_a01b:
cal_stk_a01c:
cal_stk_a01d:
do_ctor_e00c:
do_dtor_e00d:
		rts

wrt_lbl_40fc:	* SXhas
wrt_lbl_40fd:	* SXhas
wrt_lbl_40fe:
wrt_lbl_40ff:
wrt_lbl_41fc:	* SXhas
wrt_lbl_41fd:	* SXhas
wrt_lbl_41fe:
wrt_lbl_41ff:
wrt_lbl_42fc:	* SXhas
wrt_lbl_42fd:	* SXhas
wrt_lbl_42fe:
wrt_lbl_42ff:
wrt_lbl_43fc:	* SXhas
wrt_lbl_43fd:	* SXhas
wrt_lbl_43fe:
wrt_lbl_43ff:
wrt_lbl_45fe:	* v2.00
wrt_lbl_45ff:	* v2.00
wrt_lbl_46fc:	* SXhas
wrt_lbl_46fd:	* SXhas
wrt_lbl_46fe:
wrt_lbl_46ff:
wrt_lbl_47fe:	* v2.00
wrt_lbl_47ff:	* v2.00
psh_lbl_80fc:	* SXhas
psh_lbl_80fd:	* SXhas
psh_lbl_80fe:	* v2.00 ??
psh_lbl_80ff:
		addq.l		#2,a0
		rts


chg_sect_2001:
chg_sect_2002:
chg_sect_2003:
chg_sect_2004:
chg_sect_2005:	* SXhas
chg_sect_2006:	* SXhas
chg_sect_2007:	* SXhas
chg_sect_2008:	* SXhas
chg_sect_2009:	* SXhas
chg_sect_200a:	* SXhas
define_space:
wrt_lbl_4000:
wrt_lbl_4001:
wrt_lbl_4002:
wrt_lbl_4003:
wrt_lbl_4004:
wrt_lbl_4005:	* SXhas
wrt_lbl_4006:	* SXhas
wrt_lbl_4007:	* SXhas
wrt_lbl_4008:	* SXhas
wrt_lbl_4009:	* SXhas
wrt_lbl_400a:	* SXhas
wrt_lbl_4100:
wrt_lbl_4101:
wrt_lbl_4102:
wrt_lbl_4103:
wrt_lbl_4104:
wrt_lbl_4105:	* SXhas
wrt_lbl_4106:	* SXhas
wrt_lbl_4107:	* SXhas
wrt_lbl_4108:	* SXhas
wrt_lbl_4109:	* SXhas
wrt_lbl_410a:	* SXhas
wrt_lbl_4200:
wrt_lbl_4201:
wrt_lbl_4202:
wrt_lbl_4203:
wrt_lbl_4204:
wrt_lbl_4205:	* SXhas
wrt_lbl_4206:	* SXhas
wrt_lbl_4207:	* SXhas
wrt_lbl_4208:	* SXhas
wrt_lbl_4209:	* SXhas
wrt_lbl_420a:	* SXhas
wrt_lbl_4300:
wrt_lbl_4301:
wrt_lbl_4302:
wrt_lbl_4303:
wrt_lbl_4304:
wrt_lbl_4305:	* SXhas
wrt_lbl_4306:	* SXhas
wrt_lbl_4307:	* SXhas
wrt_lbl_4308:	* SXhas
wrt_lbl_4309:	* SXhas
wrt_lbl_430a:	* SXhas
wrt_lbl_4600:
wrt_lbl_4601:
wrt_lbl_4602:
wrt_lbl_4603:
wrt_lbl_4604:
wrt_lbl_4605:	* SXhas
wrt_lbl_4606:	* SXhas
wrt_lbl_4607:	* SXhas
wrt_lbl_4608:	* SXhas
wrt_lbl_4609:	* SXhas
wrt_lbl_460a:	* SXhas
wrt_ctor_4c01:
wrt_dtor_4d01:
psh_lbl_8000:
psh_lbl_8001:
psh_lbl_8002:
psh_lbl_8003:
psh_lbl_8004:
psh_lbl_8005:	* SXhas
psh_lbl_8006:	* SXhas
psh_lbl_8007:	* SXhas
psh_lbl_8008:	* SXhas
psh_lbl_8009:	* SXhas
psh_lbl_800a:	* SXhas
		addq.l		#4,a0
		rts


wrt_lbl_50fc:	* SXhas
wrt_lbl_50fd:	* SXhas
wrt_lbl_50fe:
wrt_lbl_50ff:
wrt_lbl_51fc:	* SXhas
wrt_lbl_51fd:	* SXhas
wrt_lbl_51fe:	* v2.00 ??
wrt_lbl_51ff:
wrt_lbl_52fc:	* SXhas
wrt_lbl_52fd:	* SXhas
wrt_lbl_52fe:	* v2.00 ??
wrt_lbl_52ff:
wrt_lbl_53fc:	* SXhas
wrt_lbl_53fd:	* SXhas
wrt_lbl_53fe:	* v2.00 ??
wrt_lbl_53ff:
wrt_lbl_55fe:	* v2.00 ??
wrt_lbl_55ff:	* v2.00
wrt_lbl_56fc:	* SXhas
wrt_lbl_56fd:	* SXhas
wrt_lbl_56fe:	* v2.00 ??
wrt_lbl_56ff:
wrt_lbl_57fe:	* v2.00 ??
wrt_lbl_57ff:	* v2.00
wrt_lbl_6501:
wrt_lbl_6502:
wrt_lbl_6503:
wrt_lbl_6504:
wrt_lbl_6505:	* SXhas
wrt_lbl_6506:	* SXhas
wrt_lbl_6507:	* SXhas
wrt_lbl_6508:	* SXhas
wrt_lbl_6509:	* SXhas
wrt_lbl_650a:	* SXhas
wrt_lbl_6901:	* v2.00
wrt_lbl_6902:	* v2.00
wrt_lbl_6903:	* v2.00
wrt_lbl_6904:	* v2.00
wrt_lbl_6905:	* SXhas
wrt_lbl_6906:	* SXhas
wrt_lbl_6907:	* SXhas
wrt_lbl_6908:	* SXhas
wrt_lbl_6909:	* SXhas
wrt_lbl_690a:	* SXhas
wrt_lbl_6b01:	* v2.00
wrt_lbl_6b02:	* v2.00
wrt_lbl_6b03:	* v2.00
wrt_lbl_6b04:	* v2.00
wrt_lbl_6b05:	* SXhas
wrt_lbl_6b06:	* SXhas
wrt_lbl_6b07:	* SXhas
wrt_lbl_6b08:	* SXhas
wrt_lbl_6b09:	* SXhas
wrt_lbl_6b0a:	* SXhas
set_exec_adr:
		addq.l		#6,a0
		rts


wrt_lbl_5000:
wrt_lbl_5001:
wrt_lbl_5002:
wrt_lbl_5003:
wrt_lbl_5004:
wrt_lbl_5005:	* SXhas
wrt_lbl_5006:	* SXhas
wrt_lbl_5007:	* SXhas
wrt_lbl_5008:	* SXhas
wrt_lbl_5009:	* SXhas
wrt_lbl_500a:	* SXhas
wrt_lbl_5100:
wrt_lbl_5101:
wrt_lbl_5102:
wrt_lbl_5103:
wrt_lbl_5104:
wrt_lbl_5105:	* SXhas
wrt_lbl_5106:	* SXhas
wrt_lbl_5107:	* SXhas
wrt_lbl_5108:	* SXhas
wrt_lbl_5109:	* SXhas
wrt_lbl_510a:	* SXhas
wrt_lbl_5200:
wrt_lbl_5201:
wrt_lbl_5202:
wrt_lbl_5203:
wrt_lbl_5204:
wrt_lbl_5205:	* SXhas
wrt_lbl_5206:	* SXhas
wrt_lbl_5207:	* SXhas
wrt_lbl_5208:	* SXhas
wrt_lbl_5209:	* SXhas
wrt_lbl_520a:	* SXhas
wrt_lbl_5300:
wrt_lbl_5301:
wrt_lbl_5302:
wrt_lbl_5303:
wrt_lbl_5304:
wrt_lbl_5305:	* SXhas
wrt_lbl_5306:	* SXhas
wrt_lbl_5307:	* SXhas
wrt_lbl_5308:	* SXhas
wrt_lbl_5309:	* SXhas
wrt_lbl_530a:	* SXhas
wrt_lbl_5600:
wrt_lbl_5601:
wrt_lbl_5602:
wrt_lbl_5603:
wrt_lbl_5604:
wrt_lbl_5605:	* SXhas
wrt_lbl_5606:	* SXhas
wrt_lbl_5607:	* SXhas
wrt_lbl_5608:	* SXhas
wrt_lbl_5609:	* SXhas
wrt_lbl_560a:	* SXhas
		addq.l		#8,a0
		rts


def_lbl_b0ff:
def_lbl_b2fc:	* SXhas
def_lbl_b2fd:	* SXhas
def_lbl_b2fe:
def_lbl_b2ff:
def_lbl_b200:
def_lbl_b201:
def_lbl_b202:
def_lbl_b203:
def_lbl_b204:
def_lbl_b205:	* SXhas
def_lbl_b206:	* SXhas
def_lbl_b207:	* SXhas
def_lbl_b208:	* SXhas
def_lbl_b209:	* SXhas
def_lbl_b20a:	* SXhas
obj_head_c001:
obj_head_c002:
obj_head_c003:
obj_head_c004:
obj_head_c005:	* SXhas
obj_head_c006:	* SXhas
obj_head_c007:	* SXhas
obj_head_c008:	* SXhas
obj_head_c009:	* SXhas
obj_head_c00a:	* SXhas
obj_head_c00c:
obj_head_c00d:
obj_name:
		addq.l		#4,a0
		bra		skip_string
*		rts


req_obj:
		bra		skip_string
*		rts

*------------------------------------------------------------------------------
*
*	skip string
*
*	in:	a0.l (even)
*
*	out:	a0.l (even)
*
*------------------------------------------------------------------------------

**skip_string::
**		tst.b	(a0)+
**		bne	skip_string
**		move	a0,-(sp)
**		lsr	(sp)+
**		bcc	@f
**		addq.l	#1,a0
**@@:		rts


@@:		tst.b	(a0)+
		beq	@f
skip_string::	tst.b	(a0)+
		bne	@b
		addq.l	#1,a0
@@:		rts


*------------------------------------------------------------------------------

;ラベルcmd0xXX00はマクロOBJECT_COMMAND_LIST内で定義される
index_table:
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0		;$0x??($0000は特別扱い)
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0		;$1x??($01xxは特別扱い)
		.dc	(cmd0x2000-command_table)		;$2x??
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0x3000-command_table)		;$3x??
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0x4000-command_table)		;$4x??
		.dc	(cmd0x4100-command_table)
		.dc	(cmd0x4200-command_table)
		.dc	(cmd0x4300-command_table)
		.dc	0
		.dc	(cmd0x4500-command_table)
		.dc	(cmd0x4600-command_table)
		.dc	(cmd0x4700-command_table)
		.dc	0,0,0,0
		.dc	(cmd0x4c00-command_table)
		.dc	(cmd0x4d00-command_table)
		.dc	0,0
		.dc	(cmd0x5000-command_table)		;$5x??
		.dc	(cmd0x5100-command_table)
		.dc	(cmd0x5200-command_table)
		.dc	(cmd0x5300-command_table)
		.dc	0
		.dc	(cmd0x5500-command_table)
		.dc	(cmd0x5600-command_table)
		.dc	(cmd0x5700-command_table)
		.dc	0,0,0,0,0,0,0,0
		.dc	0,0,0,0,0				;$6x??
		.dc	(cmd0x6500-command_table)
		.dc	0,0,0
		.dc	(cmd0x6900-command_table)
		.dc	0
		.dc	(cmd0x6b00-command_table)
		.dc	0,0,0,0
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0		;$7x??
		.dc	(cmd0x8000-command_table)		;$8x??
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0x9000-command_table)		;$9x??
		.dc	(cmd0x9100-command_table)
		.dc	(cmd0x9200-command_table)
		.dc	(cmd0x9300-command_table)
		.dc	0,0
		.dc	(cmd0x9600-command_table)
		.dc	0,0
		.dc	(cmd0x9900-command_table)
		.dc	0,0,0,0,0,0
		.dc	(cmd0xa000-command_table)		;$ax??
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0xb000-command_table)		;$bx??
		.dc	0
		.dc	(cmd0xb200-command_table)
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0xc000-command_table)		;$cx??
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0xd000-command_table)		;$dx??
		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		.dc	(cmd0xe000-command_table)		;$ex??

;下の.ds 128とオーバーラップさせて省サイズ化
;		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
;		.dc	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0		;$fx??

  .ds 128
command_table:
  OBJECT_COMMAND_LIST
  .ds $7f-(OBJECT_COMMAND_MAX.and.$7f)


*------------------------------------------------------------------------------

jump_table:
  OBJECT_COMMAND_LIST jump_table,skip_com_err


		.end

* End of File --------------------------------- *

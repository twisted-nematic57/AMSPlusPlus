
	include	"Os.h"
	xdef		_ti89
	xdef		_ti92plus
	xdef		_nostub



	move.l	200,a0		;jump table
	move.l	1060(a0),a0		;pointer to top estack pointer
	move.l	(a0),a0		;get top estack
	cmp.b		#$2D,(a0)		;see if it is a string
	bne		error
	subq.l	#1,a0
decrement_pointer
	tst.b		-(a0)
	bne		decrement_pointer
	addq.l	#1,a0			;point to the first byte of string
	lea		pointer(pc),a1
	move.l	a0,(a1)
	move.l	200,a0		;jump table
	move.l	824(a0),a0		;get send event
	pea		event(pc)
	move.w	#-2,-(a7)		;current
	jsr		(a0)
	addq.l	#6,a7
error:
	rts




event:
	dc.w		$723			;paste string
	dc.w		0			;sender 		-will be filled by send event
	dc.w		0			;side is 0		-will be filled by send event
	dc.w		0			;status flags	-will be filled by send event
pointer:
	dc.l		0			;pointer to the string



	END		



	include	"Os.h"
	xdef		_ti89
;	xdef		_ti92plus
	xdef		_nostub



	move.l	200,a0		;jump table
	move.l	824(a0),a0		;get send event
	pea		event(pc)
	move.w	#-2,-(a7)		;current app
	jsr		(a0)
	addq.l	#6,a7
	rts




event:
	dc.w		$710			;keycode event
	dc.w		0			;sender 		-will be filled by send event
	dc.w		0			;side is 0		-will be filled by send event
	dc.w		0			;status flags	-will be filled by send event
	dc.w		0			;modifiers
	dc.w		338			;The keycode for the 89
;	dc.w		337			;The keycode for the 92+



	END		


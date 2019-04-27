	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* CLAIM ltl_0 */
;
		;
		
	case 4: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC phil */

	case 5: // STATE 3
		;
		((P0 *)this)->rfork = trpt->bup.ovals[2];
		((P0 *)this)->lfork = trpt->bup.ovals[1];
		((P0 *)this)->p = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 7: // STATE 5
		;
		now.hasThought = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 9: // STATE 7
		;
		now.Fork[ Index(((5*((P0 *)this)->p)+((P0 *)this)->lfork), 25) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 11: // STATE 12
		;
		now.Fork[ Index(((5*((P0 *)this)->p)+((P0 *)this)->rfork), 25) ] = trpt->bup.oval;
		;
		goto R999;
;
		;
		;
		;
		;
		;
		
	case 15: // STATE 19
		;
		now.hasEaten = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 20
		;
		now.Fork[ Index(((5*((P0 *)this)->p)+((P0 *)this)->lfork), 25) ] = trpt->bup.oval;
		;
		goto R999;

	case 17: // STATE 21
		;
		now.Fork[ Index(((5*((P0 *)this)->p)+((P0 *)this)->rfork), 25) ] = trpt->bup.oval;
		;
		goto R999;

	case 18: // STATE 22
		;
		now.hasEaten = trpt->bup.oval;
		;
		goto R999;

	case 19: // STATE 23
		;
		now.hasThought = trpt->bup.oval;
		;
		goto R999;
	}


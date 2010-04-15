input automata;

prologues:=3;

verbatimtex
    \documentclass{minimal}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

% settings for some global parameters
size := 10;

beginfig(1);
	u:=1cm;
	label.bot(btex $v$ etex, (0,0));
	
	draw (0,0)..(-1u,1u);
	label.top(btex $v_1$ etex, (-1u,1u));
	
	draw (0,0)..(-0.5u,1u);
	label.top(btex $v_2$ etex, (-0.5u,1u));

	
	label.top(btex $\cdots$ etex, (0.25u,1u));

	draw (0,0)..(1u,1u);
	label.top(btex $v_n$ etex, (1u,1u));

endfig;

end.

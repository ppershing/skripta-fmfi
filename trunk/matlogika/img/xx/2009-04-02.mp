input automata;
verbatimtex
\documentclass{article}
%\usepackage{slovak}
\usepackage[slovak]{babel}
\usepackage[utf8]{inputenc}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3;

beginfig (1);
	size := 20;
	shape := circle;
	with spacing ((20,20)) tree.t (4,2);
	node.t[0][0] (btex $\varepsilon$ etex);
	node.t[1][0] (btex $Q$ etex);
	node.t[1][1] (btex $\neg Q$ etex);
	node.t[2][0] (btex $P$ etex);
	node.t[2][1] (btex $\neg P$ etex);
	node.t[2][2] (btex $P$ etex);
	node.t[2][3] (btex $\neg P$ etex);
	for i:= 0 upto 1:
	 for j:=0 upto 2**i -1:
	  arrow(0.5, "") (t[i][j],t[i+1][j*2]) t[i][j].c..t[i+1][j*2].c;
	  arrow(0.5, "") (t[i][j],t[i+1][j*2+1]) t[i][j].c..t[i+1][j*2+1].c;
         endfor;
	endfor;
endfig;
end.

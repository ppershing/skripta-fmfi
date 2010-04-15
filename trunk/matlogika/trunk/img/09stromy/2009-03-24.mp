input automata;

verbatimtex
% generic layout
\documentclass{article}
%\usepackage{slovak}
\usepackage[slovak]{babel}
\usepackage[utf8]{inputenc}
% additional packages
\usepackage{amsmath}
\begin{document}
etex

u:=1cm;

prologues:=3;

  % settings for some global parameters
  size := 10;
  incominglength := 25;
  loopsize := 22;



beginfig(1);
	with spacing((20,23)) tree.a(4,2);
	node.a[0][0]("");

	node.a[1][0]("");
	node.a[1][1]("");
	
	node.a[2][0]("");
	node.a[2][1]("");
	node.a[2][2]("");
	node.a[2][3]("");
	node.a[3][0]("");
	node.a[3][1]("");
	node.a[3][2]("");
	node.a[3][3]("");
	node.a[3][4]("");
	node.a[3][5]("");
	node.a[3][6]("");
	node.a[3][7]("");

	arrow.top (.5, btex $P$ etex)      (a[0][0],a[1][0]) a[0][0].c..a[1][0].c;
	arrow.top (.5, btex $\neg P$ etex) (a[0][0],a[1][1]) a[0][0].c..a[1][1].c;
	
	arrow.top (.5, btex $Q$ etex)      (a[1][0],a[2][0]) a[1][0].c..a[2][0].c;
	arrow.top (.5, btex $\neg Q$ etex) (a[1][0],a[2][1]) a[1][0].c..a[2][1].c;
	arrow.top (.5, btex $Q$ etex)      (a[1][1],a[2][2]) a[1][1].c..a[2][2].c;
	arrow.top (.5, btex $\neg Q$ etex) (a[1][1],a[2][3]) a[1][1].c..a[2][3].c;
	
	arrow.top (.5, btex $R$ etex)      (a[2][0],a[3][0]) a[2][0].c..a[3][0].c;
	arrow.top (.5, btex $\neg R$ etex) (a[2][0],a[3][1]) a[2][0].c..a[3][1].c;
	arrow.top (.5, btex $R$ etex)      (a[2][1],a[3][2]) a[2][1].c..a[3][2].c;
	arrow.top (.5, btex $\neg R$ etex) (a[2][1],a[3][3]) a[2][1].c..a[3][3].c;
	arrow.top (.5, btex $R$ etex)      (a[2][2],a[3][4]) a[2][2].c..a[3][4].c;
	arrow.top (.5, btex $\neg R$ etex) (a[2][2],a[3][5]) a[2][2].c..a[3][5].c;
	arrow.top (.5, btex $R$ etex)      (a[2][3],a[3][6]) a[2][3].c..a[3][6].c;
	arrow.top (.5, btex $\neg R$ etex) (a[2][3],a[3][7]) a[2][3].c..a[3][7].c;


endfig;
end.

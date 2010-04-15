input automata;
verbatimtex
        \documentclass{article}
        %\usepackage{slovak}
        \usepackage[slovak]{babel}
        \usepackage[utf8]{inputenc}
        \begin{document}
etex


prologues:=3;
beginfig(1);
	with spacing((5,25)) tree.a(4,3);
        node.a[0][0]("");

        node.a[1][0]("");
        node.a[1][1]("");
        node.a[1][2]("");
        
        node.a[2][0]("");
        node.a[2][1]("");
        node.a[2][2]("");
        node.a[2][3]("");
        node.a[2][5]("");
        node.a[2][6]("");
        node.a[2][8]("");
        
	node.a[3][0]("");
        node.a[3][2]("");
        node.a[3][3]("");
        node.a[3][5]("");
        node.a[3][9]("");
        node.a[3][11]("");
        node.a[3][15]("");
        node.a[3][17]("");

        arrow.top (.5, btex $P$ etex)      (a[0][0],a[1][0]) a[0][0].c..a[1][0].c;
        arrow.lft (.5, btex $Q$ etex) (a[0][0],a[1][1]) a[0][0].c..a[1][1].c;
        arrow.top (.5, btex $\neg P, \neg Q$ etex) (a[0][0],a[1][2]) a[0][0].c..a[1][2].c;
        

        arrow.lft (.5, btex $Q$ etex)      (a[1][0],a[2][0]) a[1][0].c..a[2][0].c;
        arrow.lft (.5, btex $R$ etex) (a[1][0],a[2][1]) a[1][0].c..a[2][1].c;
        arrow.rt (.5, btex $\neg Q, \neg R$ etex) (a[1][0],a[2][2]) a[1][0].c..a[2][2].c;
        
	arrow.lft (.5, btex $P$ etex)      (a[1][1],a[2][3]) a[1][1].c..a[2][3].c;
        arrow.rt (.5, btex $\neg P$ etex) (a[1][1],a[2][5]) a[1][1].c..a[2][5].c;
       
        arrow.lft (.5, btex $R$ etex) (a[1][2],a[2][6]) a[1][2].c..a[2][6].c;
        arrow.rt (.5, btex $\neg R$ etex) (a[1][2],a[2][8]) a[1][2].c..a[2][8].c;


        arrow.lft (.5, btex $R$ etex)      (a[2][0],a[3][0]) a[2][0].c..a[3][0].c;
        arrow.rt (.5, btex $\neg R$ etex) (a[2][0],a[3][2]) a[2][0].c..a[3][2].c;

	arrow.lft (.5, btex $Q$ etex)      (a[2][1],a[3][3]) a[2][1].c..a[3][3].c;
        arrow.rt (.5, btex $\neg Q$ etex) (a[2][1],a[3][5]) a[2][1].c..a[3][5].c;

        arrow.lft (.5, btex $R$ etex)      (a[2][3],a[3][9]) a[2][3].c..a[3][9].c;
        arrow.rt (.5, btex $\neg R$ etex) (a[2][3],a[3][11]) a[2][3].c..a[3][11].c;

        arrow.lft (.5, btex $R$ etex)      (a[2][5],a[3][15]) a[2][5].c..a[3][15].c;
        arrow.rt (.5, btex $\neg R$ etex) (a[2][5],a[3][17]) a[2][5].c..a[3][17].c;


endfig;


beginfig(2);
	with spacing((20,24)) tree.t(4,2);
	for a=0 upto 3:
	 	for b=0 upto (2**a)-1:
			node.t[a][b]("");
		endfor;
	endfor;

	arrow.top (.5, btex $\neg P(x)$ etex)	(t[0][0],t[1][0]) t[0][0].c..t[1][0].c;
	arrow.top (.5, btex $P(x)$ etex)	(t[0][0],t[1][1]) t[0][0].c..t[1][1].c;

	for i=0 upto 3:
	 	if (i mod 2 = 0):
			arrow.lft (.5, btex $\neg Q(f(x))$ etex)	(t[1][i div 2],t[2][i]) t[1][i div 2].c..t[2][i].c;
		else:
			arrow.rt (.5, btex $Q(f(x))$ etex)	(t[1][i div 2],t[2][i]) t[1][i div 2].c..t[2][i].c;
   		fi;
	endfor;

	for i=0 upto 7:
	 	if (i mod 2 = 0):
			arrow.ulft (.5, btex $\neg P(f(x))$ etex)	(t[2][i div 2],t[3][i]) t[2][i div 2].c..t[3][i].c;
		else:
			arrow.lrt (.5, btex $P(f(x))$ etex)	(t[2][i div 2],t[3][i]) t[2][i div 2].c..t[3][i].c;
   		fi;
	endfor;
endfig;

beginfig(3);
	with spacing((20,24)) tree.t(4,2);
	for a=0 upto 3:
	 	for b=0 upto (2**a)-1:
			node.t[a][b]("");
		endfor;
	endfor;

	arrow.top (.5, btex $\neg P$ etex)	(t[0][0],t[1][0]) t[0][0].c..t[1][0].c;
	arrow.top (.5, btex $P$ etex)	(t[0][0],t[1][1]) t[0][0].c..t[1][1].c;

	for i=0 upto 3:
	 	if (i mod 2 = 0):
			arrow.lft (.5, btex $\neg Q$ etex)	(t[1][i div 2],t[2][i]) t[1][i div 2].c..t[2][i].c;
		else:
			arrow.rt (.5, btex $Q$ etex)	(t[1][i div 2],t[2][i]) t[1][i div 2].c..t[2][i].c;
   		fi;
	endfor;

	for i=0 upto 7:
	 	if (i mod 2 = 0):
			arrow.lft (.5, btex $\neg R$ etex)	(t[2][i div 2],t[3][i]) t[2][i div 2].c..t[3][i].c;
		else:
			arrow.rt (.5, btex $R$ etex)	(t[2][i div 2],t[3][i]) t[2][i div 2].c..t[3][i].c;
   		fi;
	endfor;
endfig;

beginfig(4);
	with spacing((20,24)) tree.t(4,2);
	node.t[0][0]("");
	node.t[1][0]("");
	with shape(none) node.t[1][1](btex $\times$ etex);
	with shape(none) node.t[2][0](btex $\times$ etex);
	node.t[2][1]("");
	with shape(none) node.t[3][2](btex $\times$ etex);
	with shape(none) node.t[3][3](btex $\times$ etex);

	arrow.lft (.5, btex $P$ etex)	(t[0][0],t[1][0]) t[0][0].c..t[1][0].c;
	arrow.rt  (.5, btex $\neg P$ etex)	(t[0][0],t[1][1]) t[0][0].c..t[1][1].c;

	arrow.lft (.5, btex $Q$ etex)	(t[1][0],t[2][0]) t[1][0].c..t[2][0].c;
	arrow.rt  (.5, btex $\neg Q$ etex)	(t[1][0],t[2][1]) t[1][0].c..t[2][1].c;
	
	arrow.lft (.5, btex $R$ etex)	(t[2][1],t[3][2]) t[2][1].c..t[3][2].c;
	arrow.rt  (.5, btex $\neg R$ etex)	(t[2][1],t[3][3]) t[2][1].c..t[3][3].c;
endfig;

beginfig(5);
	with spacing((20,23)) tree.a(3,2);

	node.t[0][0]("");
	node.t[1][0]("");
	with shape(none) node.t[1][1](btex $\times$ etex);
	with shape(none) node.t[2][0](btex $\times$ etex);
	with shape(none) node.t[2][1](btex $\times$ etex);

	arrow.lft(0.5, btex $P(a)$ etex) (t[0][0],t[1][0]) t[0][0].c..t[1][0].c;
	arrow.rt(0.5, btex $\neg P(a)$ etex) (t[0][0],t[1][1]) t[0][0].c..t[1][1].c;
	arrow.lft(0.5, btex $Q(f(a))$ etex) (t[1][0],t[2][0]) t[1][0].c..t[2][0].c;
	arrow.rt(0.5, btex $\neg Q(f(a))$ etex) (t[1][0],t[2][1]) t[1][0].c..t[2][1].c;
endfig;

beginfig(6);
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

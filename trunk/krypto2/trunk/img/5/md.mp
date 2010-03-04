
input automata;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
beginfig(1);


size:=20;

pair downright,upright;
downright=(1,-1);
upright=(1,1);

with spacing ((70,50)) matrix.a(2,10);

% zaciatok
node.a[1][0](btex $IV$ etex);
node.a[1][1](btex $h_1$ etex);
node.a[1][2](btex $h_2$ etex);
node.a[1][3](btex $h_3$ etex);

node.a[1][5](btex $h_{l-1}$ etex);
node.a[1][6](btex $h_{l}$ etex);
node_hidden.a[1][4](btex $\cdots\cdots$ etex);


arrow.top(0.5, btex $m_1$ etex)(a[1][0],a[1][1]) a[1][0].c{upright}..a[1][1].c;
arrow.top(0.5, btex $m_2$ etex)(a[1][1],a[1][2]) a[1][1].c{upright}..a[1][2].c;
arrow.top(0.5, btex $m_3$ etex)(a[1][2],a[1][3]) a[1][2].c{upright}..a[1][3].c;

arrow_dash.top(0.5, btex etex)(a[1][3],a[1][4]) a[1][3].c{upright}..a[1][4].c;

arrow_dash.top(0.5, btex etex)(a[1][4],a[1][5]) a[1][4].c{upright}..a[1][5].c;


arrow.top(0.5, btex $m_l$ etex)(a[1][5],a[1][6]) a[1][5].c{upright}..a[1][6].c;

endfig;
end

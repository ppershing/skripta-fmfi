input boxes;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

beginfig(1);

boxjoin(a.se=b.sw; a.ne=b.nw);


boxit.prev(btex $\cdots$ etex);
boxit.s(btex $x_{2^i}$ etex);
boxit.s1(btex $x_{2^i+1}$ etex);
boxit.s2(btex $x_{2^i+1}$ etex);
boxit.sskip(btex $\cdots$ etex);
boxit.send1(btex $x_{2^{i+1}-1}$ etex);
boxit.send(btex $x_{2^{i+1}}$ etex);
boxit.send2(btex $x_{2^{i+1}+1}$ etex);
boxit.next(btex $\cdots$ etex);

%velke okraje okolo pisma
interim defaultdx:=7;
interim defaultdy:=10;

drawboxed(prev,s,s1,s2,sskip,send1,send,send2,next);
% hlavne sipky
drawarrow s.s{down} .. {curl0}s1.s;
drawarrow s.s{down} .. {curl0}s2.s;

drawarrow s.s{down} .. {curl0}sskip.s dashed evenly;

drawarrow s.s{down} .. {curl0}send1.s;
drawarrow s.s{down} .. {curl0}send.s;

% posledne sipky
drawarrow send.s{down} .. {curl0}send2.s;
drawarrow send.s{down} .. {curl0}next.s dashed evenly;

% prva sipka
drawarrow prev.sw - (5,3){down} .. {curl0}s.s dashed evenly;



endfig;
end;

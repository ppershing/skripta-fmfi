input automata;

prologues:=3;
verbatimtex
    %&latex
    \documentclass{minimal}
    \begin{document}
etex

beginfig(1);

gridx:=18;
with spacing ((gridx,60)) matrix.a(10,25);
   
% zaciatok
sep := 7;

fixedboxwidth:=gridx*4;
fixedboxheight:=20;
node_fixed.a[4][sep](btex Plaintex heslo etex);
node_fixed.a[5][sep](btex Widechar heslo etex);
node_fixed.a[5][2*sep](btex Hex64 hash etex);
node_fixed.a[5][3*sep](btex Wide hash etex);

fixedboxwidth:=gridx*2;
node_fixed.a[6][3*sep-1](btex 1/2 etex);
node_fixed.a[6][3*sep+1](btex  etex);

fixedboxwidth:=gridx*4.5;
node_rfixed.a[7][3*sep-1](btex $x == fixed const?$ etex);

fixedboxwidth:=30; fixedboxheight:=15;
node_fixed.a[8][3*sep-3](btex Allow etex);
node_fixed.a[8][3*sep+1](btex Deny etex);


arrow.rt(0.5, btex $ToWide()$ etex) 
    (a[4][sep], a[5][sep]) a[4][sep].c -- a[5][sep].c;
arrow.bot(0.5, btex $MD5()$ etex)
    (a[5][sep], a[5][2*sep]) a[5][sep].c -- a[5][2*sep].c;
arrow.bot(0.5, btex $ToWide()$ etex)
    (a[5][2*sep], a[5][3*sep]) a[5][2*sep].c -- a[5][3*sep].c;

arrow.lft(0.7, btex $First\ n/2\ bits()$ etex)
    (a[5][3*sep], a[6][3*sep-1]) a[5][3*sep].c-(gridx,0) --
    a[6][3*sep-1].c;

arrow.lft(0.5, btex  etex)
    (a[6][3*sep-1], a[7][3*sep-1]) a[6][3*sep-1].c -- a[7][3*sep-1].c;

arrow.lft(0.5, btex Yes\phantom{ } etex)
    (a[7][3*sep-1], a[8][3*sep-3]) a[7][3*sep-1].c -- a[8][3*sep-3].c;

arrow.rt(0.5, btex \phantom{ }No etex)
    (a[7][3*sep-1], a[8][3*sep+1]) a[7][3*sep-1].c -- a[8][3*sep+1].c;
endfig;
end




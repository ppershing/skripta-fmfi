input automata;

prologues:=3;
verbatimtex
    %&latex
    \documentclass{minimal}
    \begin{document}
etex


beginfig(1);
    size:=22;

    pair upright;
    upright=(1,1);

    with spacing ((70,50)) matrix.a(2,5);

    node.a[1][0](btex $p$ etex);
    node.a[1][1](btex $0$ etex);
    node.a[1][2](btex $z$ etex);
    node.a[1][3](btex $c$ etex);

    arrow.top(0.5, btex $E_{k_1}$ etex)(a[1][0], a[1][1])
                a[1][0].c{upright} .. a[1][1].c;

    arrow.top(0.5, btex $D_{k_2}$ etex)(a[1][1], a[1][2])
                a[1][1].c{upright} .. a[1][2].c;

    arrow.top(0.5, btex $E_{k_1}$ etex)(a[1][2], a[1][3])
                a[1][2].c{upright} .. a[1][3].c;
endfig;

beginfig(2);
    size:=22;

    pair downleft;
    downleft=(-1,-1);

    with spacing ((70,50)) matrix.a(2,5);

    node.a[1][0](btex $p$ etex);
    node.a[1][1](btex $0$ etex);
    node.a[1][2](btex $z$ etex);
    node.a[1][3](btex $c$ etex);

    arrow.bot(0.5, btex $D_{k_1}$ etex)(a[1][1], a[1][0])
                a[1][1].c{downleft} .. a[1][0].c;

    arrow.top(0.5, btex $TE_{k_1,k_2}$ etex)(a[1][0], a[1][3])
                a[1][0].c{(1,0.7)} .. a[1][3].c;

    arrow.bot(0.5, btex $E_{k_1}$ etex)(a[1][3], a[1][2])
                a[1][3].c{downleft} .. a[1][2].c;

    arrow_dash.bot(0.5, btex $k_2 =\, ?$ etex)(a[1][2], a[1][1])
                a[1][2].c{downleft} .. a[1][1].c;
endfig;

end

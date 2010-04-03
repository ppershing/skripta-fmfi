input automata;
prologues:=3;
verbatimtex
    %&latex
    \documentclass{minimal}
    \begin{document}
etex

beginfig(1);
    size:=25;
    loopsize:=25;
    with spacing((26,29)) matrix.a(7,10);

    % q_0
    node.a[4][0](btex $q_0$ etex);
    loop_cw.bot(0.5, btex $v \in N \cup T$ etex) (a[4][0]) -120;
    incominglength:=50;
    incoming.top(0.5, btex etex) (a[4][0]) 150;

    % q_f
    node_double.a[4][6](btex $q_F$ etex);
    loop_cw.bot(0.7, btex $v \in N \cup T$ etex) (a[4][6]) -30;

    arrow.top(.5, btex $a_1, u_1$ etex) (a[4][0], a[4][6])
            a[4][0].c{(1,1)}..a[4][6].c;

    arrow.top(.5, btex $a_2, u_2$ etex) (a[4][0], a[4][6])
            a[4][0].c{(1,0.5)}..a[4][6].c;

    arrow.bot(.5, btex $a_n, u_n$ etex) (a[4][0], a[4][6])
            a[4][0].c{(1,-1)}..a[4][6].c;

   draw ((0,-5) + point 0.5 of (a[4][0].c{(1,0.5)}..a[4][6].c)) --
        ((0,5) + point 0.5 of (a[4][0].c{(1,-1)}..a[4][6].c)) dashed evenly
        withpen pencircle scaled 0.6;
endfig;

end;

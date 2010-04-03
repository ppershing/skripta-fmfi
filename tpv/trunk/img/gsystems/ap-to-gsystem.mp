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
    with spacing((36,29)) matrix.a(7,10);

    % q_0
    node.a[4][0](btex $q_0$ etex);
    loop_cw.bot(0.5, btex $t \in T$ etex) (a[4][0]) -120;
    incominglength:=50;
    incoming.top(0.5, btex etex) (a[4][0]) 150;

    % q_f
    node_double.a[4][8](btex $q_F$ etex);
    loop_cw.rt(0.5, btex $t \in T$ etex) (a[4][8]) -30;

    size:=15;
    loopsize:=15;

    for i=1 upto 4:
        node.a[3][i](btex etex);
        loop_cw.bot(0.5, btex $t \in T$ etex) (a[3][i]) -60;
    endfor;

    size:=20;
    node_hidden.a[3][5](btex $\cdots$ etex);
    size:=15;

    for i=6 upto 7:
        node.a[3][i](btex etex);
        loop_cw.bot(0.5, btex $t \in T$ etex) (a[3][i]) -60;
    endfor;

    arrow.lft(0.5, btex $A_1,w_1$ etex) (a[4][0], a[3][1])
            a[4][0].c{(0,2)} .. a[3][1].c;

    arrow.top(0.5, btex $A_2,w_2$ etex) (a[3][1], a[3][2])
            a[3][1].c{(1,2)} .. a[3][2].c;

    arrow.top(0.5, btex $A_3,w_3$ etex) (a[3][2], a[3][3])
            a[3][2].c{(1,2)} .. a[3][3].c;

    arrow.top(0.5, btex $A_4,w_4$ etex) (a[3][3], a[3][4])
            a[3][3].c{(1,2)} .. a[3][4].c;

    arrow.top(0.5, btex etex) (a[3][4], a[3][5])
            a[3][4].c{(1,2)} .. a[3][5].c;
    
    arrow.top(0.5, btex etex) (a[3][5], a[3][6])
            a[3][5].c{(1,2)} .. a[3][6].c;


    arrow.top(0.5, btex $A_{k-1},w_{k-1}$ etex) (a[3][6], a[3][7])
            a[3][6].c{(1,2)} .. a[3][7].c;

    arrow.rt(0.5, btex $A_{k},w_{k}$ etex) (a[3][7], a[4][8])
            a[3][7].c{(1,2)} .. {curl0}a[4][8].c;


    % spodne ciarkovane sipky
    arrow_dash.bot(.5, btex etex) (a[4][0], a[4][8])
            a[4][0].c{(1,-0.2)}..a[4][8].c;

    arrow_dash.bot(.5, btex etex) (a[4][0], a[4][8])
            a[4][0].c{(1,-1)}..a[4][8].c;

   draw ((0,-5) + point 0.5 of (a[4][0].c{(1,-0.2)}..a[4][8].c)) --
        ((0,5) + point 0.5 of (a[4][0].c{(1,-1)}..a[4][8].c)) dashed evenly
        withpen pencircle scaled 0.6;

endfig;

end;

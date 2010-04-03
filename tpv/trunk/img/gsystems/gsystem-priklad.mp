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
    loop_cw.top(0.5, btex $a,a$ etex) (a[4][0]) 110;
    loop_cw.bot(0.5, btex $b,b$ etex) (a[4][0]) -120;
    incominglength:=50;
    incoming.top(0.5, btex etex) (a[4][0]) 170;

    % q_f
    node_double.a[4][8](btex $q_F$ etex);
    loop_cw.top(0.5, btex $a,a$ etex) (a[4][8]) 45;
    loop_cw.bot(0.5, btex $b,b$ etex) (a[4][8]) -75;

    size:=15;
    loopsize:=12;

    node.a[3][4](btex $q_1$ etex);
    node.a[4][4](btex $q_2$ etex);
    node.a[5][4](btex $q_3$ etex);
    node.a[6][4](btex $q_4$ etex);

    for i:=3 upto 6:
        loop_cw.top(0.5, btex $a,a$ etex) (a[i][4]) 135;
        loop_cw.top(0.5, btex $b,b$ etex) (a[i][4]) 45;
    endfor;



    arrow.top(0.5, btex $S, AA$ etex) (a[4][0], a[4][8])
            a[4][0].c{(1,1)} .. a[4][8].c;
    % 1
    arrow.top(0.5, btex $A, aA$ etex) (a[4][0], a[3][4])
            a[4][0].c{(1,0.5)} .. a[3][4].c;
    arrow.top(0.5, btex $A, aA$ etex) (a[3][4], a[4][8])
            a[3][4].c{(1,0)} .. a[4][8].c;
    % 2
    arrow.top(0.5, btex $A, bA$ etex) (a[4][0], a[4][4])
            a[4][0].c{(1,0)} .. a[4][4].c;
    arrow.top(0.5, btex $A, bA$ etex) (a[4][4], a[4][8])
            a[4][4].c{(1,0)} .. a[4][8].c;
    % 3
    arrow.top(0.5, btex $A, a$ etex) (a[4][0], a[5][4])
            a[4][0].c{(1,-0.5)} .. a[5][4].c;
    arrow.top(0.5, btex $A, a$ etex) (a[5][4], a[4][8])
            a[5][4].c{(1,0)} .. a[4][8].c;
    % 4
    arrow.top(0.5, btex $A, b$ etex) (a[4][0], a[6][4])
            a[4][0].c{(1,-1)} .. a[6][4].c;
    arrow.top(0.5, btex $A, b$ etex) (a[6][4], a[4][8])
            a[6][4].c{(1,0)} .. a[4][8].c;
endfig;

end;

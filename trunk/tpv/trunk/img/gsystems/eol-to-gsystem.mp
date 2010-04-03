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
    node_double.a[0][0](btex $q_0$ etex);
    incominglength:=50;
    incoming.top(0.5, btex etex) (a[0][0]) 150;

    loop_cw.top(0.5, btex $a_1,u_1$ etex) (a[0][0]) 90;
    loop_cw.bot(0.5, btex $a_n,u_n$ etex) (a[0][0]) -90;

    r:=15;
    draw (1, 1.41)*r .. (2, 0)*r .. (1, -1.41)*r dashed evenly;
endfig;

end;

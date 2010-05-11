input automata;

prologues:=3;

verbatimtex
    \documentclass{minimal}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

% settings for some global parameters
size := 15;

beginfig(1);
        with spacing((10,40)) tree.a(2,4);
        node.a[0][0](btex $v$ etex);

        node.a[1][0](btex $v_1$ etex);
        node.a[1][1](btex $v_2$ etex);
        node_hidden.a[1][2](btex $\dots$ etex);
        node.a[1][3](btex $v_n$ etex);
        arrow(0.5, "") (a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;
        arrow(0.5, "") (a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;
        arrow(0.5, "") (a[0][0], a[1][2]) a[0][0].c -- a[1][2].c;
        arrow(0.5, "") (a[0][0], a[1][3]) a[0][0].c -- a[1][3].c;
        % sipka zhora
        sx = 20 + xpart a[0][0].c;
        sy = 30 + ypart a[0][0].c;
        put.s(sx,sy);
        node_hidden.s("");
        arrow(0.5, "") ( s, a[0][0]) s.c -- a[0][0].c;
endfig;

end.

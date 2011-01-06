input automata;

prologues:=3;

verbatimtex
    \documentclass{article}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

% settings for some global parameters
size := 20;


beginfig(1);
    with spacing((30,40)) tree.a(3,2);
    node.a[0][0](btex $P()$ etex);
    node.a[1][0](btex $x$ etex);
    node.a[1][1](btex $f()$ etex);
    node.a[2][2](btex $y$ etex);
    node.a[2][3](btex $z$ etex);

    arrow(0.5, "")(a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;
    arrow(0.5, "")(a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;
    arrow(0.5, "")(a[1][1], a[2][2]) a[1][1].c -- a[2][2].c;
    arrow(0.5, "")(a[1][1], a[2][3]) a[1][1].c -- a[2][3].c;

    margin=15;
    draw a[1][1].c + (0,margin) .. a[2][2].c + (-margin,0) ..
         (a[2][2].c + a[2][3].c)*0.5 + (0,-margin) .. 
         a[2][3].c + (margin,0) .. cycle dashed evenly;
endfig;

beginfig(2);
    with spacing((30,40)) tree.a(3,2);
    node.a[0][0](btex $P()$ etex);
    node.a[1][0](btex $x$ etex);
    node.a[1][1](btex $a$ etex);

    arrow(0.5, "")(a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;
    arrow(0.5, "")(a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;

    draw a[1][1].c + (0,margin) .. a[1][1].c + (-margin,0) ..
         a[1][1].c + (margin,0) .. cycle dashed evenly;
endfig;

beginfig(3);
    with spacing((0.5, 40)) tree.a(5,3);
    node.a[0][0](btex $P()$ etex);
    node.a[1][0](btex $x$ etex);
    node.a[1][2](btex $g()$ etex);
    node.a[2][7](btex $h()$ etex);
    node.a[3][22](btex $k()$ etex);
    node.a[4][67](btex $x$ etex);
    arrow(0.5, "")(a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;
    arrow(0.5, "")(a[0][0], a[1][2]) a[0][0].c -- a[1][2].c;
    arrow(0.5, "")(a[1][2], a[2][7]) a[1][2].c -- a[2][7].c;
    arrow(0.5, "")(a[2][7], a[3][22]) a[2][7].c -- a[3][22].c;
    arrow(0.5, "")(a[3][22], a[4][67]) a[3][22].c -- a[4][67].c;

    draw a[1][2].c + (0,margin) .. 
        (a[2][7].c+a[3][22].c)*0.5+(-1.5*margin,0) ..
        a[4][67].c + (0,-margin) ..
        (a[3][22].c+a[2][7].c)*0.5+(1.5*margin,0) .. cycle dashed evenly;
endfig;

beginfig(11);
    with spacing((2,40)) tree.a(4,3);
    node.a[0][0](btex $P()$ etex);
    node.a[1][0](btex $a$ etex);
    node.a[1][1](btex $f()$ etex);
    node.a[1][2](btex $f()$ etex);
    node.a[2][4](btex $a$ etex);
    node.a[2][7](btex $g()$ etex);
    node.a[3][22](btex $y$ etex);

    arrow(0.5, "")(a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;
    arrow(0.5, "")(a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;
    arrow(0.5, "")(a[0][0], a[1][2]) a[0][0].c -- a[1][2].c;
    arrow(0.5, "")(a[1][1], a[2][4]) a[1][1].c -- a[2][4].c;
    arrow(0.5, "")(a[1][2], a[2][7]) a[1][2].c -- a[2][7].c;
    arrow(0.5, "")(a[2][7], a[3][22]) a[2][7].c -- a[3][22].c;

    draw a[2][7].c + (0,margin) ..
        (a[2][7].c + a[3][22].c)*0.5 + (-margin,0) ..
        a[3][22].c + (0,-margin) ..
        (a[2][7].c + a[3][22].c)*0.5 + (margin,0) .. cycle dashed evenly;

endfig;

beginfig(12);
    with spacing((2,40)) tree.a(4,3);
    node.a[0][0](btex $P()$ etex);
    node.a[1][0](btex $a$ etex);
    node.a[1][1](btex $f()$ etex);
    node.a[1][2](btex $f()$ etex);
    node.a[2][4](btex $a$ etex);
    node.a[2][7](btex $u$ etex);

    arrow(0.5, "")(a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;
    arrow(0.5, "")(a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;
    arrow(0.5, "")(a[0][0], a[1][2]) a[0][0].c -- a[1][2].c;
    arrow(0.5, "")(a[1][1], a[2][4]) a[1][1].c -- a[2][4].c;
    arrow(0.5, "")(a[1][2], a[2][7]) a[1][2].c -- a[2][7].c;

    draw a[2][7].c + (0,margin) ..
        a[2][7].c + (-margin,0) ..
        a[2][7].c + (0,-margin) ..
        a[2][7].c + (margin,0) .. cycle dashed evenly;

endfig;
end.

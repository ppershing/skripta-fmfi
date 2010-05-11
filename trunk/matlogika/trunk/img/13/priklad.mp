input automata;

prologues:=3;

verbatimtex
    \documentclass{article}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

% settings for some global parameters
size := 10;

def nodes_for_level(suffix a)(expr level)=
    for tmp=0 upto (2**level) -1:
        node.a[level][tmp]("");
    endfor;
enddef;

beginfig(1);
%%% {{{
    with spacing((30,25)) tree.a(3,2);

    nodes_for_level(a, 0);
    nodes_for_level(a, 1);
    nodes_for_level(a, 2);

    % level 0->1
    arrow.top(.5, btex $P$ etex)
        (a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;

    arrow.top(.5, btex $\neg P$ etex)
        (a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;

    %level 1->2
    for i = 0 upto 1:
        arrow.lft(.5, btex $Q$ etex)
            (a[1][i], a[2][2*i]) a[1][i].c -- a[2][2*i].c;

        arrow.rt (.5, btex $\neg Q$ etex)
            (a[1][i], a[2][2*i+1]) a[1][i].c -- a[2][2*i+1].c;
    endfor;
%%% }}}
endfig;

beginfig(2);
    with spacing((30,25)) tree.a(3,2);
    node.a[0][0]("");
    node.a[1][0]("");
    node.a[1][1](btex $\times$ etex);
    node.a[2][0](btex $\times$ etex);
    node.a[2][1](btex $\times$ etex);

    % level 0->1
    arrow.top(.5, btex $P$ etex)
        (a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;

    arrow.top(.5, btex $\neg P$ etex)
        (a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;

    % level 1->2
    arrow.lft(.5, btex $Q$ etex)
        (a[1][0], a[2][0]) a[1][0].c -- a[2][0].c;

    arrow.rt (.5, btex $\neg Q$ etex)
        (a[1][0], a[2][1]) a[1][0].c -- a[2][1].c;


    pair off;
    off = (0, -7);
    label.bot(btex $\neg P \lor \neg Q$ etex, a[2][0].c + off);
    label.bot(btex $\neg P \lor Q$ etex, a[2][1].c + off);
    label.bot(btex $P$ etex, a[1][1].c + off);
endfig;

beginfig(3);
    with spacing((30,25)) tree.a(3,2);
    node.a[0][0]("");
    node.a[1][0](btex $\times$ etex);
    node.a[1][1](btex $\times$ etex);

    % level 0->1
    arrow.top(.5, btex $P$ etex)
        (a[0][0], a[1][0]) a[0][0].c -- a[1][0].c;

    arrow.top(.5, btex $\neg P$ etex)
        (a[0][0], a[1][1]) a[0][0].c -- a[1][1].c;

    pair off;
    off = (0, -7);
    label.bot(btex $\neg P$ etex, a[1][0].c + off);
    label.bot(btex $P$ etex, a[1][1].c + off);

endfig;

beginfig(4);
    with spacing((30,25)) tree.a(3,2);
    node.a[0][0](btex $\times$ etex);

    pair off;
    off = (0, -7);
    label.bot(btex $\varepsilon$ etex, a[0][0].c + off);

endfig;

end.

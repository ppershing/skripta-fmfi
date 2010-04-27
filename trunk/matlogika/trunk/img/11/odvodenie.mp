input automata;

prologues:=3;

verbatimtex
    \documentclass{article}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

% settings for some global parameters
size := 7;

def nodes_for_level(suffix a)(expr level)=
    for tmp=0 upto (2**level) -1:
        node.a[level][tmp]("");
    endfor;
enddef;

beginfig(1);
    with spacing((30,-30)) tree.a(3,2);

    nodes_for_level(a, 0);
    nodes_for_level(a, 1);
    nodes_for_level(a, 2);

    % level 0->1
    for i = 0 upto 1:
        arrow(.5, "")
            (a[1][i], a[0][0]) a[1][i].c -- a[0][0].c;

        arrow(.5, "")
            (a[2][2*i], a[1][i]) a[2][2*i].c -- a[1][i].c;

        arrow(.5, "")
            (a[2][2*i+1], a[1][i]) a[2][2*i+1].c -- a[1][i].c;
    endfor;

    label.bot(btex $\varepsilon$ etex, a[0][0].c + (0,-5));
    label.lft(btex $Q$ etex, a[1][0].c + (-5,0));
    label.rt (btex $\neg Q$ etex, a[1][1].c + (5,0));
    label.top(btex $P \lor Q$ etex, a[2][0].c + (0,5));
    label.top(btex $\neg P \lor Q$ etex, a[2][1].c +(0,5));
    label.top(btex $P \lor \neg Q$ etex, a[2][2].c +(0,5));
    label.top(btex $\neg P \lor \neg Q$ etex, a[2][3].c +(0,5));


endfig;

end.

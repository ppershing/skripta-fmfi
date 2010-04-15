input automata;

prologues:=3;

verbatimtex
    \documentclass{minimal}
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

%%% priklad 1
beginfig(11);
%%% {{{
    with spacing((20,23)) tree.a(3,2);

    nodes_for_level(a, 0);
    nodes_for_level(a, 1);
    nodes_for_level(a, 2);

    % level 0->1
    arrow.lft(.5, btex $P$ etex)
        (a[0][0], a[1][0]) a[0][0].c .. a[1][0].c;

    arrow.rt (.5, btex $\neg P$ etex)
        (a[0][0], a[1][1]) a[0][0].c .. a[1][1].c;

    %level 1->2
    for i = 0 upto 1:
        arrow.lft(.5, btex $Q$ etex)
            (a[1][i], a[2][2*i]) a[1][i].c .. a[2][2*i].c;

        arrow.rt (.5, btex $\neg Q$ etex)
            (a[1][i], a[2][2*i+1]) a[1][i].c .. a[2][2*i+1].c;
    endfor;
%%% }}}
endfig;

% priklad 2

beginfig(21);
%%% {{{
    with spacing((20,23)) tree.a(4,2);

    nodes_for_level(a, 0);
    nodes_for_level(a, 1);
    nodes_for_level(a, 2);
    nodes_for_level(a, 3);

    % level 0->1
    arrow.lft(.5, btex $P$ etex)
            (a[0][0], a[1][0]) a[0][0].c .. a[1][0].c;

    arrow.rt (.5, btex $\neg P$ etex)
            (a[0][0], a[1][1]) a[0][0].c .. a[1][1].c;

    % level 1->2
    arrow.lft(.5, btex $Q$ etex)
            (a[1][0], a[2][0]) a[1][0].c .. a[2][0].c;

    arrow.rt (.5, btex $\neg Q$ etex)
            (a[1][0], a[2][1]) a[1][0].c .. a[2][1].c;

    arrow.lft(.5, btex $Q$ etex)
            (a[1][1], a[2][2]) a[1][1].c .. a[2][2].c;

    arrow.rt (.5, btex $\neg Q$ etex)
            (a[1][1], a[2][3]) a[1][1].c .. a[2][3].c;

    % level 2->3
    arrow.lft(.5, btex $R$ etex)
            (a[2][0], a[3][0]) a[2][0].c .. a[3][0].c;

    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][0], a[3][1]) a[2][0].c .. a[3][1].c;

    arrow.lft(.5, btex $R$ etex)
            (a[2][1], a[3][2]) a[2][1].c .. a[3][2].c;

    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][1], a[3][3]) a[2][1].c .. a[3][3].c;

    arrow.lft(.5, btex $R$ etex)
            (a[2][2], a[3][4]) a[2][2].c .. a[3][4].c;

    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][2], a[3][5]) a[2][2].c .. a[3][5].c;

    arrow.lft(.5, btex $R$ etex)
            (a[2][3], a[3][6]) a[2][3].c .. a[3][6].c;

    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][3], a[3][7]) a[2][3].c .. a[3][7].c;
%%% }}}
endfig;

beginfig(22);
%%% {{{
    with spacing((5,25)) tree.a(4,3);
    node.a[0][0]("");

    node.a[1][0]("");
    node.a[1][1]("");
    node.a[1][2]("");

    node.a[2][0]("");
    node.a[2][1]("");
    node.a[2][2]("");
    node.a[2][3]("");
    node.a[2][5]("");
    node.a[2][6]("");
    node.a[2][8]("");

    node.a[3][0]("");
    node.a[3][2]("");
    node.a[3][3]("");
    node.a[3][5]("");
    node.a[3][9]("");
    node.a[3][11]("");
    node.a[3][15]("");
    node.a[3][17]("");


    % level 0->1
    arrow.lft(.5, btex $P$ etex)
            (a[0][0], a[1][0]) a[0][0].c .. a[1][0].c;

    arrow.lft(.5, btex $Q$ etex)
            (a[0][0], a[1][1]) a[0][0].c .. a[1][1].c;

    arrow.rt (.5, btex $\neg P, \neg Q$ etex)
            (a[0][0], a[1][2]) a[0][0].c .. a[1][2].c;

    % level 1->2

    % lava cast
    arrow.lft (.5, btex $Q$ etex)
            (a[1][0], a[2][0]) a[1][0].c .. a[2][0].c;

    arrow.lft (.5, btex $R$ etex)
            (a[1][0], a[2][1]) a[1][0].c .. a[2][1].c;

    arrow.rt (.5, btex $\neg Q, \neg R$ etex)
            (a[1][0], a[2][2]) a[1][0].c .. a[2][2].c;
    % stredna cast
    arrow.lft (.5, btex $P$ etex)
            (a[1][1], a[2][3]) a[1][1].c .. a[2][3].c;

    arrow.rt (.5, btex $\neg P$ etex)
            (a[1][1], a[2][5]) a[1][1].c .. a[2][5].c;
    % prava cast
    arrow.lft (.5, btex $R$ etex)
            (a[1][2], a[2][6]) a[1][2].c .. a[2][6].c;

    arrow.rt (.5, btex $\neg R$ etex)
            (a[1][2], a[2][8]) a[1][2].c .. a[2][8].c;

    % level 2->3
    % lava 1
    arrow.lft (.5, btex $R$ etex)
            (a[2][0], a[3][0]) a[2][0].c .. a[3][0].c;

    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][0], a[3][2]) a[2][0].c .. a[3][2].c;
    % lava 2
    arrow.lft (.5, btex $Q$ etex)
            (a[2][1], a[3][3]) a[2][1].c .. a[3][3].c;

    arrow.rt (.5, btex $\neg Q$ etex)
            (a[2][1], a[3][5]) a[2][1].c .. a[3][5].c;
    % stredna 1
    arrow.lft (.5, btex $R$ etex)
            (a[2][3], a[3][9]) a[2][3].c .. a[3][9].c;
    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][3], a[3][11]) a[2][3].c .. a[3][11].c;
    % stredna 2
    arrow.lft (.5, btex $R$ etex)
            (a[2][5], a[3][15]) a[2][5].c .. a[3][15].c;
    arrow.rt (.5, btex $\neg R$ etex)
            (a[2][5], a[3][17]) a[2][5].c .. a[3][17].c;
%%% }}}
endfig;

% priklad ?

beginfig(31);
%%% {{{
    with spacing((20,24)) tree.t(5,2);
    for i=0 upto 3:
        for j=0 upto (2**i)-1:
            node.t[i][j]("");
        endfor;
    endfor;

    for j=0 upto (2**4)-1:
        node_hidden.t[4][j]("");
    endfor;

    % level 0->1
    arrow.lft(.5, btex $\neg P(a)$ etex)
            (t[0][0], t[1][0]) t[0][0].c .. t[1][0].c;

    arrow.rt (.5, btex $P(a)$ etex)
            (t[0][0],t[1][1]) t[0][0].c .. t[1][1].c;

    % level 1->2
    for i=0 upto 3:
        if (i mod 2 = 0):
            arrow.lft (.5, btex $\neg Q(f(a))$ etex)
        else:
            arrow.rt (.5, btex $Q(f(a))$ etex)
        fi
        % poznamka - toto je zvysok tych arrow prikazov
        (t[1][i div 2], t[2][i]) t[1][i div 2].c .. t[2][i].c;
    endfor;

    % level 2->3
    for i=0 upto 7:
        if (i mod 2 = 0):
            arrow.ulft (.5, btex $\neg P(f(x))$ etex)
        else:
            arrow.lrt (.5, btex $P(f(x))$ etex)
        fi
        % opat pokracovanie prikazu
        (t[2][i div 2], t[3][i]) t[2][i div 2].c .. t[3][i].c;
    endfor;

    % level 3- ->
    for i=0 upto 15:
        arrow_dash(.5, btex etex)
            (t[3][i div 2], t[4][i]) t[3][i div 2].c .. t[4][i].c;
    endfor;
%%% }}}
endfig;

% priklad ?
beginfig(41);
%%% {{{
    with spacing((20,24)) tree.t(4,2);
    for a=0 upto 3:
        for b=0 upto (2**a)-1:
            node.t[a][b]("");
        endfor;
    endfor;

    % level 0->1
    arrow.lft(.5, btex $\neg P$ etex)
            (t[0][0], t[1][0]) t[0][0].c .. t[1][0].c;
    arrow.rt (.5, btex $P$ etex)
            (t[0][0], t[1][1]) t[0][0].c .. t[1][1].c;

    % level 1->2
    for i=0 upto 3:
        if (i mod 2 = 0):
            arrow.lft (.5, btex $\neg Q$ etex)
        else:
            arrow.rt (.5, btex $Q$ etex)
        fi
        (t[1][i div 2],t[2][i]) t[1][i div 2].c..t[2][i].c;
    endfor;

    % level 2->3
    for i=0 upto 7:
        if (i mod 2 = 0):
            arrow.lft (.5, btex $\neg R$ etex)
        else:
            arrow.rt (.5, btex $R$ etex)
        fi
        (t[2][i div 2],t[3][i]) t[2][i div 2].c..t[3][i].c;
    endfor;
%%% }}}
endfig;

beginfig(42);
%%% {{{
    with spacing((20,24)) tree.t(4,2);
    node.t[0][0]("");
    node.t[1][0]("");
    node_hidden.t[1][1](btex $\times$ etex);
    node_hidden.t[2][0](btex $\times$ etex);
    node.t[2][1]("");
    node_hidden.t[3][2](btex $\times$ etex);
    node_hidden.t[3][3](btex $\times$ etex);

    arrow.lft (.5, btex $P$ etex)
            (t[0][0], t[1][0]) t[0][0].c .. t[1][0].c;

    arrow.rt  (.5, btex $\neg P$ etex)
            (t[0][0], t[1][1]) t[0][0].c .. t[1][1].c;



    arrow.lft (.5, btex $Q$ etex)
            (t[1][0], t[2][0]) t[1][0].c .. t[2][0].c;

    arrow.rt  (.5, btex $\neg Q$ etex)
            (t[1][0], t[2][1]) t[1][0].c .. t[2][1].c;



    arrow.lft (.5, btex $R$ etex)
            (t[2][1], t[3][2]) t[2][1].c .. t[3][2].c;

    arrow.rt  (.5, btex $\neg R$ etex)
            (t[2][1], t[3][3]) t[2][1].c .. t[3][3].c;
%%% }}}
endfig;

% priklad ?
beginfig(51);
%%% {{{
    with spacing((20,23)) tree.a(3,2);

    node.t[0][0]("");
    node.t[1][0]("");
    node_hidden.t[1][1](btex $\times$ etex);
    node_hidden.t[2][0](btex $\times$ etex);
    node_hidden.t[2][1](btex $\times$ etex);

    arrow.lft(0.5, btex $P(a)$ etex)
            (t[0][0], t[1][0]) t[0][0].c .. t[1][0].c;
    label.bot(btex neplatí $\neg P \lor \neg Q$ etex, t[1][0].c);

    arrow.rt(0.5, btex $\neg P(a)$ etex)
            (t[0][0], t[1][1]) t[0][0].c .. t[1][1].c;
    label.bot(btex neplatí $\neg P \lor \neg R$ etex, t[1][1].c);

    arrow.lft(0.5, btex $Q(f(a))$ etex)
            (t[1][0], t[2][0]) t[1][0].c .. t[2][0].c;
    label.bot(btex neplatí $Q \lor R$ etex, t[1][0].c);

    arrow.rt(0.5, btex $\neg Q(f(a))$ etex)
            (t[1][0], t[2][1]) t[1][0].c .. t[2][1].c;
    label.bot(btex neplatí $P$ etex, t[1][0].c);
%%% }}}
endfig;

end.

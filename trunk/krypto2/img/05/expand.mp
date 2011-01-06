
input automata;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
beginfig(1);
%%% {{{
    size:=22;

    pair downright,upright;
    downright=(1,-1);
    upright=(1,1);

    with spacing ((70,50)) matrix.a(2,10);

    % zaciatok
    node.a[1][0](btex $h_0$ etex);
    node.a[1][1](btex $h_1$ etex);
    node.a[1][2](btex $h_2$ etex);
    node.a[1][3](btex $h_3$ etex);

    %koniec
    node.a[1][5](btex $h_{k-1}$ etex);
    node.a[1][6](btex $h_{k}$ etex);
    node_hidden.a[1][4](btex $\cdots\cdots$ etex);


    arrow.top(0.5, btex $m^* || m_1$ etex)(a[1][0],a[1][1]) a[1][0].c{upright}..a[1][1].c;
    arrow.bot(0.5, btex $m'_1$ etex)(a[1][0],a[1][1]) a[1][0].c{downright}..a[1][1].c;

    arrow.top(0.5, btex $m^* || m^* || m_2$ etex)(a[1][1],a[1][2]) a[1][1].c{upright}..a[1][2].c;
    arrow.bot(0.5, btex $m'_2$ etex)(a[1][1],a[1][2]) a[1][1].c{downright}..a[1][2].c;


    arrow.top(0.5, btex $\hskip 1cm m^* || m^* || m^* || m^* || m_3$ etex)(a[1][2],a[1][3]) a[1][2].c{upright}..a[1][3].c;
    arrow.bot(0.5, btex $m'_3$ etex)(a[1][2],a[1][3]) a[1][2].c{downright}..a[1][3].c;


    arrow_dash.top(0.5, btex etex)(a[1][3],a[1][4]) a[1][3].c{upright}..a[1][4].c;
    arrow_dash.bot(0.5, btex etex)(a[1][3],a[1][4]) a[1][3].c{downright}..a[1][4].c;

    arrow_dash.top(0.5, btex etex)(a[1][4],a[1][5]) a[1][4].c{upright}..a[1][5].c;
    arrow_dash.bot(0.5, btex etex)(a[1][4],a[1][5]) a[1][4].c{downright}..a[1][5].c;


    arrow.top(0.5, btex $(m^*)^{2^{k-1}} || m_k$ etex)(a[1][5],a[1][6]) a[1][5].c{upright}..a[1][6].c;
    arrow.bot(0.5, btex $m'_k$ etex)(a[1][5],a[1][6]) a[1][5].c{downright}..a[1][6].c;
%% }}}
endfig;

beginfig(2);
%%% {{{
    with spacing ((70,50)) matrix.a(10,10);

    node_hidden.a[1][0](btex $\cdots$ etex);
    node.a[1][1](btex $h_{k-1}$ etex);
    node.a[1][2](btex $h_k$ etex);
    node.a[1][3](btex $y$ etex);

    arrow_dash.top(0.5, btex etex)(a[1][0],a[1][1])
        a[1][0].c{upright}..a[1][1].c;
    arrow_dash.bot(0.5, btex etex)(a[1][0],a[1][1])
        a[1][0].c{downright}..a[1][1].c;

    arrow.top(0.5, btex $m_k$ etex)(a[1][1],a[1][2])
        a[1][1].c{upright}..a[1][2].c;
    arrow.bot(0.5, btex $m'_k$ etex)(a[1][1],a[1][2])
        a[1][1].c{downright}..a[1][2].c;


    arrow.top(0.5, btex $invert$ etex)(a[1][2],a[1][3])
        a[1][2].c{upright}..a[1][3].c;
%%% }}}        
endfig;

beginfig(3);
%%% {{{
    loopsize:=25;
    size:=20;

    put.a(0,0);
    node.a(btex $h_i$ etex);
    loop.top(0.5, btex $m_i$ etex)(a) 90;
%%% }}}
endfig;

beginfig(4);
%%% {{{
    randomseed:=1;
    
    loopsize:=15;
    size:=10;

    for i:=1 upto 10:
        put.a( 80 + 20*i, -100 + uniformdeviate(200));
        node.a(btex etex);
        loop.top(0.5, btex etex)(a) 90;
    endfor;

    size:=15;
    put.st(0,0);
    node.st(btex $h_0$ etex);    

    for i:=0 upto 10:
        pair d;
        d = (70, (i-5)*20);
        drawarrow (0,0)..d cutbefore (circlepath scaled 20) 
            cutafter (circlepath xscaled 100 yscaled 200)
            dashed evenly;
    endfor;
%%% }}}    
endfig;

beginfig(5);
%%% {{{
    size:=22;

    pair downright,upright;
    downright=(1,-1);
    upright=(1,1);

    with spacing ((70,50)) matrix.a(3,10);

    % zaciatok
    node.a[1][0](btex $h_0$ etex);
    node.a[1][1](btex $h_1$ etex);
    % stred
    node_hidden.a[1][2](btex $\cdots\cdots$ etex);
    node.a[1][3](btex $h_x$ etex);
    node_hidden.a[1][4](btex $\cdots\cdots$ etex);
    %koniec
    node.a[1][5](btex $h_{l}$ etex);
    node.a[1][6](btex $h_{l-1}$ etex);

    node.a[2][0](btex etex);
    node.a[2][2](btex $h_{exp}$ etex);
    arrow_dash.bot(0.5, btex expanzia etex) (a[2][0], a[2][2])
        a[2][0].c -- a[2][2].c;

    arrow.top(0.5, btex $\tilde{m}$ etex)(a[2][2],a[1][3])
        a[2][2].c  -- a[1][3].c;

    arrow.top(0.5, btex $m_1$ etex)(a[1][0],a[1][1])
        a[1][0].c{upright}..a[1][1].c;

    arrow_dash.top(0.5, btex $m_2$ etex)(a[1][1],a[1][2])
        a[1][1].c{upright}..a[1][2].c;


    arrow_dash.top(0.5, btex $m_x$ etex)(a[1][2],a[1][3])
        a[1][2].c{upright}..a[1][3].c;


    arrow_dash.top(0.5, btex $m_{x+1}$ etex)(a[1][3],a[1][4])
        a[1][3].c{upright}..a[1][4].c;

    arrow_dash.top(0.5, btex $m_{l-1}$ etex)(a[1][4],a[1][5])
        a[1][4].c{upright}..a[1][5].c;

    arrow.top(0.5, btex $m_{l}$ etex)(a[1][5],a[1][6])
        a[1][5].c{upright}..a[1][6].c;
%%% }}}
endfig;

end

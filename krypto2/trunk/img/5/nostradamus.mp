input boxes;

prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

beginfig(1);
    xdist:=90;
    ydist:=-15;
    ysize:=200;
    xsize:=400;

    defaultdx:=40;
    defaultdy:=20;

    def myfixsize(suffix x) = 
        x.n-x.s = (0, defaultdy);
        x.e-x.w = (defaultdx,0);
    enddef;

    circleit.h[0][1](btex $h_{0,1}$ etex);
    circleit.h[0][2](btex $h_{0,2}$ etex);
    circleit.h[1][1](btex $h_{1,1}$ etex);
    h[1][1].c - h[0][1].c = (xdist, ydist);
    h[1][1].c - h[0][2].c = (xdist, -ydist);

    circleit.h[0][3](btex $h_{0,3}$ etex);
    circleit.h[0][4](btex $h_{0,4}$ etex);
    circleit.h[1][2](btex $h_{1,2}$ etex);
    h[1][2].c - h[0][3].c = (xdist, ydist);
    h[1][2].c - h[0][4].c = (xdist, -ydist);

    circleit.h[0][-1](btex $h_{0,2^k-1}$ etex);
    circleit.h[0][0](btex $h_{0,2^k}$ etex);
    circleit.h[1][0](btex $h_{1,2^{k-1}}$ etex);
    h[1][0].c - h[0][-1].c = (xdist, ydist);
    h[1][0].c - h[0][0].c = (xdist, -ydist);

    
    circleit.h[2][1](btex $h_{2,1}$ etex);
    h[2][1].c - h[1][1].c = (xdist, 2 * ydist);
    h[2][1].c - h[1][2].c = (xdist, -2 * ydist);

    circleit.h[2][0](btex $h_{2,2^{k-2}}$ etex);
    h[2][0].c - h[1][0].c = (xdist, -ydist);


    %% koniec
    circleit.h[-2][1](btex $h_{k-1,1}$ etex);
    circleit.h[-2][2](btex $h_{k-1,2}$ etex);
    circleit.h[-1][1](btex $h_{k,1}$ etex);
    h[-1][1].c - h[-2][1].c = (xdist, ydist);
    h[-1][1].c - h[-2][2].c = (xdist, -ydist);

    %%% setup positions
    h[0][1].c = (0,0);
    h[0][0].c = (0, -ysize);
    h[-1][1].c = (xsize,-ysize/2);

    myfixsize(h[0][1]);
    myfixsize(h[0][2]);
    myfixsize(h[0][3]);
    myfixsize(h[0][4]);
    myfixsize(h[0][-1]);
    myfixsize(h[0][0]);
    myfixsize(h[1][1]);
    myfixsize(h[1][2]);
    myfixsize(h[1][0]);
    myfixsize(h[2][0]);
    myfixsize(h[2][1]);
    myfixsize(h[-2][1]);
    myfixsize(h[-2][2]);
    myfixsize(h[-1][1]);
    drawboxed(h[0][1], h[0][2], h[0][3], h[0][4]);
    drawboxed(h[0][-1], h[0][0]);
    drawboxed(h[1][1], h[1][2], h[1][0]);
    drawboxed(h[2][1], h[2][0]);
    drawboxed(h[-1][1], h[-2][1], h[-2][2]);

    def cut(suffix a,b) =
        cutbefore bpath a cutafter bpath b
    enddef;

    vardef mydrawarrow.@#(text l) expr p=
        label.@#(l, point 0.5 * length(p) of p);
        drawarrow(p);
    enddef;

    mydrawarrow.top(btex $m_{0,1}$ etex)
        h[0][1].c .. h[1][1].c cut(h[0][1], h[1][1]);
    mydrawarrow.bot(btex $m_{0,2}$ etex)
        h[0][2].c .. h[1][1].c cut(h[0][2], h[1][1]);
     mydrawarrow.top(btex $m_{0,3}$ etex)
         h[0][3].c .. h[1][2].c cut(h[0][3], h[1][2]);
     mydrawarrow.bot(btex $m_{0,4}$ etex)
         h[0][4].c .. h[1][2].c cut(h[0][4], h[1][2]);
         
     mydrawarrow.top(btex $m_{0,2^k-1}$ etex)
         h[0][-1].c .. h[1][0].c cut(h[0][-1], h[1][0]);
     mydrawarrow.bot(btex $m_{0,2^k}$ etex)
         h[0][0].c .. h[1][0].c cut(h[0][0], h[1][0]);
 
     mydrawarrow.top(btex $m_{1,1}$ etex)
         h[1][1].c .. h[2][1].c cut(h[1][1], h[2][1]);
     mydrawarrow.bot(btex $m_{1,2}$ etex)
         h[1][2].c .. h[2][1].c cut(h[1][2], h[2][1]);
     mydrawarrow.bot(btex $m_{1,2^{k-1}}$ etex)
         h[1][0].c .. h[2][0].c cut(h[1][0], h[2][0]);
 
     mydrawarrow.top(btex $m_{k-1,1}$ etex)
         h[-2][1].c .. h[-1][1].c cut(h[-2][1], h[-1][1]);
     mydrawarrow.bot(btex $m_{k-1,2}$ etex)
         h[-2][2].c .. h[-1][1].c cut(h[-2][2], h[-1][1]);
 
    label(btex $\vdots$ etex, (h[0][-1].c + h[0][4].c)/2);
    label("...", (h[-2][1].c) - (xdist/2,ydist/2) );
    label("...", (h[-2][2].c) - (xdist/2,-ydist/2) );

    label("...", (h[2][0].c) -(xdist,ydist) );
    label("...", (h[2][0].c) +(xdist/2,-ydist/2) );
    label("...", (h[2][1].c) +(xdist/2,ydist/2) );


endfig;
end

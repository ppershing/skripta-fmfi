
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

%%% {{{ globalne definicie
    fa:=-3;
    fb:=3;
    vardef f(expr x) = sqrt(x*x*x +fa*x + fb) enddef;
    vardef fder(expr x) = (fa + 3 x*x) / 2 / sqrt(fb + fa * x + x*x*x) enddef;
%
    numeric xmin, xmax, ymin, ymax;
    xmin:=-2.5;
    xstart:=-2.1037;
    xmax:=3;
    ymin:=-1;
    ymax:=10;
    xstep:=0.1;
    path p;
    graphsize:=1cm;
    p := (xstart, f(xstart))*graphsize
        for x=xstart+xstep step xstep until xmax:
            .. (x,f(x))*graphsize
        endfor;
%%% }}}

path hline;
hline = (xmin,0)*graphsize -- (xmax,0)*graphsize;

beginfig(1);
    draw p withpen pencircle scaled 1.5;
    draw p yscaled -1 withpen pencircle scaled 1.5;
    draw hline;
    
    pointpx:=-0.5;
    pair pointp;
    pointp=(pointpx, f(pointpx))*graphsize;
    pair pointp_b;
    pointp_b=(xpart(pointp), -ypart(pointp));

    draw pointp -- pointp_b dashed evenly;
    label.top(btex P etex, pointp);
    label.bot(btex -P etex, pointp_b);

endfig;


beginfig(2);
    draw p withpen pencircle scaled 1.5;
    draw p yscaled -1 withpen pencircle scaled 1.5;

    draw hline;
 
    pointpx:=-1.2;
    pair pointp;
    pointp=(pointpx, f(pointpx))*graphsize;
    path dotycnica;
    dotycnica := pointp + (1, fder(pointpx))*graphsize*5 --
                 pointp - (1, fder(pointpx))*graphsize*(2);
    draw dotycnica;
    label.top(btex P etex, pointp);

    pair pointq;
    pointq = p intersectionpoint subpath (0,0.5) of dotycnica;
    pair pointpp;
    pointpp=(xpart(pointq), -ypart(pointq));

    draw pointq .. pointpp dashed evenly;

    label.rt(btex P+P etex, pointpp);
endfig;

beginfig(3);
    draw p withpen pencircle scaled 1.5;
    draw p yscaled -1 withpen pencircle scaled 1.5;

    draw hline;

    pointqx:=-1.5;
    pointpx:= 2.2;
    pair pointq;
    pair pointp;
    pointq=(pointqx, -f(pointqx))*graphsize;
    pointp=(pointpx, f(pointpx))*graphsize;
    path secnica;
    secnica := pointq -- pointp;
    draw secnica;
    label.lft(btex P etex, pointp);
    label.bot(btex Q etex, pointq);

    pair pointpq_a, pointpq_b;
    pointpq_a = p intersectionpoint subpath(0.1, 0.9) of secnica;
    pointpq_b = (xpart(pointpq_a), -ypart(pointpq_a));
    draw pointpq_a -- pointpq_b dashed evenly;
    label.rt(btex P+Q etex, pointpq_b + (0,0.2cm)); 
endfig;


end

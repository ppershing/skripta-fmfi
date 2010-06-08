%input automata;
input boxes;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

def cut(suffix a,b) =
    cutbefore bpath a cutafter bpath b
enddef;

beginfig(1);
    boxjoin(a.se=b.sw; a.ne=b.nw);

    bigsize:=4;
    smallsize:=10;
    bigstart:=3;
    smallstart:=3;

    boxit.M(btex M etex);
    boxit.r(btex $\phantom{M}r\phantom{M}$ etex);
    M.e-M.w=(4cm,0);
    drawboxed(M,r);

    boxjoin();

    circleit.hash(btex $h()$ etex);
    M.c-hash.c=(-0.1cm,1.5cm);
    drawboxed(hash);

    pair hvetvenie;
    hvetvenie = hash.c + (0, -0.8cm);

    circleit.g(btex $g()$ etex);
    g.c - hvetvenie = (2.7cm,0);
    drawboxed(g);
    drawarrow hvetvenie .. g.c cutafter bpath g;

    pair gvetvenie;
    g.c - gvetvenie = (0, 1cm);
    draw g.c -- gvetvenie cutbefore bpath g;



    boxjoin(a.se=b.sw; a.ne=b.nw);
    boxit.zero(btex 0 etex);
    boxit.w(btex $w$ etex);
    w.e-w.w = (2cm,0);
    boxit.gg1(btex $g_1(w) \oplus r$ etex);
    boxit.gg2(btex $g_2(w)$ etex);
    
    hvetvenie - w.c = (0,2cm);
    drawboxed(zero,w,gg1,gg2);
    drawarrow gvetvenie -- (xpart(gg2.c),ypart(gvetvenie)) -- gg2.c
        cutafter bpath gg2;
    label.top(btex $g_2$ etex,(xpart(gg2.c),ypart(gvetvenie)));

    boxjoin();
    circleit.xor(btex $\oplus$ etex);
    xpart(gg1.c - xor.c) = 0;
    ypart(xor.c - gvetvenie) = 0;

    drawboxed(xor);
    label.top(btex $g_1$ etex, xor.e+(0.2cm,0));
    drawarrow gvetvenie .. xor.c cutafter bpath xor;
    drawarrow xor.c .. gg1.c cut(xor, gg1);


    pair xorvetv[];
    xorvetv1 = r.c + (0, -0.7cm);
    xorvetv2 = (xpart(xor.c), ypart(xorvetv1));
    drawarrow r.c -- xorvetv1 -- xorvetv2 -- xor.c cut(r,xor);

    pair hashjoin;
    hashjoin = (xpart(hash.c)+0.1cm, ypart(xorvetv2));
    drawarrow xorvetv2 -- hashjoin -- (xpart(hashjoin), ypart(hash.c))
        cutafter bpath hash;
    drawarrow M.c -- (xpart(M.c), ypart(hash.c)) cut(M,hash);

    drawarrow hash.c .. w.c cut(hash, w);

    draw gvetvenie withpen pencircle scaled 3;
    draw hvetvenie withpen pencircle scaled 3;
    draw xorvetv2 withpen pencircle scaled 3;

    %drawarrow s[bigstart][smallsize].s{down}..{curl0.5}b[bigstart+1].s
    %    cut(s[bigstart][smallsize], b[bigstart+1]);

endfig;
end




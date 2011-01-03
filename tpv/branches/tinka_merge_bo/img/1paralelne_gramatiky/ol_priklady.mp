input boxes;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

%%% {{{ definicie cuta, myjoin, encapsulety, mydrawarrow
vardef cuta(suffix a,b) expr p =
    drawarrow p cutbefore bpath.a cutafter bpath.b;
    point .5*length p of p
enddef;

vardef myjoin(suffix p, q)=
    q.sw = p.se;
    q.nw = p.ne;
enddef;

vardef encapsulate(suffix p,q,r)=
    r.sw = p.sw;
    r.ne = q.ne;
enddef;

def mydrawarrow(suffix start)=
  drawarrow start.s -- d[arrowi].n;
  arrowi:=arrowi+1;
enddef;
%%% }}}

beginfig(1);
%%% {{{
    %%% {{{ createtriple, drawtriple
    def createtriple(expr i)=
     boxit.a[i](btex a etex); 
     boxit.b[i](btex a etex);
     myjoin(a[i],b[i]);
     boxit.d[i](btex etex);
     encapsulate(a[i],b[i],d[i]);
    enddef;

    def drawtriple(expr i)=
     drawunboxed(a[i],b[i]);
     drawboxed(d[i]);
    enddef;
    %%% }}}

    ydist:=20;
    arrowi:=0;
    boxjoin();

    boxit.start(btex a etex);
    start.s = (0, ydist);
    drawboxed(start);

    createtriple(0);
    d[0].s = (0,0);
    drawtriple(0);
    mydrawarrow(start);


    createtriple(1);
    createtriple(2);
    d[1].se = (0,-ydist);
    myjoin(d[1], d[2]);
    drawtriple(1);
    drawtriple(2);

    mydrawarrow(a[0]);
    mydrawarrow(b[0]);

    createtriple(3);
    for i=4 upto 6:
      createtriple(i);
      myjoin(d[i-1], d[i]);
    endfor;

    d[4].se = (0, -ydist*2);
    drawtriple(4);

    for i=3 upto 6:
      drawtriple(i);
    endfor;

    mydrawarrow(a[1]);
    mydrawarrow(b[1]);
    mydrawarrow(a[2]);
    mydrawarrow(b[2]);
%%% }}}    
endfig;

beginfig(2);
%%% {{{
    %%% {{{ createtriple_ab, createtriple_b, drawtriple
    def createtriple_ab(expr i)=
        %%% treba sproste phantom charactery a padding
        %%% aby sme mali rovnaku vysku!
        boxit.a[i](btex \phantom{l}$\!\!$a$\!$ etex); 
        boxit.b[i](btex b etex);
        myjoin(a[i],b[i]);
        boxit.d[i](btex etex);
        encapsulate(a[i],b[i],d[i]);
    enddef;

    def createtriple_b(expr i)=
        boxit.a[i](btex  etex); 
        boxit.b[i](btex b etex);
        b[i].sw = a[i].sw;
        b[i].ne = b[i].ne;
        boxit.d[i](btex  etex);
        encapsulate(b[i],b[i],d[i]);
    enddef;
    
    def drawtriple(expr i)=
        drawunboxed(a[i],b[i]);
        drawboxed(d[i]);
    enddef;
    %%% }}}

    defaultdx:=2;
    defaultdy:=2;

    ydist:=20;
    boxjoin();
    arrowi:=0;

    boxit.start(btex a etex);
    start.s = (0, ydist);
    drawboxed(start);

    createtriple_b(0);
    d[0].s = (0,0);
    drawtriple(0);
    mydrawarrow(start);

    createtriple_ab(1);
    d[1].s = (0,-ydist);
    drawtriple(1);
    mydrawarrow(b[0]);

    createtriple_b(2);
    createtriple_ab(3);
    myjoin(d[2],d[3]);
    d[2].se = (0,-ydist*2);

    drawtriple(2);
    drawtriple(3);
    mydrawarrow(a[1]);
    mydrawarrow(b[1]);

    createtriple_ab(4);
    createtriple_b(5);
    createtriple_ab(6);
    myjoin(d[4], d[5]);
    myjoin(d[5], d[6]);
    d[4].se = (0,-ydist*3);

    drawtriple(5);
    drawtriple(4);
    drawtriple(6);
    mydrawarrow(b[2]);
    mydrawarrow(a[3]);
    mydrawarrow(b[3]);

    createtriple_b(7);
    createtriple_ab(8);
    createtriple_ab(9);
    createtriple_b(10);
    createtriple_ab(11);
    myjoin(d[7], d[8]);
    myjoin(d[8], d[9]);
    myjoin(d[9], d[10]);
    myjoin(d[10], d[11]);
    d[8].se = (0,-ydist*4);

    drawtriple(8);
    drawtriple(7);
    drawtriple(9);
    drawtriple(10);
    drawtriple(11);

    mydrawarrow(a[4]);
    mydrawarrow(b[4]);
    mydrawarrow(b[5]);
    mydrawarrow(a[6]);
    mydrawarrow(b[6]);

    label.lft(btex 1:~ etex, start.w);
    label.lft(btex 1:~ etex, d[0].w);
    label.lft(btex 2:~ etex, d[1].w);
    label.lft(btex 3:~ etex, d[2].w);
    label.lft(btex 5:~ etex, d[4].w);
    label.lft(btex 8:~ etex, d[7].w);
%%% }}}
endfig;

beginfig(3);
%%% {{{
    %%% {{{ createtriple_abcc, createtriple_bcc, createtriple_c, drawtriple
    def createtriple_abcc(expr i)=
     %%% treba sproste phantom charactery a padding
     %%% aby sme mali rovnaku vysku!
     boxit.a[i](btex \phantom{l}$\!\!$a$\!$ etex); 
     boxit.b[i](btex b etex);
     boxit.c[i](btex \phantom{l}$\!\!\!$c$\!$ etex);
     boxit.cc[i](btex \phantom{l}$\!\!$c etex);

     myjoin(a[i],b[i]);
     myjoin(b[i],c[i]);
     myjoin(c[i],cc[i]);
     boxit.d[i](btex etex);

     encapsulate(a[i],cc[i],d[i]);
    enddef;

    def createtriple_bcc(expr i)=
     boxit.a[i](btex etex); 
     boxit.b[i](btex b etex);
     boxit.c[i](btex \phantom{l}$\!\!\!$c$\!$ etex);
     boxit.cc[i](btex \phantom{l}$\!\!$c etex);

     myjoin(b[i],c[i]);
     myjoin(c[i],cc[i]);
     boxit.d[i](btex etex);

     encapsulate(b[i],cc[i],d[i]);
    enddef;

    def createtriple_c(expr i)=
     boxit.a[i](btex etex); 
     boxit.b[i](btex  etex);
     boxit.c[i](btex \phantom{l}$\!\!$c etex);
     boxit.cc[i](btex  etex);

     boxit.d[i](btex etex);

     encapsulate(c[i],c[i],d[i]);
    enddef;
    %%% }}}



    def drawtriple(expr i)=
     drawunboxed(a[i],b[i],c[i],cc[i]);
     drawboxed(d[i]);
    enddef;


    defaultdx:=2;
    defaultdy:=2;

    ydist:=30;
    xdist:=20;

    boxjoin();

    boxit.start(btex a etex);
    start.s = (0, ydist);
    drawboxed(start);

    arrowi:=0;
    createtriple_abcc(0);
    d[0].s = (0,0);
    drawtriple(0);
    mydrawarrow(start);

    createtriple_abcc(1);
    d[1].s=(-xdist,-ydist);
    createtriple_bcc(2);
    createtriple_c(3);
    createtriple_c(4);
    myjoin(d[1],d[2]);
    myjoin(d[2],d[3]);
    myjoin(d[3],d[4]);
    drawtriple(1);
    drawtriple(2);
    drawtriple(3);
    drawtriple(4);

    mydrawarrow(a[0]);
    mydrawarrow(b[0]);
    mydrawarrow(c[0]);
    mydrawarrow(cc[0]);


    createtriple_abcc(10);
    createtriple_bcc(11);
    createtriple_c(12);
    createtriple_c(13);
    createtriple_bcc(14);
    createtriple_c(15);
    createtriple_c(16);
    createtriple_c(17);
    createtriple_c(18);

    d[10].s=(-2*xdist,-2*ydist);

    for i=11 upto 18:
      myjoin(d[i-1],d[i]);
    endfor

    for i=10 upto 18:
      drawtriple(i);
    endfor


    arrowi:=10;
    mydrawarrow(a[1]);
    mydrawarrow(b[1]);
    mydrawarrow(c[1]);
    mydrawarrow(cc[1]);
    mydrawarrow(b[2]);
    mydrawarrow(c[2]);
    mydrawarrow(cc[2]);
    mydrawarrow(c[3]);
    mydrawarrow(c[4]);

    label.lft(btex 1:~ etex, start.w);
    label.lft(btex 4:~ etex, d[0].w);
    label.lft(btex 9:~ etex, d[1].w);
    label.lft(btex 16:~ etex, d[10].w);
%%% }}}
endfig;
end

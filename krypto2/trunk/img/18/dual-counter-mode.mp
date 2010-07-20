input boxes;

prologues:=3;
verbatimtex
    %&latex
    \documentclass{minimal}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

def generujblok(suffix funct, xora, E, m, xorb, out, functt) =
  funct.e - xora.w = (-u, 0);
  m.s - xora.n = (0, u);
  xora.s - E.n = (0, u);
  E.s - xorb.n = (0, u);
  xorb.s - out.n = (0, 2*u);


  drawboxed(funct);
  drawunboxed(xora);
  drawunboxed(m);
  drawboxed(E);
  drawunboxed(xorb);
  drawunboxed(out);
  drawarrow funct.e -- xora.w;
  drawarrow m.s -- xora.n;
  drawarrow xora.s -- E.n;
  drawarrow E.s -- xorb.n;
  drawarrow xorb.s -- out.n;

  xora.e - functt.w = (-1.5*u, 0);
  drawboxed(functt);

  pair tmppointa,tmppointb,tmppointc,tmppointd;
  tmppointa := 0.5 * funct.c + 0.5 * xora.c;
  tmppointb := (xpart(tmppointa), ypart(0.5 * xorb.c + 0.5 * out.c));
  tmppointc := (xpart(xorb.c) + u, ypart(tmppointb));
  tmppointd := (xpart(tmppointc), ypart(xora.c));
  pair obl;
  obl := (xpart(xorb.c), ypart(tmppointb));
  drawarrow (xpart(tmppointa),ypart(xorb.w)) -- xorb.w;
  drawarrow tmppointa -- tmppointb -- (obl - (oblsize,0)) ..
    (obl + (0,oblsize)) .. (obl + (oblsize,0)) -- tmppointc --
    tmppointd -- functt.w;

enddef;

beginfig(1);
  u := 0.6cm;
  oblsize := 0.2cm;

  boxit.xx0(btex $x_0$ etex);

  boxit.funct(btex $f$ etex);
  boxit.xor1a(btex $\oplus$ etex);
  boxit.m1(btex $m_1$ etex);
  boxit.E1(btex $E_k$ etex);
  boxit.xor1b(btex $\oplus$ etex);
  boxit.c1(btex $c_1$ etex);
  boxit.funct2(btex $f$ etex);

  xx0.e - funct.w = (-u, 0);
  drawunboxed(xx0);  
  drawarrow xx0.e -- funct.w;

  generujblok(funct, xor1a, E1, m1, xor1b, c1, funct2);

  boxit.xor2a(btex $\oplus$ etex);
  boxit.m2(btex $m_2$ etex);
  boxit.E2(btex $E_k$ etex);
  boxit.xor2b(btex $\oplus$ etex);
  boxit.c2(btex $c_2$ etex);
  boxit.funct3(btex $f$ etex);

  generujblok(funct2, xor2a, E2, m2, xor2b, c2, funct3);

  boxit.xor3a(btex $\oplus$ etex);
  boxit.m3(btex $m_3$ etex);
  boxit.E3(btex $E_k$ etex);
  boxit.xor3b(btex $\oplus$ etex);
  boxit.c3(btex $c_3$ etex);
  boxit.funct4(btex $f$ etex);

  generujblok(funct3, xor3a, E3, m3, xor3b, c3, funct4);

  boxit.dots(btex $\dots$ etex);
  dots.w - funct4.e = (u, 0);
  drawunboxed(dots);
  drawarrow funct4.e -- dots.w;

endfig;

end

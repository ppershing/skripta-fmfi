input latexmp;
%input latexmphelper;% The above code and a call to setupLaTeXMP

prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\usepackage[utf8]{inputenc}
\begin{document}
etex

beginfig(1);
    color gray;
    gray := (0.7,0.7,0.7);
    path c;
    radius:=2cm;
    c := fullcircle scaled (2*radius);
    
    path qrn_a,qrn_b;
    qrn_a := (0,0) -- subpath (0,2) of c -- cycle;
    qrn_b := (0,0) -- subpath (4,6) of c -- cycle;

    draw c withpen pencircle scaled 1.2;
    fill qrn_a withcolor gray;
    fill qrn_b withcolor gray;
    draw qrn_a withpen pencircle scaled 1.1;
    draw qrn_b withpen pencircle scaled 1.1;

    label(btex $QR_n$ etex, (-radius/2.5, radius/2.5));
    label(btex $\begin{array}{c} \mbox{Pseudo} \\ 
                \mbox{štvorce} \end{array} $etex, (radius/2.5,
                -radius/2.5));
   
   label.lft(btex $\displaystyle \left( \frac {x}{q} \right) =
   \phantom{-}1$ etex,
            (-radius*1.2, radius/2));
   label.lft(btex $\displaystyle \left( \frac {x}{q} \right) = -1$ etex,
            (-radius*1.2, -radius/2));


   label.bot(btex $\displaystyle \left( \frac {x}{p} \right) = 1$ etex,
            (-radius/2, -radius*1.2));
   label.bot(btex $\displaystyle \left( \frac {x}{p} \right) = -1$ etex,
            (radius/2, -radius*1.2));
    
    draw (-2*radius,0) -- (-radius,0) dashed evenly;
    draw (0, -radius) -- (0, -2*radius) dashed evenly;
endfig;

end

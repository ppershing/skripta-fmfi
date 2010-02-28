input automata;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
beginfig(1);

size:=40;
size_ratio:=0.5;

with spacing ((18,18)) matrix.a(10,23);

vardef node_ellipse@#(expr l) =
  save pic,fs,fm;
  picture pic; pic := thelabel(l, (0,0));
  pair fs;
  numeric fm;

    @#.s := (size, size_ratio * size);
    @#.f := circlepath;
    @#.h := @#.c;
    fs := (size, size_ratio * size);
    fm := 0;
  
    if (border=solid):
      @#.m := nodemargin * solidsize + fm;
      draw @#.f xscaled xpart(fs) yscaled ypart(fs) shifted @#.c 
           withpen pencircle scaled solidsize withcolor bordercolor;
  fi

  if (nodelabel=yes):
    if ((urcorner pic - llcorner pic) <> (0,0)):
      label(l, @#.c) withcolor nodelabelcolor;
    fi
  fi
enddef;


% zaciatok
node_ellipse.a[5][0](btex $s$ etex);
node_ellipse.a[5][3](btex $x_1$ etex);
node_ellipse.a[5][6](btex $x_2$ etex);
arrow.bot(0.5, btex $f$ etex) (a[5][0], a[5][3]) a[5][0].c -- a[5][3].c;
arrow.bot(0.5, btex $f$ etex) (a[5][3], a[5][6]) a[5][3].c -- a[5][6].c;

%pokracovanie
node_ellipse.a[5][11](btex $x_{\mu-1}$ etex);
arrow_dash.bot(0.5, btex $f(f(\dots))$ etex) (a[5][6], a[5][11]) a[5][6].c -- a[5][11].c;

node_ellipse.a[5][14](btex $x_{\mu}$ etex);
arrow.bot(0.5, btex $f$ etex) (a[5][11], a[5][14]) a[5][11].c -- a[5][14].c;

%spodny cyklus
node_ellipse.a[7][15](btex $x_{\mu+1}$ etex);
arrow.bot(0.3, btex $f$ etex) (a[5][14], a[7][15]) a[5][14].c -- a[7][15].c;


node_ellipse.a[8][17](btex $x_{\mu+2}$ etex);
arrow.bot(0.5, btex $f$ etex) (a[7][15], a[8][17]) a[7][15].c -- a[8][17].c;

% vrchny cyklus
node_ellipse.a[3][15](btex $x_{\mu+\lambda-1}$ etex);
node_ellipse.a[2][17](btex $x_{\mu+\lambda-2}$ etex);
arrow.bot(0.5, btex $f$ etex) (a[2][17], a[3][15]) a[2][17].c -- a[3][15].c;
arrow.bot(0.3, btex $f$ etex) (a[3][15], a[5][14]) a[3][15].c -- a[5][14].c;


node_hidden.a[5][22](btex etex);


arrow_dash.bot(0.5, btex $f(f(\dots))$etex) (a[8][17],a[2][17]) a[8][17].c..a[5][22].c..a[2][17].c; 

endfig;
end




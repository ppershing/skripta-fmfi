input automata;
input boxes;
prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex
beginfig(1);

def cut(suffix a,b) =
    cutbefore bpath a cutafter bpath b
enddef;

boxjoin(a.se=b.sw; a.ne=b.nw);

bigsize:=4;
smallsize:=10;
bigstart:=3;
smallstart:=3;

for i = 1 upto bigsize:
    boxit.b[i](btex ~ etex);
    drawboxed(b[i]);
    for j = 1 upto smallsize:
        boxit.s[i][j](btex ~ etex);
        drawboxed(s[i][j]);
    endfor;
endfor;

boxit.b[bigsize+1](btex etex);
drawboxed(b[bigsize+1]);

pair mydir;
mydir:=(1,-1);

for i = 1 upto bigsize:
    drawarrow b[i].s{mydir}..b[i+1].s cut(b[i],b[i+1]) dashed evenly;
endfor;

for i = smallstart upto smallsize-1:
    drawarrow  (1,0)+s[bigstart][i].s{down}..{curl0.5}s[bigstart][i+1].s
        cut(s[bigstart][i],s[bigstart][i+1]);
endfor;
drawarrow s[bigstart][smallsize].s{down}..{curl0.5}b[bigstart+1].s
    cut(s[bigstart][smallsize], b[bigstart+1]);

drawarrow (200,-80)..s[bigstart][smallstart].s;

endfig;
end




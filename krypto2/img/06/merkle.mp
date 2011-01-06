input boxes;
input trees.mp.inc;

prologues:=3;
verbatimtex
    %&latex
    \documentclass{minimal}
    \usepackage{picture}
    \begin{document}
    \def\leaf#1{$\begin{array}{c} H_{#1,#1} \\ pk_#1 \end{array}$}
    \def\node#1#2#3#4{$H_{#1,#4}=h(H_{#1,#2}||H_{#3,#4})$}
etex

beginfig(1);
    interim levelsep := 1.5cm;
    interim treesep := 0.2cm;

    tree.s(btex \node{1}{4}{5}{8} etex)(
        tree(btex \node{1}{2}{3}{4} etex)(
            tree(btex \node{1}{1}{2}{2} etex)(
                leaf(btex \leaf{1} etex),
                leaf(btex \leaf{2} etex)),
            tree(btex \node{3}{3}{4}{4} etex)(
                leaf(btex \leaf{3} etex),
                leaf(btex \leaf{4} etex)
            )),
        tree(btex \node{5}{6}{7}{8} etex)(
            tree(btex \node{5}{5}{6}{6} etex)(
                leaf(btex \leaf{5} etex),
                leaf(btex \leaf{6} etex)),
            tree(btex \node{7}{7}{8}{8} etex)(
                leaf(btex \leaf{7} etex),
                leaf(btex \leaf{8} etex)
            ))
    );
    drawtrees(s);
endfig;

verbatimtex
    \def\leaf#1{$H_{#1,#1}$}
    \def\node#1#2{$H_{#1,#2}$}
etex

beginfig(2);
    interim levelsep := 1.5cm;
    interim treesep := 0.2cm;

    tree.s(btex \node{1}{8} etex)(
        tree(btex \node{1}{4} etex)(
            tree(btex \framebox{\node{1}{2}} etex)(
                leaf(btex \leaf{1} etex),
                leaf(btex \leaf{2} etex)),
            tree(btex \node{3}{4} etex)(
                leaf(btex \framebox{\leaf{3}} etex),
                leaf(btex 
                    \setlength{\unitlength}{1mm}
                        \raisebox{0pt}[4mm][4mm]{\leaf{4}}
                        \put(-3,0.7){\oval(10,5.8)}
                    etex)
            )),
        tree(btex \framebox{\node{5}{8}} etex)(
            tree(btex \node{5}{6} etex)(
                leaf(btex \leaf{5} etex),
                leaf(btex \leaf{6} etex)),
            tree(btex \node{7}{8} etex)(
                leaf(btex \leaf{7} etex),
                leaf(btex \leaf{8} etex)
            ))
    );
    drawtrees(s);
endfig;

end

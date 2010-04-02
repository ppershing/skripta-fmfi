input boxes;
input trees.mp.inc;

prologues:=3;
verbatimtex
%&latex
\documentclass{minimal}
\begin{document}
etex

beginfig(1);
    interim levelsep := 1.5cm;
    interim treesep := 1cm;
    tree.s(btex $\bowtie_{n}$ etex)(
        tree(btex $\bowtie_{n/3}$ etex)(
            leaf(btex $L_1$ etex),
            leaf(btex $L_2$ etex)),
        tree(btex $\bowtie_{n/3}$ etex)(
            leaf(btex $L_3$ etex),
            leaf(btex $L_4$ etex)
        )
    );
    drawtrees(s);
endfig;

beginfig(2);
    interim levelsep := 1.5cm;
    interim treesep := 0.2cm;
    tree.s(btex $\bowtie_{n} \approx 1$ etex)(
        tree(btex $\bowtie_{n/2} \approx 2^{n/4}$ etex)(
            tree(btex $\bowtie_{n/4} \approx 2^{n/4}$ etex)(
                leaf(btex $L_1 \approx 2^{n/4}$ etex),
                leaf(btex $L_2 \approx 2^{n/4}$ etex)),
            tree(btex $\bowtie_{n/4} \approx 2^{n/4}$ etex)(
                leaf(btex $L_3 \approx 2^{n/4}$ etex),
                leaf(btex $L_4 \approx 2^{n/4}$ etex)
            )),
        tree(btex $\bowtie_{n/2} \approx 2^{n/4}$ etex)(
            tree(btex $\bowtie_{n/4} \approx 2^{n/4}$ etex)(
                leaf(btex $L_5 \approx 2^{n/4}$ etex),
                leaf(btex $L_6 \approx 2^{n/4}$ etex)),
            tree(btex $\bowtie_{n/4} \approx 2^{n/4}$ etex)(
                leaf(btex $L_7 \approx 2^{n/4}$ etex),
                leaf(btex $L_8 \approx 2^{n/4}$ etex)
            ))
    );
    drawtrees(s);
endfig;

end

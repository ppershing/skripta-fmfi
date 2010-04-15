# script for automatic creation of "display.tex" file
# usage -  cd xx
#          make
#          ../mk_display.sh > display.tex
#          make

echo '\documentclass[letterpaper,10pt]{article}'
echo '\usepackage{graphicx}'
echo '\begin{document}'
echo ''

for mpssubor in *.mps; do
    echo '\begin{figure}'
    echo '    \centering'
    echo "    \includegraphics[scale=1]{$mpssubor}"
    echo "    \\caption{$mpssubor}";
    echo '\end{figure}'
    echo ''
done

echo '\end{document}'

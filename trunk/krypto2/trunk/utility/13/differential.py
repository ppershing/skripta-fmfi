#!/usr/bin/python
# coding=utf-8
from cipher import *;

def Diferential(d_inputs, d_outputs):
    return sum([(Sbox(x) ^  Sbox_original(x ^ d_inputs)) == d_outputs
                    for x in range(16)])

def get_dif_color(value):
    value = max(0.75 -abs(value) / 8.0 ,0);
    return "\\color[rgb]{%f,%f,%f}" % (value,value,value)

def GenerateDifferentialTable(f):
    # {{{
    print >>f, "\\begin{table}[htp]"
    print >>f, "\\begin{tabular}{" + 17*"r|" + "}"
    for i in range(16):
        print >>f, "&{\\bf %2d}" % i
    print >>f, "\\\\ \\hline"

    for i in range(KEY_MAX):
        print >>f, "{\\bf %2d}" % i
        for j in range(KEY_MAX):
            print >>f, "    &{%s %3d}" % (get_dif_color(Diferential(i,j)),
                                     Diferential(i,j))
        print >>f, "\\\\ \hline"
    print >>f, "\\end{tabular}"
    print >>f, "\\caption{Lineárna aproximačná tabuľka pre S-box}";
    print >>f, "\\label{tab:lat}"
    print >>f, "\\end{table}"
    # }}}

#!/usr/bin/python
# coding=utf-8
from cipher import *;
from metapost import *;
from linear import *;
from differential import *;

lpath1 = [[9,10,12,15],
          [10,11,14,15],
          [8,10,12,14],
          [0,2,8,10]];

lpath2 = [[0,2,3],
          [1],
          [4],
          [0,1]]

dpath1 = [[4,6,7],
          [5],
          [5,7],
          [5,7,13,15]]

dpath2 = [[10],
          [10],
          [10],
          [10]]
dpath3 = [[10],
          [10],
          [10],
          [10,11]]

GenerateLinearApproximationTable(open('lat.tex', 'w'))
AnalyzeLinearApproximations(open('lanalyza1.tex', 'w'), lpath1);
AnalyzeLinearApproximations(open('lanalyza2.tex', 'w'), lpath2);
DrawPath(open('lpath1.mp.inc', 'w'), lpath1);
DrawPath(open('lpath2.mp.inc', 'w'), lpath2);


GenerateDifferentialTable(open('dif.tex', 'w'));
AnalyzeDifferences(open('danalyza1.tex', 'w'), dpath1);
AnalyzeDifferences(open('danalyza2.tex', 'w'), dpath2);
AnalyzeDifferences(open('danalyza3.tex', 'w'), dpath3);
DrawPath(open('dpath1.mp.inc', 'w'), dpath1);
DrawPath(open('dpath2.mp.inc', 'w'), dpath2);
DrawPath(open('dpath3.mp.inc', 'w'), dpath3);

# below this line are extremely slow computations.

print "Linear attack 1"
AttackUsingLAT(open('lattack1.tex', 'w'), lpath1)
print "Linear attack 2"
AttackUsingLAT(open('lattack2.tex', 'w'), lpath2)

print "Differential attack 1"
AttackUsingDifferences(open('dattack1.tex', 'w'), dpath1);
print "Differential attack 2"
AttackUsingDifferences(open('dattack2.tex', 'w'), dpath2);
print "Differential attack 3"
AttackUsingDifferences(open('dattack3.tex', 'w'), dpath3);

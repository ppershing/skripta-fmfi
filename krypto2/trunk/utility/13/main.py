#!/usr/bin/python
# coding=utf-8
from cipher import *;
from metapost import *;
from linear import *;


path1 = [[9,10,12,15],
             [10,11,14,15],
             [8,10,12,14],
             [0,2,8,10]];
AttackUsingLAT(sys.stdout, path1)

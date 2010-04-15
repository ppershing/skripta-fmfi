#!/usr/bin/python
# coding=utf-8
from cipher import *

def DrawInoutPath(m1,r1,x,m2,r2,y):
    return "draw inout_path(%s[%d],%d,%d,%s[%d],%d,%d);" % \
            (m1, r1, x/4, x%4, m2,r2, y/4, y%4)

def DrawInputs(m,r,x):
    return "draw subpath(2,3) of (inout_path(%s[%d],%d,%d,%s[%d],%d,%d));" %\
            (m, r, x/4, x%4, m, r, x/4, x%4)

def DrawOutputs(m,r,x):
    return "draw subpath(0,1) of (inout_path(%s[%d],%d,%d,%s[%d],%d,%d));" %\
            (m, r, x/4, x%4, m, r, x/4, x%4)

def DrawPath(f, linear_combination):
    ### {{{ DrawPath
    print >>f, "%% inputs"
    for i in linear_combination[0]:
        print >>f, DrawInputs("k", 1, i);
        print >>f, DrawInoutPath("k", 1, i, "s", 1, i)

    for round in range(3):
        print >>f, "%% round %d" % (round+1)
        inputs = linear_combination[round];
        outputs = linear_combination[round+1];
        if (round>0):
            inputs = map(ShufflePosition, inputs)

        for (i,o) in zip(outputs, map(ShufflePosition, outputs)):
            print >>f, DrawInoutPath("s", round+1, i,  "k", round+2, o)
        print >>f, ""
        for i in inputs:
            DrawInoutPath("k", round+1, i, "s", round+1, i);

    print >>f, "%% final round"
    outputs = map(ShufflePosition,linear_combination[3])
    for i in outputs:
        print >>f, DrawInoutPath("k", 4, i, "s", 4, i);
    print >>f, "%% final boxes"
    active_boxes = dict(map(lambda x:(x,0), [ o/4 for o in outputs])).keys()
    for box in active_boxes:
        for i in range(4):
            print >>f, DrawInoutPath("s", 4, box*4+i, "k", 5, box*4+i);
            print >>f, DrawOutputs("k", 5, box*4+i);
    ### }}}

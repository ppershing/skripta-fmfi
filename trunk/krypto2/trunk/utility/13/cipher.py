#!/bin/python
# coding=utf-8
from operator import mul;

def parityOf(int_type):
    parity = 0
    while (int_type):
        parity = ~parity
        int_type = int_type & (int_type - 1)
    return(parity)

def Sbox(input):
    transform = [5,9,7,14,0,3,2,1,10,4,13,8,11,12,6,15]
    return transform[input]

def Shuffle(input):
    return (input %4)*4 + input/4

def LAT(inputs, outputs):
    return int(round(sum(map(lambda x:
                    (-1)**(parityOf(x & inputs) ^
                           parityOf(Sbox(x) & outputs)),
                    range(16)
                ))))

def get_LAT_color(value):
    value = max(0.75 -abs( value) / 10.0 ,0);
    return "\\color[rgb]{%f,%f,%f}" % (value,value,value)
    

def gen_LAT_table():
    print "\\begin{table}[htp]"
    print "\\begin{tabular}{" + 17*"r|" + "}"
    for i in range(16):
        print "&{\\bf %2d}" % i
    print "\\\\ \\hline"

    for i in range(16):
        print "{\\bf %2d}" % i
        for j in range(16):
            print "    &{%s %3d}" % (get_LAT_color(LAT(i,j)), LAT(i,j))
        print "\\\\ \hline"
    print "\\end{tabular}"
    print "\\caption{Lineárna aproximačná tabuľka pre S-box}";
    print "\\label{tab:lat}"
    print "\\end{table}"

def analyze_LAT(lin):
    total_balance = [];
    for round in range(3):
        inputs = lin[round];
        if (round>0):
            inputs = map(Shuffle, inputs);
        outputs = lin[round+1];

        in_array = [x in inputs for x in range(16)]
        out_array = [x in outputs for x in range(16)]

        balance = []
        for sbox in range(4):
            in_tmp = reduce(lambda x,y: x*2+y,
                            (in_array[sbox*4: sbox*4+4]))
            out_tmp = reduce(lambda x,y: x*2+y,
                            (out_array[sbox*4: sbox*4+4]))
            balance += [LAT(in_tmp, out_tmp)/32.0];
        b = reduce(mul, balance)*8.0;
        total_balance += [b]

        print "\paragraph{%d. kolo:}" % (round+1)
        print "Použijeme lineárnu aproximáciu "
        print "$" + ' \\oplus '.join(map(lambda x: "x_{%d,%d}" % (round+1,x),
                          inputs)) \
                + "\\oplus k_{%d}"%(round+1),
        print ' \\approx ',
        print ' \\oplus '.join(map(lambda x: "y_{%d,%d}" % (round+1,x),
                          outputs)) + "$,"
        print "ktorá má balancie po jednotlivých S-boxoch ",
        print "$" + ",".join(map(lambda x: "%s" % x, balance))+"$"
        print "čo podľa piling-up lemy dáva pravdepodobnosť "
        print "$1/2 + 2^3*("+")*(".join(map(lambda x: "%s" %x,
                 balance))+")",
        print "=",(0.5 + b),"$. Balancia je ",
        print "$%s$." % b
        print ""
    print "\paragraph{Spolu:} ",
    print "Máme lineárnu kombináciu "
    print "$ \Big(" + " \\oplus ".join(map(lambda x: "in_{%s}" % x, lin[0]))
    print "\Big) \\oplus \Big( k_1 \\oplus k_2 \\oplus k_3 \\oplus "
    print " \\oplus ".join(
        map(lambda (r,o): "key_{%s,%s}" % (r, o),
            sorted([(r, o) if r == 0 else (r,Shuffle(o)) for (r,o) in 
                sum([map(lambda x: (r,x), lin[r]) for r in range(4)],[])
                ]))),
    print "\Big) \\approx \Big("
    print " \\oplus ".join(map(lambda x: "out_{%s}" % x, lin[3]))    
    print "\Big) $."
    print "Podľa piling-up lemy máme balanciu "
    print "$4*" + "*".join(map(lambda x: "%s" %x, total_balance)),
    print "~= %.4f $." % (reduce(mul, total_balance)*4)

#gen_LAT_table();
analyze_LAT([[9,10,12,15],
             [10,11,14,15],
             [8,10,12,14],
             [0,2,8,10]
             ])

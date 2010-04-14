#!/usr/bin/python
# coding=utf-8
from cipher import *;
# {{{ LAT functions
def LAT(inputs, outputs):
    return int(round(sum(map(lambda x:
                    (-1)**(parityOf(x & inputs) ^
                           parityOf(Sbox(x) & outputs)),
                    range(16)
                ))))

def get_LAT_color(value):
    value = max(0.75 -abs( value) / 10.0 ,0);
    return "\\color[rgb]{%f,%f,%f}" % (value,value,value)

def GenerateLinearApproximationTable(f):
    # {{{
    print >>f, "\\begin{table}[htp]"
    print >>f, "\\begin{tabular}{" + 17*"r|" + "}"
    for i in range(16):
        print >>f, "&{\\bf %2d}" % i
    print >>f, "\\\\ \\hline"

    for i in range(KEY_MAX):
        print >>f, "{\\bf %2d}" % i
        for j in range(KEY_MAX):
            print >>f, "    &{%s %3d}" % (get_LAT_color(LAT(i,j)), LAT(i,j))
        print >>f, "\\\\ \hline"
    print >>f, "\\end{tabular}"
    print >>f, "\\caption{Lineárna aproximačná tabuľka pre S-box}";
    print >>f, "\\label{tab:lat}"
    print >>f, "\\end{table}"
    # }}}


def AnalyzeLinearApproximations(f, linear_combination):
    # {{{
    total_balance = [];
    for round in range(3):
        inputs = linear_combination[round];
        if (round>0):
            inputs = map(ShufflePosition, inputs);
        outputs = linear_combination[round+1];

        in_array = [(x in inputs) for x in range(TOTAL_KEY_SIZE)]
        out_array = [(x in outputs) for x in range(TOTAL_KEY_SIZE)]

        balance = []
        for sbox in range(SBOX_COUNT):
            in_tmp = BitsToHalfByte(in_array[sbox*4: sbox*4+4])
            out_tmp = BitsToHalfByte(out_array[sbox*4: sbox*4+4])
            balance += [LAT(in_tmp, out_tmp)/2.0/KEY_MAX];
        b = reduce(mul, balance)*8.0;
        total_balance += [b]

        print >>f, "\paragraph{%d. kolo:}" % (round+1)
        print >>f, "Použijeme lineárnu aproximáciu $"
        print >>f, " \\oplus ".join(["x_{%d,%d}" % (round+1,x) for x in  inputs]) ,
        print >>f, " \\oplus k_{%d} "%(round+1) 
        print >>f, " \\approx " 
        print >>f, " \\oplus ".join(["y_{%d,%d}" % (round+1,x) for x in outputs]),
        print >>f, "$,\nktorá má balancie po jednotlivých S-boxoch $"
        print >>f, ",".join(["%s" % x for x in balance])
        print >>f, "$čo podľa piling-up lemy dáva pravdepodobnosť "
        print >>f, "$1/2 + 2^3*(" ,
        print >>f, ")*(".join(["%s" %x for x in balance]) ,
        print >>f, ")=", (0.5 + b), "$"
        print >>f, "Balancia je $%s$." % b
        print >>f, ""
    print >>f, "\paragraph{Spolu:} ",
    print >>f, "Máme lineárnu kombináciu $ \Big("
    print >>f, " \\oplus ".join(["in_{%s}" %x for x in linear_combination[0]])
    print >>f, "\Big) \\oplus \Big( k_1 \\oplus k_2 \\oplus k_3 \\oplus "
    print >>f, " \\oplus ".join(["key_{%s,%s}" % (r, o) for (r,o) in
                sorted([((r, o) if (r == 0) else (r,ShufflePosition(o)))
                        for (r,o) in sum([map(lambda x: (r,x), linear_combination[r]) for r in range(4)],[])
                ])]),
    print >>f, "\Big) \\approx \Big("
    print >>f, " \\oplus ".join(map(lambda x: "out_{%s}" % x, linear_combination[3]))
    print >>f, "\Big) $."
    print >>f, "Podľa piling-up lemy máme balanciu $4*" ,
    print >>f, "*".join(map(lambda x: "%s" %x, total_balance)) ,
    print >>f, "~= %.4f $." % (reduce(mul, total_balance)*4)
    # }}}

# }}}

def AttackUsingLATHelper(f, linear_combination, keys, iterations):
    plaintext = [[random.randint(0, 1) for j in range(TOTAL_KEY_SIZE)] 
                        for i in range(iterations)];
    ciphertext = [Cipher(plaintext[i], keys) for i in range(iterations)]

    linear_in = linear_combination[0];
    linear_out = map(ShufflePosition, linear_combination[3])
    in_array =  [x in linear_in for x in range(TOTAL_KEY_SIZE)]
    out_array = [x in linear_out for x in range(TOTAL_KEY_SIZE)]

    sboxes = dict([ (x/4,0) for x in linear_out]).keys()

    matching_key = [0 for i in range(TOTAL_KEY_MAX)]

    for i in range(iterations):
        for boxkey in range(KEY_MAX ** len(sboxes)):
            lastkey = [0 for x in range(TOTAL_KEY_SIZE)]
            boxkey_tmp = IntToBits(boxkey, KEY_SIZE*len(sboxes))
            for x in range(len(sboxes)):
                lastkey[4*sboxes[x]:4*sboxes[x]+4] = boxkey_tmp[x*4: x*4+4]
            ct = InverseLastRound(ciphertext[i], lastkey)
            pt = plaintext[i]
            l1 = parityOf(BitsToInt(pt) & BitsToInt(in_array))
            l2 = parityOf(BitsToInt(ct) & BitsToInt(out_array))
            if not (l1^l2):
                matching_key[BitsToInt(lastkey)] = matching_key[BitsToInt(lastkey)] + 1
    good_keys = []
    for i in range(TOTAL_KEY_MAX):
        if matching_key[i]:
            good_keys.append(i);

    best = sorted([ (abs(matching_key[i] / 1.0 / iterations - 0.5), i) for i in good_keys], reverse=True)
    print >>f, " \\subtable[$key_5=%04x$]{" % BitsToInt(keys[4])
    print >>f, "     \\begin{tabular}{cc}"
    for (p,i) in best[0:10]:
        print >>f, "         %.4f & %s \\\\" % (p, MaskedHex(i, sboxes))
    print >>f, "     \\end{tabular}";
    print >>f, " }"

def AttackUsingLAT(f, path):
    key1 = IntToBits(0xfa3f, TOTAL_KEY_SIZE);
    key2 = IntToBits(0x0f39, TOTAL_KEY_SIZE);
    key3 = IntToBits(0x8db3, TOTAL_KEY_SIZE);
    key4 = IntToBits(0xf9b1, TOTAL_KEY_SIZE);

    print >>f, "\\begin{table}[h]"
    print >>f, " \\centering"

    key5 = IntToBits(random.randint(0, TOTAL_KEY_MAX), TOTAL_KEY_SIZE);
    keys = [key1,key2,key3,key4,key5];
    AttackUsingLATHelper(f, path, keys, 1000)

    key5 = IntToBits(random.randint(0, TOTAL_KEY_MAX), TOTAL_KEY_SIZE);
    keys = [key1,key2,key3,key4,key5];
    AttackUsingLATHelper(f, path, keys, 1000)

    print >>f, "\\end{table}"

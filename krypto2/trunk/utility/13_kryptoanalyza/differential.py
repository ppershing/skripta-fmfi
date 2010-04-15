#!/usr/bin/python
# coding=utf-8
from cipher import *;

def Diferential(d_inputs, d_outputs):
    return sum([(Sbox(x) ^  Sbox(x ^ d_inputs)) == d_outputs
                    for x in range(16)])

def get_dif_color(value):
    value = max(0.75 -abs(value) / 6.0 ,0);
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


def AnalyzeDifferences(f, linear_combination):
    # {{{
    total_balance = [];
    print >>f, "\\begin{itemize}"
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
            balance += [Diferential(in_tmp, out_tmp)/1.0/KEY_MAX];
        b = reduce(mul, balance);
        total_balance += [b]

        print >>f, "\\item {\\bf %d. kolo:}" % (round+1)
        print >>f, "Použijeme differenciu $\\langle in=",
        print >>f, MaskedHex(BitsToInt(in_array), [0,1,2,3]),
        print >>f, ", out=",
        print >>f, MaskedHex(BitsToInt(out_array), [0,1,2,3]),
        print >>f, "\\rangle $,"
        print >>f, "ktorá má pravdepodobnosti po jednotlivých S-boxoch $"
        print >>f, ",".join(["%s" % x for x in balance])
        print >>f, "$ čo spolu dáva pravdepodobnosť "
        print >>f, "$" ,
        print >>f, "*".join(["%s" %x for x in balance]) ,
        print >>f, "=", b, "$"
        print >>f, ""
    print >>f, "\\item {\\bf Spolu:} ",
    print >>f, "Máme diferenciu $\\langle = plaintext\\_diff",
    in_array = [(x in linear_combination[0]) for x in range(TOTAL_KEY_SIZE)]
    print >>f, MaskedHex(BitsToInt(in_array), [0,1,2,3]),
    print >>f, ", ciphertext\\_diff=",
    print >>f, MaskedHex(BitsToInt(out_array), [0,1,2,3]),
    print >>f, "\\rangle$."
    print >>f, "Celková pravdepodobnosť je $" ,
    print >>f, "*".join(map(lambda x: "%s" %x, total_balance)) ,
    print >>f, "~= %.5f $." % (reduce(mul, total_balance))
    print >>f, "\\end{itemize}"
    # }}}

def AttackUsingDifHelper(f, linear_combination, keys, iterations):
    # {{{
    linear_in = linear_combination[0];
    linear_out = map(ShufflePosition, linear_combination[3])
    in_array =  [x in linear_in for x in range(TOTAL_KEY_SIZE)]
    out_array = [x in linear_out for x in range(TOTAL_KEY_SIZE)]

    plaintext = [[random.randint(0, 1) for j in range(TOTAL_KEY_SIZE)] 
                        for i in range(iterations)];
    plaintext2 = [[ x^y for (x,y) in zip(plaintext[i], in_array)]
                        for i in range(iterations)];

    ciphertext = [Cipher(plaintext[i], keys) for i in range(iterations)]
    ciphertext2 = [Cipher(plaintext2[i], keys) for i in range(iterations)]

    sboxes = dict([(x/4,0) for x in linear_out]).keys()

    matching_key = [0 for i in range(TOTAL_KEY_MAX)]

    for i in range(iterations):
        for boxkey in range(KEY_MAX ** len(sboxes)):
            lastkey = [0 for x in range(TOTAL_KEY_SIZE)]
            boxkey_tmp = IntToBits(boxkey, KEY_SIZE*len(sboxes))
            for x in range(len(sboxes)):
                lastkey[4*sboxes[x]:4*sboxes[x]+4] = boxkey_tmp[x*4: x*4+4]
            ct1 = InverseLastRound(ciphertext[i], lastkey)
            ct2 = InverseLastRound(ciphertext2[i], lastkey)

            ok = True;
            for j in range(TOTAL_KEY_SIZE):
                if (ct1[j]^ct2[j] ^ out_array[j] != 0):
                    ok = False;
            if ok:
                matching_key[BitsToInt(lastkey)] = matching_key[BitsToInt(lastkey)] + 1

    good_keys = []
    for i in range(TOTAL_KEY_MAX):
        if matching_key[i]:
            good_keys.append(i);

    best = sorted([ (matching_key[i] / 1.0 / iterations , i) for i in good_keys], reverse=True)
    print >>f, " \\subtable[$key_5=%04x$]{" % BitsToInt(keys[4])
    print >>f, "     \\begin{tabular}{cc}"
    for (p,i) in best[0:10]:
        print >>f, "         %.4f & %s \\\\" % (p, MaskedHex(i, sboxes))
    print >>f, "     \\end{tabular}";
    print >>f, " }"
    # }}}

def AttackUsingDifferences(f, path):
    # {{{
    key1 = IntToBits(0x8db3, TOTAL_KEY_SIZE);
    key2 = IntToBits(0xfa3f, TOTAL_KEY_SIZE);
    key3 = IntToBits(0x0f39, TOTAL_KEY_SIZE);
    key4 = IntToBits(0xf9b1, TOTAL_KEY_SIZE);

    print >>f, "\\begin{table}[h]"
    print >>f, " \\centering"

    key5 = IntToBits(random.randint(0, TOTAL_KEY_MAX), TOTAL_KEY_SIZE);
    keys = [key1,key2,key3,key4,key5];
    AttackUsingDifHelper(f, path, keys, 1000)

    key5 = IntToBits(random.randint(0, TOTAL_KEY_MAX), TOTAL_KEY_SIZE);
    keys = [key1,key2,key3,key4,key5];
    AttackUsingDifHelper(f, path, keys, 1000)

    print >>f, "\\end{table}"
    # }}}

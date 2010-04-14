#!/usr/bin/python
# coding=utf-8
from operator import mul;
import random;
import sys;

SBOX_COUNT = 4
KEY_SIZE = 4
TOTAL_KEY_SIZE = 16
KEY_MAX = 16
TOTAL_KEY_MAX = 65536
CIPHER_ROUNDS=5

# {{{ bit functions
def parityOf(int_type):
    parity = 0
    while (int_type):
        parity = parity^(int_type % 2)
        int_type = int_type/2;
    return(parity)

def BitsToInt(bits):
    return reduce(lambda x,y: x*2+y, reversed(bits))

def BitsToHalfByte(bits):
    return BitsToInt(bits)

def IntToBits(x, bits):
    data = []
    for i in range(bits):
        data += [x%2];
        x = x/2;
    return data;

def HalfByteToBits(x):
    return IntToBits(x,4)
# }}}

# {{{ cipher functions

def Sbox(input):
    # povodny Stanokov Sbox, my potrebujeme ale reverzne poradie bitov
    # vstupu a vystupu
    # transform = [5,9,7,14,0,3,2,1,10,4,13,8,11,12,6,15]
    transform = [10, 5, 0, 13, 14, 11, 4, 6, 9, 2, 12, 3, 7, 1, 8, 15];
    return transform[input]

def ISbox(input): # momentalne stupidna implementacia
    for i in range(16):
        if (Sbox(i) == input):
            return i

def BitSbox(input):
    return HalfByteToBits(Sbox(BitsToHalfByte(input)))

def BitISbox(input):
    return HalfByteToBits(ISbox(BitsToHalfByte(input)))

def ShufflePosition(input):
    return (input %4)*4 + input/4

def AddRoundKey(input, key):
    return [input[i] ^ key[i] for i in range(TOTAL_KEY_SIZE)]

def CipherRound(input, key):
    data = AddRoundKey(input, key)
    data = sum([BitSbox(data[4*i: 4*i+4]) for i in range(SBOX_COUNT)], [])

    tmp = [0 for i in range(TOTAL_KEY_SIZE)];
    for i in range(TOTAL_KEY_SIZE):
        tmp[ShufflePosition(i)] = data[i];
    return tmp

def CipherFinalRounds(input, key1, key2):
    data = AddRoundKey(input, key1)
    data = sum([BitSbox(data[4*i: 4*i+4]) for i in range(SBOX_COUNT)], [])
    data = AddRoundKey(data, key2)
    return data

def Cipher(input, keys):
    for i in range(CIPHER_ROUNDS-2):
        input = CipherRound(input, keys[i])
    return CipherFinalRounds(input, keys[CIPHER_ROUNDS-2], keys[CIPHER_ROUNDS-1]);

def InverseLastRound(input, key):
    data = AddRoundKey(input, key)
    data = sum([BitISbox(data[4*i: 4*i+4]) for i in range(SBOX_COUNT)], [])
    return data
# }}}


def MaskedHex(x, mask):
    s = "";
    for i in range(4):
        if i in mask:
            s = "%x%s" %(x%16,s)
        else:
            s = "_"+s;
        x = x/16
    return s







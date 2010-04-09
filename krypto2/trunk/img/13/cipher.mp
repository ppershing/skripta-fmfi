prologues:=3;
verbatimtex
    %&latex
    \documentclass{minimal}
    \usepackage[utf8]{inputenc}
    \begin{document}
etex

sbox_width:=1.5cm;
sbox_height:=0.7cm;
sbox_sep:=0.3cm;

kbox_width:=4*sbox_width + 3*sbox_sep;
kbox_height:=sbox_height;
pin_length:=0.3cm;

round_skip:=4cm;
round_sbox_offset:=1.2cm;

%%% {{{ create_pins(nameofbox)
def create_pins(suffix name)(expr posx, posy)=
    for j=0 upto 3:
        name.in[j].x = posx - sbox_width/2 + (j+1)*sbox_width/5;
        name.in[j].y = posy + sbox_height/2;
        name.out[j].x = posx - sbox_width/2 + (j+1)*sbox_width/5;
        name.out[j].y = posy - sbox_height/2;
    endfor;
enddef;
%%% }}}

%%% {{{ create_sbox(name,posx,posy)
def create_sbox(suffix name)(expr posx, posy)=
    draw (posx - sbox_width/2, posy - sbox_height/2) --
         (posx + sbox_width/2, posy - sbox_height/2) --
         (posx + sbox_width/2, posy + sbox_height/2) --
         (posx - sbox_width/2, posy + sbox_height/2) --
         cycle;
    label(btex S etex, (posx, posy));
    create_pins(name,posx,posy);
enddef;
%%% }}}

%%% {{{ create_kbox(name,labeltext,posx,posy)
def create_kbox(suffix name)(expr l, posx, posy)=
    draw (posx - kbox_width/2, posy - kbox_height/2) --
         (posx + kbox_width/2, posy - kbox_height/2) --
         (posx + kbox_width/2, posy + kbox_height/2) --
         (posx - kbox_width/2, posy + kbox_height/2) --
         cycle;
    label(l, (posx, posy));
    for i:=0 upto 3:
        create_pins(name.subbyte[i],
                    posx - kbox_width/2 + sbox_width/2 +
                        i*(sbox_sep+sbox_width),
                    posy);
    endfor;
enddef;
%%% }}}

%%% {{{ create_sboxes(name,posx,posy)
def create_sboxes(suffix name)(expr posx, posy)=
    for i:=0 upto 3:
        create_sbox(name.subbyte[i],
                    posx-kbox_width/2 +sbox_width/2+
                        i*(sbox_sep+sbox_width),
                    posy);
    endfor;
enddef;
%%% }}}

%%% {{{ pair_in(name_of_box,i,j)   pair_out(name_of_box,i,j)
def pair_in(suffix meno)(expr i,j)=
    (meno.subbyte[i].in[j].x, meno.subbyte[i].in[j].y)
enddef;

def pair_out(suffix meno)(expr i,j)=
    (meno.subbyte[i].out[j].x, meno.subbyte[i].out[j].y)
enddef;
%%% }}}

%%% {{{ inout_path(meno1,i1,j1,meno2,i2,j2)
def inout_path(suffix prva)(expr i,j)(suffix druha)(expr ii,jj)=
    pair_out(prva,i,j) --
    pair_out(prva,i,j) - (0, pin_length) --
    pair_in(druha, ii, jj) + (0, pin_length) --
    pair_in(druha, ii, jj)
enddef;
%%% }}}

%%% {{{ connect_straight(meno1, meno2)
def connect_straight(suffix prva, druha)=
    for i:=0 upto 3:
        for j:=0 upto 3:
            draw inout_path(prva, i,j, druha,i,j);
        endfor;
    endfor;
enddef;
%%% }}}

%%% {{{ connect_shuffle(meno1, meno2)
def connect_shuffle(suffix prva, druha)=
    for i:=0 upto 3:
        for j:=0 upto 3:
            draw inout_path(prva, i, j, druha, j,i);
        endfor
    endfor;
enddef;
%%% }}}

%%% {{{ draw_in_pins(meno)
def draw_in_pins(suffix meno)=
    for i:=0 upto 3:
        for j:=0 upto 3:
            draw subpath(2,3) of
                (inout_path(meno,i,j,meno,i,j));
        endfor;
    endfor;
enddef;
%%% }}}

%%% {{{ draw_out_pins
def draw_out_pins(suffix meno)=
    for i:=0 upto 3:
        for j:=0 upto 3:
            draw subpath(0,1) of
                (inout_path(meno,i,j,meno,i,j));
        endfor;
    endfor;
enddef;
%%% }}}

def draw_cipher=
    r:=1;
    % round 1
    create_kbox(k[r], btex $\oplus key_1 $ etex, 0, - r*round_skip);
    create_sboxes(s[r], 0, -round_sbox_offset - r*round_skip);
    connect_straight(k[r],s[r]);
    r:=r+1;
    % round 2
    create_kbox(k[r], btex $\oplus key_2 $ etex, 0, - r*round_skip);
    create_sboxes(s[r], 0, -round_sbox_offset - r*round_skip);
    connect_shuffle(s[r-1],k[r]);
    connect_straight(k[r],s[r]);
    r:=r+1;
    % round 3
    create_kbox(k[r], btex $\oplus key_3 $ etex, 0, - r*round_skip);
    create_sboxes(s[r], 0, -round_sbox_offset - r*round_skip);
    connect_shuffle(s[r-1],k[r]);
    connect_straight(k[r],s[r]);
    r:=r+1;
    % round 4
    create_kbox(k[r], btex $\oplus key_4 $ etex, 0, - r*round_skip);
    create_sboxes(s[r], 0, -round_sbox_offset - r*round_skip);
    connect_shuffle(s[r-1],k[r]);
    connect_straight(k[r],s[r]);
    r:=r+1;
    % round 5
    create_kbox(k[r], btex $\oplus key_5 $ etex, 0, - (r-1)*round_skip
            -2*round_sbox_offset);
    connect_straight(s[r-1],k[r]);

    draw_in_pins(k[1]);
    draw_out_pins(k[5]);
enddef;

beginfig(1);
    draw_cipher;
endfig;

end

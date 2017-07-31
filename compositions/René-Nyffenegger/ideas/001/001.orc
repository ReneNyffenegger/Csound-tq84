sr     = 44100
kr     =  4410
nchnls =     2


gahall init 0

instr 1
  i_len    = p3
  i_freq   = cpspch(p5)
  i_amp    = p4 * 0.8
  i_hall   = p6

  k_amp      expseg 0.02,     0.02, 1,  i_len-0.04, 0.4,      0.02,0.02

  ao oscil i_amp*k_amp, i_freq, 1


  ; variation of instrument choo  ----------------;
  kamp  linen i_amp, 0.01, i_len, i_len/7          ;
                                                                                   ;
  arnd  rand kamp                                   ;
                                                                                   ;
  kbw   expseg   i_freq / 10, i_len, i_freq / 400 ;
                                                                                   ;
  aout1 butterbp arnd, i_freq,   1*kbw          ;
  aout2 butterbp arnd, i_freq*2, 2*kbw          ;
  aout3 butterbp arnd, i_freq*3, 3*kbw          ;
  aout4 butterbp arnd, i_freq*4, 4*kbw          ;
  aout5 butterbp arnd, i_freq*5, 5*kbw          ;
  ;--------------------------------------------------------------------------------;

  atotal = ao + aout1 +aout2 + aout3 + aout4 + aout5 


  gahall   = gahall + atotal * i_hall

  outs atotal , atotal
endin


instr 2
  i_freq   = cpspch(p5) 
  i_amp    = p4 * 0.5
  i_hall   = p6

  k_amp      expseg 0.02,     0.02, 1,     p3-0.04, 0.4,      0.02,0.02

  ao oscil i_amp*k_amp, i_freq, 2

  gahall     = gahall + ao * i_hall

  outs ao, ao
endin

instr 99
irevtime  = 1

apdelay delay gahall, sqrt(irevtime)/50

acomb0 comb apdelay,irevtime,0.05
acomb1 comb apdelay,irevtime,0.056
acomb2 comb apdelay,irevtime,0.061
acomb3 comb apdelay,irevtime,0.068
acomb4 comb apdelay,irevtime,0.072
acomb5 comb apdelay,irevtime,0.078
asum   =    (acomb0 + acomb1 + acomb2 + acomb3 + acomb4 + acomb5)/6
asig0 alpass asum,irevtime, 0.006
asig1 alpass asig0,irevtime,0.0063
asig2 alpass asum,irevtime, 0.0061
asig3 alpass asig1,irevtime ,0.0062
        outs (asig0+asig1),(asig2+asig3)
gahall = 0
endin

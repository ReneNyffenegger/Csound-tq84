sr     = 44100
kr     = 4410
nchnls = 2

instr 1
  ilen  =  p3
  iamp  =  p4
  ifrq  =  cpspch(p5)

  i_rand_amp = p6 * ifrq
  i_rand_frq = p7

  kenv  linseg  0, ilen/4, 1, ilen/2, 1, ilen/4, 0
  krand randh   i_rand_amp , i_rand_frq
  kpan  line    0, ilen, 1
  asig  oscil   iamp*kenv, ifrq +krand , 1

  out asig*kpan, asig*(1-kpan)
endin

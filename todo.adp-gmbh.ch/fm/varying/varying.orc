sr  = 44100
kr  = 4410

nchnls = 1

instr 1;
  ilen        = p3
  iamp        = p4
  ifrq        = cpspch(p5)
  
  k_carrier   oscili p6   , p7 *ifrq ,  1
  k_mod       oscili p9   , p10*ifrq ,  1
  k_index     oscili p12  , p13      ,  1

  k_carrier   = k_carrier + p8 
  k_mod       = k_mod     + p11
  k_index     = k_index   + p14

  asig        foscili 1, ifrq, k_carrier, k_mod, k_index, 1

  kenv        linseg 0, 1*ilen/10, iamp, 2*ilen/10, iamp/2, 3*ilen/10, iamp/3, 4*ilen/10, 0
              out   asig * kenv
endin

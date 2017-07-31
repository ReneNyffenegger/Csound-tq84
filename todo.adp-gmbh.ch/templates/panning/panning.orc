sr     = 44100
kr     = 4410
nchnls = 2


instr 1

  ilen  init abs(p3)
  iamp  init p4
  ifrq  init cpspch(p5)

  kenv  linen  iamp, 0.02, ilen, 0.04

  tigoto  tied_note

  kpan oscili 1, 0.5, 1

tied_note:

  asig oscili kenv, ifrq, 2 

  outs asig * kpan, asig * (1-kpan)

endin

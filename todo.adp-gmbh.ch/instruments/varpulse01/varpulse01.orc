sr     = 44100
ksmps  = 2
nchnls = 2

instr 1

  p3=p3*1.4

  ilen = p3
  iamp = ampdb(p4)
  ifrq = cpspch(p5)

  k0_1   phasor ifrq
  kwidth linseg 0.5, ilen, 0.01
  kenv   linseg 0, 0.02, 1, ilen-0.05, 1, 0.03, 0

  if k0_1 > kwidth then
    asig = -1;
  else
    asig = +1;
  endif

  outs asig*kenv*iamp, asig*kenv*iamp

endin

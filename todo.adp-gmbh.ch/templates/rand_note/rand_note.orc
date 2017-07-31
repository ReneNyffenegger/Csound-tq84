sr=44100
kr=4410
nchnls=1

instr 1

  igoto start

  goto no_start

start:

  ilen   = p3
  iampl  = p4

  inote1 = p5
  inote2 = inote1 + p7
  inote3 = inote1 + p9
  inote4 = inote1 + p11
  inote5 = inote1 + p13

  iprob1 = p6
  iprob2 = iprob1 + p8
  iprob3 = iprob2 + p10
  iprob4 = iprob3 + p12
  iprob5 = iprob4 + p14

  iprob_sum = iprob5

  irnd    init rnd (iprob_sum)

  if irnd < iprob1 igoto f1
  if irnd < iprob2 igoto f2
  if irnd < iprob3 igoto f3
  if irnd < iprob4 igoto f4
  if irnd < iprob5 igoto f5


f1:
  inote table inote1, 50
  igoto found_note

f2:
  inote table inote2, 50
  igoto found_note

f3:
  inote table inote3, 50
  igoto found_note
  
f4:
  inote table inote4, 50
  igoto found_note

f5:
  inote table inote5, 50


found_note:
  ;inote = 6.00
  ifrq = cpspch(inote)
  ;iampl = 10000

no_start:

  ;printk ifrq

  kenv  linen iampl, 0.02, ilen, 0.04
  asig oscili kenv, ifrq, 1
  out asig


endin

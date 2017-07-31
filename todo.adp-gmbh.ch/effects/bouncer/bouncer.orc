sr     = 44100
kr     = 4410
nchnls = 2

instr 1
  ilen     = p3
  iamp     = p4
  ifrq     = cpspch(p5)
  ipan     = p6

  kfreq_incr expon 5.6, ilen, 112

  kbounce oscil iamp, 1/ilen *kfreq_incr, 2
  a1 oscil kbounce, ifrq, 1

  a1 butterlp a1, 4*ifrq

  outs a1*ipan*10,a1*(1-ipan)*10
endin


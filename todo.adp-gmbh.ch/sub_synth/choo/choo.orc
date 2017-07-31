sr = 44100
kr = 44100

nchnls=1

instr 1

  ilen = p3
  iamp = p4
  ifrq = cpspch(p5)

  kamp  linen iamp, 0.01, ilen, ilen/7

  arnd  rand kamp

  kbw   expseg   ifrq / 10, ilen, ifrq / 400

  aout1 butterbp arnd, ifrq,   1*kbw 
  aout2 butterbp arnd, ifrq*2, 2*kbw
  aout3 butterbp arnd, ifrq*3, 3*kbw
  aout4 butterbp arnd, ifrq*4, 4*kbw
  aout5 butterbp arnd, ifrq*5, 5*kbw

  out (4*aout1 + 3*aout2 + 2*aout3 + 1.5*aout4 + aout5)/4

endin

sr     = 44100
kr     = 44100
nchnls = 2

instr 1

  ilen = p3
  iamp = ampdb (p4)
  ifrq = cpspch(p5)

  ibla = 350
  ifoo = 1/7

  kamp0 expseg 1, ilen, 1/256
  kamp0 = kamp0 * kamp0
  
  afm0  foscili ifrq*kamp0, ifrq*ifoo, 1, 4.9, 7, 1
  afm0_ butterlp afm0, ifrq/6
  afm0  balance afm0_, afm0
  kfm0  downsamp afm0

  afm1  foscili ifrq/30, ifrq/ibla, 1, 3, 2, 1
  kfm1  downsamp afm1

  kindx2 expseg 4, ilen, 2
  afm2  foscili 1, ifrq+kfm0, 1, 2+kfm1, kindx2, 1 
  kband expseg 140, ilen, 50
  afm2_ butterbp afm2, ifrq, kband
  afm2  balance afm2_, afm2

  kenv  linseg 0, 0.02, iamp, ilen-0.02, 0
  outs afm2*kenv, afm2 *kenv

endin


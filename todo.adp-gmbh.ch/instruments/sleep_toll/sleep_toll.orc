sr     = 44100
kr     = 44100
nchnls = 2

instr 1

  p3 = p3*1.2

  ilen  =        p3
  idens = 1000
  iamp  = ampdb (p4)
  ifrq  = cpspch(p5)

  a_grain_d    init 0
  a_grain_dd   init 0
  a_grain_ddd  init 0
  a_grain_dddd init 0

  kbend expseg 2.02,   ilen, 0.98
  kpoff expseg 1.1, ilen, 0.9

  kenv linseg 0, 0.02, iamp, ilen - 0.02, 0

  kenvs1 linseg 0, ilen/7, 0.3, 4*ilen/7, 1, 2*ilen/7, 0
  a_s1 oscili kenvs1 * iamp, ifrq / 2, 1

  kenvs2 linseg 0, ilen/7, 0.1, 4*ilen/7, 1, 2*ilen/7, 0
  a_s2 oscili kenvs2 * 0* iamp, ifrq , 1

  a_grain grain kenv, ifrq * kbend, idens, 10,    ifrq * kpoff , 1/ifrq    , 1, 2, 0.2

  k_d expseg 0.7, ilen, 0.1

  a_grain_d  = (1-k_d) * a_grain_d + k_d * a_grain
  a_grain_dd = (1-k_d) * a_grain_d + k_d * a_grain

  a_grain_d    delay a_grain_d,    0.98/ifrq
  a_grain_dd   delay a_grain_dd,   0.99/ifrq
  a_grain_ddd  delay a_grain_ddd,  1.00/ifrq
  a_grain_dddd delay a_grain_dddd, 1.01/ifrq

  a_out_l butterbp (a_grain_d  + a_grain_ddd )/2, ifrq, 10
  a_out_r butterbp (a_grain_dd + a_grain_dddd)/2, ifrq, 10

  outs a_out_l*4+ a_s1 + a_s2, a_out_r*4 + a_s1 + a_s2

endin

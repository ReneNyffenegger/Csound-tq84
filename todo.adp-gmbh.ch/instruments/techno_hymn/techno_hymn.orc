sr     = 44100
kr     = 22050
ksmps  = 2
nchnls = 2

;---------------------------------------------------------------------------
; Synth with Noise Filter Resonance
;---------------------------------------------------------------------------
instr 1

  ilen     =  p3
  iamp     =  p4
  ifqc     =  cpspch(p5)

  ifqc_start =      p6
  ifqc_end   =      p7

  kamp     expseg 0.00001, 0.5, iamp, 0.25, iamp*0.9, 0.25, iamp*0.8, 1.0, 0.00001

  kfco    linseg ifqc_start, ilen, ifqc_end
  irez     = 16
  ifqcadj  =      .149659863*sr
  
  apulse1 buzz    1,ifqc, sr/2/ifqc, 1 ; Avoid aliasing
  asaw1   integ   apulse1
  
  apulse2 buzz    1,ifqc*.505, sr/2/ifqc*.505, 1 ; Avoid aliasing
  asaw2   integ   apulse2
  
  axn     =       asaw1+asaw2-1

  ;ayn2  rezzy axn, kfco, 40
  ;ayn2l rezzy axn, kfco, 3

  ; Resonant Lowpass Filter (4 Pole)
  kc     =        ifqcadj/kfco
  krez2  =        irez/(1+exp(kfco/11000))
  ka1    =        kc/krez2-1;(1+krez2*iband)
  kasq    =       kc*kc
  kb     =        1+ka1+kasq
  
  ayn    nlfilt   axn/kb, (ka1+2*kasq)/kb, -kasq/kb, 0, 0, 1
  ayn2   nlfilt   ayn/kb, (ka1+2*kasq)/kb, -kasq/kb, 0, 0, 1
  
  ; Resonant Lowpass Filter (4 Pole)
  kcl    =        ifqcadj/kfco
  krez2l =        2.0/(1+exp(kfco/11000))
  ka1l   =        kcl/krez2l-1;(1+krez2l*iband)
  kasql  =        kcl*kcl
  kbl    =        1+ka1l+kasql
  
  aynl   nlfilt   axn/kbl, (ka1l+2*kasql)/kbl, -kasql/kbl, 0, 0, 1
  ayn2l  nlfilt   aynl/kbl, (ka1l+2*kasql)/kbl, -kasql/kbl, 0, 0, 1

  ares1  =       ayn2-ayn2l
  krms   rms     ares1, 100
  
  arand1 rand     krms
  ares2  butterbp arand1, kfco, kfco/8
  ares3  butterbp arand1, kfco*1.5, kfco/32*1.5
  aout   =       ayn2l+(ares2+ares3)

  asig_delayed_1  init 0
  asig_delayed_2  init 0
  asig_delayed_3  init 0
  asig_delayed_4  init 0

  asig_delayed_5  init 0
  asig_delayed_6  init 0
  asig_delayed_7  init 0
  asig_delayed_8  init 0

  asig_delayed_1 = asig_delayed_1 *0.45 + aout * kamp
  asig_delayed_2 = asig_delayed_2 *0.50 + aout * kamp
  asig_delayed_3 = asig_delayed_3 *0.55 + aout * kamp
  asig_delayed_4 = asig_delayed_4 *0.60 + aout * kamp

  asig_delayed_5 = asig_delayed_5 *0.66 + aout * kamp
  asig_delayed_6 = asig_delayed_6 *0.70 + aout * kamp
  asig_delayed_7 = asig_delayed_7 *0.75 + aout * kamp
  asig_delayed_8 = asig_delayed_8 *0.80 + aout * kamp

  asig_delayed_1 delay asig_delayed_1, 0.003
  asig_delayed_2 delay asig_delayed_2, 0.005
  asig_delayed_3 delay asig_delayed_3, 0.107
  asig_delayed_4 delay asig_delayed_4, 0.211
  asig_delayed_5 delay asig_delayed_5, 0.35
  asig_delayed_6 delay asig_delayed_6, 0.43
  asig_delayed_7 delay asig_delayed_7, 0.51
  asig_delayed_8 delay asig_delayed_8, 0.63

  aout_l = aout * kamp + asig_delayed_1 + asig_delayed_3 + asig_delayed_5 + asig_delayed_7
  aout_r = aout * kamp + asig_delayed_2 + asig_delayed_4 + asig_delayed_6 + asig_delayed_8

  outs aout_l, aout_r

endin

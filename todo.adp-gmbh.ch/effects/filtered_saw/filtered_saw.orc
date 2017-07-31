sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 2

instr 1 
  ilen             =        p3
  ifrq             = cpspch(p4)
  iamp             =        p5

  i_filt_frq_start =        p6  
  i_filt_frq_end   =        p7

  kenv  linen iamp,ilen/5,ilen,ilen/5
  kpan  phasor 1/ilen
  a1    oscil kenv,ifrq       ,9
  a2    oscil kenv,ifrq*0.999 ,9
  a3    oscil kenv,ifrq*1.001 ,9
  k_flt_freq    line i_filt_frq_start,ilen,i_filt_frq_end
  a4=(a1+a2+a3)/3
  aout  reson a4,k_flt_freq,100, 2
  outs aout*kpan , aout*(1-kpan)
endin

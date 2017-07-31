sr        =  44100
kr        =  4410
nchnls    =   2


instr 1
  ilen      =         p3
  iseed     =         p4
  krndfrq   =         p5

  krndval   randh     1000,krndfrq,iseed 
  kenv      linseg    0, ilen/4, 1000, ilen/2, 1000, ilen/4, 0
  a2        oscil     kenv, krndval,1              ; SINE OSC CONTROLLED BY S&H;;;amp=600
  kpan      oscil     1, 0.4, 1
  
  asig1     =         a2*kpan
  asig2     =         a2*(1-kpan)

          outs      asig1,asig2
endin

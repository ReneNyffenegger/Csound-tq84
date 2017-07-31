sr      =       44100
kr      =       44100
nchnls  =       2


instr   1
  ifrq     init     cpspch(p4)
  iamp     init     p5/3
  p3       =  0.4

  kmod     linseg  0, p3, 1-2/256   

  kmodamp  tablei kmod, 3, 1

  aindex   oscili  kmodamp,ifrq,1

  asignal  tablei   0.5+aindex/2,2,1
  
           outs    asignal*iamp, asignal*iamp
endin

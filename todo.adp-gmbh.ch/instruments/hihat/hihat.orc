sr     = 44100
kr     =  4410
ksmps  =    10
nchnls =     1

instr 1

  ilen init p3
  iamp init p4

  kcutfreq  expon     10000, 0.1, 2500
  aamp      expon     iamp,  0.1,   10
  arand     rand      aamp
  alp1      butterlp  arand,kcutfreq
  alp2      butterlp  alp1,kcutfreq
  ahp1      butterhp  alp2,3500
  asigpre   butterhp  ahp1,3500
  asig      linen    (asigpre+arand/2),0,ilen, .05  

  out asig
endin

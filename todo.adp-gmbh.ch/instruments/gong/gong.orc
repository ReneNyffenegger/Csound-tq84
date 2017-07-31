sr = 44100
kr  =  441
ksmps= 100
nchnls = 1

instr 1; *****************************************************************
  ilen  = p3
  ifrq  = cpspch(p4)

  print ifrq

  ifrq1 =  1.0000  * ifrq
  ifrq2 =  1.1541  * ifrq
  ifrq3 =  1.6041  * ifrq
  ifrq4 =  1.5208  * ifrq
  ifrq5 =  1.4166  * ifrq
  ifrq6 =  2.7916  * ifrq
  ifrq7 =  3.3833  * ifrq

  iamp  = p5

  iamp1 =  1.0000  * iamp
  iamp2 =  0.8333  * iamp
  iamp3 =  0.6667  * iamp
  iamp4 =  1.0000  * iamp
  iamp5 =  0.3333  * iamp
  iamp6 =  0.3333  * iamp
  iamp7 =  0.3333  * iamp

  aenv1    oscili  iamp1, 1/ilen, 2
  aenv2    oscili  iamp2, 1/ilen, 2
  aenv3    oscili  iamp3, 1/ilen, 2
  aenv4    oscili  iamp4, 1/ilen, 2
  aenv5    oscili  iamp5, 1/ilen, 2
  aenv6    oscili  iamp6, 1/ilen, 2
  aenv7    oscili  iamp7, 1/ilen, 2

  asig1    oscili  aenv1, ifrq1, 1
  asig2    oscili  aenv2, ifrq2, 1
  asig3    oscili  aenv3, ifrq3, 1
  asig4    oscili  aenv4, ifrq4, 1
  asig5    oscili  aenv5, ifrq5, 1
  asig6    oscili  aenv6, ifrq6, 1
  asig7    oscili  aenv7, ifrq7, 1

         out     asig1 + asig2 + asig3 + asig4 + asig5 + asig6 + asig7
endin

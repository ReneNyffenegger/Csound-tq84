sr = 44100
kr = 4410
ksmps =10
nchnls=1

instr 1
  ifrq   init cpspch(p5)
  ilen   init        p3
  iamp   init        p4

  k2    expseg 3000, 0.08, 9000, ilen, 1

  ksweep =k2-3000
  
  a1    oscil    iamp*0.40, ifrq*0.998-.12, 1
  a2    oscil    iamp*0.40, ifrq*1.002-.12, 2
  a3    oscil    iamp*0.40, ifrq*1.002-.12, 1
  a4    oscil    iamp*0.70, ifrq-.24      , 2
  
  aall= a1+a2+a3+a4
  a6    butterlp  aall,ksweep
  a8    butterlp  a6, ksweep
  a9    butterhp  a8, 65  
  a10   butterhp  a9, 65  
  a11   butterlp  a10,1000
  asig  linen    a11, p6, ilen, p7
  out asig
endin

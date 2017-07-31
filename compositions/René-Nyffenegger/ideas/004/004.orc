sr     = 44100;
kr     = 4410
nchnls = 2
instr 1 ;; See also Simple Drum
  iptch = cpspch(p5)
  asig pluck p4, iptch, iptch*0.81, 1, 3, .5
  outs asig, asig
endin
instr 2  ;; See also Bass
  ifrq   init cpspch(p5)
  ilen   init        p3
  iamp   init        p4

  k2    expseg 3000, 0.08, 9000, ilen, 1

  ksweep =k2-3000
  
  a1    oscil    iamp*0.40, ifrq*0.998-.12, 2
  a2    oscil    iamp*0.40, ifrq*1.002-.12, 3
  a3    oscil    iamp*0.40, ifrq*1.002-.12, 2
  a4    oscil    iamp*0.70, ifrq-.24      , 3
  
  aall= a1+a2+a3+a4
  a6    butterlp  aall,ksweep
  a8    butterlp  a6, ksweep
  a9    butterhp  a8, 65  
  a10   butterhp  a9, 65  
  a11   butterlp  a10,1000
  asig  linen    a11, 0.02, ilen, 0.01 
  outs asig, asig
endin
instr 3
  ifrq = cpspch(p5)
  
  kenv linseg 0, .01, p4, p3-.02, p4, .01, 0

  a1     oscil 8,   1      * ifrq,  3
  a2     oscil 8,   2      * ifrq,  3
  a3     oscil 8,   2.9966 * ifrq,  3
  a4     oscil 8,   4      * ifrq,  3
  a5     oscil 3,   5.9932 * ifrq,  3
  a6     oscil 2,   8      * ifrq,  3
  a7     oscil 1,  10.0794 * ifrq,  3
  a8     oscil 1,  11.9864 * ifrq,  3
  a9     oscil 4,  16      * ifrq,  3

  asig = kenv* (a1+a2+a3+a4+a5+a6+a7+a8+a9)

  outs asig, asig
endin
instr 4 ;; See also Hand clap

  iamp     = p4
  
  kamp1 expon 1.25, .03,  .0001
  kamp2 expseg .001,.005,1, .35, .001
  
  anoise rand 1

  anoise1 = anoise*kamp1
  anoise2 = anoise*kamp2
  
  adel1     = anoise1
  adel2 delay anoise1, .01
  adel3 delay anoise1, .02

  adel4 delay anoise2, .03
  
  abp1 resonz adel1,  400,  1100
  abp2 resonz adel2,  600,  1100
  abp3 resonz adel3,  800,  1100
  abp4 resonz adel4,  1100, 1100
  
  asig = iamp*(abp1+abp2+abp3+abp4)

  outs asig, asig
endin

instr 5 ;; See also Hand clap
  i_len = p3+0.2
  
  icps = 51
  iamp = p4
  
  kcps	expon 1, 0.022, 0.5
  kcps	=  4.3333 * kcps * icps + icps
  
  a1	phasor kcps
  a2	phasor kcps, 0.5
  a1	=  a1 - a2
  
  kffrq1  expon 1, 0.07, 0.5
  kffrq2	expon 1, 0.01, 0.5
  kffrq	=  (kffrq1 + kffrq2) * kcps

  a1	pareq a1, kffrq, 0, 0.7071, 2
  
  a1	=  taninv(a1 * 20)
  
  a1	pareq a1, kcps * 6, 2, 1, 2
  a1	pareq a1, icps * 1.25, 2.5, 1, 0
  
  a2	linseg 1, i_len, 1, 0.01, 0, 1, 0
  a1	=  a1 * a2 * iamp * 4500 + (1/1e24)
  
  outs a1,a1
endin

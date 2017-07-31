sr	=  48000
ksmps	=  32
nchnls	=  2


instr 1
  i_len = p3+0.2
  
  icps = 51
  iamp = 1
  
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

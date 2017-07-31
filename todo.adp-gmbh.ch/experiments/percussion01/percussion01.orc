sr     = 44100
kr     = 44100
nchnls =     2

instr 1; hihat

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

  outs asig, asig
endin

instr 2; snare
  icps0  = 147
  iamp   = p4*0.7

  icps1  =  2.0 * icps0
  
  kcps   port icps0, 0.007, icps1
  kcpsx  =  kcps * 1.5
  
  kfmd   port   0.0, 0.01, 0.7
  aenv1  expon  1.0, 0.03, 0.5
  kenv2  port   1.0, 0.008, 0.0
  aenv2  interp kenv2
  aenv3  expon  1.0, 0.025, 0.5
  
  a_     oscili 1.0, kcps, 1
  a1     oscili 1.0, kcps * (1.0 + a_*kfmd), 1
  a_     oscili 1.0, kcpsx, 1
  a2     oscili 1.0, kcpsx * (1.0 + a_*kfmd), 1
  
  a3     unirand 2.0
  a3     =  a3 - 1.0
  a3     butterbp a3, 5000, 7500
  a3     =  a3 * aenv2
  
  a0     =  a1 + a2*aenv3 + a3*1.0
  a0     =  a0 * aenv1

  outs a0*iamp, a0*iamp
endin


instr 3; kick
  iamp      = p4

  k1  expon    120, .2, 50    
  k2  expon    500, .4, 200
  a1  oscil    iamp, k1, 1
  a2  reson    a1, k2, 50
  a3  butterlp  a2+a1,k1,1
  a4  butterlp  a3,   k1,1
  a5  butterlp  a4,2500,1
  a6  butterhp  a5,50
  a7  butterhp  a6,50
  a8  linen    a7,0.01,p3, .2  
  
  outs a8,a8
endin

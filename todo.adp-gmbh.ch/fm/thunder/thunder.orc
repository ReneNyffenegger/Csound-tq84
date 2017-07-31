sr     = 44100
kr     = 44100
nchnls = 2

instr 1

  ilen = p3
  iamp = ampdb (p4)
  ifrq = cpspch(p5)

  k_feedback init 0

  ; ------- FM C
  ;kfrqC   = 15
  kfrqC   expseg  4.0, ilen,  1.0
  kampC   = 0.09
  kC_Cin  expseg  9.0, ilen,  4.0
  kC_Min  = 1.41
  kC_Iin  expseg 40.0, ilen, 20.0

  aCout    foscili kampC + k_feedback * 3, kfrqC, kC_Cin, kC_Min, kC_Iin, 1
  kCout    downsamp aCout

  ; ------- FM M
  ;kfrqM      expseg   1.4, ilen,  1.0
  kfrqM    = 1
  kampM      expseg   9.0, ilen,  4.0
  kM_Cin     expseg  14.0, ilen,  7.0 
  kM_Min   = 1
  kM_Iin   = 10

  aMout    foscili kampM + k_feedback * 5, kfrqM, kM_Cin, kM_Min, kM_Iin, 1
  kMout    downsamp aMout


  ; ------- FM I
  kfrqI    = 750
  kampI      expseg 55.0, ilen, 15.0
  kI_Cin   = 1
  kI_Min     expseg 10.0, ilen,  7.0
  ;kI_Iin    expseg 14.0, ilen,  2.0 
  kI_Iin   = 7 + k_feedback * 7

  aIout    foscili kampI, kfrqI, kI_Cin, kI_Min, kI_Iin, 1
  kIout    downsamp aIout

  ; ------- FM out
  kO_Cin  = 1
  kO_Min  = 3
  kO_Iin  = 7

  afmout  foscili 1, ifrq, kO_Cin+kCout, kO_Min+kMout, kO_Iin+kIout, 1

  ;afmout_  rezzy  afmout, 90 , 90
  ;afmout   balance afmout_,afmout

  afmout_  butterbp afmout, ifrq, ifrq/10
  afmoutf1 balance  afmout_, afmout

  afmout_  butterlp afmout , ifrq;, ifrq/20
  afmoutf2 balance  afmout_, afmout

  afmout = afmoutf2-afmoutf1

  kfmout_ downsamp afmout
  k_feedback = kfmout_

  afmout_ delay afmout, 0.009


  kenv  linseg 0, 0.02, iamp, 0.5, iamp*0.5, ilen-0.52, 0
  outs kenv* afmout, kenv*afmout_

endin

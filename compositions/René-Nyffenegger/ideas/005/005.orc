sr     = 44100
ksmps  = 2
nchnls = 2

seed 0; (instr 4)

instr 1

  p3   =  0.9

  ilen        =        p3
  iamp        =        p4
  ifrq        = cpspch(p5)

  ipan_start  =        p6
  ipan_end    =        p7

  kpan_       phasor   1/ilen
  kpan        = ipan_start + kpan_ * (ipan_end - ipan_start)

  i_time_up   = 0.20
  i_time_down = 0.34

  i_time_rest = ilen - i_time_up - i_time_down
   
  kenv  linseg 0, 0.02, iamp, ilen-0.02-0.1, iamp, 0.1, 0

  kenv1 linseg 0, 0/6*i_time_rest, 0, i_time_up, 1, i_time_down, 0, 5/6*i_time_rest, 0
  kenv2 linseg 0, 1/6*i_time_rest, 0, i_time_up, 1, i_time_down, 0, 4/6*i_time_rest, 0
  kenv3 linseg 0, 2/6*i_time_rest, 0, i_time_up, 1, i_time_down, 0, 3/6*i_time_rest, 0
  kenv4 linseg 0, 3/6*i_time_rest, 0, i_time_up, 1, i_time_down, 0, 2/6*i_time_rest, 0
  kenv5 linseg 0, 4/6*i_time_rest, 0, i_time_up, 1, i_time_down, 0, 1/6*i_time_rest, 0
  kenv6 linseg 0, 5/6*i_time_rest, 0, i_time_up, 1, i_time_down, 0, 0/6*i_time_rest, 0

  asig1 oscili 1, 1*ifrq, 1
  asig2 oscili 1, 2*ifrq, 1
  asig3 oscili 1, 3*ifrq, 1
  asig4 oscili 1, 4*ifrq, 1
  asig5 oscili 1, 5*ifrq, 1
  asig6 oscili 1, 6*ifrq, 1


  asig_ = 1.0 * kenv1 * asig1 + \
          0.7 * kenv2 * asig2 + \
          0.5 * kenv3 * asig3 + \
          0.3 * kenv4 * asig4 + \
          0.2 * kenv5 * asig5 + \
          0.1 * kenv6 * asig6 

  asig_ = asig_ * kenv

  asig_r reverb asig_, 0.5

  asig_t = asig_ / 2 + asig_r /2 

  outs asig_t * kpan, asig_t * (1-kpan)

endin


instr 2; Hi Hat

  ilen init p3
  iamp init p4

  kcutfreq  expon     1000, 0.1, 250
  aamp      expon     iamp,  0.1,   10
  arand     rand      aamp
  alp1      butterlp  arand,kcutfreq
  alp2      butterlp  alp1,kcutfreq
  ahp1      butterhp  alp2,3500
  asigpre   butterhp  ahp1,3500
  asig      linen    (asigpre+arand/2),0,ilen, .05  

  outs asig, asig
endin

instr 3; Snare
  icps0  = 147
  iamp   = p4*0.7

  icps1  =  2.0 * icps0
  
  kcps   port icps0, 0.007, icps1
  kcpsx  =  kcps * 1.5
  
  kfmd   port   0.0, 0.01, 0.7
  aenv1  expon  1.0, 0.03, 0.5
  kenv2  port 1.0, 0.008, 0.0
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


instr 4;
  iamp =  p4

  icps  = 50
  
  print icps
  print iamp
  
  /* ------------------------------------------------------------------------- */
  
  ivol     = 7000
  ibpm     = 190        ;  <=== Change here
  
  ifrqs    = 5.3333     /* oscillator start frq. / note freq.   */
  ifrqe    = 1.0        /* oscillator end frequency / note frq. */
                        /*                                      */ 
  ifrqd    = 20.0       /* osc. freq. envelope speed            */
                        /*                                      */ 
  iffr1s   = 880        /* lowpass filter start freq. 1 (Hz)    */
  iffr1d   = 128        /* lowpass filter freq. 1 decay speed   */
  iffr2s   =   0        /* lowpass filter start freq. 2 (Hz)    */
  iffr2d   =   1        /* lowpass filter freq. 2 decay speed   */
  iffr3s   =   8        /* LP filter start freq. 3 / note frq   */
  iffr3d   =   8        /* lowpass filter freq. 3 decay speed   */
  iffr4s   =   0        /* LP filter start freq. 4 / note frq   */
  iffr4d   =   1        /* lowpass filter freq. 4 decay speed   */
                        /*                                      */ 
  iEQ1fo   =   0.5      /* EQ 1 frequency / osc. frequency      */
  iEQ1fn   =   0        /* EQ 1 frequency / note frequency      */
  iEQ1fa   =   0        /* EQ 1 frequency (Hz)                  */
  iEQ1l    =   0.25     /* EQ 1 level                           */
  iEQ1q    =   0.7071   /* EQ 1 Q                               */
  iEQ1m    =   1        /* EQ 1 mode (0:peak,1:low,2:high)      */
                        /*                                      */
  iEQ2fo   =   0.5      /* EQ 2 frequency / osc. frequency      */
  iEQ2fn   =   0        /* EQ 2 frequency / note frequency      */
  iEQ2fa   =   0        /* EQ 2 frequency (Hz)                  */
  iEQ2l    =   0.25     /* EQ 2 level                           */
  iEQ2q    =   0.7071   /* EQ 2 Q                               */
  iEQ2m    =   1        /* EQ 2 mode (0:peak,1:low,2:high)      */
                        /*                                      */ 
  iEQ3fo   =   0.5      /* EQ 3 frequency / osc. frequency      */
  iEQ3fn   =   0        /* EQ 3 frequency / note frequency      */
  iEQ3fa   =   0        /* EQ 3 frequency (Hz)                  */
  iEQ3l    =   4        /* EQ 3 level                           */
  iEQ3q    =   2.0      /* EQ 3 Q                               */
  iEQ3m    =   0.0      /* EQ 3 mode (0:peak,1:low,2:high)      */
                        /*                                      */ 
  iEQ4fo   =   0        /* EQ 4 frequency / osc. frequency      */
  iEQ4fn   =   1.5      /* EQ 4 frequency / note frequency      */
  iEQ4fa   =   0        /* EQ 4 frequency (Hz)                  */
  iEQ4l    =   2.0      /* EQ 4 level                           */
  iEQ4q    =   1.0      /* EQ 4 Q                               */
  iEQ4m    =   0        /* EQ 4 mode (0:peak,1:low,2:high)      */
                        /*                                      */
  insmix   =   16.0     /* noise mix                            */
                        /*                                      */
  iEQn1fo  =   0        /* noise EQ 1 frequency / osc. freq.    */
  iEQn1fn  =   16       /* noise EQ 1 frequency / note freq.    */
  iEQn1fa  =   0        /* noise EQ 1 frequency (Hz)            */
  iEQn1l   =   0.0625   /* noise EQ 1 level                     */
  iEQn1q   =   0.7071   /* noise EQ 1 Q                         */
  iEQn1m   =   1        /* noise EQ 1 mode (0:peak,1:lo,2:hi)   */
                        /*                                      */ 
  iEQn2fo  =   0        /* noise EQ 2 frequency / osc. freq.    */
  iEQn2fn  =   16       /* noise EQ 2 frequency / note freq.    */
  iEQn2fa  =   0        /* noise EQ 2 frequency (Hz)            */
  iEQn2l   =   0.0625   /* noise EQ 2 level                     */
  iEQn2q   =   0.7071   /* noise EQ 2 Q                         */
  iEQn2m   =   1        /* noise EQ 2 mode (0:peak,1:lo,2:hi)   */

/* ------------------------------------------------------------------------- */

  p3  =  p3+0.15  /* increase note length */
  
  ibtime  =  60/ibpm
  
  kamp  linseg 1,p3-0.15,1,0.05,0,0.1,0   /* amp. envelope */
  kamp  =  kamp*iamp*ivol
  
  kcps  port ifrqe*icps,ibtime/ifrqd,ifrqs*icps /* kcps = osc. frequency */
  knumh =  sr/(2*kcps)        /* knumh = num. of harmonics */
  
  a_  buzz sr/(3.14159265*10),kcps,knumh,1,0    /* square oscillator */
  a__ buzz sr/(3.14159265*10),kcps,knumh,1,0.5
  
  a0  tone a_-a__,10
  
  a_  unirand 2         /* noise generator */
  a_  =  a_-1
  
  a_  pareq a_,iEQn1fa+icps*iEQn1fn+kcps*iEQn1fo,iEQn1l,iEQn1q,iEQn1m
  a_  pareq a_,iEQn2fa+icps*iEQn2fn+kcps*iEQn2fo,iEQn2l,iEQn2q,iEQn2m
  
  a0  =  a0+insmix*a_
  
  /* EQ */
  
  a0  pareq a0,iEQ1fa+icps*iEQ1fn+kcps*iEQ1fo,iEQ1l,iEQ1q,iEQ1m
  a0  pareq a0,iEQ2fa+icps*iEQ2fn+kcps*iEQ2fo,iEQ2l,iEQ2q,iEQ2m
  a0  pareq a0,iEQ3fa+icps*iEQ3fn+kcps*iEQ3fo,iEQ3l,iEQ3q,iEQ3m
  a0  pareq a0,iEQ4fa+icps*iEQ4fn+kcps*iEQ4fo,iEQ4l,iEQ4q,iEQ4m
  
  
  kffr1 port 0,ibtime/iffr1d,iffr1s /* LP filter freq. envelopes */
  kffr2 port 0,ibtime/iffr2d,iffr2s
  kffr3 port 0,ibtime/iffr3d,iffr3s*icps
  kffr4 port 0,ibtime/iffr4d,iffr4s*icps
  
  kffrq =  kffr1+kffr2+kffr3+kffr4  /* kffrq = LP filter frequency */
  
  a0  butterlp a0,kffrq   /* LP filter */
  
  a_  =  a0*kamp      /* apply envelope */

  outs a_, a_
endin


instr 5;  Simple Sine
  ilen  =        p3
  iamp  =        p4
  ifrq  = cpspch(p5)
  ipan  =        p6

  kenv  linseg 0, ilen/30*3, iamp, ilen/30*3, iamp/2, ilen/30*18, iamp/2.4, ilen/30*6, 0

  asig  oscili   kenv, ifrq, 1

  outs asig * ipan, asig *(1-ipan)

endin


instr 6; filtered saw
  ilen             =        p3
  ifrq             = cpspch(p4)
  iamp             =        p5

  i_filt_frq_start =        p6  
  i_filt_frq_end   =        p7

  kenv  linen iamp,ilen/5,ilen,ilen/5
  kpan  phasor 1/ilen
  a1    oscil kenv,ifrq       ,2
  a2    oscil kenv,ifrq*0.999 ,2
  a3    oscil kenv,ifrq*1.001 ,2
  k_flt_freq    expseg i_filt_frq_start,ilen,i_filt_frq_end
  a4=(a1+a2+a3)/3
  aout  reson a4,k_flt_freq,100, 2
  outs aout*kpan , aout*(1-kpan)
endin


sr      =       44100
kr      =       4410
ksmps   =       10
nchnls  =       2

;================================================================;
;                                                                ;
;               General Purpose Waveshaping Instrument           ;
;                                                                ;
;                                                                ;
;                Coded by Russell Pinkston - Univ. of Texas      ;


instr   1

  ihertz           = cpspch(p4)
  iamp             =        p5
  i_transfer_func  =         2
  i_normalize_func =         3
  
  kenv    linseg  0, .01, iamp, p3-.11, 1, .1, 0             ;overall amp envelope
  kctrl   linseg  0,p3/2,.999,p3/2,0
  aindex  oscili  kctrl/2,ihertz,1
  asignal tablei  .5+aindex,i_transfer_func,1
  knormal tablei  .5+kctrl, i_normalize_func ,1               ;amplitude normalization function
          outs    asignal*knormal*kenv, asignal*knormal*kenv
endin

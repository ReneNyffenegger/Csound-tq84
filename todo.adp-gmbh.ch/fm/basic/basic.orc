sr     = 44100
kr     = 44100
nchnls = 2

instr 1;

  ilen    = p3
  iamp    = p4

  icps    = p5
  icar    = p6
  imod    = p7
  indx    = p8

  kenv     linseg 0, 0.02, 1,ilen-0.02, 0

  asig_l     foscili iamp, icps, icar, imod, indx, 1

  ;----- FM without foscili ----------------
  icar_frq    = icps     * icar
  imod_frq    = icps     * imod
  imod_amp    = imod_frq * indx
  koscil      oscili imod_amp, imod_frq, 1  
  asig_r      oscili iamp   , icar_frq + koscil, 1  
  ;---------------------------------

  outs asig_l * kenv, asig_r* kenv
endin

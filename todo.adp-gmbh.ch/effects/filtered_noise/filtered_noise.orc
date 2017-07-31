sr     = 44100
kr     = 4410
nchnls = 2

instr 1
  ilen           =    p3
  iamp           =    p4
  i_nof_pulses   =    p5
  i_nof_pans     =    p6

  i_sweep_start  = 16000
  i_sweep_end    =   700
  i_band_width   =   100

  ksweep expseg i_sweep_start, ilen, i_sweep_end

  kenv_total    linseg 0, ilen/20, 1, 19/20*ilen, 0

  kenv          oscil  1,  i_nof_pulses/ilen, 10
  kpan          oscil  1,  i_nof_pans  /ilen, 11

  arand         rand   iamp
  afilt         reson  arand ,ksweep,i_band_width,2

  asig =        afilt*kenv*kenv_total
  outs          asig*kpan,asig*(1-kpan)
endin

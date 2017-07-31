kr     =  4410
nchnls =     2

gall init 0

instr 1

  ;;;  i_freq   = cpspch(p5)


  gall   = gall + ao

  outs ao , ao 
endin


instr 2
  gall     = gall + ao

  outs ao, ao
endin

instr 99
  ao   reverb gall, 0.2

  outs ao, ao
  gall = 0
endin

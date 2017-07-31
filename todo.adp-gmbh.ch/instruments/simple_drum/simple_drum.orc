sr     = 44100
kr     = 4410
nchnls = 1

instr 1
  iptch = cpspch(p5)
  asig pluck p4, iptch, iptch*0.81, 1, 3, .5
  out asig
endin

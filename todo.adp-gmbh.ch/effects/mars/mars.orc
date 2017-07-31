sr = 44100
kr  =  441
ksmps= 100
nchnls = 1


instr 1;
iamp1   = p4
ifrq    = cpspch(p5)

ioff1   = 1.001 
ioff2   = 1.004 
ioff3   = 1.009
ioff4   = 1.025
ioff5   = 1.036
ioff6   = 1.049

   a0    oscili   iamp1, ifrq,       1
   a1    oscili   iamp1, ifrq*ioff1, 1
   a2    oscili   iamp1, ifrq*ioff2, 1
   a3    oscili   iamp1, ifrq*ioff3, 1
   a4    oscili   iamp1, ifrq*ioff4, 1
   a5    oscili   iamp1, ifrq*ioff5, 1
   a6    oscili   iamp1, ifrq*ioff6, 1

         out   a0+a1+a2+a3+a4+a5+a6

endin

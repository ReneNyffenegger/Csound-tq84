sr = 44100
kr   = 441
ksmps =100
nchnls = 1


instr  1;
ilen     =  p3
iamp     =  p4
ifrq     =  cpspch(p5)
if1      =  p6 ; shape of envelope
if2      =  p7 ; waveform

   aenv   oscili  iamp, 1/ilen, if2
   asig   oscili  aenv, ifrq, if1
          out    asig
endin

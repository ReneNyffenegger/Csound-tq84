sr     = 44100
kr     = 4410
nchnls = 1

instr 1;
idur   = p3
iamp   = p4
ifenv  = 31
ifdyn  = 31
ifq1   = cpspch(p5)
if1    = 1
ifq2   = cpspch(p5)
if2    = 1
imax   = 5

   aenv  oscili   iamp, 1/idur, ifenv

   adyn  oscili   ifq2*imax, 1/idur, ifdyn
   amod  oscili   adyn, ifq2, if2

   a1    oscili   aenv, ifq1+amod, if1
         out      a1
endin

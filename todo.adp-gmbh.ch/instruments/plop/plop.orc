sr = 44100
kr = 4410
ksmps = 10
nchnls=1

instr 1
  ifreq = cpspch(p5)
  iampl = p4

  kenv  expseg .0001,.01,iampl,p3-.01,.0001
  arand rand    kenv
  asig  reson   arand, ifreq ,ifreq/25,1
  asigb balance asig, arand
        out     asigb
endin

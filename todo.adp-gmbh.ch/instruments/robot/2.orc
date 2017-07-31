sr        =         44100
kr        =         4410
ksmps     =         10
nchnls    =          2

instr 1
                                             
  ilen      =         p3
  irnd_seed =         p4                      
  irnd_frq  =         p5                     
  
  krnd_val  randh     8000, irnd_frq, irnd_seed 

  asin600   oscil     1.2, 600, 11
  a4        reson     asin600, krnd_val+1000, 50 
  kenv     linen      10, ilen/2, ilen, ilen/2
  kpan      oscil     1,.14,17
  
  asig1     =         a4*kenv*kpan
  asig2     =         a4*kenv*(1-kpan)
  
            outs      asig1,asig2
endin

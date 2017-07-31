sr        =         44100
kr        =         4410
nchnls    =         2

instr 1
  ilen      =         p3
  iamp      =         p4
  iclk_frq  =         p5                
  
  apuls     oscil     iamp, iclk_frq, 1            
  apuls_    butterbp  apuls, 2500, 200   

  aclick    oscil     apuls_, iclk_frq, 2 
  kswp      line      1800,ilen,380   
  afilt     reson     aclick, kswp, 20 
  asig      linen     afilt, ilen/2,ilen,ilen/2
  kpan      line      0,ilen,1 
       
            outs      asig*kpan, asig*(1-kpan)
endin

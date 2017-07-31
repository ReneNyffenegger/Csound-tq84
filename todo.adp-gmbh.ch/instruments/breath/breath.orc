sr        =    44100
kr        =    4410
nchnls    =    2

instr 1
  ilen      =         p3
  ienvamp   =         p4
  ifreq     =         p5
                                          
  krnd_amp  linseg   0,ilen*.6, ienvamp*2, ilen*.4, 0
  krnd_frq  linen    ienvamp, 0.05*ilen, ilen, ilen*.3
  anoise    randi    krnd_amp, krnd_frq
  aosc      oscil    anoise, ifreq, 1
  aosc2     reson    aosc,ifreq/30,100,2
            outs     aosc2,aosc2
endin

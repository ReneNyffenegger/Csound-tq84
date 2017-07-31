gareverberation init 0

instr X

  ; asig somehow being produced here

  gareverberation = gareverberation + asig
endin

instr 99

  idur      = p3
  igain     = p4    ; gain to control amplitude, 0 <= igain <= 1
  irevtime  = p5    ; reverberat time
  ireverb   = p6    ; percent reverberated signal, 0 <= ireverb <= 1 
  iacoustic  = 1 - ireverb  ; pct unreverberated
  p3      = p3+irevtime+.1 

  inorm    = .91999    ; constant to normalize the tone
;  ; make sure gain is between 0 and 1 (1 = 100%)
;  igain    = (igain <= 0 ? .01 : igain)
;  igain    = (igain > 1.0 ? 1.0 : igain)
  ; make sure % reverb between 0 and 1 (0 ok, 1=100%)
  ;ireverb  = (ireverb > .99 ? .99 : ireverb)
  ;ireverb  = (ireverb < 0 ? 0 : ireverb)
  iacoustic  = 1 - ireverb ; percent unreverberated
  ac1   comb    gareverberation, irevtime, .0297
  ac2   comb    gareverberation, irevtime, .0371
  ac3   comb    gareverberation, irevtime, .0411
  ac4   comb    gareverberation, irevtime, .0437
  acomb   =    ac1 + ac2 + ac3 + ac4
  ap1   alpass  acomb, .09683, .005
  arev  alpass  ap1,   .03292, .0017

  ; mix signal (percent acoustic and percent reverbed)

  aout   =     (iacoustic * gareverberation) + (ireverb * arev)

  ; attenuate and output the signal
       out     aout*igain/inorm
  gareverberation  =     0
endin

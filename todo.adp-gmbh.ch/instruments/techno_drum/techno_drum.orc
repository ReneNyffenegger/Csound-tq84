sr     = 44100
kr     = 4410
nchnls = 1

instr 1
  p3           = 0.3
  i_len        = 0.3
  i_frq_start  = 200
  i_frq_end    =  20

  i_pow_amp    = 5
  i_pow_frq    = 0.4

  i_pow_sig    = 0.7
  
  kphase     phasor 1/i_len
  
  kamp       pow kphase, i_pow_amp
  kamp       = 1 - kamp

  kfrq       pow kphase, i_pow_frq
  kfrq       = (i_frq_start - i_frq_end) * (1-kfrq)+i_frq_end

  ksig       oscili kamp, kfrq, 1

  if ksig < 0 goto neg

  ksig       pow ksig, i_pow_sig

  goto out
neg:

  ksig       pow -ksig, i_pow_sig
  ksig = -ksig

out:
  asig       upsamp ksig
             out asig * 32000
endin

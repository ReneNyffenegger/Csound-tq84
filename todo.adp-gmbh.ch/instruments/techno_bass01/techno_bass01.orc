/* bass_01.orc - filtered and distorted sawtooth/square bass with */
/*               bass drum. Written by Istvan Varga, 2002         */

sr      =  44100
ksmps    =     10
nchnls  =      1

gi_time_beat  =  60 / 137      ; Remember to set according to t statement

instr 1

  i_time_release  =  0.02      ; release time

  p3     =  p3 + i_time_release + 0.01  ; extend note duration

  i_frq  = cpspch(p4)
  i_amp   = p5

  iffrq    pow 2, (p6+3)
  i_frq_filter = i_frq * iffrq

  a_decay    expseg 2, 50 / i_frq_filter, 1, 1, 1
  a_release  linseg 1, p3 - (i_time_release + 0.01), 1, i_time_release, 0, 1, 0
  a_amp     =  a_decay * a_release * a_release

  k_frq  expseg i_frq*0.5, 0.01, i_frq*0.5, 0.01, i_frq, 1, i_frq

  k_frq_filter_attack  port 1, 0.005, 0.5 
  k_frq_filter_decay   port 0, gi_time_beat/2, 1

  k_frq_filter  =  i_frq_filter * k_frq_filter_attack * k_frq_filter_decay

  kffrqx  port 0, 0.05, 24 * i_amp  ; velocity -> filter
  kffrqx  =  exp(log(2) * kffrqx / 12)

  k_frq_filter_pos_peak  =  k_frq_filter / kffrqx
  k_frq_filter_neg_peak  =  k_frq_filter * kffrqx

  /* oscillator */

  a1  phasor k_frq, 0
  a2  phasor k_frq, 0.5
  a1  =  1 - 2 * a1
  a2  =  1 - 2 * a2

  /* filters */

  a1  pareq a1, k_frq_filter_pos_peak, 0, 2.0, 2  ; resonant lowpass
  a2  pareq a2, k_frq_filter_neg_peak, 0, 2.0, 2
  a0  =  a1 - a2

  /* distortion */
  
  atmp  delay1 a0
  a0  =  a0 - atmp
  atmp  =  taninv(a0 * abs(a0) * 400)
  a0  integ atmp
  a0  pareq a0, k_frq, 0, 2.0, 1  ; resonant highpass

  a0  =  a0 * 70 * sqrt(sqrt(i_frq_filter))  ; correct amplitude
  a0  =  a0 * a_amp * i_amp

  out a0

endin

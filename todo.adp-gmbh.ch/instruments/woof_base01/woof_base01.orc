sr     = 44100
kr     = 44100
nchnls = 2


instr 1

; +------------+         a1  +------------+     +------------+
; | oscillator |--->---+-->--| highpass 1 |-->--| bandpass 1 |-->--+
; +------------+       |     +------------+     +------------+     |
;                   a2 |                                           V
;          +-----<-----+                        +-------------+    |
;          |           |              +----<----| "allpass" 1 |----+
;          |           V              |         +-------------+
;          |           |              |
;          |    +------------+      +---+       +-----------------+
;          |    | highpass 2 |      | + |--->---| output highpass |--+
;          |    +------------+      +---+       +-----------------+  |
;          |           |              |                              V
;          |           V              ^         +----------------+   |
;          |           |              |         | output lowpass |-<-+
;          |         +---+     +------------+   +----------------+
;          +---->----| + |-->--| highpass 3 |           |
;                    +---+     +------------+           +---->-----+
;                                                                  |
; +-----------------+   +----------------+   +---------------+   +---+ output
; | noise generator |->-| noise bandpass |->-| noise lowpass |->-| + |-------->
; +-----------------+   +----------------+   +---------------+   +---+


  i_time_release               =   0.03
  i_osc_frq_start              =    250
  i_osc_frq_end                =     50
  
  i_noise_bandpass_frq_start   =   7040
  i_noise_bandpass_frq_end     =    240
  
  i_noise_lowpass__frq_start   =   3520
  i_noise_lowpass__frq_end     =     55

  i_noise_half_time            =   0.04; shorter: more tapping, longer: more noise
  
  i_time_extended              =  i_time_release + 0.01  ; extend note duration
  
  p3  =  p3 + i_time_extended

  iamp                         =     ampdb(p4)

  kenv  expseg 1, p3 - i_time_extended, 1, i_time_release, 0.00001, 1, 0.000001
  kenv  =  kenv * kenv

; ---- noise generator ----

  a_noise                  rnd31 1    , 0,                  0
  k_noise_filter_line      expon 1    , i_noise_half_time, 0.5

  k_nsbp  =  i_noise_bandpass_frq_end   + (i_noise_bandpass_frq_start - i_noise_bandpass_frq_end) * k_noise_filter_line
  k_nslp  =  i_noise_lowpass__frq_end   + (i_noise_lowpass__frq_start - i_noise_lowpass__frq_end) * k_noise_filter_line

  a_noise  butterbp a_noise, k_nsbp, k_nsbp*0.3
  a_noise  pareq a_noise, k_nslp, 0, 0.7071, 2; 2 means high shelving (lowpass)

  ; noise amp. envelope, See Shaping an envelope with linseg and expon
  a_noise_amp_1  linseg 0, 0.01, 1, 1, 1
  a_noise_amp_2  expon  1, 0.15, 0.5   ; Noise amp decreases 50% after 0.333 "Beat Units"
  a_noise  =  a_noise * a_noise_amp_1 * a_noise_amp_2

; ---- oscillator ----

  k_frq_osc_e    expon  1, 0.03, 0.5

  k_frq_osc = i_osc_frq_end + (i_osc_frq_start - i_osc_frq_end) * k_frq_osc_e

  a1 oscili 1, k_frq_osc, 1
  a2  =  a1        ; a1 = a2 = osc. signal
  
; ---- filters ----

  ; highpass 1
  a1  butterhp a1, 0.0625 * k_frq_osc

  ; bandpass 1
  a1  butterbp a1, k_frq_osc, 0.5 * k_frq_osc

     ; "allpass" 1
  k_apf  expon 1, 0.06, 0.5
  k_apf  =  (1 + (0.5 - 1) * k_apf) * k_frq_osc

  atmp  tone a1, k_apf
  a1  =  2 * atmp - a1

  ; highpass 2
  a3  butterhp a2, 8 * i_osc_frq_end

  ; highpass 3
  a2  butterhp a2 - a3 * 2, 0.5 * i_osc_frq_end
  a1  =  a1 - 0.4 * a2

  ; output highpass
  a1  pareq a1, 1.5 * i_osc_frq_end, 0, 2, 1

  ; output lowpass
  k1  expon 1, 0.004, 0.5
  k2  expon 1, 0.04,  0.5
  kfrx  limit (k1 * 40 + k2 * 8) * k_frq_osc, 10, sr * 0.48
  a1  pareq a1, kfrx, 0, 0.7071, 2


  asig_l = (a1 + a_noise) * iamp * kenv
  asig_r = (a1 + a_noise) * iamp * kenv

  outs asig_r, asig_l

endin

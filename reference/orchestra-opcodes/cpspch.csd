;
;   Note:
;     8.09 produces 439.962770 Hertz, but it should be 440 Hertz.
;
;     cps2pch seems to be more precise.
;
;   See also cpspch.svg
;

<CsoundSynthesizer>
  
<CsOptions>

  -d     ; Suppress all displays
  -o dac ; Output file name / dac = request writing to host audio output device

</CsOptions>


  
<CsInstruments>

  sr    = 44100
  kr    =  4410
  ksmps =    10
  nchnls =    1


  instr   1 

      i_pch  = p4
      i_csp  = cpspch(i_pch)

      Sfoo  sprintf "%3.2f -> %f", i_pch, i_csp

      puts Sfoo, 1

  endin

</CsInstruments>




<CsScore>
  i1  0   0.01    0.09
  i1  +   0.01    1.09
  i1  +   0.01    2.09
  i1  +   0.01    3.09
  i1  +   0.01    4.09
  i1  +   0.01    5.09
  i1  +   0.01    6.09
  i1  +   0.01    7.09
  i1  +   0.01    8.09
  i1  +   0.01    9.09
  i1  +   0.01   10.09
  i1  +   0.01   11.09

</CsScore>

</CsoundSynthesizer>




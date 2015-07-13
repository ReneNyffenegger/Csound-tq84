<CsoundSynthesizer>


<CsOptions>

  -d             ; Suppress all displays
  -o dac         ; Name output file / dac = request writing to host audio output device

</CsOptions>


<CsInstruments>

sr     = 44100
kr     = 4410
ksmps  = 10
nchnls = 1


instr 1
        
; --- Initialization

  iHertz      = cpspch(p4)  ; Convert 4th parameter to hertz
  print iHertz
  iAmplitude  = p5          ; Use 5th parameter as amplitude


; --- Signal generation:

  asig  oscili iAmplitude, iHertz, 1


; --- Outputting signal:

  outs        asig

endin
</CsInstruments>


<CsScore>

f1   0 8192 10 1            ; Sine

; p1     p2          p3        p4       p5
; Instr  Start-Time  Duration  Param-1  Param-2   ...
; -----  ----------  --------  -------  -------
i 1      0           0.8        8.01     10000
i 1      1           0.9        9.01      2000
i 1      2           1         10.01     20000

e

</CsScore>
</CsoundSynthesizer>

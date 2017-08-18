<CsoundSynthesizer>
<CsOptions>

  -odac     ;;;realtime audio out

</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs  = 1

instr 1

aenv expseg .01, p3*0.25, 0.8, p3*0.75, 0.01

asig poscil3 aenv, 220, 1
     outs asig, asig

endin
</CsInstruments>
<CsScore>

f 1 0 16384 10
  1    ; 1x
  0.95 ; 2x
  0.05 ; 3x
  0.9  ; 4x
  0.03 ; 5x
  0.05 ; 6x
  0.03 ; 7x
  0.8  ; 8x

t  0  60   ; start with 60 beats per minute
   6  60   ; keep 60 beats per minute for 6 beats
   6 120   ; double tempo from beat 6
   8 120   ; until beat 8
  12  60   ; then decrease to 60 beats per minute until beat 12
		
i 1  0 1    ; Start with 60 beats per minute
i 1  1 .  	;
i 1  2 .  	;
i 1  3 .  	;
i 1  4 .  	;
i 1  5 .  	; Last one with duration of 1 second.
i 1  6 .  	; half a second
i 1  7 .  	; half a second
i 1  8 .  	; half a second
i 1  9 .  	; Start to slow down until …
i 1 10 .  	;
i 1 11 .  	;
i 1 12 .  	; … beat 12, now 60 beats per minute again.
i 1 13 .  	;
i 1 14 .  	;
i 1 15 .    ;
e
</CsScore>
</CsoundSynthesizer>

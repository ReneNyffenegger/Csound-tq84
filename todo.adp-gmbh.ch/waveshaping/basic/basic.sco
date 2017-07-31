;===============================================================
; =========  Score for General Purpose Waveshaping Instrument 
;
;
; This demonstrates the use of high partials, sometimes without
;   a fundamental, to get quasi-inharmonic spectra from waveshaping.
;===============================================================

f1      0 1025 10 1
; transfer function1: h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16
f2     0 1025 13   1   1   -1   1  -.8  0  .6   0   0   0  .4   0   0   0   0   .1  -.2  -.3  .5

; normalizing function with midpoint bipolar offset:
f3     0       513     4       2       1

i1      0       4       5.00   10000
i1      +       4       5.02   10000
i1      +       4       5.04   10000
i1      +       4       5.05   10000
i1      +       4       5.07   10000
i1      +       4       5.09   10000
i1      +       4       5.11   10000
i1      +       4       6.00    .   

s
f0      1
s

; transfer function2:        h0  h1  h2  h3  h4  h5  h6 h7  h8  h9 h10 h11 h12 h13 h14 h15 h16
f2     0  1025 13      1  1   0   0   0 -.1   0  .3  0 -.5   0  .7   0 -.9   0   1   0  -1   0
; normalizing function with midpoint bipolar offset:
f3     0       513     4       2       1

i1      0       4       5.00   10000
i1      4       .       6.00    .   
i1      8       .       7.00    .

s
;f0      1
s

; transfer function3: h0 h1 h2 h3 h4 h5 h6 h7 h8 h9 h10 h11 h12 h13 h14 h15 h16
f2     0  1025 13 1 1 0  0  0  0  0  0  0 -1  0  1  0   0   -.1 0   .1  0   -.2
;                      h17 h18 h19 h20 h21 h22 h23
                       .3  0   -.7 0   .2  0   -.1
; normalizing function with midpoint bipolar offset:
f3     0       513     4       2       1

i1      0       4       5.00   10000
i1      4       .       5.06    .
i1      8       .       6.00    .

e

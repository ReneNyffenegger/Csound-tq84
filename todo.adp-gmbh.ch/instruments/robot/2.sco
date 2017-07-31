;f1  0 512   9 1 1 0                                    ;sine lo-res
;f2  0 512   5 4096 512 1                               ;exp env
;f3  0 512   9 10 1 0 16 1.5 0 22 2 0 23 1.5 0          ;inharm wave
;f4  0 512   9 1 1 0                                    ;sine
;f8  0 512   5 256 512 1                                ;exp env
;f9  0 512   5 1   512 1                                ;constant value of 1
;f10 0 512   7 0 50 1 50 .5 300 .5 112 0                ;ADSR
f11 0 2048 10 1                                        ;SINE WAVE hi-res
;f13 0 1024  7 0 256 1 256 0 256 -1 256 0               ;triangle
;f14 0 512   7 1 17  1 0   0 495                        ;pulse for S&H clk osc
;f15 0 512   7 0 512 1 0                                ;ramp up;;;left=>right
;f16 0 512   7 1 512 0 0                                ;ramp down;;;right=>left
f17 0 1024  7 .5 256 1 256 .5 256 0 256 .5             ;triangle with offset
;f18 0 512   5 1 512 256                                ;reverse exp env
;f20 0 1024 10 1 0 0 0 .7 .7 .7 .7 .7 .7                ;approaching square
;------------------------------------------------------------------------

i1   0  40   .3   60

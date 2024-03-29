;; Function tables  1 through 17 for instrument 1
;; Function tables 21 through 37 for instrument 3


f01     0       512     10      1

; operator fpoutput level to amp scale function (data from Chowning/Bristow)
f02     0       128     7       0       10      .003    10      .013
        10      .031    10      .079    10      .188    10      .446
        5       .690    5       1.068   5       1.639   5       2.512
        5       3.894   5       6.029   5       9.263   4       13.119
        29      13.119

; rate scaling function
f03     0       128     7       0       128     1

; eg rate rise function for lvl change between 0 and 99 (data from Opcode)
f04     0       128     -7      38      5       22.8    5       12      5
        7.5     5       4.8     5       2.7     5       1.8     5       1.3
        8       .737    3       .615    3       .505    3       .409    3
        .321    6       .080    6       .055    2       .032    3       .024
        3       .018    3       .014    3       .011    3       .008    3
        .008    3       .007    3       .005    3       .003    32      .003

; eg rate rise percentage function
f05     0       128     -7      .00001  31      .00001  4       .02     5
        .06     10      .14     10      .24     10      .35     10      .50
        10      .70     5       .86     4       1.0     29      1.0

; eg rate decay function for lvl change between 0 and 99
f06     0       128     -7      318     4       181     5       115     5
        63      5       39.7    5       20      5       11.2    5       7
        8       5.66    3       3.98    6       1.99    3       1.34    3
        .99     3       .71     5       .41     3       .15     3       .081
        3       .068    3       .047    3       .037    3       .025    3
        .02     3       .013    3       .008    36      .008

; eg rate decay percentage function
f07     0       128     -7      .00001  10      .25     10      .35     10
        .43     10      .52     10      .59     10      .70     10      .77
        10      .84     10      .92     9       1.0     29      1.0

; eg level to peak deviation mapping function (index in radians = Index / 2PI)
f08     0       128     -7      0       10      .000477 10      .002
        10      .00493  10      .01257  10      .02992  10      .07098
        5       .10981  5       .16997  5       .260855 5       .39979
        5       .61974  5       .95954  5       1.47425 4       2.08795
        29      2.08795

; velocity to amp factor mapping function (rough guess)
f09     0       129     9       .25     1       0

; velocity sensitivity scaling function
f10     0       8       -7      0       8       1

; feedback scaling function
f11     0       8       -7      0       8       7

f12   0    32    -2    99    6   95   33   71   30   
        99   75   67   0   
        0   0   1.000000   2   
        2   

f13   0    32    -2    80    4   98   46   71   14   
        99   0   66   0   
        0   0   3.500000   3   
        2   

f14   0    32    -2    99    6   95   33   71   30   
        99   0   32   0   
        0   0   1.000000   -5   
        2   

f15   0    32    -2    83    4   98   50   71   28   
        99   0   32   0   
        0   0   3.500000   -2   
        2   

f16   0    32    -2    91    6   99   0   45   39   
        99   0   50   0   
        0   0   2.000000   0   
        0   
f17   0    32    -2    99    4   99   68   29   15   
        99   0   21   32   
        0   0   16.000000   0   
        2   

f21     0       512     10      1
; operator fpoutput level to amp scale function (data from Chowning/Bristow)
f22     0       128     7       0       10      .003    10      .013
        10      .031    10      .079    10      .188    10      .446
        5       .690    5       1.068   5       1.639   5       2.512
        5       3.894   5       6.029   5       9.263   4       13.119
        29      13.119
; rate scaling function
f23     0       128     7       0       128     1
; eg rate rise function for lvl change between 0 and 99 (data from Opcode)
f24     0       128     -7      38      5       22.8    5       12      5
        7.5     5       4.8     5       2.7     5       1.8     5       1.3
        8       .737    3       .615    3       .505    3       .409    3
        .321    6       .080    6       .055    2       .032    3       .024
        3       .018    3       .014    3       .011    3       .008    3
        .008    3       .007    3       .005    3       .003    32      .003
; eg rate rise percentage function
f25     0       128     -7      .00001  31      .00001  4       .02     5
        .06     10      .14     10      .24     10      .35     10      .50
        10      .70     5       .86     4       1.0     29      1.0
; eg rate decay function for lvl change between 0 and 99
f26     0       128     -7      318     4       181     5       115     5
        63      5       39.7    5       20      5       11.2    5       7
        8       5.66    3       3.98    6       1.99    3       1.34    3
        .99     3       .71     5       .41     3       .15     3       .081
        3       .068    3       .047    3       .037    3       .025    3
        .02     3       .013    3       .008    36      .008
; eg rate decay percentage function
f27     0       128     -7      .00001  10      .25     10      .35     10
        .43     10      .52     10      .59     10      .70     10      .77
        10      .84     10      .92     9       1.0     29      1.0
; eg level to peak deviation mapping function (index in radians = Index / 2PI)
f28     0       128     -7      0       10      .000477 10      .002
        10      .00493  10      .01257  10      .02992  10      .07098
        5       .10981  5       .16997  5       .260855 5       .39979
        5       .61974  5       .95954  5       1.47425 4       2.08795
        29      2.08795
; velocity to amp factor mapping function (rough guess)
f29     0       129     9       .25     1       0
; velocity sensitivity scaling function
f30     0       8       -7      0       8       1
; feedback scaling function
f31     0       8       -7      0       8       7
f32   0    32    -2    99    2   75   37   18   63   
        99   70   0   0   
        0   0   0.505000   0   
        3   
f33   0    32    -2    80    2   28   37   42   50   
        99   0   0   0   
        0   0   0.515000   0   
        1   
f34   0    32    -2    68    3   73   25   32   30   
        97   78   0   0   
        0   0   1.000000   7   
        3   
f35   0    32    -2    99    2   80   39   28   53   
        93   57   0   0   
        0   0   0.500000   0   
        3   
f36   0    32    -2    75    2   99   51   0   0   
        99   74   0   0   
        0   0   1.010000   0   
        4   
f37   0    32    -2    87    7   25   50   24   55   
        96   97   0   0   
        0   0   0.500000   1   
        3   



t 0 18

;a0 0 11


i1         0  1.05   7.08   55   ;  Ab, B, Eb, Gb      (   1)
i1         0  1.05   7.11   49   ;    Abm 7
i1         0  1.05   8.03   50   ;  -> 8, 11, 3, 6
i1         0  1.05   8.06   52   ;

i1         1  1.05   7.06   50   ;  Gb, Bb, Db, Eb     (   2)
i1         1  1.05   7.10   48   ;    Gb 6
i1         1  1.05   8.01   45   ;  -> 6, 10, 1, 3
i1         1  1.05   8.03   49   ;

i1         2  1.05   7.04   50   ;  E, Ab, B, Eb       (   3)
i1         2  1.05   7.08   47   ;    E maj7
i1         2  1.05   7.11   46   ;  -> 4, 8, 11, 3
i1         2  1.05   8.03   49   ;

i1         3  1.05   7.03   50   ;  Eb, Gb, Bb, Db     (   4)
i1         3  1.05   7.06   47   ;    Ebm 7
i1         3  1.05   7.10   46   ;  -> 3, 6, 10, 1
i1         3  1.05   8.01   49   ;

i1         4  1.05   7.08   55   ;  Ab, B, Eb, Gb      (   5)
i1         4  1.05   7.11   49   ;    Abm 7
i1         4  1.05   8.03   50   ;  -> 8, 11, 3, 6
i1         4  1.05   8.06   52   ;

i1         5  1.05   7.06   50   ;  Gb, Bb, Db, Eb     (   6)
i1         5  1.05   7.10   48   ;    Gb 6
i1         5  1.05   8.01   45   ;
i1         5  1.05   8.03   49   ;

i1         6  1.05   7.04   50   ;  E, Ab, B, Eb       (   7)
i1         6  1.05   7.08   47   ;    E maj7
i1         6  1.05   7.11   46   ;
i1         6  1.05   8.03   49   ;

i1         7  1.05   7.03   50   ;  Eb, Gb, Bb, Db     (   8)
i1         7  1.05   7.06   47   ;    Ebm 7
i1         7  1.05   7.10   46   ;
i1         7  1.05   8.01   49   ;

i1         8  1.05   7.08   55   ;  Ab, B, Eb, Gb      (   1)
i1         8  1.05   7.11   49   ;    Abm 7
i1         8  1.05   8.03   50   ;  -> 8, 11, 3, 6
i1         8  1.05   8.06   52   ;

i1         9  1.05   7.06   50   ;  Gb, Bb, Db, Eb     (   2)
i1         9  1.05   7.10   48   ;    Gb 6
i1         9  1.05   8.01   45   ;  -> 6, 10, 1, 3
i1         9  1.05   8.03   49   ;

i1        10  1.05   7.04   50   ;  E, Ab, B, Eb       (   3)
i1        10  1.05   7.08   47   ;    E maj7
i1        10  1.05   7.11   46   ;  -> 4, 8, 11, 3
i1        10  1.05   8.03   49   ;

i1        11  1.05   7.03   50   ;  Eb, Gb, Bb, Db     (   4)
i1        11  1.05   7.06   47   ;    Ebm 7
i1        11  1.05   7.10   46   ;  -> 3, 6, 10, 1
i1        11  1.05   8.01   49   ;

; ----------------------------------------- Hihat

i2         0.00  0.25     2500   ;                     (   1)
i2         0.25  0.25     0500   ;
i2         0.50  0.25     2500   ;
i2         0.75  0.25     0500   ;
                                 ;
i2         1.00  0.25     2500   ;                     (   2)
i2         1.25  0.25     0500   ;
i2         1.50  0.25     2500   ;
i2         1.75  0.25     0500   ;
                                 ;
i2         2.00  0.25     2500   ;                     (   3)
i2         2.25  0.25     0500   ;
i2         2.50  0.25     2500   ;
i2         2.75  0.25     0500   ;
                                 ;
i2         3.00  0.25     2500   ;                     (   4)
i2         3.25  0.25     0500   ;
i2         3.50  0.25     2500   ;
i2         3.75  0.25     0500   ;
                                 ;
i2         4.00  0.25     2500   ;                     (   5)
i2         4.25  0.25     0500   ;
i2         4.50  0.25     2500   ;
i2         4.75  0.25     0500   ;
                                 ;
i2         5.00  0.25     2500   ;                     (   6)
i2         5.25  0.25     0500   ;
i2         5.50  0.25     2500   ;
i2         5.75  0.25     0500   ;
                                 ;
i2         6.00  0.25     2500   ;                     (   7)
i2         6.25  0.25     0500   ;
i2         6.50  0.25     2500   ;
i2         6.75  0.25     0500   ;
                                 ;
i2         7.00  0.25     2500   ;                     (   8)
i2         7.25  0.25     0500   ;
i2         7.50  0.25     2500   ;
i2         7.75  0.25     0500   ;

i2         8.00  0.25     2500   ;                     (   9)
i2         8.25  0.25     0500   ;
i2         8.50  0.25     2500   ;
i2         8.75  0.25     0500   ;

i2         9.00  0.25     2500   ;                     (  10)
i2         9.25  0.25     0500   ;
i2         9.50  0.25     2500   ;
i2         9.75  0.25     0500   ;

i2        10.00  0.25     2500   ;                     (  11)
i2        10.25  0.25     0500   ;
i2        10.50  0.25     2500   ;
i2        10.75  0.25     0500   ;

i2        11.00  0.25     2500   ;                     (  12)
i2        11.25  0.25     0500   ;
i2        11.50  0.25     2500   ;
i2        11.75  0.25     0500   ;
; --------------------------------------------- Bass line

i3         0.125 0.4      6.06  65  ;  Abm 7
i3         0.375 0.2      6.08  62  ;  -> 8, 11, 3, 6
i3         0.500 0.4      6.08  66  ;
i3         0.750 0.3      6.03  65  ;
i3         0.875 0.4      6.06  70  ;

i3         1.125 0.4      6.08  65  ;  Gb 6
i3         1.250 0.2      6.08  63  ;  -> 6, 10, 1, 3
i3         1.375 0.4      6.06  65  ;
i3         1.625 0.3      6.08  62  ;
i3         1.875 0.3      6.06  70  ;

i3         2.000 0.4      6.06  65  ;  E maj7
i3         2.125 0.2      6.08  67  ;  -> 4, 8, 11, 3
i3         2.375 0.4      6.06  65  ;
i3         2.500 0.4      6.04  65  ;
i3         2.750 0.3      6.06  65  ;
i3         2.875 0.4      6.08  60  ;

i3         3.125 0.4      6.06  65  ;  Ebm 7
i3         3.375 0.3      6.08  67  ;  -> 3, 6, 10, 1
i3         3.500 0.4      6.08  65  ;
i3         3.625 0.3      6.06  65  ;
i3         3.875 0.4      6.08  60  ;

i3         4.000 0.4      6.06  65  ;  Abm 7
i3         4.250 0.2      6.08  62  ;  -> 8, 11, 3, 6
i3         4.375 0.4      6.06  66  ;
i3         4.625 0.3      6.08  65  ;
i3         4.750 0.4      6.06  70  ;
i3         4.875 0.4      6.08  70  ;

i3         5.125 0.3      6.08  62  ;  Gb 6
i3         5.250 0.3      6.10  62  ;  -> 6, 10, 1, 3
i3         5.375 0.4      6.06  66  ;  
i3         5.500 0.3      6.08  65  ;
i3         5.625 0.4      6.06  70  ;
i3         5.875 0.4      6.10  70  ;

i3         6.000 0.4      6.06  65  ;  E maj7
i3         6.125 0.3      6.08  67  ;  -> 4, 8, 11, 3
i3         6.375 0.4      6.06  65  ;
i3         6.500 0.4      6.04  65  ;
i3         6.750 0.3      6.06  65  ;
i3         6.875 0.4      6.08  60  ;

i3         7.125 0.4      6.10  65  ;  Ebm 7
i3         7.250 0.3      6.08  67  ;  -> 3, 6, 10, 1
i3         7.500 0.4      6.06  65  ;
i3         7.625 0.3      6.03  65  ;
i3         7.875 0.4      6.10  60  ;

i3         8.000 0.4      6.08  65  ;  Abm 7
i3         8.125 0.2      6.06  62  ;  -> 8, 11, 3, 6
i3         8.375 0.4      6.08  66  ;
i3         8.500 0.3      6.06  65  ;
i3         8.625 0.4      6.06  70  ;
i3         8.875 0.4      6.08  70  ;

i3         9.000 0.3      6.08  62  ;  Gb 6
i3         9.250 0.4      6.06  66  ;  -> 6, 10, 1, 3
i3         9.375 0.3      6.08  65  ;
i3         9.625 0.4      6.06  70  ;
i3         9.750 0.4      6.10  70  ;

i3        10.000 0.4      6.06  65  ;  E maj7
i3        10.125 0.3      6.08  67  ;  -> 4, 8, 11, 3
i3        10.375 0.4      6.06  65  ;
i3        10.500 0.4      6.08  65  ;
i3        10.625 0.3      6.06  65  ;
i3        10.875 0.4      6.08  60  ;

i3        11.000 0.4      6.08  65  ;  Ebm 7
i3        11.125 0.3      6.10  67  ;  -> 3, 6, 10, 1
i3        11.375 0.4      6.06  65  ;
i3        11.625 0.3      6.03  65  ;
i3        11.875 0.4      6.10  60  ;
e

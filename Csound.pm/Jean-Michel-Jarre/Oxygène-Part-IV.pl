#!/usr/bin/perl
use warnings;
use strict;
use utf8;

use Csound;

# use Csound::Score;
use Csound::Instrument;
use Csound::Composition;

my $composition = Csound::Composition->new();

# my $score = Csound::Score->new();

my $bass = Csound::Instrument->new({
  composition=>$composition,
  definition =>'

; kenv linen 1, 0.02, p3-0.04, 0.02
  kenv adsr p3*.01, p3*.39, .4, p3*.3

;                                                       1  2    3    4    5    6     7     8    9    10   11    12    13    14    15    16
  asig oscili kenv*15000, i_freq, @FUNCTABLE(10, 16384, 1, 0.9, 0.2, 0.8, 0.1, 0.05, 0.01, 0.6, 0.1, 0.2, 0.06, 0.15, 0.04, 0.03, 0.02, 0.3 )
  outs asig, asig
'});

my $melody_1 = Csound::Instrument->new({
  composition=>$composition,  
  definition=>'
  kenv adsr p3*.01, p3*.39, .4, p3*.3

; asig foscili kenv*15000, i_freq, 1, 1.2, 4, @FUNCTABLE(10, 16384, 1)
  asig oscili kenv*15000, i_freq, @FUNCTABLE(10, 16384, 1, 0.9, 0.2, 0.8, 0.1, 0.05, 0.01, 0.6, 0.1, 0.2, 0.06, 0.15, 0.04, 0.03, 0.02, 0.3 )
  outs asig, asig
'});

my $melody_2 = Csound::Instrument->new({
  composition=>$composition,
  definition=>'
  kenv adsr p3*.01, p3*.39, .4, p3*.3

  asig foscili kenv*15000, i_freq, 1, 2.2, 4, @FUNCTABLE(10, 16384, 1)
; asig oscili kenv*15000, i_freq, @FUNCTABLE(10, 16384, 1, 0.9, 0.2, 0.8, 0.1, 0.05, 0.01, 0.6, 0.1, 0.2, 0.06, 0.15, 0.04, 0.03, 0.02, 0.3 )
  outs asig, asig
'});

my $melody_3 = Csound::Instrument->new({
  composition=>$composition,
  definition=>'
  kenv adsr p3*.01, p3*.39, .4, p3*.3

  asig foscili kenv*15000, i_freq, 1, 1.8, 3, @FUNCTABLE(10, 16384, 1)
  outs asig, asig
'});

my
$t = intro();
$t = between_intro_and_dal_segno($t);

for my $rep (1 .. 6) {
  $t = between_dal_segno_and_last_part($t, $rep);
}

end($t);

$composition->write('Oxygène-Part-IV');

sub intro { #_{

  for my $t (0 .. 6) {
    bass_cm($t);
  }

  return 7;

} #_}

sub between_intro_and_dal_segno { #_{
  my $t = shift;

  $t = melody_cm($t);
  $t = melody_cm($t);
  $t = melody_gm($t);
  $t = melody_cm($t);

  return $t;

} #_}
sub between_dal_segno_and_last_part { #_{
  my $t = shift;
  my $rep = shift;

  $t = melody_cm($t);
  $t = melody_gm($t);
  $t = melody_f ($t);

  if ($rep == 1 or $rep == 2 or $rep == 4 or $rep == 5) { #_{
    $t=melody_cm($t);
  } #_}
  else {
    $t=part_3_6($t);
  }

  return $t;
} #_}
sub part_3_6 { #_{
  my $t = shift;

  $t = melody_2_cm($t);
  $t = melody_2_cm($t);

  $t = melody_2_gm($t);
  $t = melody_2_gm($t);

  $t = melody_2_f ($t);
  $t = melody_2_f ($t);

  return $t;

} #_}

sub bass_cm { #_{

  my $t0 = shift;

  my $t = $t0;

  my $l = 2;

  my
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'c5' ); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'c5' ); $t += $len;
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'b♭4'); $t += $len;
  $len = 3/12 *$l; $bass->play($t0 + $t, $len, 'c5' ); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'g4' ); $t += $len;
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'b♭4'); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'g4' ); $t += $len;

} #_}
sub bass_gm { #_{

  my $t0 = shift;


  my $t = $t0;

  my $l = 2;

  my
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'd5' ); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'd5' ); $t += $len;
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'c5' ); $t += $len;
  $len = 4/12 *$l; $bass->play($t0 + $t, $len, 'd5' ); $t += $len;
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'b♭4'); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'g4' ); $t += $len;

} #_}
sub bass_f  { #_{

  my $t0 = shift;

  my $t = $t0;

  my $l = 2;

  my
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'f5' ); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'f5' ); $t += $len;
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'e♭5'); $t += $len;
  $len = 3/12 *$l; $bass->play($t0 + $t, $len, 'c5' ); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'f5' ); $t += $len;
  $len = 2/12 *$l; $bass->play($t0 + $t, $len, 'e♭5'); $t += $len;
  $len = 1/12 *$l; $bass->play($t0 + $t, $len, 'c5' ); $t += $len;

} #_}

sub melody_cm { #_{
  my $t0 = shift;

  bass_cm($t0  );
  bass_cm($t0+1);

  my $t  = $t0;

  my $l = 2;

  my
  $len = 5/12 * $l; $melody_1->play($t0+$t, $len, 'c7' ); $t += $len;
  $len = 1/12 * $l; $melody_1->play($t0+$t, $len, 'g6' ); $t += $len;
  $len = 2/12 * $l; $melody_1->play($t0+$t, $len, 'e♭6'); $t += $len;
  $len = 3/12 * $l; $melody_1->play($t0+$t, $len, 'g6' ); $t += $len;
  $len =13/12 * $l; $melody_1->play($t0+$t, $len, 'c6' ); $t += $len;

  return $t0+2;

} #_}
sub melody_gm { #_{
  my $t0 = shift;

  bass_gm($t0  );
  bass_gm($t0+1);

  my $t  = $t0;

  my $l = 2;

  my
  $len = 5/12 * $l; $melody_1->play($t0+$t, $len, 'b♭6'); $t += $len;
  $len = 1/12 * $l; $melody_1->play($t0+$t, $len, 'a6' ); $t += $len;
  $len = 2/12 * $l; $melody_1->play($t0+$t, $len, 'g6' ); $t += $len;
  $len = 3/12 * $l; $melody_1->play($t0+$t, $len, 'a6' ); $t += $len;
  $len =13/12 * $l; $melody_1->play($t0+$t, $len, 'd6' ); $t += $len;

  return $t0+2;
} #_}
sub melody_f  { #_{
  my $t0  = shift;

  bass_f($t0  );
  bass_f($t0+1);

  my $t  = $t0;

  my $l = 2;

  my
  $len = 2/12 * $l; $melody_1->play($t0+$t, $len, 'a6' ); $t += $len;
  $len = 1/12 * $l; $melody_1->play($t0+$t, $len, 'g6' ); $t += $len;
  $len = 2/12 * $l; $melody_1->play($t0+$t, $len, 'f6' ); $t += $len;
  $len = 7/12 * $l; $melody_1->play($t0+$t, $len, 'c6' ); $t += $len;

  $len = 2/12 * $l; $melody_1->play($t0+$t, $len, 'a6' ); $t += $len;
  $len = 1/12 * $l; $melody_1->play($t0+$t, $len, 'g6' ); $t += $len;
  $len = 2/12 * $l; $melody_1->play($t0+$t, $len, 'f6' ); $t += $len;
  $len = 7/12 * $l; $melody_1->play($t0+$t, $len, 'c6' ); $t += $len;

  return $t0+2;
} #_}

sub melody_2_cm { #_{
  my $t0 = shift;

  bass_cm($t0  );

  my $t = $t0;

  my $l = 2;

  my
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'c7'); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'g7'); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'c7'); $t += $len;
  $len = 9/12 * $l; $melody_2->play($t0+$t, $len, 'g7'); $t += $len;

  return $t0 + 1;
} #_}
sub melody_2_gm { #_{
  my $t0 = shift;

  bass_gm($t0  );

  my $t = $t0;
  my $l = 2;

  my
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'd7' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'b♭7'); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'd7' ); $t += $len;
  $len = 9/12 * $l; $melody_2->play($t0+$t, $len, 'b♭7'); $t += $len;


  return $t0 + 1;
} #_}
sub melody_2_f  { #_{
  my $t0 = shift;

  bass_f($t0  );

  my $t = $t0;
  my $l = 2;

  my
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'f7' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'c8' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'f7' ); $t += $len;
  $len = 9/12 * $l; $melody_2->play($t0+$t, $len, 'c8' ); $t += $len;

  return $t0 + 1;
} #_}

sub end { #_{

  my $t = shift;

  for my $rep (1 .. 3) {
    $t = end_part($t, $rep);
  }

} #_}
sub end_part { #_{

  my $t   = shift;
  my $rep = shift;

  $t=end_cm($t);
  $t=end_cm($t);

  $t=end_gm($t);
  $t=end_gm($t);

  $t=end_f ($t);
  $t=end_f ($t);

  if ($rep == 2) { #_{

    my $t0 = $t;
    bass_cm($t0);
    bass_cm($t0+1);

    my $l = 2;
    my
    $len = 5/12 * $l; $melody_3->play($t0+$t, $len, 'c7' ); $t += $len;
    $len = 1/12 * $l; $melody_3->play($t0+$t, $len, 'g6' ); $t += $len;
    $len = 2/12 * $l; $melody_3->play($t0+$t, $len, 'e♭6'); $t += $len;
    $len = 3/12 * $l; $melody_3->play($t0+$t, $len, 'g6' ); $t += $len;
    $len =13/12 * $l; $melody_3->play($t0+$t, $len, 'c6' ); $t += $len;

    $t = $t0+2;

  } #_}

  return $t;

} #_}

sub end_cm { #_{
  my $t0 = shift;

  bass_cm($t0);

  my $t = $t0;
  my $l = 2;
  my
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'e♭7'); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'd7' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'e♭7'); $t += $len;
  $len = 2/12 * $l; $melody_2->play($t0+$t, $len, 'c7' ); $t += $len;
  $len = 7/12 * $l; $melody_2->play($t0+$t, $len, 'g6' ); $t += $len;

  return $t0+1;

} #_}
sub end_gm { #_{
  my $t0 = shift;

  bass_gm($t0);

  my $t = $t0;
  my $l = 2;
  my
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'b♭6'); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'a6' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'b♭6'); $t += $len;
  $len = 2/12 * $l; $melody_2->play($t0+$t, $len, 'g6' ); $t += $len;
  $len = 7/12 * $l; $melody_2->play($t0+$t, $len, 'd6' ); $t += $len;

  return $t0+1;

} #_}
sub end_f  { #_{
  my $t0 = shift;

  bass_f($t0);

  my $t = $t0;
  my $l = 2;
  my
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'a6' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'g6' ); $t += $len;
  $len = 1/12 * $l; $melody_2->play($t0+$t, $len, 'a6' ); $t += $len;
  $len = 2/12 * $l; $melody_2->play($t0+$t, $len, 'f6' ); $t += $len;
  $len = 7/12 * $l; $melody_2->play($t0+$t, $len, 'c7' ); $t += $len;

  return $t0+1;

} #_}

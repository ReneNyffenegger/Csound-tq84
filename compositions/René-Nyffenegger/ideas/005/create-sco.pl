#!/usr/bin/perl

use strict;
use warnings;

use Math::Random qw(random_poisson);

srand;

# open SCO, ">005_001.sco";
open SCO, ">005.sco";

print SCO << 'H';
f1 0 2048 10 1
f2 0 4096 10 1 .5 .333 .25 .2 .167 .1428 .125 .111 .1 .0909 .0833 .0769 .0714 .0667 .0625  ; SAW

t 0 30
H

for (my $bl = 0; $bl < 16; $bl++) {
  bass_line($bl);
}

## Hi Hat
for (my $i=0; $i <= 16.0; $i+=0.25) {
  my $when = $i + (random_poisson(1, 100) - 100) / 10000;
  print SCO "i2 $when 0.25 4000\n";
}

## Snare
for (my $i=0.5; $i <= 16.0; $i+=1) {
  print SCO "i3 $i 1 8000\n";
}

my $kick=0;
while ($kick <= 16.0) {
  my $len = 0.125 * int (2 + rand(3));
  print SCO "i4 $kick $len 0.3\n";

  $kick += $len;
}

my $sine = 0;
while ($sine < 16.0) {

  my $len = int (rand(5)) * 1/32;

  my $len_played = 0.1 + rand(0.1);

  my $beat = int $sine;

  my $pan  = rand;

  my @possble_notes;

  @possble_notes = qw(.04 .07 0.11 0.02) unless ($beat % 4) -0;
  @possble_notes = qw(.06 .09 0.11 0.03) unless ($beat % 4) -1;
  @possble_notes = qw(.07 .11 0.02 0.04) unless ($beat % 4) -2;
  @possble_notes = qw(.09 .00 0.04 0.06) unless ($beat % 4) -3;

  my $oct = 7 + int (rand(3));

  my $note = $oct . $possble_notes[rand (@possble_notes)];

  my $amp = 1000 + rand(2000);

  print SCO "i5 $sine $len_played 2500 $note $pan\n";

  $sine += $len;
}

print SCO "i6  4 3.5 8.11 200 5000 100\n";
print SCO "i6  8 3.5 8.04 200 5000 100\n";
print SCO "i6 12 3.5 8.11 400 5000 100\n";

sub bass_line {

  my $beat  = shift;
  my $pitch;

  $pitch = '6.04' unless ($beat % 4) -0;
  $pitch = '6.06' unless ($beat % 4) -1;
  $pitch = '6.07' unless ($beat % 4) -2;
  $pitch = '6.09' unless ($beat % 4) -3;

  my $pan_start = rand;
  my $pan_end   = rand;

  print SCO "i1 $beat 1 12000 $pitch $pan_start $pan_end\n"; 
}

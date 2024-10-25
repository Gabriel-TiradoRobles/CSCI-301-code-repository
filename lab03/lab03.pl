#!/usr/bin/perl
use strict;
use warnings;
use Math::Complex;

# declare vars
my $sideA = 0.0;
my $sideB = 0.0;
my $hypot = 0.0;

# Ask for sides A and B
print ("Enter length of side A: ");
$sideA = <STDIN>;

print ("Enter length of side B: ");
$sideB = <STDIN>;

# Math to get hypotenuse
$hypot = sqrt(($sideA * $sideA) + ($sideB * $sideB));

# $hypot = sqrt((5 * 5) + (4 * 4));

printf ("Hypotenuse of %.1f and %.1f is %.1f\n", $sideA, $sideB, $hypot);
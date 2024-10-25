#!/usr/bin/perl

use strict;
use warnings;

# defines vars
my $fileNameScores = "./scores.txt";
my $fileNameAverage = "./average.txt";
my $fileNameWinner = "./winner.txt";
my $fileNameSorted = "./sorted.txt";

my $avgScore = 0;
my $loopCounter = 0;

my $winner = "";
my $curLeaderName = "";
my $curLeaderScore = 0;

# defines Player => Score hash
my %players = ();
my @playerValuesSorted = ();

# --------------------------------------------------------- #

# Open FileIO for getting player scores
open(FH, '<', $fileNameScores) or die $!;

# Loops through file and stores name and score into hash key and value
while(<FH>) {
	my @playerInfo = split(" ", $_);

	$players { $playerInfo[0] } = $playerInfo[1];
}

# Close FileIO for player scores
close(FH);

# --------------------------------------------------------- #

# Calculate average player score
for (values %players) {
	$avgScore += $_;
	$loopCounter++;
}

$avgScore = ($avgScore / $loopCounter);

# Open FileIO for writing average score to file
open(FH, '>', $fileNameAverage) or die $!;

print FH ("Average Score: $avgScore\n");
print FH ("Player Count: $loopCounter\n");

# Close FileIO for writing average score
close(FH);

# --------------------------------------------------------- #

# Find winner from hash list
for (keys %players) {
	if ($players{$_} > $curLeaderScore) {
		$curLeaderName = $_;
		$curLeaderScore = $players{$_};
	}
}

# Open FileIO for writing winner to file
open(FH, '>', $fileNameWinner) or die $!;

print FH ("Winner: $curLeaderName\n");
print FH ("Score: $curLeaderScore\n");

# Close FileIO for writing winner
close(FH);

# --------------------------------------------------------- #

# Sort players hash list alphabetically
@playerValuesSorted = sort { $a <=> $b } values %players;

# Open FileIO for writing sorted player list to file
open(FH, '>', $fileNameSorted) or die $!;

for my $x (@playerValuesSorted) {
	for my $i (keys %players) {
		if ($players{$i} == $x) {
			print FH ("Player: $i\tScore: $players{$i}\n");
		}
	}
}

# Close FileIO for writing sorted player list
close(FH);
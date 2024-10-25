#!/usr/bin/env python3

# Read in, store, and sort bowlers that aren't duplicates
file = open("Scramble.txt", "r")

bowlers = list(set(file.readlines()))
bowlers.sort()

file.close()

# Write sorted cleaned list of bowlers into file
output = open("sortedListPy.txt", "w")

for bowler in bowlers:
	output.write(bowler)

output.close()
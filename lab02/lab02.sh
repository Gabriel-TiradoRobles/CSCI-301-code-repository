#!/usr/bin/bash

# basic string
# '[^a-z][^a-z][^a-z][^a-z][^a-z]'

# NOTE: | wc -w  returns number of words that are possible

# first guess: crane
# results:
# 	52 words
# 	No: c, r, a, e
# 	Yes: n (4th spot)

grep -Ei "[^crane][^crane][^crane]n[^crane]" Wordle.txt
grep -Ei "[^crane][^crane][^crane]n[^crane]" Wordle.txt | wc -w

# second guess: mound
# results:
# 	52 words
# 	No: c, r, a, e, m, u
# 	Yes: o (spot unknown NOT 2), n (4th spot), d (5th spot)
grep -Ei "[^cranemud][^cranemoud][^cranemud]nd" Wordle.txt
grep -Ei "[^cranemud][^cranemoud][^cranemud]nd" Wordle.txt | wc -w

# third guess: blond
# result: Correct
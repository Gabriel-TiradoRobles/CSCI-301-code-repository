#!/usr/bin/bash

# grep -Eic "[^crane][^crane][^crane]n[^crane]" KJV.txt

grep -Ec '[t][h][y|e|o][:blank:|e|u]' KJV.txt

grep -Eic '(/bthy|thee|thou/b)' KJV.txt

grep -Eic '(thy|thee|thou)' KJV.txt
#!/usr/bin/env python3

import time
import random
import math
import statistics

# Binary Serach algorithm. Borrowed from https://github.com/gasampaiosouza/python-binarySearch/blob/master/binary_search.py for lab
def binary_search(arr, target):
    arr.sort()

    left = 0
    right = len(arr)

    while left <= right:
        mid = math.floor((left + right) / 2)

        if target > arr[mid]:
            left = mid + 1
        elif target < arr[mid]:
            right = mid - 1
        else:
            return arr.index(target)

ourList = list(range(10000000))
numOfTests = 10

# ## ---------- Random Selection ---------- ##

totalTime = 0
times = []
elements = []

for x in range(numOfTests):
	element = random.choice(ourList)
	# element = 7000000

	# Grabs a timeframe to note when program calcs begun
	start = time.time()

	random_choice = random.choice(ourList)
	while random_choice != element:
			random_choice = random.choice(ourList)

	# Grabs timeframe to note when program calcs finished
	end = time.time()

	totalTime += end - start
	times.append(end - start)
	elements.append(element)

print("Average Time Taken for Random: " + str(totalTime / numOfTests) + "\n")
print("Standard Dev of Passthrough is: " + str(statistics.stdev(times)) + "\n")
for x in range(numOfTests):
	print(str(x + 1) + ". " + str(elements[x]))
print("\n\n")


## ---------- Passthrough ---------- ##
totalTime = 0
times = []
elements = []

for x in range(numOfTests):
	element = random.choice(ourList)
	# element = 7000000

	# Grabs a timeframe to note when program calcs begun
	start = time.time()

	for num in ourList:
			if num == element:
				break

	# Grabs timeframe to note when program calcs finished
	end = time.time()

	totalTime += end - start
	times.append(end - start)
	elements.append(element)

print("Average Time Taken for Passthrough: " + str(totalTime / numOfTests))
print("Standard Dev of Passthrough is: " + str(statistics.stdev(times)) + "\n")

for x in range(numOfTests):
	print(str(x + 1) + ". " + str(elements[x]))
print("\n\n")


## ---------- Binary Search ---------- ##
totalTime = 0
times = []
elements = []

for x in range(numOfTests):
	element = random.choice(ourList)
	# element = 7000000

	# Grabs a timeframe to note when program calcs begun
	start = time.time()

	binary_search(ourList, element)

	# Grabs timeframe to note when program calcs finished
	end = time.time()

	totalTime += end - start
	times.append(end - start)
	elements.append(element)

print("Average Time Taken for Binary Search: " + str(totalTime / numOfTests))
print("Standard Dev of Binary Search is: " + str(statistics.stdev(times)) + "\n")
print("Elements used:")

for x in range(numOfTests):
	print(str(x + 1) + ". " + str(elements[x]))
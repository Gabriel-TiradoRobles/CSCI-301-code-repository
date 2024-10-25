#!/usr/bin/env python3

import math

# make me a right triangle class please
# class name, setters, getters, etc
class RightTriangle:
	__sideA = 0
	__sideB = 0

	def __init__(self, _sideA, _sideB):
		self.__sideA = _sideA
		self.__sideB = _sideB
		pass

	# Set side A of Right Triangle
	def setSideA(self, _sideLen):
		self.__sideA = _sideLen
		return
	
	# Set side B of Right Triangle
	def setSideB(self, _sideLen):
		self.__sideB = _sideLen
		return
	
	# Get side A of Right Triangle
	def getSideA(self):
		return self.__sideA
	
	# Get side B of Right Triangle
	def getSideB(self):
		return self.__sideB
	
	# Get Hypotenuse of Right Triangle
	def getHypotenuse(self):
		return math.hypot(self.__sideA, self.__sideB)
	
	def getSurfaceArea(self):
		return (0.5 * self.__sideA * self.__sideB)

# Main class below
def main():
	print("Length of Side A: 5")
	sideA = 5
	# sideA = int(input())
	print("Length of Side B: 6")
	sideB = 6
	# sideB = int(input())

	triangle = RightTriangle(sideA, sideB)

	print("Triangle Info:")
	print("Side A Length: %.2f" % triangle.getSideA())
	print("Side B Length: %.2f" % triangle.getSideB())
	print("Hypotenuse Length: %.2f" % triangle.getHypotenuse())
	print("Area of Triangle: %.2f" % triangle.getSurfaceArea())

	print("Change side A to 8")
	triangle.setSideA(5)
	print("New Side A: %.2f" % triangle.getSideA())

	print("Change side B to 9")
	triangle.setSideB(9)

	print("New Hypotenuse: %.2f" % triangle.getHypotenuse())

# Run main() only if file is run as a script
if __name__ == '__main__': main()
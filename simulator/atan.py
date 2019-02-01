import numpy as np

def atan(x):
	return x - x**3 / 3 + x**5 / 5 - x**7 / 7 + x**9 / 9 - x**11 / 11 + x**13 / 13

if __name__ == "__main__":
	print(10 * atan(0.3))

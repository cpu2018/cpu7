import numpy as np

if __name__ == "__main__":
	correct = np.array([i + 1 for i in range(256)], dtype = int)
	div10 = correct // 10
	shift10 = ((correct << 7) + (correct << 6) + (correct << 3) + (correct << 2) + correct) >> 11
	pseudo2_div10 = correct * 205 // 2048
	print(correct)
	print(div10)
	print(shift10)
	print(pseudo2_div10)
	print(pseudo2_div10 == div10)

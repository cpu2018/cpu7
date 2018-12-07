import numpy as np

if __name__ == "__main__":
	correct = np.array([i + 1 for i in range(256)], dtype = int)
	div10 = correct // 10
	pseudo1_div10 = correct * 102 // 1024
	pseudo2_div10 = correct * 205 // 2048
	pseudo3_div10 = correct * 408 // 4096
	pseudo4_div10 = correct * 816 // 8192
	print(correct)
	print(div10)
	print(pseudo1_div10)
	print(pseudo2_div10)
	print(pseudo3_div10)
	print(pseudo4_div10)
	print(pseudo1_div10 == div10)
	print(pseudo2_div10 == div10)
	print(pseudo3_div10 == div10)
	print(pseudo4_div10 == div10)

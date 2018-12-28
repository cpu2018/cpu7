let print_external_methods oc = Printf.fprintf oc
"	.data
	.literal8
#	--- lib_float ---
	.align 3
lzero:	# 0.000000
	.long	0
	.long	0
lhalf:	# 0.500000
	.long	0
	.long	1071644672
#	--- lib_sc ---
	.align 3
lsc.179:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
lsc.166:	 # 3.141593
	.long	1610612736
	.long	1074340347
	.align 3
lsc.165:	 # 720.000000
	.long	0
	.long	1082556416
	.align 3
lsc.164:	 # 24.000000
	.long	0
	.long	1077411840
	.align 3
lsc.163:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
lsc.162:	 # 5040.000000
	.long	0
	.long	1085517824
	.align 3
lsc.161:	 # 120.000000
	.long	0
	.long	1079902208
	.align 3
lsc.160:	 # 3.000000
	.long	0
	.long	1074266112
	.align 3
lsc.156:	 # 2.000000
	.long	0
	.long	1073741824
#	--- lib_atan ---
	.align 3
latan.96:	 # 4.000000
	.long	0
	.long	1074790400
	.align 3
latan.95:	 # 0.000000
	.long	0
	.long	0
	.align 3
latan.94:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
latan.93:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
latan.92:	 # 2.437500
	.long	0
	.long	1073971200
	.align 3
latan.91:	 # 0.437500
	.long	0
	.long	1071382528
	.align 3
latan.90:	 # 3.141593
	.long	1610612736
	.long	1074340347
	.align 3
latan.89:	 # 0.060035
	.long	-1722198048
	.long	1068416248
	.align 3
latan.88:	 # 0.089764
	.long	-1140127587
	.long	1068956365
	.align 3
latan.87:	 # 0.111111
	.long	-35190969
	.long	1069314502
	.align 3
latan.86:	 # -0.142857
	.long	-1871582096
	.long	-1077786332
	.align 3
latan.85:	 # 0.200000
	.long	-1717986918
	.long	1070176665
	.align 3
latan.84:	 # 0.333333
	.long	831175815
	.long	1070945621
"

.data
QUO : .string "Quociente = "
RES : .string "\nResto = "




.text
	li a7, 5
	ecall
	mv s0, a0	# Q : s0 <- Dividendo | -> Quociente
	#bge s0, zero, POS1
	#addi s5, s5, 1
	#neg s0, s0
	ecall
	mv s1, a0	# M : s1 <- Divisor
	#bge s1, zero, POS2
	#addi s6, s6, 1
	#neg s1, s1
	li s2, 0 	# A : s2 -> Resto
	lui t0, 0x80000	
	li s3, 0	#s3, s4 são os indices
	li s4, 32
	
	# Shift Left AQ
WHL :	and t1, s0, t0	#pega o bit mais significativo do Q
	sltu t2, zero, t1 	#se t1 for 1, como é unsigned, t2 vai virar 1, mas se t1 for zero, vai dar falso e t2 vai ser 0
	slli s0, s0, 1		#
	slli s2, s2, 1
	add s2, s2, t2		#adicionando o t2 no s2 que é o A, o valordo bit menos significativo do Q no A
	
	blt s2, s1, ZERO	# A>=m
	sub s2, s2, s1		
	ori s0, s0, 1	#colocando o 1 no bit menos significativo
	j BRK
ZERO :	andi s0, s0, -2	#botando 0 no bit menos significativo do Q, tudo um menos o bit menos significativo
BRK :	addi s3, s3, 1
	blt s3, s4, WHL
	
	li a7, 10
	ecall
	
	


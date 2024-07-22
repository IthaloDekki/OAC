.text
	addi sp, sp, -12 # reserva espaço na pilha
	sw a1, 0(sp)	#salva a1
	sw t0, 4(sp)	#salva t0
	sw t1, 8(sp)	#salva t1
	mv t0, a0	# t0 <- a0
	li a0, 0	#zera o resultado
	beq t0, zero, fim 	# verifica se t0 é zero
loop:	andi t1, a1, 1	#verifica bit menos significativo de t1
	srli a1, a1, 1	#desloca t1 para direita
	beq t1, zero, pula 	#se lsb for 0, pula
	add a0, a0, t0 	#se lsb for 1 soma t0 ao resultado
pula: 	slli t0, t0, 1	#desloca t0 para esquerda
	bne a1, zero, loop #verifica se a1 é diferente de 0
fim:	lw a1, 0(sp)	#recupera a1
	lw t0, 4(sp)	#recupera t0
	lw t1, 8(sp)	#reupera t1
	addi sp, sp, 12 #ibera espaço da pilha
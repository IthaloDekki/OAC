.data
str: .string "mdc="
cut: .string "\n"

.text
main:
	li a0, 12
	li a1, 10
	call mdc
	mv t0, a0
	
	la a0, str
	li a7, 4
	ecall
	
	mv a0, t0
	li a7, 1
	ecall
	
	la a0, cut
	li a7, 4
	ecall
	
	li a7, 10
	ecall
	
		
mdc:
	beq a0, a1, fim
	bge a0, a1, pula
	sub a1, a1, a0
	j mdc
	
pula:
	sub a0, a0, a1
	j mdc	
				
	
fim:
	ret

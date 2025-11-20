
# Desafío 2 - Laboratorio 4
# RISC-V Assembly
# Validación de clave de 16 caracteres

	.data
clave:      .space 20         # Espacio para la clave (16 + 3 extra por si acaso)
msg_ing:    .string "Ingrese clave de 16 caracteres: "
msg_ok:     .string "CLAVE VALIDADA\n"
salto:      .string "\n"
msg_fail:   .string "CLAVE RECHAZADA\n"
msg_capa:   .string "Capa fallida: "
msg_capa1:  .string "1 (COMPOSICION)\n"
msg_capa2:  .string "2 (PARIDAD POSICIONAL)\n"
msg_capa3:  .string "3 (HASH)\n"

	.text
	.globl main
main:
	# Pedir clave
	la a0, msg_ing
	li a7, 4
	ecall
	la a0, clave
	li a1, 17         # Leer 16 caracteres + null
	li a7, 8          # Leer string
	ecall
	# Imprimir salto de línea
	la a0, salto
	li a7, 4
	ecall

	# CAPA 1: Composición
	la t0, clave
	li t1, 0      # mayúsculas
	li t2, 0      # minúsculas
	li t3, 0      # dígitos
	li t4, 0      # especiales
	li s3, 0      # contador

capa1_loop:
	lb t6, 0(t0)
	beqz t6, capa1_fin
	# Mayúsculas
	li t5, 65
	li s4, 90
	blt t6, t5, check_minus
	bgt t6, s4, check_minus
	addi t1, t1, 1
	j next_char
check_minus:
	li t5, 97
	li s4, 122
	blt t6, t5, check_digit
	bgt t6, s4, check_digit
	addi t2, t2, 1
	j next_char
check_digit:
	li t5, 48
	li s4, 57
	blt t6, t5, check_special
	bgt t6, s4, check_special
	addi t3, t3, 1
	j next_char
check_special:
	li t5, 33   # !
	beq t6, t5, add_special
	li t5, 64   # @
	beq t6, t5, add_special
	li t5, 35   # #
	beq t6, t5, add_special
	li t5, 36   # $
	beq t6, t5, add_special
	li t5, 37   # %
	beq t6, t5, add_special
	li t5, 38   # &
	beq t6, t5, add_special
	li t5, 42   # *
	beq t6, t5, add_special
	li t5, 43   # +
	beq t6, t5, add_special
	j next_char
add_special:
	addi t4, t4, 1
next_char:
	addi t0, t0, 1
	addi s3, s3, 1
	li s0, 16
	blt s3, s0, capa1_loop

capa1_fin:
	# Verificar composición
	li s0, 4
	bne t1, s0, fail_capa1
	bne t2, s0, fail_capa1
	bne t3, s0, fail_capa1
	bne t4, s0, fail_capa1

	# CAPA 2: Paridad Posicional
	la t0, clave
	li t1, 0      # bloque
	li t2, 0      # bloques válidos

capa2_loop:
	li t3, 0      # suma ascii
	li t4, 0      # contador interno
capa2_bloque:
	lb t5, 0(t0)
	add t3, t3, t5
	addi t0, t0, 1
	addi t4, t4, 1
	li s1, 4
	blt t4, s1, capa2_bloque
	# Verificar paridad
	andi s2, t3, 1
	bnez s2, capa2_valido
	j capa2_next
capa2_valido:
	addi t2, t2, 1
capa2_next:
	addi t1, t1, 1
	li s1, 4
	blt t1, s1, capa2_loop
	# Verificar bloques válidos
	li s0, 3
	blt t2, s0, fail_capa2

	# CAPA 3: Hash
	la t0, clave
	li t1, 0      # contador
	li t2, 0      # hash
capa3_loop:
	lb t3, 0(t0)
	beqz t3, capa3_fin
	li s0, 31
	mul t2, t2, s0
	add t2, t2, t3
	li s1, 65536
	remu t2, t2, s1
	addi t0, t0, 1
	addi t1, t1, 1
	li s0, 16
	blt t1, s0, capa3_loop
capa3_fin:
	li s0, 10000
	ble t2, s0, fail_capa3

	# Si pasa todo
	la a0, msg_ok
	li a7, 4
	ecall
	li a7, 10
	ecall

fail_capa1:
	la a0, msg_fail
	li a7, 4
	ecall
	la a0, msg_capa
	li a7, 4
	ecall
	la a0, msg_capa1
	li a7, 4
	ecall
	li a7, 10
	ecall

fail_capa2:
	la a0, msg_fail
	li a7, 4
	ecall
	la a0, msg_capa
	li a7, 4
	ecall
	la a0, msg_capa2
	li a7, 4
	ecall
	li a7, 10
	ecall

fail_capa3:
	la a0, msg_fail
	li a7, 4
	ecall
	la a0, msg_capa
	li a7, 4
	ecall
	la a0, msg_capa3
	li a7, 4
	ecall
	li a7, 10
	ecall

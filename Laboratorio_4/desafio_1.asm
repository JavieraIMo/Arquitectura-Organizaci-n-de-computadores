# Desafío 1 - Laboratorio 4
# RISC-V Assembly compatible con RARS
# Desciframiento de Jerarquía Criminal con Recursión (Secuencia de Collatz)

.data
n:      .word 0
ids:    .space 80      # Hasta 20 IDs
buffer_id: .space 12
ids_real: .word 0      # Cantidad real de IDs

lider:      .string "LIDER"
operador:   .string "OPERADOR"
informante: .string "INFORMANTE"
peon:       .string "PEON"

texto_pasos: .string " Pasos: "
texto_rango: .string " Rango: "
texto_maximo: .string "Máximo alcanzado"
salto:       .string "\n"
flecha:      .string " -> "
id_label:    .string "ID "
dos_puntos:  .string ": "
msg_n:       .string "n: "
msg_id:      .string "IDs: "
msg_idnum:   .string "ID: "
msg_err:     .string "ERROR: n debe ser entre 1 y 20\n"

.text
.globl main

main:
    # Pedir n
leer_n:
    la a0, msg_n
    li a7, 4
    ecall
    li a7, 5
    ecall
    
    # Guardar n
    la t3, n
    sw a0, 0(t3)
    mv t1, a0

    # Validar n (debe ser entre 1 y 20)
    li t4, 1
    blt t1, t4, error_n
    li t4, 20
    bgt t1, t4, error_n

    # Leer exactamente n IDs
    la t0, ids
    li t2, 0

    la a0, msg_id
    li a7, 4
    ecall
    
    la a0, salto
    li a7, 4
    ecall

leer_ids:
    beq t2, t1, fin_ids      # Si ya se ingresaron n IDs, termina

    la a0, msg_idnum
    li a7, 4
    ecall

    li a7, 5
    ecall

    sw a0, 0(t0)            # Almacena el ID
    addi t2, t2, 1          # Incrementa el contador de IDs
    addi t0, t0, 4          # Avanza el puntero de almacenamiento

    j leer_ids

fin_ids:
    la t3, ids_real
    sw t2, 0(t3)
    j procesar_ids

error_n:
    la a0, msg_err
    li a7, 4
    ecall
    li a7, 10
    ecall

###############################################
# PROCESAMIENTO CORREGIDO
###############################################

procesar_ids:
    # Agregar salto de línea antes de empezar a procesar
    la a0, salto
    li a7, 4
    ecall
    
    la t3, ids_real
    lw s0, 0(t3)      # s0 = cantidad de IDs (usar saved register)
    li s1, 0          # s1 = índice actual
    la s2, ids        # s2 = puntero de lectura de IDs

bucle_ids:
    bge s1, s0, fin   # Terminar si ya procesamos todos

    # Imprimir "ID X:"
    la a0, id_label
    li a7, 4
    ecall

    lw s3, 0(s2)      # s3 = ID actual
    mv a0, s3
    li a7, 1
    ecall

    la a0, dos_puntos
    li a7, 4
    ecall
    la a0, salto
    li a7, 4
    ecall

    # Llamar a Collatz
    mv a0, s3
    jal ra, collatz

    # a1 = pasos, a2 = máximo
    # Guardarlos porque los vamos a usar
    mv s4, a1         # s4 = pasos
    mv s5, a2         # s5 = máximo

    # Determinar rango
    li t6, 0

    li t5, 100
    bge s4, t5, rango_lider
    li t5, 50
    bge s4, t5, rango_operador
    li t5, 20
    bge s4, t5, rango_informante
    j rango_peon

rango_lider:
    la t6, lider
    j mostrar_rango
rango_operador:
    la t6, operador
    j mostrar_rango
rango_informante:
    la t6, informante
    j mostrar_rango
rango_peon:
    la t6, peon

mostrar_rango:
    # Pasos
    la a0, texto_pasos
    li a7, 4
    ecall
    mv a0, s4
    li a7, 1
    ecall
    
    la a0, salto
    li a7, 4
    ecall

    # Rango
    la a0, texto_rango
    li a7, 4
    ecall
    mv a0, t6
    li a7, 4
    ecall

    # Línea final
    la a0, salto
    li a7, 4
    ecall
    la a0, salto
    li a7, 4
    ecall

    # Avanzar al siguiente ID
    addi s1, s1, 1
    addi s2, s2, 4
    j bucle_ids

fin:
    li a7, 10
    ecall

###############################################
# COLLATZ ITERATIVO
###############################################

collatz:
    # Guardar registros que vamos a usar
    addi sp, sp, -16
    sw s2, 0(sp)
    sw s3, 4(sp)
    sw s4, 8(sp)
    sw ra, 12(sp)
    
    mv s2, a0      # s2 = número actual
    li a1, 0       # a1 = contador de pasos
    mv a2, a0      # a2 = máximo alcanzado
    li s4, 0       # s4 = contador para saltos de línea

collatz_loop:
    mv a0, s2
    li a7, 1
    ecall

    addi s4, s4, 1
    li t1, 1
    beq s2, t1, collatz_fin

    la a0, flecha
    li a7, 4
    ecall

    li t5, 10
    bne s4, t5, cont
    la a0, salto
    li a7, 4
    ecall
    li s4, 0

cont:
    andi t2, s2, 1
    beqz t2, par

    li t3, 3
    mul s2, s2, t3
    addi s2, s2, 1
    j next

par:
    srli s2, s2, 1

next:
    addi a1, a1, 1
    bge s2, a2, new_max
    j collatz_loop

new_max:
    mv a2, s2
    j collatz_loop

collatz_fin:
    la a0, salto
    li a7, 4
    ecall
    
    # Restaurar registros
    lw s2, 0(sp)
    lw s3, 4(sp)
    lw s4, 8(sp)
    lw ra, 12(sp)
    addi sp, sp, 16
    
    ret
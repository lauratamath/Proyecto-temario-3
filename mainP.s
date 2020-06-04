/*
@-----------------------------------------------------------------------------------------------
@ Universidad del Valle de Guatemala
@ CC3054 -Organización de computadoras y assembler	|
@ Oliver Josue de Leon Milian 19270					|
@ Laura Tamath Maria Levi Perez 19365				|
@ Proyecto 3										|
@ Temario 3, Pi-DOTS								|
@-----------------------------------------------------------------------------------------------
*/

@--------------------------- Área de datos ---------------------------------
.data
.align 2
menu1:		.asciz "\nBienvenido al juego Pi-DOTS\n"
opcion:		.asciz "1. Ver instrucciones\n2. Comenzar a jugar\n3. Salir\n Ingrese la opcion: "
reglas:		.asciz "\n\t\t-----------Instrucciones-----------\n"
reglas3:	.asciz "El jugador debe unir la mayor cantidad  de caracteres del mismo tipo con líneas verticales y horizontales\n"
reglas1:	.asciz "Cuando conectalos caracteres del  mismo tipo,estos  desaparecen de  las  posibilidades  de ser  elegidos  paraunir,  y  se acumula 1 punto por cada letra unida\n"
reglas2:	.asciz "Si el jugador conecta 20  caracteres, entonces termina esa ronda.\nCada error de ingreso para unir puntos descuenta 3 puntos del total acumulado.\n"
arregloBase:.word  1,2,3	@3 posibles combinaciones
arreglo1:	.word 1,2,3,4	@fila 1
arreglo2:	.word 0,0,0,0	@fila 2
areeglo3:	.word 0,0,0,0	@fila 3
areeglo4:	.word 0,0,0,0	@fila 4
string:		.asciz "%d"		@String format
ref1:		.word arreglo1
@----------------------------------------------------------------------------

.text
.align 2
.global main
.type main,%function

main:
	stmfd sp!, {lr}
	mov r7,#0
	ldr r6,=ref1		@contador
	
@----------------- M E N U ----------------
menu:
	/*Show menu*/
	ldr r0,=menu1
	bl printf
	ldr r0,=opcion
	bl printf
	
	/*Se le pide la opcion al usuario*/
	bl getchar
	
	/*chosen option*/
	cmp r0, #'1'
	beq instructions
	
	#cmp r0, #'2'
	#beq jugar
	
	cmp r0, #'3'
	beq exit
	bne error
	
@--------- I N S T R U C T I O N S ---------
instructions:
	ldr r0, =reglas
	bl printf
	ldr r0, =reglas1
	bl printf
	ldr r0, =reglas2
	bl printf
	b menu
@-------- I M P R E S I O N --------
	
@----------------- E X I T -----------------
exit:
	mov r0,#0
	mov r3,#0
	ldmfd sp!,{lr}
	bx lr
	
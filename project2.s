# MIPS Assignment 2
.data
	str: .space 1000
	message: .asciiz "Input: \n"
	message1: .asciiz "\nOutput: "
	message2: .asciiz "\nInvalid input"
	sum: .word 0

.text # for instructions
main:

	# prints message
	li $v0, 4
	la $a0, message
	syscall
	
	
	# read a string to operate on
	li $v0, 8
	la $a0, str
	li $a1, 11 # space for 11(1001) characters
	syscall
	
	move $t7, $a0 # moves string into $t7 register
	
	# prints str
	li $v0, 4
	la $a0, str
	syscall
	
	# prints character at index 0
	li $t1, 10 # initialize register $t1 to 10 (1000)
	li $t2, 0 # initialize byte number to 0
	
	lw $t9, sum # loads sum into register
	
	li $k0, 0 # puts zero in total sum
	
	
	for_loop: # to remove leading/trailing spaces and tabs
	blt $t1, 1, exit # Branch less than 10 < 1 (1000 < 1)
    lbu $a0, 0($t7) # Loads byte 0 of $t7 (str) # for printing
    lbu $t6, 0($t7) # Loads byte 0 of $t7 (str) # storage
    
    li $t0, 32
    beq $t6, $t0, checkTab # character index of string = 32 if t

	
	return:
	# iteration
    addi $t7, 1 # next char
	add $t2, $t2, 1 # Adds 1 to $t2 to get the next character
	sub $t1, $t1, 1 # --10 (1000)
    
	j for_loop
	
	

	
	checkTab:
	
	j return
	
	
	exit:	
	# Exit call
	li $v0, 0
	syscall
# MIPS Assignment 2
.data
	str: .space 1000
	message: .asciiz "Input: \n"
	message1: .asciiz "\nOutput: "
	message2: .asciiz "\nInvalid input"
	sum: .word 0
	message3: .asciiz "\nIndex saved is "
	message4: .asciiz ": "
	saved_index: .word 0
	test: .asciiz "\nGot to the end of the for loop"
	newline: .asciiz "\n"
	

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
	li $t2, 0 # initialize byte number(counter) to 0 (left end)
	#li $t3, 9 # initialize byte number(counter) to 9 (right end)
	
	lw $t9, sum # loads sum into register
	
	li $k0, 0 # puts zero in total sum 
	
	#*****************FOR LOOP***************
	for_loop: # to remove leading spaces and tabs
	blt $t1, 1, invalid # Branch less than 10 < 1 (1000 < 1)
	# if all spaces, loop finishes go to invalid
    #lbu $a0, 0($t7) # Loads byte 0 of $t7 (str) # for printing
    lbu $t6, 0($t7) # Loads byte 0 of $t7 (str) # storage
    

	#checking for a space
	li $t0, 64 # ASCII space
	beq $t6, $t0, return # index == space; true return and iterate; false move down
	li $t0, 41 # ASCII tab 
	bne	$t6, $t0, zero # index != tab; true zero; false (next index)
	
	return:
	# iteration
    addi $t7, 1 # next char
	add $t2, $t2, 1 # Adds 1 to $t2 to get the next character
	sub $t1, $t1, 1 # --10 (1000)
    
	j for_loop
	#*****************FOR LOOP***************
	
	
	zero: #save index and return
	bgt $t6, 47, saveReturn # if index > 47 (/) go to zero
	
	j return 
	
	saveReturn:
	move $t4, $t2 # moves index into $t4 register
	sw $t4, saved_index # saved_index = $t4
	
	
	# prints message3 "Index saved"
	li $v0, 4
	la $a0, message3
	syscall
	
	
	# prints address index stored
	li $v0, 1
	la $a0, saved_index
	syscall
	
	j string_loop
	#needs j statement
	
	invalid:
	# prints message2 "Invalid input"
	li $v0, 4
	la $a0, message2
	syscall
	
	j exit
	
	#*****************FOR LOOP***************
	string_loop:
	li $t1, 10 # initialize register $t1 to 10 (1000) 
	blt $t1, $t4, finished # Branch less than 10 < $t4 (1000 < $t4)
	
	# prints int of counter
	li $v0, 1
	add $a0, $zero, $t2
	syscall
	
	# prints message3 (": ")
	li $v0, 4
	la $a0, message4
	syscall

	lbu $t6, saved_index($t7) # Loads byte saved_index of $t7 (str)
    lbu $a0, saved_index($t7) # Loads byte saved_index of $t7 (str)
    li $v0, 11 # prints character
    syscall
	
	# prints newline
	li $v0, 4
	la $a0, newline
	syscall
	
	# iteration
    addi $t7, 1 # next char
	add $t2, $t2, 1 # Adds 1 to $t2 to get the next character
	sub $t1, $t1, 1 # --10 (1000)
	
	j string_loop
	#*****************END FOR LOOP***************
	

	finished:
	li $v0, 4
	la $a0, test
	syscall
	
	exit:	# Exit call
	li $v0, 0
	syscall
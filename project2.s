# MIPS Assignment 2
.data
	str: .space 1000
	message: .asciiz "Input: \n"
	message1: .asciiz "\nOutput: "
	message2: .asciiz "\nInvalid input"

.text # for instructions
main:

	# prints message
	li $v0, 4
	la $a0, message
	syscall
	
	
	# read a string to operate on
	li $v0, 8
	la $a0, str
	li $a1, 11 # space for 1001 characters
	syscall
	
	move $t7, $a0 # moves string into $t7 register
	
	# prints str
	li $v0, 4
	la $a0, str
	syscall
	
	# prints character at index 0
	li $t1, 10 # initialize register $t1 to 1000
	li $t2, 0 # initialize byte number to 0
	
	
	
	
	exit:	
	# Exit call
	li $v0, 0
	syscall
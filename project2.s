# MIPS Assignment 2
.data
	str: .space 1000
	message: .asciiz "Input: "
	message1: .asciiz "\nOutput: "
	message2: .asciiz "\nInvalid input"

.text # for instructions
main:

	# prints message
	li $v0, 4
	la $a0, message
	syscall
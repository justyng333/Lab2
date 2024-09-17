# Exercise 2
#  Max Score: 9 points
#Justyn G. Arnold: 33%
#Celeste Tuohy: 33%
#Liliana Suarez: 33%
# Students: 
#
# 'count_occurence.a' - count the occurrences of a specific character in string 
# "str". Indexed addressing is used to access the array elements.
#  MAX Score: 15 points
# Expected Outcome:- 
# The following string will be printed on the console,
# "Count is 6"
#
# Questions:-
# 1. Briefly describe the purposes of the registers, $t0, $t1, $t2, and $t3.

#$t0:Stores character from "str", which is used for comparator operators in the following two lines
#$t1:Indexing register used for the "str" string.
#$t2:Counts how many times a character (in $t3 and this case e) shows up in the "str" string
#$t3:Contains character that we'd like to see how many times shows up in the "str" string(in this case e)

# 2. 
#   "add" in loop: and con: changed to "addi" as they're adding integers and not other register values.ALSO, in
# con:, $t1 = $t2 + 1 changed to $t1 = $t1 +1 as $t2 is already being used.

	.text

	.globl main

main:	

	li      $t1, 0          # initialize register $t1 to '0'
	li      $t2, 0          # initialize register $t2 to '0'
	lb      $t3, char       # initialize register $t3 to 'char'

loop:

    lb      $t0, str($t1)	# fetch a character in 'str'
	beqz    $t0, strEnd	    # if a null character is fetched, exit the loop
	bne     $t0, $t3, con   # branches to 'con' if registers $t0, and $t3 are not the same
	addi     $t2, $t2, 1	    # increment register $t2

con:	

    addi     $t1, $t1, 1	    # increase indexing register $t1
	j       loop	       	# continues the loop

strEnd:

	la      $a0, ans        # load $a0 with the address of the string, 'ans'
	li      $v0, 4	        # trap code, '4', refers to 'print_string' system call
	syscall                 # execute the system call

	move    $a0, $t2        # move the integer to print from register $t2->$a0
	li      $v0, 1	        # trap code, '1', refers to 'print_int' system call
	syscall		            # execute the system call

	la      $a0, endl	    # load $a0 with the address of the string, 'ans'
	li      $v0, 4	        # trap code, '4', refers to 'print_string' system call
	syscall                 # execute the system call

	li      $v0, 10         # terminate the program
	syscall


	.data

str:	.asciiz "abceebceebeebbacacb"
char:	.asciiz "e"
ans:	.asciiz "Count is "
endl:	.asciiz "\n"


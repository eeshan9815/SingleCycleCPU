
bubblesort:
	sw $ra, 0($sp)
	sw $s0, 1($sp)
	add $sp, $sp, -2

	mov $s0, $a0 		# $s0 = arr
	mov $t0, $a1
	addi $t0, $t0, -1 	# $t0 = n-1
	
	mov $t1, 0			# $t1 = i
L_beginloopOut:
	bgte $t1, $t0, L_endloopOut	# while(i<n-1)

		mov $t2, 0			# $t2 = j
		sub $t0, $t0, $t1 	# $t0 = n-1-i 
	L_beginloopIn:
		bgte $t2, $t0, L_endloopIn	# while(j<n-1-i)

		mov $t3, $s0+j	# $t3 = $s0+j
		add $t4, $t3, 1		# $t4 = $s0+j+1

		lw $t5, 0($t3)		# $t5 = a[j]
		lw $t6, 0($t4)		# $t6 = a[j+1]

			blte $t5, $t6, L_notif
				sw $t6, 0($t3)
				sw $t5, 0($t4)
		L_notif:

		addi $t2, $t2, 1
		j L_beginloopIn
	L_endloopIn:
		add $t0, $t0, $t1

	addi $t1, $t1, 1
	j L_beginloopOut
L_endloopOut:

	add $sp, $sp, 2
	lw $s0, 1($sp)
	lw $ra, 0($sp)
	jr $ra

main:
	mov $sp, 31
	array  = 0			# $s0 = array
	mov $t0, 5
	sw $t0, 0(array)
	mov $t0, 4
	sw $t0, 1(array)
	mov $t0, 3
	sw $t0, 2(array)
	mov $t0, 2
	sw $t0, 3(array)
	mov $t0, 1
	sw $t0, 4(array)
	mov $s1, 5			# $s1 = n

	mov $a0, $s0
	mov $a1, $s1
	jal bubblesort

	mov $t1, 0			# $t1 = i
	L_forloop:
		bgte $t1, $s1, L_forloopend
		
		lw $t0, 0($s0)
		addi $t0, $t0, 0	# DISPLAY COMMAND

		addi $s0, $s0, 1
		addi $t1, $t1, 1
		j L_forloop
	L_forloopend:
end
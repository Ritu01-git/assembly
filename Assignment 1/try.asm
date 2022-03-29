.data
 new:    .asciiz  "\n"
 str:    .asciiz  "Mean: "
 str1:   .asciiz  "Median: "
 str2:   .asciiz  "Mode: "
 arr:    .word  1, 2, 3, 3, 3, 4, 5, 6, 6, 9
.text
 main:

 li $t0,10 #length
 li $t1,0 #sum
 li $t2,0 #count
 li $t4,0 #array count

#mean calculation
 loop:

 beq $t2,$t0,exit
 lw $t3,arr($t4)
 addu $t1,$t1,$t3
 addi $t2,$t2,1
 addi $t4,$t4,4
 j loop
 exit:

 div $s0,$t1,$t0
 li    $v0,4       #syscall 4(print_str)
 la    $a0,str     #string to be printed
 syscall	      #print the string
 li   $v0,1       #syscall 1(print_int)
 move  $a0,$s0   #integer to be printed
 syscall
 #median calculation
 addi $t4,$zero,0



end:
    
    li    $v0,10      #syscall 10 to exit the program
    syscall
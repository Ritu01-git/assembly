.data
 str: .asciiz "The answer is "
 arr:    .word  5, 6, 3, 6, 4, 3, 7, 5
.text
 main:

    li $t1,2 #counter(i) variable
    li $t2,0 #fx=0
    li $t3,0 #f=0
    li $t4,0 #count
    li $t6,10 #number of iterations

 loop:

  beq $t1,$t6,exit #if t1==t6 i.e 9 then break the loop
  lw $t7,arr($t4) #$t7 will store the arr[i], 0 based indexing
  mul $t8,$t1,$t7  #t1*arr[i] 
  addu $t2,$t2,$t8 #adding, fx += t1*arr[i] 
  addu $t3,$t3,$t7  #f+=arr[i]
  addi $t1,$t1,1 #count+=1
  addi $t4,$t4,4
  j loop
 exit:
 
 div $s0,$t2,$t3 #ans = fx/f
  
end:
    li    $v0,4       #syscall 4(print_str)
    la    $a0,str     #string to be printed
    syscall	      #print the string
    li    $v0,1       #syscall 1(print_int)
    move  $a0,$s0   #integer to be printed
    syscall
    li    $v0,10      #syscall 10 to exit the program
    syscall
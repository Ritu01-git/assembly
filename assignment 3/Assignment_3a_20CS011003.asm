.data
     str: .asciiz  "Result is "
.text

 main:
 addi $a1, $zero, 5  #a = 5
 jal result  #calling the subroutine
 
 li    $v0,4       #syscall 4(print_str)
   la    $a0,str     #string to be printed
   syscall	      #print the string
   li    $v0,1       #syscall 1(print_int)
   move  $a0,$v1     #integer to be printed
   syscall
   li    $v0,10      #syscall 10 to exit the program
   syscall

 result:
    li $s2,7   #loading the value 7
    li $s3,2   #loading the value 2

    li $s6,3   #loading the value 3
    mul $s0,$a1,$a1 #a*a
    mul $s1,$s0,$s2  #7*a*a
    mul $s4,$s6,$a1 #3*a
    sub $s5,$s1,$s4 #7*a*a-3*a
    add $v1,$s5,$s3 #7*a*a-3*a+2

    jr $ra  #return back

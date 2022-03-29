.data
    str: .asciiz "The result is "
.text
    main:
    
    li $t0,6 #number of iterations
    li $t1,1 #counter variable(i) initialize to 1
    li $t2,0 #variable for holding sum initialized to 0

 loop:
    beq  $t1,$t0,end  #if t1==6 end loop
    mul  $t3,$t1,$t1  #computing i*i
    addu $t2,$t2,$t3  #computing sum = sum+ i*i
    addi $t1,$t1,1    #incrementing t1 by 1
    j    loop	      #unconditional jump to loop
 end:
    li    $v0,4       #syscall 4(print_str)
    la    $a0,str     #string to be printed
    syscall	      #print the string
    li    $v0,1       #syscall 1(print_int)
    move  $a0,$t2     #integer to be printed
    syscall
    li    $v0,10      #syscall 10 to exit the program
    syscall
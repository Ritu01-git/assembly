.data
    str: .asciiz "The result is "

.text
 main:
    li $t0,5 #the variable is a i.e 1
    li $t1,4 #the variable is b i.e 2
    li $t2,6 #the variable is c i.e 3
    li $t3,2 #the variable is d i.e 4
    li $t4,20 #it is the predifined value i.e given in question
    li $t5,0 #it is answer variable which store the answer
    li $t6,0 #it is temporary variable which is use for storing addition result

    
    div $t5,$t4,$t2 #computing (20/c) i.e t4/t2 and storing it in t5
    sub $t5,$t5,$t3 #computing ans i.e t5 will be t5-t3
    mul $t6,$t0,$t1 #a*b, it is storing in t6
    addu $t5,$t5,$t6 #lastly adding t5 and t6


 end:
    li $v0,4 #syscall 4(print_str)
    la $a0,str #string to be printed
    syscall    #print the string
    li $v0,1   #syscall 1(print_int)
    move $a0,$t5 #integer to be printed
    syscall
    li $v0,10 #syscall 10 to exit the program
    syscall 



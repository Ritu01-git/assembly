.data
 new:    .asciiz  "\n"
 str:    .asciiz  "Mean: "
 str1:   .asciiz  "Median: "
 str2:   .asciiz  "Mode: "
 
 array:    .word  1, 2, 3, 3, 3, 4, 5, 6, 6, 9
 length:   .word  10 #length of the array
 sum:      .word  0  #initializing the sum variable with the value 0
 median:   .word  0 #initializing the median variable with the value 0

.text
 .globl main
 .ent main
 
main:
      #calculation of mean
      la $t0, array #array starting address
      li $t1, 0      #loop index, i=0
      lw $t2, length  #loads the data from length to t2
      li $t3, 0      #sum =0 
      
 for_loop:
      lw $t4, ($t0) #get array[i], i is the 0 based indexing of array
      add $t3, $t3,$t4 #sum = sum+array[i]
       
      add $t1, $t1, 1 #i = i+1
      add $t0, $t0, 4 #updating array address with 4 cause integer size is 4
     
      blt $t1,$t2, for_loop #if i<length, continue
 
      sw  $t3, sum #save sum

      div $t5,$t3,$t2 # ave = sum/length

      li  $v0,4  #syscall 4(print_str)
      la  $a0,str   #string to be printed
      syscall
      li  $v0,1   #syscall 1(print_int)
      move $a0,$t5  #integer i.e mean to be printed
      syscall
      
      # calculation of median

      la $t0, array # starting addr of array
      lw $t1, length # value of length

      div $t2, $t1, 2 # length / 2
      mul $t3, $t2, 4 # cvt index into offset
      add $t4, $t0, $t3 # add base addr of array

      lw $t5, ($t4) # get array[len/2]
      sub $t4, $t4, 4 # addr of prev value

      lw $t6, ($t4) # get array[(len/2)-1]

      add $t7, $t6, $t5 # a[len/2] + a[(len/2)-1]
      div $t8, $t7, 2 # / 2
      
      li  $v0,4    #syscall 4(print_str)
      la  $a0,new   #string to be printed
      syscall
      li  $v0,4   #syscall 4(print_str)
      la  $a0,str1  
      syscall
      li  $v0,1
      move $a0,$t8
      syscall

     #calculation of mode
      
      li $t2, 4   #mean
      li $t4,3  #median
      li $t7, 0   #mode

      mul $t0,$t8,3   #computing the mulplication of mean with 3,storing into t0
    mul $t1,$t5,2     #computing the mulplication of medianwith 2,storing into t
    sub $t3,$t0,$t1  #subtracting t0 and t1 and storing into t3
end:
     li $v0,4
 la  $a0,new   #string to be printed
     la $a0,str2
     syscall
     li $v0,1
     move $a0,$t8
 la  $a0,new   #string to be printed
     move $a0,$t3   #integer to be printed

     syscall
     li  $v0,10   #syscall 10 to exit the program
     syscall
.end main